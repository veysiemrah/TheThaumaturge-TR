# tmp_ic_lw_apply.ps1
# 12 IC_lw_<arc> dosyasını uygula: dialog_apply -AllRawExports + UAssetGUI fromjson + staging
$assets = @("cm01","grz01","pp01","pw01","pw02","smc01","smc02","smc03","smg01","smg02","smg03","smg04")
$jsonRoot  = "build\ic_json"
$trRoot    = "translation"
$workRoot  = "build\work"
$stageBase = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests\InsightsConclusions"
$uaGui     = ".\tools\UAssetGUI\UAssetGUI.exe"

$applied = 0; $staged = 0; $failed = @()

foreach ($a in $assets) {
    $name = "IC_lw_$a"
    $jsonPath = Join-Path $jsonRoot "$name.json"
    $csvPath  = Join-Path $trRoot  "$name.csv"
    $outJson  = Join-Path $workRoot "$($name)_tr.json"
    $stageDir = Join-Path $stageBase "lw_$a"
    New-Item -ItemType Directory -Force -Path $stageDir | Out-Null
    $stagePath = Join-Path $stageDir "$name.uasset"

    if (-not (Test-Path $jsonPath)) { Write-Host "ATLA $name (JSON yok)" -ForegroundColor Yellow; $failed += $name; continue }
    if (-not (Test-Path $csvPath))  { Write-Host "ATLA $name (CSV yok)"  -ForegroundColor Yellow; $failed += $name; continue }

    Write-Host "[$name] apply..." -ForegroundColor Cyan
    & pwsh scripts\dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csvPath -OutJsonPath $outJson -AllRawExports 2>&1 | Select-String "Replaced|Yaz" | ForEach-Object { Write-Host "  $_" }

    if (-not (Test-Path $outJson)) { Write-Host "  HATA TR JSON üretilmedi" -ForegroundColor Red; $failed += $name; continue }
    $applied++

    & $uaGui fromjson $outJson $stagePath Mappings 2>&1 | Out-Null
    if (-not (Test-Path $stagePath)) { Write-Host "  HATA uasset üretilmedi" -ForegroundColor Red; $failed += $name; continue }
    $staged++
}

Write-Host ""
Write-Host "=== IC_lw apply özet ===" -ForegroundColor Green
Write-Host "Applied: $applied / Staged: $staged"
if ($failed) { Write-Host "Failed: $($failed -join ', ')" -ForegroundColor Red }
