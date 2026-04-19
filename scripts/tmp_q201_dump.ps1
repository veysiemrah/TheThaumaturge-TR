# tmp_q201_dump.ps1
# q201 + q201b tüm .uasset'leri JSON'a çevir + PL CSV dump üret.
# Assets: normal dump; Chats: -AllRawExports.

$extractRoot = "build\q201_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$jsonRoot    = "build\q201_json"
$srcRoot     = "source\pl"

New-Item -ItemType Directory -Force -Path $jsonRoot | Out-Null
New-Item -ItemType Directory -Force -Path $srcRoot | Out-Null

$uaGui = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings = "Mappings"

$quests = @("q201", "q201b")
$subdirs = @("Assets", "Chats")

$counts = @{ Assets = 0; Chats = 0 }

foreach ($q in $quests) {
    foreach ($sub in $subdirs) {
        $dir = Join-Path $extractRoot "$q\$sub"
        if (-not (Test-Path $dir)) { continue }
        $uassets = Get-ChildItem -Path $dir -Filter "*.uasset"
        foreach ($u in $uassets) {
            $name = [System.IO.Path]::GetFileNameWithoutExtension($u.Name)
            $jsonPath = Join-Path $jsonRoot "$name.json"
            $csvPath = Join-Path $srcRoot "$name.csv"

            # 1) tojson
            Write-Host "[$q/$sub] tojson: $name" -ForegroundColor Cyan
            & $uaGui tojson $u.FullName $jsonPath VER_UE5_1 $mappings | Out-Null
            if (-not (Test-Path $jsonPath)) {
                Write-Host "  HATA: JSON üretilmedi ($name)" -ForegroundColor Red
                continue
            }

            # 2) dump
            if ($sub -eq "Chats") {
                pwsh scripts\dialog_dump.ps1 -JsonPath $jsonPath -CsvPath $csvPath -AllRawExports | Out-Null
            } else {
                pwsh scripts\dialog_dump.ps1 -JsonPath $jsonPath -CsvPath $csvPath | Out-Null
            }
            $counts[$sub]++
        }
    }
}

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "Assets dump'lı: $($counts.Assets)"
Write-Host "Chats dump'lı:  $($counts.Chats)"
Write-Host "Toplam:          $($counts.Assets + $counts.Chats)"
