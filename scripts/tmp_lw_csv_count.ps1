# Quick inventory of lw_* non-journal/readable CSVs
$files = Get-ChildItem "source\pl\lw_*.csv" | Where-Object {
    $_.Name -notlike "*_journal*" -and $_.Name -notlike "*_readable*"
}

Write-Host ("Dosya sayisi: " + $files.Count)

$total = 0
foreach ($f in $files) {
    $n = (Get-Content $f.FullName | Measure-Object -Line).Lines
    $total += $n
}
Write-Host ("Toplam satir: " + $total)

# Grouping per lw quest
Write-Host ""
Write-Host "=== Quest basina ==="
$grouped = $files | Group-Object { ($_.BaseName -split "_")[0..1] -join "_" }
foreach ($g in $grouped) {
    $sum = 0
    foreach ($f in $g.Group) {
        $sum += (Get-Content $f.FullName | Measure-Object -Line).Lines
    }
    Write-Host ("{0,-10} {1,3} dosya  {2,5} satir" -f $g.Name, $g.Count, $sum)
}
