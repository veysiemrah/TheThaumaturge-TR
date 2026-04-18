# Multiline-aware CSV validation: tırnaksız virgül içeren, CSV parse'i bozan satırları tespit eder
$files = Get-ChildItem translation/*.csv
$problems = @()

foreach ($f in $files) {
    $raw = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ([string]::IsNullOrEmpty($raw)) { continue }

    # Header satırından beklenen kolon sayısını al
    $firstNL = $raw.IndexOf("`n")
    if ($firstNL -lt 0) { continue }
    $header = $raw.Substring(0, $firstNL).TrimEnd("`r")
    $expectedCols = ($header -split ',').Count

    # Tüm dosyayı karakter-karakter tara. Logical record'ları çıkar.
    $inQuotes = $false
    $recordStartChar = 0
    $recordStartLine = 1
    $currentLine = 1
    $fieldsInRecord = 1  # Her kayıt en az 1 alan içerir

    # İlk karakter header'ın başı. Header'ı atlamak için newline'dan sonrasından başla.
    $i = $firstNL + 1
    $currentLine = 2
    $recordStartChar = $i
    $recordStartLine = $i -ge $raw.Length ? -1 : 2
    $fieldsInRecord = 1

    while ($i -lt $raw.Length) {
        $ch = $raw[$i]

        if ($ch -eq '"') {
            # Çift tırnak kaçışı mı (""), yoksa toggle mı
            if ($inQuotes -and ($i + 1 -lt $raw.Length) -and ($raw[$i + 1] -eq '"')) {
                $i += 2
                continue
            } else {
                $inQuotes = -not $inQuotes
            }
        }
        elseif ($ch -eq ',' -and -not $inQuotes) {
            $fieldsInRecord++
        }
        elseif ($ch -eq "`n" -and -not $inQuotes) {
            # Logical record bitti
            if ($fieldsInRecord -ne $expectedCols) {
                $snippet = $raw.Substring($recordStartChar, [Math]::Min(180, $i - $recordStartChar)).Replace("`r", "").Replace("`n", " | ")
                $problems += [PSCustomObject]@{
                    File = $f.Name
                    Line = $recordStartLine
                    Expected = $expectedCols
                    Actual = $fieldsInRecord
                    Preview = $snippet
                }
            }
            $currentLine++
            $recordStartChar = $i + 1
            $recordStartLine = $currentLine
            $fieldsInRecord = 1
        }
        elseif ($ch -eq "`n") {
            $currentLine++
        }

        $i++
    }

    # Son kayıt (newline ile bitmiyorsa)
    if ($recordStartChar -lt $raw.Length -and $fieldsInRecord -ne $expectedCols) {
        $snippet = $raw.Substring($recordStartChar).Replace("`r", "").Replace("`n", " | ")
        if ($snippet.Length -gt 180) { $snippet = $snippet.Substring(0, 180) }
        $problems += [PSCustomObject]@{
            File = $f.Name
            Line = $recordStartLine
            Expected = $expectedCols
            Actual = $fieldsInRecord
            Preview = $snippet
        }
    }
}

Write-Host "Toplam gerçek CSV kolon uyuşmazlığı: $($problems.Count)"
Write-Host ""
foreach ($p in $problems) {
    Write-Host ("{0}:{1}  (expected {2}, got {3})" -f $p.File, $p.Line, $p.Expected, $p.Actual)
    Write-Host ("  => {0}" -f $p.Preview)
    Write-Host ""
}
