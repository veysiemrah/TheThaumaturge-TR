# Vset CSV'leri apply et — JSON build/vset_json/, staging build/staging/.../Vset/<bölge>/<altkategori>/
# Wildcard pattern: translation/*vset*.csv → match build/vset_json/<name>.json + build/vset_extract path

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

# CSV'lerden filtre — sadece *vset* ismiyle başlayanlar
$csvs = Get-ChildItem $csvDir -Filter "*vset*.csv" -File

foreach ($csv in $csvs) {
    $name = $csv.BaseName
    $jsonPath = Join-Path $jsonRoot "$name.json"

    if (-not (Test-Path $jsonPath)) {
        $counts.SkippedNoJson++
        $missing += "json: $name"
        continue
    }

    # Staging path'i bulmak için extract path'ini kullan
    $extractMatch = Get-ChildItem $extractRoot -Filter "$name.uasset" -Recurse -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $extractMatch) {
        $counts.SkippedNoExtract++
        $missing += "uasset: $name"
        continue
    }

    # extract'tan staging'e relatif yol
    $relativePath = $extractMatch.FullName.Replace($extractRoot, "").TrimStart("\")
    $stagePath = Join-Path $stageRoot $relativePath

    # Staging klasörünü oluştur
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
Write-Host "Json yok atlandı:  $($counts.SkippedNoJson)"
Write-Host "Extract yok:       $($counts.SkippedNoExtract)"
Write-Host "Failed:            $($counts.Failed)"
if ($missing.Count -gt 0) {
    Write-Host ""
    $missing | Select-Object -First 20 | ForEach-Object { "  $_" }
}
