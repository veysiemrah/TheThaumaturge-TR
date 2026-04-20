# Line counts for lw_smg04 non-journal CSVs
Get-ChildItem "source\pl\lw_smg04_*.csv" | Where-Object { $_.BaseName -notlike "*_journal" } | ForEach-Object {
    $n = (Get-Content $_.FullName | Measure-Object -Line).Lines
    "{0,-50} {1,4}" -f $_.Name, $n
}
