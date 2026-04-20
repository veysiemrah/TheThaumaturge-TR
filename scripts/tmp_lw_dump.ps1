# tmp_lw_dump.ps1
# Tüm lw_* quest klasörlerindeki top-level Assets + Chats uasset'lerini
# JSON + CSV dump üret. Chat için -AllRawExports.

$uaGui    = ".\tools\UAssetGUI\UAssetGUI.exe"
$mappings = "Mappings"

$extractRoot = "build\lw_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"
$jsonRoot    = "build\lw_json"
$srcRoot     = "source\pl"

New-Item -ItemType Directory -Force -Path $jsonRoot | Out-Null
New-Item -ItemType Directory -Force -Path $srcRoot  | Out-Null

$lwDirs = Get-ChildItem $extractRoot -Directory | Where-Object { $_.Name.StartsWith("lw_") }
$subs = @("Assets", "Chats")
$counts = @{ Dumped = 0; Skipped = 0; Empty = 0 }

foreach ($d in $lwDirs) {
    foreach ($sub in $subs) {
        $dir = Join-Path $d.FullName $sub
        if (-not (Test-Path $dir)) { continue }

        $uassets = Get-ChildItem $dir -Filter '*.uasset'
        foreach ($u in $uassets) {
            $name = [System.IO.Path]::GetFileNameWithoutExtension($u.Name)
            $jsonPath = Join-Path $jsonRoot "$name.json"
            $csvPath  = Join-Path $srcRoot  "$name.csv"

            Write-Host ("[" + $d.Name + "/" + $sub + "] " + $name) -ForegroundColor Cyan
            & $uaGui tojson $u.FullName $jsonPath VER_UE5_1 $mappings | Out-Null

            if (-not (Test-Path $jsonPath)) {
                Write-Host "  HATA: JSON üretilmedi" -ForegroundColor Red
                $counts.Skipped++
                continue
            }

            if ($sub -eq "Chats") {
                pwsh scripts\dialog_dump.ps1 -JsonPath $jsonPath -CsvPath $csvPath -AllRawExports | Out-Null
            } else {
                pwsh scripts\dialog_dump.ps1 -JsonPath $jsonPath -CsvPath $csvPath | Out-Null
            }

            $lineCount = 0
            if (Test-Path $csvPath) {
                $lineCount = (Get-Content $csvPath | Measure-Object -Line).Lines
            }

            if ($lineCount -le 1) {
                $counts.Empty++
                if (Test-Path $csvPath) { Remove-Item $csvPath -Force }
            } else {
                $counts.Dumped++
            }
        }
    }
}

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "Dumped (non-empty): $($counts.Dumped)"
Write-Host "Empty (silindi):    $($counts.Empty)"
Write-Host "Skipped:            $($counts.Skipped)"
