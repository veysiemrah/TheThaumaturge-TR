# Çeviri Stil Rehberi

Türkçenin doğal yapısına uygun, tutarlı çeviri için kabul edilen prensipler. Oyun ilerledikçe kararlar tartışılıp buraya eklenir.

## Genel Prensipler

1. **Türkçe, İngilizce veya Polonyacanın gölgesi olmasın.** Cümle yapısı Türkçenin kendi ritmine göre kurulur; kelimesi kelimesine çeviri yapılmaz.
2. **Karakter sesi > kelime sadakati.** Bir karakter argo konuşuyorsa Türkçede de öyle konuşsun; yüksek üsluplu bir bilgin için kelime seçimi ona göre olsun.
3. **1905 Varşova atmosferi.** Gerektiğinde dönem tınılı Türkçe (örneğin "toplantı" yerine "içtima", "gazete" yerine bazen "cerîde") kullanılabilir, ama **zorlamadan, tutarlı ve okunabilir şekilde**.
4. **UI'da sade dil; anlatı ve diyalogda dönem rengini koyulaştır.** Menüler, panel başlıkları, ayarlar = modern, temiz Türkçe. Codex, karakter notları, diyalog = atmosfer taşıyan dil.
5. **Belirsizlikte not düş.** CSV'de `Notes` kolonuna "Şu iki yorum mümkün: X veya Y. Hangisini tercih edersiniz?" yazılır; kullanıcı karar verince glossary güncellenir.

## Noktalama

- **Üç nokta:** `…` (tek karakter), ASCII `...` değil. Sadece gerçekten "cümle kesintisi / devamı var" anlamında; kesin cümle sonlarında nokta `.`.
- **Tırnak:** Türkçe çift tırnak `"..."` (düz); yazılı metinde köşeli kullanabiliriz ama oyun yazı tipi genelde düz tırnak çiziyor. İç tırnak `'...'`.
- **Uzun çizgi (em dash):** `—` (U+2014). Parantetik açıklama, vurgu, konuşmada ara söz için. Örnek: "Bu salutor — yani bir başka deyişle, onun gölgesi — bizi takip ediyor."
- **Kısa çizgi `-`:** Sadece birleşik isim/sıfatlarda (anti-kraliyet, on-beş gibi) ve bağlaçlarda. Tire ile em dash karıştırılmaz.
- **Ünlem ve soru işareti:** Türkçe kurallara göre. `Gel!` doğru, `Gel !` hatalı.

## Hitap

- **Wiktor ile konuşmalar:** İkinci tekil şahıs "sen". (Oyun Wiktor'un bakış açısından). Karakterler genelde doğal, insani bir ton kullansın.
- **Tılsımkâr-öğretmen ilişkileri:** Yaşlı ve otoriter figürler Wiktor'a "siz" diyebilir ama Wiktor onlara "siz" der. Örnek: Rasputin Wiktor'a "sen" der (yaşlı-baba tavrı), Wiktor Rasputin'e kibarca cevap verir.
- **Oyuncuya rehber/eğitici metinler:** İkinci tekil şahıs, samimi ama bilgi verir ton. Örnek: "Yeteneğini planla." (değil "Yeteneğinizi planlayın.")
- **UI bilgilendirmeleri:** Yine ikinci tekil; "Kaydet" butonu "Kaydetmek" değil.

## Özel İsimler

- **Karakterler:** Çevrilmez. Wiktor, Rasputin, Abram, Ligia, Grażyna, Tatarin, Leila, Javier, Morana, Upyr, Bukavac. Yazımda Polonya diakritikleri korunur (Grażyna, Łódź). Türkçe metin içinde büyük harfle başlar.
- **Yer adları:**
  - Yerleşik Türkçeleri kullan: **Warszawa → Varşova**, **Kaukaz → Kafkaslar**, **Petersburg → Petersburg** (Türkçede de aynı), **Paris → Paris**.
  - Semt adları çevrilmez: **Praga**, **Powiśle**, **Wola**, **Śródmieście**. Apostrofla çekim: "Powiśle'de", "Praga'ya".
  - Sokak adları (`Street_Addresses_ST` içerecek) — kısmi Türkçeleştirme muhtemel; tam karar henüz verilmedi.
- **Grimoire** → `grimuar` (küçük harf, Türkçeleşmiş okült terimi).
- **Studio adı:** `11 bit studios` — aynen kalır (marka adı).

## Dönem Tınısı — Dikkatli Kullanım

**Evet, uygun yerlerde:**
- Anlatı bölümleri (journal girdileri, codex tanımları)
- Resmî/otoriter karakter diyalogları (polis memuru, subay, doktor vb.)
- Tarihî bilgi veren metinler ("Okhrana'nın Varşova şubesi...")

**Hayır, karşı durur:**
- UI elementleri ("Kaydet", "Devam Et" gibi standart kavramlar dönem kelimelerine bürünmez)
- Modern oyun mekaniklerinin adlandırılması ("Yetenek", "Boyut", "Kusur" gibi)
- Gençlik argosu konuşan karakterler

**Örnek uygun dönem kelimeleri:**
- toplantı → içtima (resmî/siyasî bağlamda)
- örgüt → cemiyet (tarihî sol hareketler için)
- kıyafet → esvap (dönem parçası detayları)
- haberleşmek → muhabere etmek (mektup/telgraf çağı)
- bina → hani/hân (Rus dönemi resmî binaları için)

## Placeholder ve Biçim Etiketleri

Bunlara **asla dokunulmaz:**

- `{int}`, `{string}`, `{0}`, `{1}`, `%s`, `%d` — runtime değişken
- `[FOCUS]`, `[HP]` — oyun değişkeni (UI simge etiketi muhtemelen)
- `<tag>...</>` — metin vurgusu (renklendirme/kalın)
- `<br>` — satır sonu
- `<i>...</>` — italik

Bunlar çeviri içinde **aynen kopyalanır**, yerleri ve sayıları korunur. Sadece etrafındaki Türkçe metin değişir.

Örnek:
- PL: `Użyj <tag>Percepcji</> na przedmiocie.`
- TR: `Eşya üzerinde <tag>Algı</>yı kullan.`

Tag içinde ek durum sonu varsa (-yı, -de, -ye vs.) tag dışına yazılır: `<tag>Algı</>yı` doğru, `<tag>Algıyı</>` yanlış olabilir (oyun kaynağı bu stiliyle yazılmış).

## Uzunluk Endişesi

Türkçe, Polonya ve İngilizceden genelde **%10-20 daha uzun** olur (ekler nedeniyle). UI elemanlarında (butonlar, kısa etiketler) bu taşma riski yaratır.

**Stratejiler:**
- Kısa etiket = kısa Türkçe ("Wyjdź z gry" = 12 karakter → "Oyundan Çık" = 11, iyi)
- Zorunda kalırsan daha kısa eş anlamlı seç ("Varsayılana Dön" yerine "Sıfırla" vb.)
- Taşma test aşamasında görülür → CSV'de düzeltilir

## Yaygın Çeviri Kararları

| Kaynak (EN/PL) | Türkçe |
|---|---|
| heavy attack / silny atak | Güçlü Saldırı |
| stun | Sersemlet (durum adı: "Sersemletme") |
| level up / progression | ilerleme / gelişim |
| upgrade | yükseltme |
| skill | yetenek |
| ability | yetenek (skill ile aynı) |
| quest | görev |
| side quest | yan görev |
| timeline | zaman çizelgesi / eylem sırası (bağlama göre) |
| save / load | kaydet / yükle |
| settings | ayarlar |
| options | seçenekler (nadir; "ayarlar" tercih) |
| inventory | eşya / envanter (bağlama göre; oyun "Dobytek" = "Eşya" kullandı) |
| achievement | başarım (Steam/Xbox konvansiyonu) |
| dialogue | diyalog / konuşma |
| cutscene | ara sahne |

## Kaynak: `docs/glossary.md`

Karakter, salutor, yer adları ve oyun-spesifik mekanik terimleri için `glossary.md`'yi kontrol et. Orası terim otoritesidir.
