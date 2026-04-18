# TR kolonunda ASCII "..." arar, listelemek için
$files = Get-ChildItem translation/*.csv
$hits = @()
foreach ($f in $files) {
    try {
        $rows = Import-Csv -Path $f.FullName
        $lineNo = 1
        foreach ($r in $rows) {
            $lineNo++
            if ($r.TR -match '\.\.\.') {
                $hits += [PSCustomObject]@{
                    File = $f.Name
                    Line = $lineNo
                    Key  = if ($r.PSObject.Properties.Name -contains 'Key') { $r.Key } else { $r.Hash }
                    TR   = $r.TR
                }
            }
        }
    } catch {
        Write-Host "PARSE FAIL: $($f.Name)"
    }
}
Write-Host ""
Write-Host "Total TR-sütun '...' hit sayısı: $($hits.Count)"
Write-Host ""
Write-Host "--- Dosya başına ---"
$hits | Group-Object File | Sort-Object Count -Descending | ForEach-Object {
    "{0,3}  {1}" -f $_.Count, $_.Name
}
Write-Host ""
Write-Host "--- Detay (ilk 200) ---"
$hits | Select-Object -First 200 | ForEach-Object {
    "$($_.File):$($_.Line)  [$($_.Key)]  $($_.TR)"
}
