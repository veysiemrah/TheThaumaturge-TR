# Tüm Vset uasset'lerini JSON'a çevirip source/pl/<name>.csv'ye dump et.
# -AllRawExports gerekli (vset asset'leri Chat-tipi).

$extractRoot = "build/vset_extract/TheThaumaturge/Content/GrimoireContent/Quests/Vset"
$jsonRoot    = "build/vset_json"
$csvRoot     = "source/pl"
$uaGui       = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings    = "Mappings"

New-Item -ItemType Directory -Force -Path $jsonRoot | Out-Null

# Important_NPCs/Wiktor/VO klasörleri ses dosyası referansları, atla
$assets = Get-ChildItem -Path $extractRoot -Filter "*.uasset" -Recurse -File | Where-Object {
    $_.FullName -notmatch '\\VO\\(en|pl)\\'
}

$total = $assets.Count
Write-Host "Toplam vset asset (VO hariç): $total" -ForegroundColor Cyan

$counts = @{ Json = 0; Dump = 0; Empty = 0; Failed = 0 }
$idx = 0

foreach ($a in $assets) {
    $idx++
    $name = $a.BaseName
    $jsonPath = Join-Path $jsonRoot "$name.json"
    $csvPath  = Join-Path $csvRoot "$name.csv"

    Write-Host ("[{0}/{1}] {2}" -f $idx, $total, $name) -NoNewline

    # tojson
    & $uaGui tojson $a.FullName $jsonPath VER_UE5_1 $mappings | Out-Null
    if (-not (Test-Path $jsonPath)) {
        Write-Host " ✗ tojson" -ForegroundColor Red
        $counts.Failed++
        continue
    }
    $counts.Json++

    # dump
    try {
        $output = pwsh scripts/dialog_dump.ps1 -JsonPath $jsonPath -CsvPath $csvPath -AllRawExports 2>&1 | Out-String
    } catch {
        Write-Host " ✗ dump" -ForegroundColor Red
        $counts.Failed++
        continue
    }

    # CSV satır sayısı kontrol — header dahil
    $lineCount = 0
    if (Test-Path $csvPath) {
        $lineCount = (Get-Content $csvPath).Count
    }
    if ($lineCount -le 1) {
        Write-Host " (boş)" -ForegroundColor Yellow
        $counts.Empty++
    } else {
        Write-Host (" → {0} satır" -f ($lineCount - 1)) -ForegroundColor Green
        $counts.Dump++
    }
}

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "JSON üretildi:    $($counts.Json)"
Write-Host "İçerikli dump:    $($counts.Dump)"
Write-Host "Boş asset:        $($counts.Empty)"
Write-Host "Başarısız:        $($counts.Failed)"
