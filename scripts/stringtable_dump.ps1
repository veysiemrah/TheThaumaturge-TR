# stringtable_dump.ps1
# UAssetGUI JSON çıktısındaki StringTable "Data" base64 blob'unu parse eder,
# tüm entry'leri tablo halinde listeler (veya CSV olarak yazar).

param(
    [Parameter(Mandatory=$true)] [string] $JsonPath,
    [string] $CsvPath = $null
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

$json = Get-Content $JsonPath -Raw | ConvertFrom-Json -Depth 50
$export = $json.Exports | Where-Object { $_.'$type' -match "RawExport" } | Select-Object -First 1
$data = [Convert]::FromBase64String($export.Data)

# Find namespace
$pos = 0
for ($i = 0; $i -lt 32; $i++) {
    $len = [BitConverter]::ToInt32($data, $i)
    if ($len -gt 0 -and $len -lt 256 -and ($i + 4 + $len -le $data.Length)) {
        $candidate = [System.Text.Encoding]::UTF8.GetString($data, $i + 4, $len - 1)
        if ($candidate -match "^[a-zA-Z][a-zA-Z0-9_]+$") {
            $namespace = $candidate
            $pos = $i + 4 + $len
            break
        }
    }
}

$count = [BitConverter]::ToInt32($data, $pos); $pos += 4

Write-Host "Namespace: $namespace"
Write-Host "Entry count: $count"
Write-Host ""

$rows = @()
for ($e = 0; $e -lt $count; $e++) {
    $k = Read-FString -data $data -pos ([ref]$pos)
    $v = Read-FString -data $data -pos ([ref]$pos)
    $rows += [PSCustomObject]@{ Key = $k; Value = $v }
}

if ($CsvPath) {
    $rows | Export-Csv -Path $CsvPath -Encoding UTF8 -NoTypeInformation
    Write-Host "CSV yazıldı: $CsvPath"
} else {
    $rows | Format-Table -AutoSize -Wrap
}
