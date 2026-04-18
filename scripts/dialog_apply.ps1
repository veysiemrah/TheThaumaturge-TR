# dialog_apply.ps1
# CSV'deki TR sütununu kullanarak dialog graph JSON'undaki CinematicNode_(Choice|Response) export'larındaki
# hash-text çiftlerindeki metni değiştirir. StringTable apply'a benzer prensip; farklı blob şeması.
#
# CSV format: Hash,NodeName,PL,TR,Notes
# - Hash sütunu 32-char hex UUID (dump ettiğimiz hali)
# - NodeName opsiyonel bilgi, replacement için gerekli değil
# - TR boşsa PL korunur
#
# Pattern (her hash-text çifti):
#   [int32 len=33][32 hex chars + '\0']          ← hash FString
#   [int32 len]   [FString body]                  ← text FString (UTF-8 veya UTF-16LE)

param(
    [Parameter(Mandatory=$true)][string] $JsonPath,
    [Parameter(Mandatory=$true)][string] $CsvPath,
    [Parameter(Mandatory=$true)][string] $OutJsonPath
)

function Write-FString {
    param([string] $s)
    if ([string]::IsNullOrEmpty($s)) {
        return [byte[]]([BitConverter]::GetBytes([int32]0))
    }
    $asciiOnly = $true
    foreach ($c in $s.ToCharArray()) { if ([int]$c -gt 0x7F) { $asciiOnly = $false; break } }
    if ($asciiOnly) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($s + "`0")
        return [byte[]]([BitConverter]::GetBytes([int32]$bytes.Length) + $bytes)
    } else {
        $bytes = [System.Text.Encoding]::Unicode.GetBytes($s + "`0")
        $chars = $bytes.Length / 2
        return [byte[]]([BitConverter]::GetBytes([int32](-$chars)) + $bytes)
    }
}

# Load CSV
$rows = Import-Csv -Path $CsvPath -Encoding UTF8
$trMap = @{}
foreach ($r in $rows) {
    $tr = if ([string]::IsNullOrWhiteSpace($r.TR)) { $r.PL } else { $r.TR }
    $trMap[$r.Hash] = $tr
}
Write-Host "CSV'den yüklenen satır: $($trMap.Count)"

# Load JSON
$json = Get-Content $JsonPath -Raw | ConvertFrom-Json -Depth 50
$exports = $json.Exports | Where-Object { $_.'$type' -match "RawExport" -and $_.Data }

$totalReplaced = 0
$totalKept = 0
$totalMissing = 0

foreach ($exp in $exports) {
    $name = $exp.ObjectName
    if ($name -notmatch '^CinematicNode_(Choice|Response)') { continue }
    $data = [Convert]::FromBase64String($exp.Data)

    # Her hash-text çiftinin konumunu bul (sonra tersten replace edeceğiz ki offset'ler karışmasın)
    $spans = New-Object System.Collections.Generic.List[object]
    for ($pos = 0; $pos -lt $data.Length - 37; $pos++) {
        $len = [BitConverter]::ToInt32($data, $pos)
        if ($len -ne 33) { continue }
        $cand = [System.Text.Encoding]::ASCII.GetString($data, $pos + 4, 32)
        if ($cand -notmatch '^[0-9A-F]{32}$') { continue }
        $hashId = $cand
        $textPos = $pos + 4 + 33
        if ($textPos + 4 -gt $data.Length) { continue }
        $textLen = [BitConverter]::ToInt32($data, $textPos)
        $textBodyStart = $textPos + 4
        $origText = $null
        $textEndPos = $null
        if ($textLen -gt 0 -and $textLen -lt 8192 -and $textBodyStart + $textLen -le $data.Length) {
            $origText = [System.Text.Encoding]::UTF8.GetString($data, $textBodyStart, $textLen - 1)
            $textEndPos = $textBodyStart + $textLen
        } elseif ($textLen -lt 0 -and $textLen -gt -8192) {
            $chars = -$textLen
            $byteLen = $chars * 2
            if ($textBodyStart + $byteLen -le $data.Length) {
                $origText = [System.Text.Encoding]::Unicode.GetString($data, $textBodyStart, ($chars - 1) * 2)
                $textEndPos = $textBodyStart + $byteLen
            }
        }
        if ($null -eq $origText) { continue }
        $spans.Add([PSCustomObject]@{
            Hash = $hashId
            TextStart = $textPos       # FString length prefix pozisyonu
            TextEnd = $textEndPos      # FString body'nin bittiği yer
            OrigText = $origText
        })
    }

    if ($spans.Count -eq 0) { continue }

    # Tersten replace (sondan başa — offset'leri korumak için)
    # Ama blob'u yeniden inşa etmek daha temiz: parçalara böl, text bölgelerini değiştir, birleştir
    $newParts = New-Object 'System.Collections.Generic.List[byte[]]'
    $cursor = 0
    foreach ($sp in $spans) {
        # Önceki kısmı ekle
        $newParts.Add($data[$cursor..($sp.TextStart - 1)])
        # Replace text
        if ($trMap.ContainsKey($sp.Hash)) {
            $newVal = $trMap[$sp.Hash]
            $newBytes = Write-FString -s $newVal
            $newParts.Add($newBytes)
            if ($newVal -ne $sp.OrigText) { $totalReplaced++ } else { $totalKept++ }
        } else {
            # CSV'de yok — orijinali koru
            $newParts.Add($data[$sp.TextStart..($sp.TextEnd - 1)])
            $totalMissing++
        }
        $cursor = $sp.TextEnd
    }
    # Kalan tail
    if ($cursor -lt $data.Length) {
        $newParts.Add($data[$cursor..($data.Length - 1)])
    }

    # Birleştir
    $totalLen = 0
    foreach ($p in $newParts) { $totalLen += $p.Length }
    $newData = New-Object byte[] $totalLen
    $offset = 0
    foreach ($p in $newParts) {
        [Array]::Copy($p, 0, $newData, $offset, $p.Length)
        $offset += $p.Length
    }
    $exp.Data = [Convert]::ToBase64String($newData)
}

Write-Host "Replaced: $totalReplaced, Unchanged: $totalKept, Missing-in-CSV: $totalMissing"

$json | ConvertTo-Json -Depth 50 -Compress:$false | Set-Content $OutJsonPath -Encoding UTF8
Write-Host "Yazıldı: $OutJsonPath"
