# stringtable_apply.ps1
# CSV'deki TR sütununu kullanarak UAssetGUI JSON'undaki tüm StringTable entry'lerini günceller.
#
# CSV format: Key,PL,TR,Notes (TR sütunu boşsa PL değeri tutulur)

param(
    [Parameter(Mandatory=$true)] [string] $JsonPath,      # Orijinal UAssetGUI JSON (kaynak)
    [Parameter(Mandatory=$true)] [string] $CsvPath,       # Çeviri CSV (Key,PL,TR,Notes)
    [Parameter(Mandatory=$true)] [string] $OutJsonPath    # Üretilen çevrilmiş JSON
)

function Read-FString {
    param([byte[]] $data, [ref] $pos)
    $len = [BitConverter]::ToInt32($data, $pos.Value); $pos.Value += 4
    if ($len -eq 0) { return "" }
    if ($len -gt 0) {
        $str = [System.Text.Encoding]::UTF8.GetString($data, $pos.Value, $len - 1)
        $pos.Value += $len
        return $str
    } else {
        $chars = -$len
        $str = [System.Text.Encoding]::Unicode.GetString($data, $pos.Value, ($chars - 1) * 2)
        $pos.Value += $chars * 2
        return $str
    }
}

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

# Load CSV translations
$rows = Import-Csv -Path $CsvPath -Encoding UTF8
$trMap = @{}
foreach ($r in $rows) {
    $tr = if ([string]::IsNullOrWhiteSpace($r.TR)) { $r.PL } else { $r.TR }
    $trMap[$r.Key] = $tr
}
Write-Host "CSV'den yüklenen çeviri sayısı: $($trMap.Count)"

# Load source JSON
$json = Get-Content $JsonPath -Raw | ConvertFrom-Json -Depth 50
$export = $json.Exports | Where-Object { $_.'$type' -match "RawExport" } | Select-Object -First 1
if (-not $export) { throw "RawExport bulunamadı." }

$data = [Convert]::FromBase64String($export.Data)
Write-Host "Orijinal data: $($data.Length) bytes"

# Find namespace
$nsStart = 0
for ($i = 0; $i -lt 32; $i++) {
    $len = [BitConverter]::ToInt32($data, $i)
    if ($len -gt 0 -and $len -lt 256 -and ($i + 4 + $len -le $data.Length)) {
        $cand = [System.Text.Encoding]::UTF8.GetString($data, $i + 4, $len - 1)
        if ($cand -match "^[a-zA-Z][a-zA-Z0-9_]+$") {
            $nsStart = $i
            $nsEnd = $i + 4 + $len
            break
        }
    }
}
if ($nsStart -eq 0 -and $nsEnd -eq 0) { throw "Namespace bulunamadı." }

# Entry count position
$pos = $nsEnd
$count = [BitConverter]::ToInt32($data, $pos)
$entriesStart = $pos + 4
Write-Host "Entry count: $count"

# Parse all entries, track value start/end for replacement
$pos = $entriesStart
$newParts = New-Object 'System.Collections.Generic.List[byte[]]'
# Prepend header (everything up to entries start)
$newParts.Add($data[0..($entriesStart - 1)])

$replaced = 0
$kept = 0
$missing = 0
for ($e = 0; $e -lt $count; $e++) {
    # Read key (preserved as-is)
    $keyBytesStart = $pos
    $null = Read-FString -data $data -pos ([ref]$pos)
    $keyBytesEnd = $pos
    $newParts.Add($data[$keyBytesStart..($keyBytesEnd - 1)])

    # Re-parse key to match CSV
    $tmpPos = $keyBytesStart
    $keyStr = Read-FString -data $data -pos ([ref]$tmpPos)

    # Read original value
    $valStartPos = $pos
    $origVal = Read-FString -data $data -pos ([ref]$pos)
    $valEndPos = $pos

    # Replace with CSV TR value if found
    if ($trMap.ContainsKey($keyStr)) {
        $newVal = $trMap[$keyStr]
        if ($newVal -ne $origVal) { $replaced++ } else { $kept++ }
        $newParts.Add((Write-FString -s $newVal))
    } else {
        # Key missing in CSV — preserve original
        $missing++
        $newParts.Add($data[$valStartPos..($valEndPos - 1)])
    }
}

# Append remaining tail (meta data section)
if ($pos -lt $data.Length) {
    $newParts.Add($data[$pos..($data.Length - 1)])
}

# Concatenate all parts
$totalLen = 0
foreach ($p in $newParts) { $totalLen += $p.Length }
$newData = New-Object byte[] $totalLen
$offset = 0
foreach ($p in $newParts) {
    [Array]::Copy($p, 0, $newData, $offset, $p.Length)
    $offset += $p.Length
}

Write-Host "Yeni data: $($newData.Length) bytes (delta $($newData.Length - $data.Length))"
Write-Host "Replaced: $replaced, Unchanged: $kept, Missing-in-CSV: $missing"

$export.Data = [Convert]::ToBase64String($newData)
$json | ConvertTo-Json -Depth 50 -Compress:$false | Set-Content $OutJsonPath -Encoding UTF8
Write-Host "Yazıldı: $OutJsonPath"
