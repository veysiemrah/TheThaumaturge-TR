# tmp_lw_validate.ps1 — run standard validations on lw translation CSVs
$files = Get-ChildItem "translation\lw_*.csv" | Where-Object {
    $_.BaseName -notlike "*_journal" -and
    $_.BaseName -notlike "*_readable" -and
    $_.BaseName -notlike "lw_POI_*"
}

$colBad = 0
$tagBad = 0

foreach ($f in $files) {
    $out = & .\scripts\validate_csv_columns.ps1 -CsvPath $f.FullName 2>&1 | Out-String
    if ($out -match "uyusmazligi: (\d+)" -or $out -match "uyuşmazlığı: (\d+)") {
        $n = [int]$Matches[1]
        if ($n -ne 0) {
            $colBad += $n
            Write-Host ("COL " + $f.Name + ": " + $n) -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host ("Toplam kolon uyusmazligi: " + $colBad)
