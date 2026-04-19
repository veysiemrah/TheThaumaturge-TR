$csvs = Get-ChildItem source/pl/q201*.csv
$total = 0
$report = @()
foreach ($c in $csvs) {
    $lines = (Import-Csv $c.FullName).Count
    $total += $lines
    $report += [PSCustomObject]@{ File = $c.BaseName; Lines = $lines }
}
$report | Sort-Object -Property Lines -Descending | Format-Table -AutoSize
Write-Host ("TOPLAM: {0} satır / {1} asset" -f $total, $csvs.Count)
