# Tüm translation/*.csv dosyalarında TR sütununda ASCII "..." → "…" (U+2026) yapar.
# UTF-8 (BOM yok) + CRLF korunur. CSV bütünlüğü Import-Csv/Export-Csv ile garantilenir.

param(
    [switch]$DryRun
)

$files = Get-ChildItem translation/*.csv
$totalHits = 0
$totalFiles = 0
$changedFiles = @()

foreach ($f in $files) {
    try {
        $rows = Import-Csv -Path $f.FullName
    } catch {
        Write-Host "PARSE FAIL: $($f.Name) — atlandı" -ForegroundColor Red
        continue
    }
    if ($rows.Count -eq 0) { continue }

    $fileHits = 0
    foreach ($r in $rows) {
        if ($r.PSObject.Properties.Name -notcontains 'TR') { continue }
        if ($r.TR -match '\.\.\.') {
            $fileHits += ([regex]::Matches($r.TR, '\.\.\.')).Count
            $r.TR = $r.TR -replace '\.\.\.', '…'
        }
    }

    if ($fileHits -gt 0) {
        $totalHits += $fileHits
        $totalFiles++
        $changedFiles += $f.Name
        Write-Host ("{0,3} hit: {1}" -f $fileHits, $f.Name)

        if (-not $DryRun) {
            # CRLF + UTF-8 (BOM yok) yaz; orijinal kolon sırasını koruyacak
            $tmp = "$($f.FullName).tmp"
            $rows | Export-Csv -Path $tmp -NoTypeInformation -Encoding utf8 -UseQuotes Always
            # Export-Csv UTF-8 BOM ekler (PS 7'de utf8BOM vs utf8NoBOM ayrımı). utf8 = BOMsuz PS7.
            # Üzerine yaz
            Move-Item -Path $tmp -Destination $f.FullName -Force
        }
    }
}

Write-Host ""
Write-Host "=== Özet ===" -ForegroundColor Green
Write-Host "Toplam değişen TR '...' adedi: $totalHits"
Write-Host "Etkilenen dosya sayısı: $totalFiles"
if ($DryRun) {
    Write-Host "(DryRun — dosyalara dokunulmadı)" -ForegroundColor Yellow
}
