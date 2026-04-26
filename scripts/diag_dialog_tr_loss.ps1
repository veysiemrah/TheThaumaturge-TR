# diag_dialog_tr_loss.ps1
# CSV listesindeki her dialog asset'i için staging'deki .uasset'i tojson yapar,
# dialog_apply.ps1'i -AllRawExports'la dry-run çalıştırır.
# Replaced > 0 → staging'deki text CSV'deki TR'den farklı (regresyon adayı).
#
# Kullanım: .\scripts\diag_dialog_tr_loss.ps1 [-CsvList build\changed_csvs.txt]
#          (opsiyonel) -All  → translation/ altındaki tüm non-vset, non-_ST CSV'leri tara

param(
    [string] $CsvList = "build\changed_csvs.txt",
    [switch] $All,
    [switch] $Repair,
    [string] $StagingRoot = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests",
    [string] $TmpDir = "build\work\diag_tr_loss",
    [string] $ReportPath = "build\diag_tr_loss_report.txt"
)

New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

$root      = (Get-Location).Path
$mappings  = Join-Path $root "tools\Mappings.usmap"
$uassetgui = Join-Path $root "tools\UAssetGUI\UAssetGUI.exe"
$applyScript = Join-Path $root "scripts\dialog_apply.ps1"

# CSV listesini hazırla
if ($All) {
    $csvFiles = Get-ChildItem "translation" -Filter "*.csv" |
                Where-Object { $_.Name -notmatch "_ST\.csv$" -and $_.Name -notmatch "vset" }
    Write-Host "Tüm non-vset, non-_ST translation CSV'leri taranıyor: $($csvFiles.Count) dosya"
} else {
    if (-not (Test-Path $CsvList)) { throw "CsvList bulunamadı: $CsvList" }
    $names = Get-Content $CsvList | ForEach-Object {
        $_.Trim().TrimStart("translation/").TrimEnd(".csv")
    } | Where-Object { $_ -ne "" }
    $csvFiles = $names | ForEach-Object {
        $p = "translation\$_.csv"
        if (Test-Path $p) { Get-Item $p }
    }
    Write-Host "$($csvFiles.Count) CSV taranıyor (changed_csvs.txt)"
}

# Staging .uasset indeksi (BaseName → fullPath)
$allUassets = Get-ChildItem $StagingRoot -Recurse -Filter "*.uasset"
$uassetByName = @{}
foreach ($u in $allUassets) {
    if (-not $uassetByName.ContainsKey($u.BaseName)) {
        $uassetByName[$u.BaseName] = $u.FullName
    }
}

$results = New-Object System.Collections.Generic.List[object]
$idx = 0
$total = $csvFiles.Count

foreach ($csv in $csvFiles) {
    $idx++
    $name = $csv.BaseName
    if (-not $uassetByName.ContainsKey($name)) {
        $results.Add([PSCustomObject]@{ Name=$name; Status="NO_STAGING"; Replaced=-1; Unchanged=-1; Missing=-1 })
        continue
    }
    $uassetPath = $uassetByName[$name]
    $tmpJson    = Join-Path $TmpDir "$name.json"
    $tmpTrJson  = Join-Path $TmpDir "$($name)_tr.json"

    # tojson
    & $uassetgui tojson $uassetPath $tmpJson VER_UE5_1 $mappings 2>&1 | Out-Null
    if (-not (Test-Path $tmpJson)) {
        $results.Add([PSCustomObject]@{ Name=$name; Status="TOJSON_FAIL"; Replaced=-1; Unchanged=-1; Missing=-1 })
        continue
    }

    # dialog_apply -AllRawExports (dry-run; OutJson zorunlu ama kullanmıyoruz)
    $applyOut = & pwsh -NoProfile -File $applyScript -JsonPath $tmpJson -CsvPath $csv.FullName -OutJsonPath $tmpTrJson -AllRawExports 2>&1
    $stat = ($applyOut | Where-Object { $_ -match "Replaced:\s*(\d+),\s*Unchanged:\s*(\d+),\s*Missing-in-CSV:\s*(\d+)" } | Select-Object -First 1)
    if ($stat) {
        $null = $stat -match "Replaced:\s*(\d+),\s*Unchanged:\s*(\d+),\s*Missing-in-CSV:\s*(\d+)"
        $rep = [int]$matches[1]; $unc = [int]$matches[2]; $mis = [int]$matches[3]
        $status = if ($rep -gt 0) { "LOSS" } else { "OK" }
        $results.Add([PSCustomObject]@{ Name=$name; Status=$status; Replaced=$rep; Unchanged=$unc; Missing=$mis })
        $marker = if ($rep -gt 0) { "✗ LOSS" } else { "✓ OK" }
        Write-Host ("[{0}/{1}] {2,-50} R={3} U={4} M={5}  {6}" -f $idx, $total, $name, $rep, $unc, $mis, $marker)

        # Repair modu: LOSS varsa tmp_tr.json'u staging .uasset'in üzerine fromjson ile yaz
        if ($Repair -and $rep -gt 0 -and (Test-Path $tmpTrJson)) {
            & $uassetgui fromjson $tmpTrJson $uassetPath $mappings 2>&1 | Out-Null
            Write-Host ("    → REPAIRED ({0} hash TR'ye geri yazıldı)" -f $rep) -ForegroundColor Green
        }
    } else {
        $results.Add([PSCustomObject]@{ Name=$name; Status="PARSE_FAIL"; Replaced=-1; Unchanged=-1; Missing=-1 })
        Write-Host ("[{0}/{1}] {2}  PARSE_FAIL" -f $idx, $total, $name)
    }

    # tmp dosyaları temizle (yer korumak için) — Repair'de tmpTrJson'u sadece fromjson sonrası sil
    Remove-Item $tmpJson, $tmpTrJson -ErrorAction SilentlyContinue
}

# Rapor
$lossList = $results | Where-Object { $_.Status -eq "LOSS" } | Sort-Object Replaced -Descending
$okCount = ($results | Where-Object { $_.Status -eq "OK" }).Count
$noStageCount = ($results | Where-Object { $_.Status -eq "NO_STAGING" }).Count
$failCount = ($results | Where-Object { $_.Status -in @("TOJSON_FAIL","PARSE_FAIL") }).Count

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("# Dialog TR-Loss Diagnostic Report")
[void]$sb.AppendLine("# Tarih: $(Get-Date -Format 'yyyy-MM-dd HH:mm')")
[void]$sb.AppendLine("# Toplam CSV: $total")
[void]$sb.AppendLine("# OK (zaten TR): $okCount")
[void]$sb.AppendLine("# LOSS (Replaced>0): $($lossList.Count)")
[void]$sb.AppendLine("# Staging yok: $noStageCount")
[void]$sb.AppendLine("# Hata: $failCount")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("## LOSS olan asset'ler (Replaced büyükten küçüğe)")
foreach ($r in $lossList) {
    [void]$sb.AppendLine(("{0,-50} R={1} U={2} M={3}" -f $r.Name, $r.Replaced, $r.Unchanged, $r.Missing))
}
[void]$sb.AppendLine("")
[void]$sb.AppendLine("## NO_STAGING (translation/ var ama staging'de uasset yok)")
foreach ($r in ($results | Where-Object { $_.Status -eq "NO_STAGING" })) {
    [void]$sb.AppendLine($r.Name)
}
$sb.ToString() | Set-Content $ReportPath -Encoding UTF8

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "OK:        $okCount"
Write-Host "LOSS:      $($lossList.Count)" -ForegroundColor $(if ($lossList.Count -gt 0) { "Red" } else { "Green" })
Write-Host "NO_STAGE:  $noStageCount"
Write-Host "FAIL:      $failCount"
Write-Host ""
Write-Host "Rapor: $ReportPath"
