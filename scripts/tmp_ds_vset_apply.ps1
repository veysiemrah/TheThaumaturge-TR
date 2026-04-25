# DS vset CSV'leri apply et — yalnızca DS_vset_* dosyalarını işler.

$workRoot   = "build/work"
$csvDir     = "translation"
$jsonRoot   = "build/vset_json"
$extractRoot = (Resolve-Path "build/vset_extract/TheThaumaturge").Path
$stageRoot  = (Resolve-Path "build/staging/TheThaumaturge").Path
$uaGui      = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings   = "Mappings"

New-Item -ItemType Directory -Force -Path $workRoot | Out-Null

$counts = @{ Applied = 0; Staged = 0; SkippedNoJson = 0; SkippedNoExtract = 0; Failed = 0 }
$missing = @()

$csvs = Get-ChildItem $csvDir -Filter "DS_vset_*.csv" -File

foreach ($csv in $csvs) {
    $name = $csv.BaseName
    $jsonPath = Join-Path $jsonRoot "$name.json"

    if (-not (Test-Path $jsonPath)) {
        $counts.SkippedNoJson++
        $missing += "json: $name"
        continue
    }

    $extractMatch = Get-ChildItem $extractRoot -Filter "$name.uasset" -Recurse -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $extractMatch) {
        $counts.SkippedNoExtract++
        $missing += "uasset: $name"
        continue
    }

    $relativePath = $extractMatch.FullName.Replace($extractRoot, "").TrimStart("\")
    $stagePath = Join-Path $stageRoot $relativePath
    $stageDir = Split-Path $stagePath -Parent
    New-Item -ItemType Directory -Force -Path $stageDir | Out-Null

    $outJson = Join-Path $workRoot "$($name)_tr.json"

    Write-Host "[$name]" -NoNewline

    try {
        pwsh scripts/dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csv.FullName -OutJsonPath $outJson -AllRawExports | Out-Null
    } catch {
        Write-Host " ✗ apply" -ForegroundColor Red
        $counts.Failed++
        continue
    }

    if (-not (Test-Path $outJson)) {
        Write-Host " ✗ apply (json yok)" -ForegroundColor Red
        $counts.Failed++
        continue
    }
    $counts.Applied++

    & $uaGui fromjson $outJson $stagePath $mappings | Out-Null
    if (-not (Test-Path $stagePath)) {
        Write-Host " ✗ fromjson" -ForegroundColor Red
        $counts.Failed++
        continue
    }
    $counts.Staged++
    Write-Host " ✓" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "Applied:           $($counts.Applied)"
Write-Host "Staged:            $($counts.Staged)"
Write-Host "Json yok:          $($counts.SkippedNoJson)"
Write-Host "Extract yok:       $($counts.SkippedNoExtract)"
Write-Host "Failed:            $($counts.Failed)"
if ($missing.Count -gt 0) {
    $missing | Select-Object -First 20 | ForEach-Object { "  $_" }
}
