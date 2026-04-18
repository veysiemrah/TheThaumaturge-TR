# _fix_csv_quotes.ps1
# Bir translation CSV dosyasındaki Hash,NodeName,PL,TR,Notes formatını düzeltir.
# Amaç: PL veya TR alanında tırnaksız virgül varsa, alanı "..." ile sarmalamak.
#
# Strateji:
#   - Her satırı oku. 5 kolon için 4 virgül gerekli (alan içi tırnak korumayla).
#   - Import-Csv'ye veriyi satır satır deniyor — 5 alan değilse, heuristik onar:
#     PL = "Hash"+","+"NodeName"+"," sonrası, "TR"'den önce.
#     TR = PL'den sonra, Notes'tan önce. Notes satır sonundan tersine gider.
#   - Hash 32-hex, NodeName CinematicNode_Choice|Response_\d+ ya da asset_adı.
#
# Kullanım: pwsh -File scripts/_fix_csv_quotes.ps1 -CsvPath translation/q102_X.csv

param(
    [Parameter(Mandatory=$true)][string] $CsvPath
)

function Fix-Line {
    param([string] $line)
    # Başlık veya boş satır ise atla
    if ([string]::IsNullOrWhiteSpace($line)) { return $line }
    if ($line -match '^Hash,NodeName') { return $line }

    # Test parse: 5 alana düzgün bölünüyor mu?
    # Basit sayı: tırnak DIŞINDAKI virgül sayısı
    $inQuote = $false
    $commaPositions = @()
    for ($i = 0; $i -lt $line.Length; $i++) {
        $c = $line[$i]
        if ($c -eq '"') { $inQuote = -not $inQuote; continue }
        if ($c -eq ',' -and -not $inQuote) { $commaPositions += $i }
    }
    $fieldCount = $commaPositions.Count + 1
    if ($fieldCount -eq 5) { return $line }
    # Aksi halde bozuk — düzeltmeye çalış.
    # Heuristik: Hash=32hex, NodeName=ilk virgülden sonra, tırnaksız kısa token.
    # PL başlangıcı: 2. virgül sonrası.
    # Notes sonu: son virgülden sonraki kısım (boş olabilir).
    if ($commaPositions.Count -lt 4) { return $line } # çok az virgül, elle onar

    # İlk iki alan (Hash, NodeName) genelde sorun değil — tırnaksız, virgülsüz
    $hashEnd = $commaPositions[0]
    $hash = $line.Substring(0, $hashEnd)
    $nameEnd = $commaPositions[1]
    $name = $line.Substring($hashEnd + 1, $nameEnd - $hashEnd - 1)

    # Son alanı bul (Notes): son virgülden sonrası
    $lastCommaIdx = $commaPositions[$commaPositions.Count - 1]
    $notes = $line.Substring($lastCommaIdx + 1)

    # PL ve TR arası — PL 2. virgülden sonra, TR son-virgülden bir önceki virgüle kadar
    # Hangi virgül PL/TR sınırı?
    # Heuristik: 2. virgülden sonraki orta alanı, PL ve TR'ye böleriz. En az bir virgül PL
    # içinde, en az bir virgül TR içinde olabilir. Mutlak heuristik yok — ama:
    # PL sondaki `? . ! "`` karakterle bitmeli ve TR baharı büyük harfle başlamalı.
    $middleStart = $nameEnd + 1
    $middleEnd = $lastCommaIdx
    $middle = $line.Substring($middleStart, $middleEnd - $middleStart)

    # Middle içindeki virgüllerde, hangisi PL/TR sınırı?
    # PL tipik bitiş karakterleri: . ? ! ) ] } " ... veya PL-özel karakter
    # Heuristik: her olası virgül için; solundaki string PL parçası gibi bitiyor mu?
    $candidates = @()
    $mInQuote = $false
    for ($i = 0; $i -lt $middle.Length; $i++) {
        $c = $middle[$i]
        if ($c -eq '"') { $mInQuote = -not $mInQuote; continue }
        if ($c -eq ',' -and -not $mInQuote) { $candidates += $i }
    }

    # En iyi bölme: soldaki (PL) son 3 karakteri .?!'" gibi + sağdaki (TR) ilk harf büyük/özel
    $best = -1
    $bestScore = -1
    foreach ($cm in $candidates) {
        $left = $middle.Substring(0, $cm).TrimEnd()
        $right = $middle.Substring($cm + 1).TrimStart()
        if ($right.Length -eq 0) { continue }
        $score = 0
        # PL bitiş ipucu
        if ($left.Length -gt 0) {
            $lastChar = $left[$left.Length - 1]
            if ($lastChar -match '[\.\?!\)\]\"»…]') { $score += 2 }
            if ($left -match '[\.\?!]\s*"?\s*$') { $score += 1 }
        }
        # TR başlangıç ipucu
        $firstChar = $right[0]
        if ($firstChar -match '[A-ZÇĞİÖŞÜ"…\[<\(]') { $score += 2 }
        if ($right -match '^\s*"') { $score += 1 }
        if ($score -gt $bestScore) {
            $bestScore = $score
            $best = $cm
        }
    }
    if ($best -lt 0) { return $line }

    $pl = $middle.Substring(0, $best).Trim()
    $tr = $middle.Substring($best + 1).Trim()

    # Alanları tırnakla — sadece virgül içeriyor ise
    function Quote-IfNeeded {
        param([string]$s)
        if ($s.StartsWith('"') -and $s.EndsWith('"')) { return $s }
        if ($s.Contains(',') -or $s.Contains('"')) {
            $esc = $s.Replace('"', '""')
            return '"' + $esc + '"'
        }
        return $s
    }

    $plQ = Quote-IfNeeded $pl
    $trQ = Quote-IfNeeded $tr

    return "$hash,$name,$plQ,$trQ,$notes"
}

$lines = Get-Content $CsvPath -Encoding UTF8
$fixed = @()
$count = 0
foreach ($line in $lines) {
    $newLine = Fix-Line $line
    if ($newLine -ne $line) { $count++ }
    $fixed += $newLine
}
Set-Content -Path $CsvPath -Value $fixed -Encoding UTF8
Write-Host "$CsvPath -- $count satır düzeltildi"
