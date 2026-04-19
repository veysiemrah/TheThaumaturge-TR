# tmp_q301_dump.ps1
# q301 + q302 tüm .uasset'leri JSON'a çevir + PL CSV dump üret.

$uaGui = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings = "Mappings"

$targets = @(
    @{ Quest = "q301"; Extract = "build\q301_extract"; Json = "build\q301_json" },
    @{ Quest = "q302"; Extract = "build\q302_extract"; Json = "build\q302_json" }
)
$subdirs = @("Assets", "Chats")
$srcRoot = "source\pl"

New-Item -ItemType Directory -Force -Path $srcRoot | Out-Null

$counts = @{ Assets = 0; Chats = 0 }

foreach ($t in $targets) {
    New-Item -ItemType Directory -Force -Path $t.Json | Out-Null
    $dialogueRoot = Join-Path $t.Extract "TheThaumaturge\Content\GrimoireContent\Quests\Dialogues\$($t.Quest)"

    foreach ($sub in $subdirs) {
        $dir = Join-Path $dialogueRoot $sub
        if (-not (Test-Path $dir)) { continue }
        $uassets = Get-ChildItem -Path $dir -Filter "*.uasset"
        foreach ($u in $uassets) {
            $name = [System.IO.Path]::GetFileNameWithoutExtension($u.Name)
            $jsonPath = Join-Path $t.Json "$name.json"
            $csvPath = Join-Path $srcRoot "$name.csv"

            Write-Host "[$($t.Quest)/$sub] tojson: $name" -ForegroundColor Cyan
            & $uaGui tojson $u.FullName $jsonPath VER_UE5_1 $mappings | Out-Null
            if (-not (Test-Path $jsonPath)) {
                Write-Host "  HATA: JSON üretilmedi ($name)" -ForegroundColor Red
                continue
            }

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
