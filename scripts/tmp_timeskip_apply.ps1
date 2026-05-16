$ErrorActionPreference = "Stop"

$files = @("lw_TimeSkip","lw_TimeSkip_BZR","lw_TimeSkip_CM","lw_TimeSkip_GRZ","lw_TimeSkip_PP","lw_TimeSkip_PR","lw_TimeSkip_PW","lw_TimeSkip_SMC")
$relDir = "TheThaumaturge\Content\GrimoireContent\Quests\Dialogues\lw_timeSkipScenes"
$stagingBase = "build\staging\$relDir"
New-Item -ItemType Directory -Force -Path $stagingBase | Out-Null

foreach ($f in $files) {
    Write-Host "[$f]"
    $jsonIn  = "build\work\$f.json"
    $csv     = "translation\$f.csv"
    $jsonOut = "build\work\${f}_tr.json"
    $uassetIn = "build\work\$relDir\$f.uasset"
    $uassetOut = "$stagingBase\$f.uasset"

    & pwsh -File scripts/dialog_apply.ps1 -JsonPath $jsonIn -CsvPath $csv -OutJsonPath $jsonOut -AllRawExports
    if ($LASTEXITCODE -ne 0) { throw "apply failed: $f" }

    & .\tools\UAssetGUI\UAssetGUI.exe fromjson $jsonOut $uassetOut Mappings 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "fromjson failed: $f" }

    # Copy uexp / ubulk if present
    $base = [System.IO.Path]::Combine("build\work\$relDir", $f)
    foreach ($ext in @(".uexp",".ubulk")) {
        $src = "$base$ext"
        if (Test-Path $src) {
            Copy-Item $src "$stagingBase\$f$ext" -Force
        }
    }
    Write-Host "  Staged: $uassetOut"
}
Write-Host "Done: $($files.Count) timeSkip assets staged."
