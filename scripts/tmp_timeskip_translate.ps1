$ErrorActionPreference = "Stop"

$map = @{
  "Poczekaj tu." = "Burada bekle."
  "Porozmawiaj z Upyrem." = "Upyr ile konuş."
  "Wstań." = "Kalk."
  "Siedź tu do rana." = "Sabaha kadar burada otur."
  "Siedź tu do południa." = "Öğlene kadar burada otur."
  "Siedź tu do popołudnia." = "İkindiye kadar burada otur."
  "Siedź tu do nocy." = "Geceye kadar burada otur."
  "Co, tęskniłeś za tym miastem?" = "Ne, bu şehri özledin mi?"
  "..." = "…"
  "Ja też nie." = "Ben de."
  "Poczekajmy do..." = "Şuna kadar bekleyelim…"
  "Ten cały Burnakowicz. Powinniśmy mu zaufać?" = "Şu Burnakowicz var ya. Ona güvenmeli miyiz?"
  "Spokojny twój czerep." = "Sakin ol, kafan rahat dursun."
  "Szybko się pozmieniało, co? Jednego dnia siedzisz na ławce i odpoczywasz, innego zastanawiasz się, czy to bezpieczne." = "Hızlı değişti, değil mi? Bir gün bankta oturup dinleniyorsun, ertesi gün burası güvenli mi diye düşünüyorsun."
  "Wiem, wiem." = "Biliyorum, biliyorum."
  "Zastanawiam się, co on dokładnie knuje." = "Tam olarak ne çeviriyor merak ediyorum."
  "Jak to kto? Rasputin." = "Kim mi? Rasputin tabii."
  "Zaczekajmy." = "Bekleyelim."
  "Pozwól, że spocznę." = "İzin ver de bir dinleneyim."
  "Ciebie nogi nie bolą? Głupie pytanie." = "Senin bacakların ağrımıyor mu? Aptal soru."
  "Zabijmy więc nieco czasu." = "Hadi biraz vakit öldürelim."
  "Abaurycy Niedzic w półświatku. Kto by pomyślał?" = "Abaurycy Niedzic yeraltı âleminde. Kim derdi?"
  "Słusznie, słusznie." = "Doğru, doğru."
  "Nie mogę przestać myśleć o losie Swietłany. Myślisz, że ona..." = "Swietłana'nın akıbetini düşünmeden duramıyorum. Sence o…"
  "Tak, pewnie masz rację." = "Evet, muhtemelen haklısın."
  "Co za dzień." = "Ne gün ama."
  "1" = "1"
  "2" = "2"
  "3" = "3"
  "4" = "4"
  "5" = "5"
}

$files = @("lw_TimeSkip","lw_TimeSkip_BZR","lw_TimeSkip_CM","lw_TimeSkip_GRZ","lw_TimeSkip_PP","lw_TimeSkip_PR","lw_TimeSkip_PW","lw_TimeSkip_SMC")
$missingTotal = 0
foreach ($f in $files) {
    $src = "source\pl\$f.csv"
    $dst = "translation\$f.csv"
    $rows = Import-Csv $src
    $out = @()
    foreach ($r in $rows) {
        $pl = $r.PL
        if ($map.ContainsKey($pl)) {
            $tr = $map[$pl]
        } else {
            $tr = ""
            $missingTotal++
            Write-Host "MISSING [$f] $($r.Hash): $pl"
        }
        $out += [pscustomobject]@{
            Hash = $r.Hash
            NodeName = $r.NodeName
            PL = $r.PL
            TR = $tr
            Notes = ""
        }
    }
    $out | Export-Csv -Path $dst -NoTypeInformation -Encoding UTF8
    Write-Host "Wrote $dst ($($out.Count) rows)"
}
Write-Host "Total missing PL keys: $missingTotal"
