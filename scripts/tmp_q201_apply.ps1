# tmp_q201_apply.ps1
# q201 + q201b tüm CSV'lerini JSON'a uygula + staging'e fromjson.

$jsonRoot   = "build\q201_json"
$workRoot   = "build\work"
$trRoot     = "translation"
$stageBase  = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$uaGui      = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings   = "Mappings"

New-Item -ItemType Directory -Force -Path $workRoot | Out-Null

$quests = @(
    @{ Name = "q201";  Assets = 10; Chats = 14 },
    @{ Name = "q201b"; Assets = 9;  Chats = 14 }
)
$subdirs = @("Assets", "Chats")

$counts = @{ Applied = 0; Staged = 0; Skipped = 0; Failed = 0 }

foreach ($q in $quests) {
    foreach ($sub in $subdirs) {
        $stageDir = Join-Path $stageBase "$($q.Name)\$sub"
        New-Item -ItemType Directory -Force -Path $stageDir | Out-Null
    }
}

$csvFiles = Get-ChildItem "$trRoot\q201*.csv" | Where-Object {
    $_.BaseName -notlike "*_journal" -and $_.BaseName -notlike "*_readable*"
}

foreach ($csv in $csvFiles) {
    $name = $csv.BaseName

    # Quest adı ve tipini belirle
    $quest = if ($name -like "q201b_*") { "q201b" } else { "q201" }
    $isChat = $name -like "*_chat"
    $sub = if ($isChat) { "Chats" } else { "Assets" }

    $jsonPath = Join-Path $jsonRoot "$name.json"
    $outJson = Join-Path $workRoot "$($name)_tr.json"
    $stagePath = Join-Path $stageBase "$quest\$sub\$name.uasset"

    if (-not (Test-Path $jsonPath)) {
        Write-Host "  ATLA: $name JSON yok" -ForegroundColor Yellow
        $counts.Skipped++
        continue
    }

    Write-Host "[$quest/$sub] apply: $name" -ForegroundColor Cyan

    # 1) apply
    try {
        if ($isChat) {
            pwsh scripts\dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csv.FullName -OutJsonPath $outJson -AllRawExports | Out-Null
        } else {
            pwsh scripts\dialog_apply.ps1 -JsonPath $jsonPath -CsvPath $csv.FullName -OutJsonPath $outJson | Out-Null
        }
    } catch {
        Write-Host "  HATA apply ($name): $_" -ForegroundColor Red
        $counts.Failed++
        continue
    }

    if (-not (Test-Path $outJson)) {
        Write-Host "  HATA: TR JSON üretilmedi ($name)" -ForegroundColor Red
        $counts.Failed++
        continue
    }
    $counts.Applied++

    # 2) fromjson → staging
    & $uaGui fromjson $outJson $stagePath $mappings | Out-Null
    if (-not (Test-Path $stagePath)) {
        Write-Host "  HATA: uasset üretilmedi ($name)" -ForegroundColor Red
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
