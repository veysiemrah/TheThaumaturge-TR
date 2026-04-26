# fix_journal_readable_apply.ps1
# Journal ve Readable asset'lerine -AllRawExports ile çeviri uygular.
# Kullanım: .\scripts\fix_journal_readable_apply.ps1

param(
    [string] $StagingBase = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests",
    [string] $TranslationBase = "translation",
    [string] $TmpDir = "build\work\journal_readable_fix"
)

New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

$root        = (Get-Location).Path
$mappings    = Join-Path $root "tools\Mappings.usmap"
$uassetgui   = Join-Path $root "tools\UAssetGUI\UAssetGUI.exe"
$applyScript = Join-Path $root "scripts\dialog_apply.ps1"

$allAssets = @(Get-ChildItem "$StagingBase\Journal"   -Recurse -Filter "*.uasset") +
             @(Get-ChildItem "$StagingBase\Readables"  -Recurse -Filter "*.uasset")

$ok = 0; $fail = 0

foreach ($asset in $allAssets) {
    $csvPath = "$TranslationBase\$($asset.BaseName).csv"
    if (-not (Test-Path $csvPath)) { continue }

    $tmpJson    = Join-Path $root "$TmpDir\$($asset.BaseName)_orig.json"
    $tmpTrJson  = Join-Path $root "$TmpDir\$($asset.BaseName)_tr.json"

    # 1. tojson
    $r = & $uassetgui tojson $asset.FullName $tmpJson VER_UE5_1 $mappings 2>&1
    if (-not (Test-Path $tmpJson)) { Write-Host "HATA tojson: $($asset.Name)"; $fail++; continue }

    # 2. apply -AllRawExports
    & $applyScript -JsonPath $tmpJson -CsvPath $csvPath -OutJsonPath $tmpTrJson -AllRawExports | Out-Null

    if (-not (Test-Path $tmpTrJson)) { Write-Host "HATA apply: $($asset.Name)"; $fail++; continue }

    # 3. fromjson — staging'e yerinde yaz (.uasset + .uexp)
    $r2 = & $uassetgui fromjson $tmpTrJson $asset.FullName $mappings 2>&1
    $ok++
    Write-Host "OK: $($asset.Name)"
}

Write-Host ""
Write-Host "Tamamlandı: $ok başarılı, $fail başarısız"
