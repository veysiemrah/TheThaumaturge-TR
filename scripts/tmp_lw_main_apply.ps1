# tmp_lw_main_apply.ps1
# LW yan görev ana sahne CSV'leri (translation/<arc>_*.csv, lw_ prefix YOK) için apply.
# CSV adı = uasset adı; Quest dizini = lw_<arc>.
#
# Kullanım:
#   pwsh scripts\tmp_lw_main_apply.ps1 -Arcs @("smg03","pw01")
#
# Her CSV için:
#   - JSON kaynağı: build\lw_json\<name>.json
#   - dialog_apply (-AllRawExports yok; ana sahneler tek RawExport)
#   - UAssetGUI fromjson → build\staging\...\Dialogues\lw_<arc>\Assets\<name>.uasset

param(
    [Parameter(Mandatory=$true)]
    [string[]]$Arcs
)

$trRoot       = "translation"
$workRoot     = "build\work"
$jsonRoot     = "build\lw_json"
$extractRoot  = "build\lw_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$stageBase    = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$uaGui        = ".\tools\UAssetGUI\UAssetGUI.exe"

New-Item -ItemType Directory -Force -Path $workRoot | Out-Null

$applied = 0; $staged = 0; $skipped = 0; $failed = @()

foreach ($arc in $Arcs) {
    $csvFiles = Get-ChildItem "$trRoot\$arc`_*.csv" -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -notlike "*_chats.csv" -and
        $_.Name -notlike "*_journal.csv" -and
        $_.Name -notlike "*_readables.csv" -and
        $_.Name -notlike "*_vset_*.csv"
    }

    if (-not $csvFiles) {
        Write-Host "ATLA: arc $arc — eşleşen CSV yok" -ForegroundColor Yellow
        continue
    }

    Write-Host "=== arc lw_$arc — $($csvFiles.Count) ana sahne ===" -ForegroundColor Green

    foreach ($csv in $csvFiles) {
        $name = $csv.BaseName
        $jsonPath = Join-Path $jsonRoot "$name.json"
        $outJson  = Join-Path $workRoot "$($name)_tr.json"
        $stageDir = Join-Path $stageBase "lw_$arc\Assets"
        New-Item -ItemType Directory -Force -Path $stageDir | Out-Null
        $stagePath = Join-Path $stageDir "$name.uasset"

        if (-not (Test-Path $jsonPath)) {
            Write-Host "  ATLA $name (JSON yok: $jsonPath)" -ForegroundColor Yellow
            $skipped++; continue
        }

        Write-Host "  [$name] apply..." -ForegroundColor Cyan
        & pwsh scripts\dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csv.FullName -OutJsonPath $outJson 2>&1 |
            Select-String "Replaced|Yaz" | ForEach-Object { Write-Host "    $_" }

        if (-not (Test-Path $outJson)) {
            Write-Host "    HATA TR JSON üretilmedi" -ForegroundColor Red
            $failed += $name; continue
        }
        $applied++

        & $uaGui fromjson $outJson $stagePath Mappings 2>&1 | Out-Null
        if (-not (Test-Path $stagePath)) {
            Write-Host "    HATA uasset üretilmedi" -ForegroundColor Red
            $failed += $name; continue
        }
        $staged++
    }
}

Write-Host ""
Write-Host "=== LW main apply özet ===" -ForegroundColor Green
Write-Host "Applied: $applied / Staged: $staged / Skipped: $skipped"
if ($failed) { Write-Host "Failed: $($failed -join ', ')" -ForegroundColor Red }
