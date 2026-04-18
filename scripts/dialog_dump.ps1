# dialog_dump.ps1
# Dialog graph .uasset (JSON) dosyasındaki tüm 32-char hex hash + FString metin çiftlerini çıkarır.
# Format (CinematicNode_Choice / CinematicNode_Response export'ları içinde):
#   [FString hash] (33 byte: 32 hex char + '\0')
#   [FString text] (UTF-8 pozitif uzunluk / UTF-16LE negatif uzunluk)

param(
    [Parameter(Mandatory=$true)][string] $JsonPath,
    [string] $CsvPath = $null,
    [switch] $SkipNumericTexts
)

$json = Get-Content $JsonPath -Raw | ConvertFrom-Json -Depth 50
$exports = $json.Exports | Where-Object { $_.'$type' -match "RawExport" -and $_.Data }

$rows = New-Object System.Collections.Generic.List[object]
$seenHashes = New-Object System.Collections.Generic.HashSet[string]

foreach ($exp in $exports) {
    $name = $exp.ObjectName
    # Metin sadece CinematicNode_* export'larında beklenir
    if ($name -notmatch '^CinematicNode_(Choice|Response)') { continue }
    $data = [Convert]::FromBase64String($exp.Data)

    for ($pos = 0; $pos -lt $data.Length - 37; $pos++) {
        $len = [BitConverter]::ToInt32($data, $pos)
        if ($len -ne 33) { continue }
        $cand = [System.Text.Encoding]::ASCII.GetString($data, $pos + 4, 32)
        if ($cand -notmatch '^[0-9A-F]{32}$') { continue }
        $hashId = $cand
        $textPos = $pos + 4 + 33
        if ($textPos + 4 -gt $data.Length) { continue }
        $textLen = [BitConverter]::ToInt32($data, $textPos)
        $textPosBody = $textPos + 4
        $text = $null
        if ($textLen -gt 0 -and $textLen -lt 8192 -and $textPosBody + $textLen -le $data.Length) {
            $text = [System.Text.Encoding]::UTF8.GetString($data, $textPosBody, $textLen - 1)
        } elseif ($textLen -lt 0 -and $textLen -gt -8192) {
            $chars = -$textLen
            $byteLen = $chars * 2
            if ($textPosBody + $byteLen -le $data.Length) {
                $text = [System.Text.Encoding]::Unicode.GetString($data, $textPosBody, ($chars - 1) * 2)
            }
        }
        if ($null -eq $text) { continue }
        if ($SkipNumericTexts -and $text -match '^\d+$') { continue }
        if (-not $seenHashes.Add($hashId)) { continue }
        $rows.Add([PSCustomObject]@{
            Hash = $hashId
            NodeName = $name
            PL = $text
        })
    }
}

Write-Host "Dosya: $JsonPath"
Write-Host "Toplam unique dialog satırı: $($rows.Count)"

if ($CsvPath) {
    $rows | Export-Csv -Path $CsvPath -Encoding UTF8 -NoTypeInformation
    Write-Host "CSV yazıldı: $CsvPath"
} else {
    $rows | Select-Object -First 20 | Format-Table -AutoSize -Wrap
}
