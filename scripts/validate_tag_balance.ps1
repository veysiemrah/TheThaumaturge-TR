# PL ve TR sütunlarında placeholder/tag sayısı eşit mi denetler
$files = Get-ChildItem translation/*.csv
$problems = @()

# Saydığımız pattern'ler: <tag>...</>, <i>, <b>, <br>, <dl>, <ru>, <fr>, <ar>, {var}, [VAR]
# Daha güvenli yol: her "açılış" benzeri token'ı ayrı ayrı say
$patterns = @(
    @{ Name = '<tag>';    Regex = '<tag>' },
    @{ Name = '</>';      Regex = '</>' },
    @{ Name = '<i>';      Regex = '<i>' },
    @{ Name = '<b>';      Regex = '<b>' },
    @{ Name = '<br>';     Regex = '<br>' },
    @{ Name = '<dl>';     Regex = '<dl>' },
    @{ Name = '<ru>';     Regex = '<ru>' },
    @{ Name = '<fr>';     Regex = '<fr>' },
    @{ Name = '<ar>';     Regex = '<ar>' },
    @{ Name = '{var}';    Regex = '\{[a-zA-Z0-9_]+\}' },
    @{ Name = '[VAR]';    Regex = '\[[A-Z_][A-Z0-9_\.]*\]' }
)

function Count-Matches {
    param([string]$text, [string]$regex)
    if ([string]::IsNullOrEmpty($text)) { return 0 }
    return [regex]::Matches($text, $regex).Count
}

foreach ($f in $files) {
    try {
        $rows = Import-Csv -Path $f.FullName -Encoding UTF8
    } catch { continue }
    foreach ($r in $rows) {
        $key = if ($r.PSObject.Properties.Name -contains 'Key') { $r.Key } else { $r.Hash }
        $pl = $r.PL
        $tr = $r.TR
        if ([string]::IsNullOrWhiteSpace($tr)) { continue }

        foreach ($p in $patterns) {
            $plCount = Count-Matches -text $pl -regex $p.Regex
            $trCount = Count-Matches -text $tr -regex $p.Regex
            if ($plCount -ne $trCount) {
                $problems += [PSCustomObject]@{
                    File = $f.Name
                    Key = $key
                    Pattern = $p.Name
                    PL_Count = $plCount
                    TR_Count = $trCount
                }
            }
        }
    }
}

Write-Host "Toplam tag/placeholder uyuşmazlığı: $($problems.Count)"
Write-Host ""
foreach ($p in $problems) {
    Write-Host ("{0}  [{1}]  pattern={2}  PL={3}  TR={4}" -f $p.File, $p.Key, $p.Pattern, $p.PL_Count, $p.TR_Count)
}
