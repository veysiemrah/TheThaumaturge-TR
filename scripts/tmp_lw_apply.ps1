# tmp_lw_apply.ps1
# lw_* tüm çevrilmiş (translation/) CSV'leri JSON'a uygula + staging'e fromjson.
# Translated CSV'nin uasset karşılığını lw_extract altında ismiyle bulur.

param(
    [string[]]$Include = $null  # Opsiyonel: sadece bu quest'leri uygula (ör: @("lw_pp01","lw_bzr01"))
)

$workRoot     = "build\work"
$trRoot       = "translation"
$extractRoot  = "build\lw_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$stageBase    = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$jsonRoot     = "build\lw_json"
$uaGui        = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings     = "Mappings"

New-Item -ItemType Directory -Force -Path $workRoot | Out-Null

$allCsvs = Get-ChildItem "$trRoot\lw_*.csv" | Where-Object {
    $_.BaseName -notlike "*_journal" -and
    $_.BaseName -notlike "*_readable" -and
    $_.BaseName -notlike "lw_POI_*"
}

if ($Include) {
    $allCsvs = $allCsvs | Where-Object {
        $base = $_.BaseName
        $match = $false
        foreach ($inc in $Include) {
            if ($base -like ("$inc" + "_*") -or $base -eq $inc) { $match = $true; break }
        }
        $match
    }
}

$counts = @{ Applied = 0; Staged = 0; Skipped = 0; Failed = 0 }

foreach ($csv in $allCsvs) {
    $name = $csv.BaseName

    # Quest adını çıkar: "lw_<prefix><id>" — first two _-separated segments
    $parts = $name -split "_"
    if ($parts.Count -lt 2) {
        $counts.Skipped++
        continue
    }
    $quest = $parts[0] + "_" + $parts[1]

    # Uasset dosyasını extract altında bul
    $uassetPath = $null
    $questRoot = Join-Path $extractRoot $quest
    if (Test-Path $questRoot) {
        foreach ($sub in @("Assets", "Chats")) {
            $candidate = Join-Path (Join-Path $questRoot $sub) "$name.uasset"
            if (Test-Path $candidate) {
                $uassetPath = $candidate
                $subDir = $sub
                break
            }
        }
    }

    if (-not $uassetPath) {
        Write-Host "  ATLA: $name (uasset bulunamadı)" -ForegroundColor Yellow
        $counts.Skipped++
        continue
    }

    $jsonPath = Join-Path $jsonRoot "$name.json"
    $outJson  = Join-Path $workRoot "$($name)_tr.json"
    $stageDir = Join-Path $stageBase "$quest\$subDir"
    New-Item -ItemType Directory -Force -Path $stageDir | Out-Null
    $stagePath = Join-Path $stageDir "$name.uasset"

    if (-not (Test-Path $jsonPath)) {
        Write-Host "  ATLA: $name (JSON yok)" -ForegroundColor Yellow
        $counts.Skipped++
        continue
    }

    $isChat = $subDir -eq "Chats"
    Write-Host ("[" + $quest + "/" + $subDir + "] apply: " + $name) -ForegroundColor Cyan

    try {
        if ($isChat) {
            pwsh scripts\dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csv.FullName -OutJsonPath $outJson -AllRawExports | Out-Null
        } else {
            pwsh scripts\dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csv.FullName -OutJsonPath $outJson | Out-Null
        }
    } catch {
        Write-Host "  HATA apply: $_" -ForegroundColor Red
        $counts.Failed++
        continue
    }

    if (-not (Test-Path $outJson)) {
        Write-Host "  HATA: TR JSON üretilmedi" -ForegroundColor Red
        $counts.Failed++
        continue
    }
    $counts.Applied++

    & $uaGui fromjson $outJson $stagePath $mappings | Out-Null
    if (-not (Test-Path $stagePath)) {
        Write-Host "  HATA: uasset üretilmedi" -ForegroundColor Red
        $counts.Failed++
        continue
    }
    $counts.Staged++
}

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "Applied: $($counts.Applied)"
Write-Host "Staged:  $($counts.Staged)"
Write-Host "Skipped: $($counts.Skipped)"
Write-Host "Failed:  $($counts.Failed)"
