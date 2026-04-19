# Çeviri Review Rehberi (kendime talimat)

**Bu doküman gelecekteki oturumlarda Claude'un kendine talimatıdır.** Kullanıcı "review yap" / "gözden geçir" dediğinde buradaki süreci takip et.

İş birimi: **CSV dosyaları üzerinde metin-tabanlı inceleme** (kullanıcı oyunda test etmez; bu Claude'un görevidir). Tespit edilen her sorun: düzelt, CSV'yi yaz, pipeline'ı çalıştır, deploy et, bu dokümanın tablosunda durumu güncelle.

---

## 0. Review başlangıç kontrolü (her oturumda)

```
1. docs/glossary.md oku — terim otoritesi taze mi?
2. docs/style-guide.md oku — karar güncel mi?
3. Bu dokümanın "Sık sorunlar" ve "Değişim günlüğü" bölümüne bak
4. Kullanıcıdan review odağı al: "StringTable genelinde tutarlılık mı?",
   "belirli karakter/asset mı?", "tag/placeholder denetimi mi?"
```

**Varsayılan odak:** Son review'dan sonra eklenen yeni asset'ler. `git log --oneline docs/translation-review.md` son durum noktasını verir.

---

## 1. Review kriterleri — ne için bakıyorum?

Aşağıdaki 9 kategori. Her kategori için operasyonel tarama yöntemi ekli.

### 1.1 Glossary tutarlılığı

`docs/glossary.md` kırılma noktaları:

| Kategori | Kilit terimler (tutarlı olması gereken) |
|---|---|
| Oyun mekaniği | Tılsımkâr, Kusur, Boyut (Yürek/Eylem/Akıl/Söz), Odak, Parçalanma, Yetenek, Ant, Bağ, İz, Manipülasyon |
| Salutorlar | Upyr, Bukavac, Djinn, Golem, Krampus, Lelek, Morana, Weles |
| Karakterler | Wiktor, Rasputin, Ligia, Fałdżej, Samira, Abaurycy, Wanda, Vesna, Luka, Stanisław |
| Yer adları | Varşova, Kafkaslar, Güney Kafkasya, Paris, Mirów, Powiśle, Praga, Sitadel, Wola, Śródmieście |
| Dönem terimleri | Cemiyet (≠Komiser), Ant (≠Pakt), Bilge Kadın (≠Şeptuha), Amir (≠Komiser), Hacı/Yerli |
| Wordplay | Bülbül Muhabbeti, Şek Şük, Yerine!, Şıkırdım, Proletarya Casanovası |

**Tarama komutu (Grep):**

```
# Glossary terimi taraması — tutarlılık için farklı varyantları ara
Grep pattern="(Kumanda|Kontrolör|Kontroler)" path="translation" glob="*.csv"
Grep pattern="(Amir|Komiser|Naczelnik)" path="translation" glob="*.csv"
Grep pattern="(Ant|Pakt)" path="translation" glob="*.csv"
Grep pattern="(Bağ|Więź)" path="translation" glob="*.csv"
Grep pattern="(Kibir|Gurur|Duma|Pycha)" path="translation" glob="*.csv"
Grep pattern="(Cemiyet|Komitywa)" path="translation" glob="*.csv"
Grep pattern="(Hekim|Doktor)" path="translation" glob="*.csv"
```

Aynı asset içinde tek terim için birden çok çeviri varsa otomatik kırmızı bayrak.

### 1.2 Placeholder/tag koruma (zorunlu)

PL'deki her `<tag>`, `{}`, `[]` TR'de birebir (aynı adette, aynı sırada, aynı içerikle).

| Tag | PL | TR davranışı |
|---|---|---|
| `<tag>...</>` | `<tag>Algı</>yı` | içerik çevrilir, ek dışında |
| `<i>...</>` | `<i>İz</>` | içerik çevrilir/korunur (italik) |
| `<b>...</>` | `<b>Thaumata</>` | içerik aynen (özel terim) |
| `<dl>...</>` | `<dl>syreniak</>` | argo — TR argosuna aktarılır |
| `<ru>...</>` | `<ru>Arestovat'!</>` | Rusça içerik **aynen** (çevrilmez) |
| `<fr>...</>` | `<fr>Au revoir.</>` | Fransızca içerik **aynen** |
| `<ar>...</>` | `<ar>As-salamu alaykum.</>` | Arapça içerik **aynen** (Latin harf) |
| `<br>` | satır sonu | **aynen** |
| `{int}`, `{string}`, `{0}`, `%s` | runtime değişken | **aynen** |
| `[FOCUS]`, `[HP]`, `[DAMAGE]` | oyun değişkeni | **aynen** |
| `[Status.Offensive.Dmg_Debt]` | runtime ref | **aynen** |

**Tarama komutu:**

```
# CSV satırı başına PL ve TR tag sayısı eşit mi?
# Manuel: suspicious satırları ara
Grep pattern="<(tag|i|b|dl|ru|fr|ar)>" path="translation" glob="*.csv" output_mode="content" -n=true
```

Kontrol algoritması: bir satırın PL ve TR kolonundaki tag adedi eşit olmalı. Eşit değilse o asset için detaylı incele.

### 1.3 Karakter sesi

| Karakter | Ton özeti | Dikkat |
|---|---|---|
| **Wiktor** | alaycı, aristokrat, Kibir Kusuru taşır | "Ben" şişirilmez; serin |
| **Rasputin** | bilge + küfürlü (karakter); Wiktor'a "sen" | "topal am" gibi küfürler korunmalı |
| **Ligia** | aile tonu, samimi | Wiktor'a "sen" |
| **Fałdżej** | yaşlı Tatar hekim, saygılı; Wiktor'a "sen" | Arapça selam korunur |
| **Samira/Sara** | sarkastik, güvensiz | "sen" yoldaş |
| **Abaurycy** | gangster argosu, küfürlü; "Hacı'cım" | Yoğun "V.Ş." lakabı, "Mojki" grup adı |
| **Wanda** | PPS flörtöz, Fransızca; "sihirbaz bey" | "soğan" kod, "pączki Berk Rotblitz" kod |
| **Abaurycy↔Wanda** karakterleri ayırt | Farklı argo tonları | Abaurycy: sokak; Wanda: entellektüel flört |
| **Köylüler** | rustik, batıl inançlı, "beyim" hitap | Vesna öfkeli, Luka kısa, Bilge Kadın bilge |
| **Amca (Ligia+Wiktor sahnesinde)** | polis/asker, aile | "Oğlum", üniformalı |

### 1.4 Hitap (siz/sen)

- Wiktor → yaşlı/otorite: **siz** (Rasputin, Fałdżej, Bilge Kadın, polis, terzi'ye karşı — müşteri olarak ama sen de olabilir)
- Wiktor → yoldaş/akran: **sen** (Samira, Wanda, Abaurycy, Ligia)
- Yaşlı/bilge → Wiktor: **sen** (Rasputin, Fałdżej, amca)
- Köylü → Wiktor: **siz** / "beyim"
- Yoldaş → Wiktor: **sen**
- Terzi ↔ Wiktor: terzi "bayım" der (siz); Wiktor "sen" (üst sınıf alt sınıfa)

### 1.5 Noktalama

- Üç nokta: `…` (U+2026) ✓, `...` (3 ASCII) ✗ (dönüştür)
- Tırnak: `""` TR düz; iç `''`
- Uzun çizgi: `—` (U+2014) parantetik
- Kısa çizgi: `-` birleşik isim

**Tarama:**

```
# Üç ASCII nokta (...) taraması — kaynağa sadakat gerekiyor mu?
Grep pattern="\.\.\." path="translation" glob="*.csv" output_mode="content" -n=true
# Not: CSV'nin PL kolonu kaynak, dokunulmaz. TR kolonunda … tercih edilir.
```

### 1.6 Özel isimler ve yazım

- Polonya diakritikleri: Grażyna, Łódź, Fałdżej (korunur)
- Karakter adları çevrilmez
- Tarihî: Franz Ferdinand (TR), Tsarskoye Selo (aynen), 1863 Ocak Ayaklanması

### 1.7 Doğallık

- Pasif yapının PL'den doğrudan çekilmesi → etken tercih
- Uzun birleşik cümleleri kısalt
- Deyim literal ≠ iyi çeviri; TR deyimine aktar (Przyganiał kocioł → Tencere kazana dibi kara)

### 1.8 Dönem tınısı (1905 Varşova)

- UI'da sade; diyalogda dönem rengi
- "içtima" (resmî), "cemiyet" (sol hareket), "esvap" (dönem kıyafet), "hekim" (diyalogda doktor yerine)

### 1.9 Risk noktaları

- **Cümle parçalı inject** — `Combat_ST Salutor_Dimension1/2` gibi birden çok satırdan birleşen; PL vs TR sıra farkı TR'de yapıyı kırabilir
- **Tag içi/dışı ek** — `<tag>Algı</>yı` ✓ vs `<tag>Algıyı</>` ✗
- **Sahne notu [...]** — bazı asset'lerde geliştirici notu; çevrilebilir ama oyuncu görmeyebilir

---

## 2. Review süreci — adım adım

### Adım 1: Kapsam seç

Kullanıcının talimatına göre:
- "Tümünü review et" → **Bölüm 4** tablosundaki asset'leri sırayla
- "Belirli bir asset / karakter" → sadece o asset
- "Yeni eklenenler" → `git log --oneline translation/ -10` → son commit'ler

### Adım 2: Çapraz terim taraması (proje geneli)

Aşağıdaki Grep taramalarını sırayla çalıştır; aykırı sonuç çıkarsa not al:

```
Grep pattern="Kontrolör" path="translation"  # Kumanda olması lazım
Grep pattern="Komiser" path="translation"    # Amir/amcacığım dışında yoksa bayrak
Grep pattern="Pakt" path="translation"       # Ant olmalı
Grep pattern="Hotel(?! Imperialny)" path="translation"  # Otel tercih
Grep pattern="Polonyaca" path="translation"  # Lehçe tercih
Grep pattern="\.\.\." path="translation" glob="*.csv"   # … tercih (TR sütununda)
```

### Adım 3: Asset-bazlı derin inceleme

Her asset için:
1. CSV'yi oku (Read)
2. PL kolonunun karakter sesi ile TR kolonu eşleşiyor mu?
3. Tag sayısı eşit mi? (PL `<tag>` sayısı ≈ TR `<tag>` sayısı)
4. Glossary terimleri tutarlı çevrilmiş mi?
5. Notes kolonunda işaretli belirsizlik var mı?

### Adım 4: Tespit raporu

Her sorunu şu formatta not al:

```
[ASSET] q001_XX_name.csv satır N
  Hash: XXXXXX
  PL:  "..."
  TR:  "..."
  Sorun: (tutarsızlık / tag hatası / doğal olmayan çeviri / glossary ihlali)
  Öneri: "..."
```

### Adım 5: Düzeltme + deploy

Onay alınmış düzeltmeler için:
1. `Edit` ile CSV'yi güncelle
2. `pwsh scripts/dialog_apply.ps1` (dialog) veya `scripts/stringtable_apply.ps1`
3. `UAssetGUI fromjson` → staging
4. `retoc to-zen` → mod pak
5. Oyun kapalı kontrol → `Paks/`'a kopyala
6. **Bu dokümanın Bölüm 4'ündeki tablo** güncelle (`—` → `✅` veya `🔄`)
7. **Bu dokümanın Bölüm 7 Değişim Günlüğü'ne** kısa not ekle

---

## 3. StringTable review takip tablosu

**27 StringTable / 26 çevrilmiş / ~1539 entry**

| Asset | Entry | Son review | Durum | Bilinen sorun / Not |
|---|---|---|---|---|
| `Panels_ST` | 186 | 2026-04-18 | ✅ | Temiz |
| `Tutorial_ST` | 48 | 2026-04-18 | 🔄 | CSV parse düzeltildi (ProgressionPanel); InbornStates2'de eksik `<tag>Nitelikle</>` eklendi; uzun pop-up taşma riski hâlâ kontrol edilmedi |
| `TutorialName_ST` | 48 | 2026-04-18 | ✅ | Tutorial mekaniği isimleri — glossary ile tam uyum (Zincirler/İzler/Nitelikler/Gözlemler/Manipülasyon/Eşya/Harita/Kayıtlar/Tılsımkârlık/Boyunduruk/Eylem Sırası) |
| `AbilityName_ST` | 145 | 2026-04-18 | 🔄 | 145 yetenek ismi tarandı: Salutor (Bukavac/Djinn/Golem/Krampus/Lelek/Morana/Upyr/Weles), silah kategori (Blunt/Fist/Knife/Sabre/Rifle/Pistol/Derringer), Rasputin "Bağını Zehirleme" formu, boks terimleri (Kroşe/Gong/Direkt) hepsi tutarlı. **Düzeltme:** Player_A2 "Eylem Tepki" → "Etki Tepki" (Türkçe yerleşik + Boyut adıyla karışmaz). Bukavac_H "Sırp Darbesi" alternatife açık |
| `AbilityDescription_ST` | 42 | 2026-04-18 | ✅ | Upyr_02 PL-sadık 1×[HP] 2×[DAMAGE] yapısı ile yeniden yazıldı (kullanıcı onayı) |
| `Map_ST` | 169 | 2026-04-18 | ✅ | Berk Rotblit/Rotblitz kaynakta da var; `İmperyal Oteli`, `Elizyum` düzeltildi |
| `MapDescriptions_ST` | 14 | 2026-04-18 | ✅ | Edebi lokasyon betimlemeleri (Powązki, Praga, Powiśle, Port Praski, Bazar Różyckiego, Dolina Szwajcarska); "niedom/eve-olmayan" neolojizmi başarılı aktarım |
| `MapPinTypes_ST` | 13 | 2026-04-18 | ✅ | Ulaşım tipleri glossary ile tam uyum (Fayton/Yük Arabası/Hafif Fayton/Tramvay) |
| `Combat_ST` | 170 | 2026-04-18 | ✅ | Salutor_Dimension1/2 parçalı cümle yapısı doğrulandı; HealingDrawback PL-sadık 1×[HP] ("öncekinden daha az yeniler") ile yeniden yazıldı (kullanıcı onayı) |
| `CombatLog_ST` | 12 | 2026-04-18 | ✅ | Savaş log mesajları — `{int_f}`, `{int_h}`, `{int_d}`, `{int_r}` placeholder'ları korunmuş |
| `PopupsTexts_ST` | 112 | 2026-04-18 | ✅ | Kumanda/Lehçe düzeltildi |
| `Flaw_Name_ST` | 12 | 2026-04-18 | ✅ | Tüm 12 Kusur İngilizce eşdeğerleriyle eşleştirildi (glossary güncel); 3 düzeltme: Porywczość "Atılganlık"→"Hiddet" (EN Vehemence), Trwoga "Dehşet"→"Korku" (EN Fright; Przerażenie=Dehşet ile ayrım), Zawiść "Kıskançlık"→"Haset" (EN Malice) |
| `Flaw_CombatDescription_ST` | 4 | 2026-04-18 | ✅ | {name} ve [HP] placeholder bütünlüğü ve dil temiz |
| `Flaw_PanelDescription_ST` | 12 | 2026-04-18 | ✅ | [DEED/HEART/MIND/WORD] ve [HP] placeholder'ları tutarlı; Mind.2 & Word.2 "9'u aşmıyorsa" → PL "nie przekraczają 9" doğru çeviri |
| `FlawsPanel_Descriptions_ST` | 22 | 2026-04-18 | ✅ | Wiktor sesi + Pycha/Duma ayrımı iyi; Heart.1_weak Türkçe deyim düzeltildi ("başımı derde soktu") |
| `StatusName_ST` | 46 | 2026-04-18 | ✅ | Amir düzeltildi |
| `StatusDescription_ST` | 49 | 2026-04-18 | ✅ | Teknik durum tanımları — `[DAMAGE]/[FOCUS]/[HP]/[V.DMG]/[V.FOC]` + `<Tag_Neg>` tutarlı; Rasputin boyunduruk salutor tanımları (Bukavac/Djinn/Golem/Krampus/Lelek/Morana/Weles) doğru |
| `Progression_EffectName_ST` | 32 | 2026-04-18 | ✅ | 4 Boyut etki isimleri (Berserker/Hiddet/Sükûnet/Buzdan Zırh/Kışın Gelişi) — dönem ve oyun tonu uyumlu |
| `Progression_EffectDescription_ST` | 14 | 2026-04-18 | ✅ | `[GameplayEffect...]` placeholder'ları ve `<Tag_Neg>Acı</>` korunmuş |
| `ImprintsDescription_ST` | 72 | 2026-04-18 | ✅ | Fałdżej "Doktor" → "Hekim" (diyalog tutarlılığı); Maria "Sigara İçen Kadın" — bağlam belirsiz (Palaczka) |
| `BarberName_ST` | 22 | 2026-04-18 | ✅ | Yaratıcı dönem argosu — Nadwiślański Sznyt/Vistül Şıklığı, Syreniak/Varşovalı, Aligantny/Zarif, Cymes korundu (Yidiş), Bosmański Klar/Lostromo Temizliği denizci argosu |
| `BarberDescription_ST` | 22 | 2026-04-18 | 🔄 | CSV parse düzeltildi (special_facial_hair_06 PL tırnaklandı); edebi içerik hâlâ review'lanmadı |
| `Street_Addresses_ST` | 33 | 2026-04-18 | ✅ | Sokak adları Polonya diakritikleriyle aynen korunmuş; Plac Zielony → Yeşil Meydan (glossary istisnası) |
| `UnitDataLoreDescription_ST` | 16 | 2026-04-18 | ✅ | Mitolojik salutor lore (Baalberith/Dybbuk/Erlik/Shurale/Sirin/Paimon/Hashihime) edebi, kültürel bağlam korunmuş |
| `Achievements_ST` | 116 | 2026-04-18 | ✅ | "Hızlı ve Öfkeli" + "İmperyal Otel'e" düzeltildi; wordplay kararları |
| `Exploration_ST` | 108 | — | — | İkindi/Şafak dönem; `felçer` terimi |
| `DebugText_ST` | ? | — | skip | Oyuncu görmez |

**Durum kodları:** `—` review yapılmadı • `🔍` incelemede • `🟡` sorun var • `✅` onaylandı • `🔄` düzeltildi yeniden bakılacak

---

## 4. Dialog asset review takip tablosu

**46 graph asset / 1565 satır**

### Default_dialogues (6)

| Asset | Satır | Son review | Durum | Not |
|---|---|---|---|---|
| `DD_smg_tailor` | 39 | 2026-04-18 | ✅ | Dönem tınısı ("bay/bayım", "Powązki'deki berber"), küfür karakter tutarlı, hitap doğru (terzi→Wiktor "siz", Wiktor→terzi imperatif) |
| `DD_faldzej` | 94 | 2026-04-18 | 🔄 | **3 hitap düzeltmesi:** satır 19/20/72 Fałdżej→Wiktor "siz"→"sen" (style-guide: yaşlı bilge→genç). Glossary (Tılsımkâr/Cemiyet/Ant/Golem/Pogrom/Arapça selam) ve tarihsel (Traugutt/Ocak Ayaklanması/Wilno/Tatar) tutarlı |
| `DD_ligia` | 98 | 2026-04-18 | ✅ | Aile bağlamı (Ligia/amca), "mundur vs krew" dönem tezadı, Stasio samimi form, Czarny Grymuar = Kara Grimuar özel isim; "iyi kısmet" dönem deyim |
| `DD_samira` | 136 | 2026-04-18 | ✅ | Sara Rywkin sırrı + Samira/Madam, felçer (dönem argo), Mirów/Skałon/Okhrana/Konieczkin, karakter sesi (sarkastik, güvensiz) |
| `DD_smc_abaurycy` | 134 | 2026-04-18 | ✅ | Karakter sesi + argo + glossary (Pielgrzym/Hacı, V.Ş., Mojki, Ryjcopranie, Siwucha, Şek Şük, Proletarya Casanovası) hepsi tutarlı; küçük opsiyonel iyileştirmeler (satır 25 parantez, satır 79 belirsizlik) |
| `DD_wanda` | 194 | 2026-04-18 | 🔄 | **2 düzeltme:** satır 118 `<i>À propos</>` Fransızca korundu (Madame/Madam ile tutarlı), satır 152 "Üzerinde göz bulunduracağım." → "Gözüm üzerinde olacak." (TR deyim). Flört + kodlar (soğan, pomad, PPS) + `<fr>` tag'leri temiz |

### q001 prolog (28 story) ✅ tamamlandı

| Asset | Satır | Son review | Durum | Not |
|---|---|---|---|---|
| `q001_00a_introduction` | 10 | 2026-04-18 | ✅ | Ligia→Wiktor mektubu; aile samimi "sen"; PL büyük-Ty saygı nüansı TR'ye uyarlandı |
| `q001_00b_telegram` | 34 | 2026-04-18 | ✅ | Posta müdürü resmi "siz"; "v/w" harf diktesi korunmuş; "Gürcistan Rusya, Polonya Rusya" tarihî ironi; Wiktor'un alaycı mesajı |
| `q001_00c_travel_to_village` | 20 | 2026-04-18 | ✅ | Arabacı → Wiktor "siz + beyim" (dönem köylü saygısı); "Rasputin dua eder" ipucu |
| `q001_01a_entering_tavern` | 20 | 2026-04-18 | 🔄 | CSV parse + satır 8 yazım/kurgu düzeltmesi (pataklaıp→patadığını; cümle netleşti); Rusça tag'ler sağlam |
| `q001_01b_meeting_rasputin` | 46 | 2026-04-18 | ✅ | Hitap asimetrisi doğru (Wiktor→Rasputin "siz", Rasputin→Wiktor "sen"), Polonya 3 işgali bağlamı ("Rus/Alman/Avusturya Polonyası") ve "haritada 100+ yıldır görünmez ülke" korunmuş; hekim tutarlı |
| `q001_01c_rasputin_healing` | 35 | 2026-04-18 | ✅ | "topal am" kaba küfür karakter sesi korundu; hitap asimetrisi doğru; glossary (Tılsımkâr/Upyr/Bağ) tutarlı; minör: "kasza z sarnim tłuszczem" → "geyik yağıyla bulgur" (kasza≠bulgur ama anlaşılır) |
| `q001_01d_vision` | 9 | 2026-04-18 | ✅ | Otoriter baba vizyonu — "Kör herif/budala/Kibir" aşağılama; Duma=Kibir glossary |
| `q001_01e_waking_after_vision` | 13 | 2026-04-18 | ✅ | Hancı "süpürmek istiyordum" tekrarı komedi; Rasputin→Wiktor "sen" (01b siz → 01e sen, karakter yakınlaşması); Pakt=Ant |
| `q001_02a_wagon` | 16 | 2026-04-18 | ✅ | Arabacı pazarlığı; "siz+beyim" dönem tonu; "chabetę/gebermiş atı" argo |
| `q001_03a_rasputin_in_cemetery` | 35 | 2026-04-18 | ✅ | "pociąg" wordplay Notes ile açıklandı (Türkçe kaybı kaçınılmaz); köy başı/Bilge Kadın/Bukavac/ya'vietz/şer (licho) tutarlı; köylü rustik "beyim" tonu ve Rasputin alaycılığı güzel |
| `q001_04a_burned_house_conclusion` | 8 | 2026-04-18 | ✅ | Wiktor iç monolog; Kusur/İz glossary tutarlı |
| `q001_04b_burned_house_encounter` | 25 | 2026-04-18 | 🔄 | "Grigorij" samimi form geçişi; "klecho/papaz" Rus asker aşağılaması; satır 10 yazım düzeltildi (pataklaıp→pataklayan) |
| `q001_04c_burned_house_rasputin` | 55 | 2026-04-18 | ✅ | Glossary (Kusur/Salutor/İz/Bağ/Kibir) ve hitap (Wiktor→Rasputin "siz") tutarlı; çok küçük dilsel nüanslar (satır 21 tekil/çoğul, satır 38 "indywidualne" nüansı) |
| `q001_05a_vesna_at_market` | 3 | 2026-04-18 | ✅ | Vesna pazarda öfke (Atılganlık Kusur kaynağı); "Tu!" tükürme ünlemi |
| `q001_05b_vesna_conclusion` | 7 | 2026-04-18 | ✅ | Wiktor iç monolog — Luka/Vesna şüphe; İz glossary |
| `q001_05c_vesna_at_home` | 22 | 2026-04-18 | 🔄 | CSV parse düzeltmesi yapıldı; Wiktor→Vesna "siz/pani" + "İMDAT!" haykırışı korundu |
| `q001_05d_vesna_gone_from_home` | 5 | 2026-04-18 | ✅ | Komşu kadın tonu; "açıklıkta odun kesiyor" bilgisi |
| `q001_05e_neighbours` | 5 | 2026-04-18 | ✅ | Köylü tehditler; "Şeytan sürmüş seni buraya" deyim |
| `q001_06a_wise_woman_argument` | 21 | 2026-04-18 | ✅ | Bilge Kadın dava sahnesi (kaz/kolye); köylü argo yoğun ("wszarz/bitli"); "Szeptucha/Bilge Kadın" glossary; "cam kırıkları" takı değerlendirmesi |
| `q001_06b_wise_woman_hut` | 46 | 2026-04-18 | ✅ | Bukavac/şer/zamowa/Tılsımkâr tutarlı; Wiktor→Bilge Kadın "siz"→"sen" geçişi dramatik ton olarak savunulabilir; küçük dilsel (satır 15 "işe girdi") |
| `q001_07a_rasputin_and_plan` | 15 | 2026-04-18 | ✅ | Wiktor→Rasputin "sen" geçişi (04c'den 07a'ya karakter yakınlaşması, PL'de de "cię"); "Bay Szulski/pan Szulski" arabacı; Bukavac planı |
| `q001_08a_confrontation_with_luka` | 18 | 2026-04-18 | ✅ | Luka gerilim sahnesi; "Kes kafasını" köylü tehditleri; Bilge Kadın ifşa; glossary (Bukavac/Kusur/zamowa) tutarlı |
| `q001_08b_bukavac` | 3 | 2026-04-18 | ✅ | Bukavac savaş anı — "Sen de benimsin" güçlü kapanış |
| `q001_08c_rasputin_salutor` | 2 | 2026-04-18 | ✅ | 01d baba vizyon sesi ile tutarlı; Rasputin "Tılsımkâr, Ben hakikatim" |
| `q001_08d_resolution` | 34 | 2026-04-18 | ✅ | Luka/Vesna kapanış + köylü kalabalığı tepkisi; "Odun yığınına!" cadı yakma referansı korundu; Vesna'nın öfke, Luka'nın şok, Wiktor'un alaycı tonu güzel; köylü → Wiktor "sen"e geçiş saldırganlıkla tutarlı |
| `q001_09a_postmaster` | 6 | 2026-04-18 | ✅ | Posta müdürü başsağlığı; resmi "siz" tonu |
| `q001_09b_traveler` | 12 | 2026-04-18 | ✅ | Albuquerque absürt yolcusu; yolcu→Wiktor "pan/siz" resmi; "okyanus ötesi" mizahi coğrafya |
| `q001_09c_epilog` | 35 | 2026-04-18 | ✅ | Franz Ferdinand (1914 Saraybosna) + Odessa Merdivenleri (Potemkin) + WW1 sisi kehaneti korundu; Wiktor→Rasputin "sen"e geçiş karakter gelişimi (yol sonu — PL'de de "ty") |

### q101 (12/24 story)

| Asset | Satır | Son review | Durum | Not |
|---|---|---|---|---|
| `q101_00a_welcome_to_warsaw` | 49 | 2026-04-18 | ✅ | Üç dilde Varşova selamı (Rusça/Almanca/Lehçe), PPS/Hollanda pomadı kodları, Rasputin-Wiktor sen-sen (q001_09c sonrası), "zabory→üç işgal bölgesi"; minör: guwernantki/dadı (alt: mürebbiyeler) |
| `q101_00b_arrival_wiktor_dream` | 1 | 2026-04-18 | ✅ | Sahne notu `[...]` → `[…]` |
| `q101_01a_tsar_speech` | 35 | 2026-04-18 | ✅ | `<ru>` tag'leri aynen (Varshava/Vremya terrora/Idi nakhuy/Arestovat'); Wszechruś→Tüm-Rusya, Grunwald 1410, Rzeźnik→Kasap Skałon lakabı; Çar anti-propaganda dili + Wanda ilk karşılaşma "siz" doğru |
| `q101_01b_prisoners_cell_talk` | 49 | 2026-04-18 | ✅ | `<dl>` tag'leri hepsi eşleşiyor; Varşova gangster argosu çevirileri mükemmel (szmondak/Şmondak, kacap/Moskof, syreniak/Varşovalı, aligant/Şıkırdım, gwoździowe/haraç, zblatowany/bağlantı); küfür karakter sesine uygun |
| `q101_01c_guard_cell_talk` | 8 | 2026-04-18 | ✅ | Gardiyan Wiktor'u çıkartıyor; grimuar bağlantısı; hitap (gardiyan→Wiktor "sen") doğru |
| `q101_01d_player_in_cell` | 5 | 2026-04-18 | ✅ | Mahkum kova sahnesi; "franco/frengili" aşağılama korundu; kaba argo karakter sesi |
| `q101_01e_wanda_cell_talk` | 32 | 2026-04-18 | ✅ | `<fr>Rue de la Roquette</>`, `<fr>Oui</>` aynen; sen-sen simetrisi (yoldaş); pomada/pączki/Rotblitz kodları tutarlı; Wanda flörtöz tonu iyi |
| `q101_01f_parade_arresting` | 34 | 2026-04-18 | ✅ | Parade + Wanda ayakkabı bağla oyunu; `<ru>` tag'leri aynen; "Varşovalı hanımefendi vs yüz yıl önce odun yığınında yanacak sihirbaz" tarih-sınıf oyunu; Wiktor şantaj doğru aktarılmış |
| `q101_01g_police_registration` | 6 | 2026-04-18 | ✅ | Polis kayıt + Stanisław Szulski aile tanınması; resmi siz hitabı |
| `q101_01h_worker_kettling_talk` | 15 | 2026-04-18 | ✅ | İşçi çığırtkanı devrimci söylem; "Spierdalaj/Siktir git" küfür karakter sesi; sınıf-farkı hitap (Wiktor siz, işçi sen) |
| `q101_01k_wanda_after_kettling` | 5 | 2026-04-18 | ✅ | Wanda teşekkür + Berk Rotblitz daveti; kodlar (pomada/çörek) DD_wanda ile tutarlı |
| `q101_01m_soldier_kettling_talk` | 29 | 2026-04-18 | ✅ | 10 `<ru>` tag aynen (Gospodi/Dostatochno/Shagom marsh/Ponyatno/Davay...); Szulski→Szmulski Yahudi aşağılaması; "Polonyalı itler" Rus asker tonu; CSV parse düzeltmesi (3 satır) zaten yapılmıştı |

**Kalan q101 story:** 12 asset — 02 bloğu (mezarlık, 6) + 03 bloğu (vasiyet, 6).

---

## 5. Proje kapsam sayaç (güncel tut)

| Kategori | Toplam | Çevrilen | Review'lı |
|---|---|---|---|
| StringTable | 27 | 26 | 26 |
| Default_dialogues | 6 | 6 | 6 |
| q001 story | 28 | 28 | 28 |
| q001 Chats | 14 | 0 | — |
| q101 story | 24 | 12 | 12 |
| q101 Chats | ? | 0 | — |
| q102–q401 | ~180 | 0 | — |
| lw_* (yan) | ~180 | 0 | — |
| genenc / Chats / Fluffs | ~60 | 0 | — |
| **Toplam dialog** | ~687 | 46 | 0 |

---

## 6. Sık karşılaşılan sorun türleri (referans)

Önceki review'lardan kalıplar:

| Kalıp | Örnek | Nasıl bulunur |
|---|---|---|
| **Tutarlılık** (farklı dosyalarda farklı çeviri) | "Kontrolör" vs "Kumanda" | Grep çapraz tarama |
| **Glossary ihlali** | "Komiser" (glossary: Amir) | Grep glossary terimi |
| **Yerleşik TR yerleşim** | "Polonyaca" yerine "Lehçe"; "Elyzyum" yerine "Elizyum" | Kültürel bilgi |
| **Standart film/kitap çeviri** | "Hızlı ve Sinirli" yerine "Hızlı ve Öfkeli" | Yaygın TR referans |
| **Tag ek hatası** | `<tag>Algıyı</>` yerine `<tag>Algı</>yı` | Tag sınırı denetimi |
| **Üç nokta** | `...` yerine `…` (TR sütununda) | Grep `\.\.\.` |
| **Cümle parçalı inject sırası** | `Salutor_Dimension1/2` PL↔TR yeniden yapılandırıldı | Cross-dump kontrol |
| **Karma Hotel/Otel** | Aynı dosyada ikisi birden | Grep "Hotel" |

---

## 7. Değişim günlüğü

Her review oturumundan sonra buraya özet ekle.

| Tarih | Oturum | Kapsam | Bulgular | Eylem |
|---|---|---|---|---|
| 2026-04-18 | İlk StringTable review | 26 ST | 6 tutarsızlık: Kumanda, Amir, Lehçe, Hızlı-Öfkeli, Elizyum, İmperyal Oteli | Tümü düzeltildi + deploy |
| 2026-04-18 | Çapraz tutarlılık taraması (26 ST + 46 dialog) | Hotel, Hekim/Doktor, Pakt, Amir, Kibir-Gurur, Bilge Kadın, Cemiyet, Kontrolör | 2 tutarsızlık: Achievements_ST `İmperyal Hotel'e`→`İmperyal Otel'e`; ImprintsDescription_ST `Doktor`→`Hekim` | Düzeltildi + deploy |
| 2026-04-18 | **CSV parse bütünlüğü** (multiline-aware kolon denetimi; yeni `scripts/validate_csv_columns.ps1`) | 10 satırda tırnaksız virgül PL/TR kolonlarını kaydırıyordu → oyuna sessizce yanlış/Polonyaca metin gidiyordu | BarberDescription_ST:12, DD_faldzej:32/42, q001_01a_entering_tavern:10, q001_05c_vesna_at_home:8, q001_09c_epilog:36, q101_01m_soldier_kettling_talk:12/16/22, Tutorial_ST:46 (ProgressionPanel) | Hepsi düzeltildi (PL/TR tırnaklandı) + 7 asset re-apply + deploy; validator pipeline'a eklenmeli |
| 2026-04-18 | Tag/placeholder dengesi + FlawsPanel + Combat parçalı cümle (Tur B) | 5 tag uyuşmazlığı; Combat_ST Salutor_Dimension1/2 yapısal doğrulama; FlawsPanel edebi ton; yeni `scripts/validate_tag_balance.ps1` | **Net hata:** Tutorial_ST InbornStates2 3. `<tag>Cecha</>` TR'ye eksik eklendi (semantik bilgi kaybı). **Dilsel:** FlawsPanel Heart.1_weak "beni başı derde" → "başımı derde" düzeltildi. **Tartışmalı (kullanıcı kararı):** Upyr_02, HealingDrawback 2×[HP], Flaw_Name terim nüansları. **Teknik not:** FlawsPanel_Descriptions_ST.uasset staging'de 2 lokasyonda (UI/Data/StringTables + Quests/InsightsConclusions), ikisi de senkron tutuldu. | 2 ST re-apply + deploy |
| 2026-04-18 | Yüksek-riskli dialog asset derinliği (Tur C — örnekleme) | DD_smc_abaurycy (134 satır Varşova argo + 12 özel terim), q001_04c_burned_house_rasputin (55 satır Kusur/Salutor/İz teorisi), q001_06b_wise_woman_hut (46 satır halk büyüsü), q101_01b_prisoners_cell_talk (49 satır `<dl>` argo) | **Dört asset de ✅:** karakter sesi, glossary, hitap (Wiktor→Rasputin/Bilge Kadın "siz"; Wiktor→Abaurycy/mahkumlar "sen"), tag eşitliği, küfür/argo karşılıkları hepsi tutarlı ve doğru. Küçük opsiyonel iyileştirmeler var ama kritik sorun yok. | Düzeltme yok — onay verildi |
| 2026-04-18 | Default_dialogues tamamlama (Tur C devam) | DD_wanda (194 satır Fransızca+flört+kodlar), DD_smg_tailor (39 satır terzi dönem argo), DD_faldzej (94 satır Tatar bilge), DD_ligia (98 satır aile+amca), DD_samira (136 satır Sara sırrı) | **DD_wanda:** satır 118 `À propos` Fransızca aynen korundu; satır 152 TR deyim ("gözüm üzerinde"). **DD_faldzej:** 3 hitap düzeltmesi — Fałdżej→Wiktor "siz"→"sen" (style-guide: yaşlı bilge→genç samimi; Notes da düzeltildi). **DD_smg_tailor/DD_ligia/DD_samira:** ✅ kritik sorun yok. Tüm 6 Default_dialogue artık review'lı. | 2 asset re-apply + deploy |
| 2026-04-18 | Kalan StringTable + yüksek-riskli dialog (Tur C toplu kapanış) | AbilityName_ST (145 entry), Exploration_ST (108), StatusDescription_ST (49), TutorialName_ST (48), Street_Addresses_ST (33), Progression_EffectName_ST (32), BarberName_ST (22), UnitDataLoreDescription_ST (16), MapDescriptions_ST (14), Progression_EffectDescription_ST (14), MapPinTypes_ST (13), CombatLog_ST (12) + q001_01b_meeting_rasputin (46) | **Düzeltme:** AbilityName_ST Player_A2 "Eylem Tepki" → "Etki Tepki" (Türkçe fizik deyimi + "Eylem Boyutu" ile karışmaz). Diğer tüm 12 ST ve q001_01b ✅ onaylandı — placeholder'lar, glossary, karakter sesi, tarihî bağlam, lore, dönem argosu hepsi tutarlı. | 1 ST re-apply + deploy |
| 2026-04-18 | q001 prolog yüksek-riskli örnekleme + q101 01-bloğu derinlik (commit sonrası) | q001_01c (Rasputin tedavi, "topal am" küfür), q001_03a (mezarlık, pociąg wordplay, ya'vietz), q001_08d (Luka/Vesna resolution, Odun yığınına), q001_09c (Franz Ferdinand/Odessa kehaneti), q101_01a (Çar konuşması, Rusça, Grunwald, Kasap), q101_01e (Wanda hücre, Fransızca), q101_01f (parade ayakkabı bağla) | **7 asset ✅ onaylandı** — Rusça/Fransızca tag'ler aynen, tarihî referanslar (Grunwald/Franz Ferdinand/Odessa Merdivenleri/Potemkin) korunmuş, Wiktor-Rasputin "siz→sen" karakter gelişimi PL ile tutarlı, Wiktor-Wanda "siz→sen" geçişi iyi, kalabalık tepkisi + rustik tonu güçlü. Kritik sorun yok; minör stil notları (kasza/bulgur, psia krew/Kör talih, kıllı/tüylü) opsiyonel | Düzeltme yok |
| 2026-04-18 | q101 story blok tamamlama (12/12) | q101_00a (49 — tren, üç dilde Varşova, Rasputin gazete), q101_00b (1 — sahne notu), q101_01c (8 — gardiyan çıkış, grimuar), q101_01d (5 — mahkum kova frengi), q101_01g (6 — polis kayıt, Szulski aile), q101_01h (15 — işçi çığırtkanı, spierdalaj), q101_01k (5 — Wanda teşekkür, Berk Rotblitz), q101_01m (29 — asker Rusça tag'ler, Szmulski aşağılama) | **8 asset ✅ onaylandı** — tüm `<ru>` tag'leri aynen, sınıf-farkı hitap (aristokrat vs işçi/asker), kodlar (pomada/pączki/Rotblitz) DD_wanda ve Abaurycy ile tutarlı, Stanisław Szulski aile tanınması korundu. **q101 01-bloğu tamamen review'lı.** | Düzeltme yok |
| 2026-04-18 | q001 prolog blok tamamlama (28/28) | Kalan 21 asset toplu review: q001_00a/b/c (Ligia mektup, telgraf v/w, arabacı), 01a/d/e (tavern CSV+tipo, vizyon, uyanış), 02a (wagon), 04a/b (burned house, tipo), 05a-e (Vesna sahneleri), 06a (Bilge Kadın dava), 07a (plan), 08a-c (Luka/Bukavac/baba), 09a/b (posta/Albuquerque) | **2 yazım düzeltmesi:** q001_01a:8 "pataklaıp→patadığını" + kurgu netleşti, q001_04b:10 "pataklaıp→pataklayan". **19 asset ✅ temiz** — Ligia mektup aile samimi, posta müdürü "v/w" diktesi, arabacı "siz+beyim", baba vizyonu/Bukavac savaş anı, Vesna öfke (Hiddet), Bilge Kadın dava argosu, Rasputin-Wiktor "siz→sen" karakter yakınlaşma (q001_07a'da geçiş, PL'de de "cię"), Albuquerque mizah. **q001 prolog tamamen review'lı.** | 2 asset re-apply + deploy |
| 2026-04-18 | Kullanıcı kararı bekleyen 4 noktaya yanıt | Upyr_02 & HealingDrawback 2×[HP] placeholder tekrarı; Flaw_Name 3 terim nüansı (Porywczość/Trwoga/Zawiść); Bukavac_H "Sırp Darbesi". Web araştırması (wiki/Steam/gamepressure) ile resmi EN isimler bulundu: Vehemence/Fright/Malice. | **5 düzeltme deploy'lu:** Flaw_Name_ST "Hiddet/Korku/Haset" (EN eşleştirmeli); Combat_ST HealingDrawback 1×[HP] simetrik; AbilityDescription_ST Upyr_02 1×[HP] 2×[DAMAGE] simetrik. Bukavac_H "Sırp Darbesi" mevcut haliyle muhafaza (EN adı bulunamadı). Glossary 12-Kusur tablosu PL/EN/TR eşleştirmesiyle eklendi. | 3 ST re-apply + deploy |
| 2026-04-19 | Post-review kümulatif denetim (Readables + Journal + q102 Danis bloğu) | Çapraz Grep (Hotel, Doktor, Kontrolör, Pakt, Komitywa, Cytadela, Weles, Polonyaca) + validator script + TR `...` taraması. Tespit: (1) Hotel Imperialny strateji tutarsızlığı — Map_ST + Achievements_ST Türkçeleştirilmiş, diyalog/Codex/Readable'da 10+ yerde özel isim korunmuş; (2) q102_05f_resolution:55 "oklep" Lehçe argosu çevrilmemiş; (3) q102_readable:22 "Beş Zotiye" yazım hatası (Zlotiye olmalı); (4) q102_readable:173 "Doktor" glossary ihlali (Hekim); (5) q102_readable:303 "Hakâretin" yanlış diakritik (Hakaretin); (6) Danis bloğu (q102_05d/e/f) 20 TR satırında `...` → `…` dönüşümü gerek. | **6 asset düzeltildi + deploy:** Map_ST (İmperyal Oteli → Hotel Imperialny); Achievements_ST (ACH_q103_got_weles_desc); q102_05f_resolution (oklep→dövüş + 14×`...`→`…`); q102_05d (5×`...`→`…`); q102_05e (2×`...`→`…`); q102_readable (Zotiye→Zlotiye, Doktor→Hekim, Hakâretin→Hakaretin). Glossary güncellendi: Hotel Imperialny + Hotel Grand özel isim satırı + Komisarz → Komiser eklendi (Naczelnik ile ayrım). Not: Readables 15/15 ana story + q102_readable edebi metinler ✅ temiz; q102 Danis bloğu karakter sesi ✅ (trajedik ton korundu); q301_readables ve CodexCharactersDT büyük ölçüde temiz (spot kontrol). |
| 2026-04-19 | İkinci tur — Codex DT derinliği + q103 spot | CodexSalutorsDT + CodexFactionsDT + CodexLoreDT + CodexCharactersDT ilk 80 satır; q103_04c_session_started (101 satır Zofia seans sahnesi). Glossary yoğun (Kusur/Ant/Cemiyet/Tılsımkâr/Grimuar/Bağ/Boyut) çapraz kontrol. | **2 asset düzeltildi + deploy:** (1) CodexSalutorsDT:3 Upyr "seçmiyorum" → "seçemiyorum" (ability negatif — PL "Czy nawet dostrzec go w pełni..."); (2) q103_04c_session_started:11 "çağırtt" → "çağırt" (yazım hatası). Diğer Codex DT'ler ve q103_04c seans sahnesi ✅ — karakter sesi (Zofia entrikası + Siergiej kıskançlık + Wiktor "bu küstahlıktan kurtul, yoksa seni darağacına götürür"), Pakt→Ant ve Komitywa→Cemiyet tutarlılığı, PL tipo'ları (ój/podążąl/naległa/Ojcec/opiosuje/złacznie/Koniecznik/gubernetor/Wazwięta/dazyć/ogranizacji/zaskopakania) Notes'a işlenmiş. |
| 2026-04-19 | Üçüncü tur — CodexCharactersDT derinliği (satır 80-293) | 213 satır Wiktor iç monolog (karakter bazlı: Rasputin/Ligia/Wujek Sasza/Abaurycy/Pietia/Grażyna/Wanda/Swietłana/Skałon/Car/Mordechaj/Konieczkin/Zofia/Ariel/Javier/Samira/Rabbi'ler/Emir/Çariçe/Cecylia/Dickstein/Nadarzyński/Kajetan/Pielewin/Fejgin/Vesna/Danis/Michał/Janek/Maria/Magdalena/Lazarew/Lermontowa/Siergiej/Konieczny). | **4 düzeltme deploy'lu:** (1) satır 146/147/148 "Varşova General-Valisi böyle bitirdi" (geçişli fiil gramer hatası, PL "I tak kończy...") → "...sonu böyle oldu" (3 ayrı satır); (2) satır 198 (Javier) "Polonyacayı fena konuşmuyor" → "Lehçeyi fena konuşmuyor" (**glossary ihlali** — Polski dili → Lehçe); (3) satır 239 (Dickstein) "buruklukluk kaldı" → "burukluk kaldı" (yazım — çift -luk eki); (4) satır 288 (Kontes Lermontowa) "Soyun nâsihi" → "Soyun duayeni" (PL "Nestorka rodu"=matriark/pir; "nâsih"=öğütçü tamamen farklı anlam). Karakter sesi Wiktor iç monologunda genelde mükemmel; glossary (Kusur/Ant/Cemiyet/Tılsımkâr/Grimuar/Bağ/İz/Manipülasyon/Boyut) tutarlı. |
| 2026-04-19 | Dördüncü tur — CodexLocationsDT tam + q103 Weles bloğu spot | CodexLocationsDT (76 satır — Güney Kafkasya, Varşova 1905, 4 Varşova semti, 8 lokasyon); q103_02c_konietchkin_in_hotel (86 satır — Konieczkin+Hotel Imperialny), q103_04d_ritual_consequences (82 satır — ritüel sonrası Zofia kargaşa), q103_01d_rasputin_hypnosis (12), q103_06c_svetlana_request (82 satır — Swietłana aşk+siyaset+Çariçe). | **3 düzeltme deploy'lu:** (1) q103_02c:9 "Tamamı değil olduğunu söyle" → "Tam öyle olmadığını söyle" (**gramer hatası**); (2) q103_04d:59 "Zosia her şey" → "Zosia, her şey" (vokativ virgül); (3) **q103_06c_svetlana_request tam tutarsızlık** — dosya içinde hem "Ohrana" (7 yer) hem "Ochrana" (6 yer) karışık kullanılmış; proje genelinde "Ochrana" baskın (43 occurrences, 12 dosya) → 7 "Ohrana" → "Ochrana" yapıldı (Notes dahil replace_all). CodexLocationsDT ✅ temiz (edebi/atmosferik betimlemeler, dönem tonu yoğun). |
| 2026-04-19 | Beşinci tur — q101 02/03 mezarlık+vasiyet + Notes tutarlılık | q101_03b_testament_reading (48 satır — baba vasiyeti okuma sahnesi, Zacław Fiedorow), q101_02b_fathers_grave (56 satır — Wiktor babasıyla veda + Konieczkin giriş), q101_02a_ligia_in_cemetery (24 — Ligia-Wiktor kavuşma), q101_03f_woronin_before_testament (51 — Wujek cenaze kadehi sahnesi). Notes tutarlılık taraması. | **2 düzeltme deploy'lu:** (1) q101_03b:8 vasiyet metni "rabbimizin bin sekiz yüz..." → "Rabbimizin..." (Hristiyan dini kullanımda büyük harf); (2) **q103_readable:2 "Beş Zotiye" → "Beş Zlotiye"** (aynı tipo q102_readable'da düzeltilmişti; q103'te tekrar tespit — aynı yemek kitabı başlığı iki yerde). **3 Notes düzeltmesi (deploy yok):** DD_wanda:125, q102_05a_side_bar_entrance:17, q103_02b_elegant_men:6 — Notes kolonundaki "Polonyaca" referansları "Lehçe" olarak düzeltildi (glossary tutarlılık — oyuncu görmez). q101 blok diyalogları: karakter sesi (Wiktor baba-kardeş-amca üçlüsü, Konieczkin sinsi giriş, Wujek sarhoş cenaze kadehi), dönem dili (vasiyet+taziye formal ton), glossary (Kara Grimuar/ayaklanma/Cemiyet/Ochrana) ✅ tutarlı. |
| 2026-04-19 | Altıncı tur — q102_02d Abaurycy + Chats + Story Journal + özel isim çapraz tarama | q102_02d_london_bar_abaurycy (95 satır — Abaurycy Varşova gangster argosu), q101/q102/q103 Chats spot, q001/q101 story Journal, q102_readable_chat, q101_readable_chat. "Berk/Berek Rotblitz" çapraz tarama (14 dosya). | **2 düzeltme deploy'lu:** (1) Map_ST:74 (PR_Tavern) "Berk Rotblit'in Meyhanesi" → "Berk Rotblitz'in Meyhanesi" (**z harfi eksik**; proje genelinde "Berk Rotblitz" 14 yerde tutarlı, Map_ST tek istisnaydı); (2) q101_journal:8 "Berek Rotblitz" → "Berk Rotblitz" (**fazladan 'e'**; başka hiç bir yerde "Berek" yok — tek yazım hatası). q102_02d Abaurycy sahnesi ✅ (Varşova gangster argosu, küfür/diyalekt `<dl>` tag'leri tutarlı, "Nora Demona"/"Şeytan İni" wordplay korunmuş). Chats (50+ dosya, çoğu 2-5 satır) ve Story Journal çapraz temiz (Cemiyet/Kusur/Bağ/Grimuar/Tılsımkâr glossary tutarlı). |

---

## 8. Hızlı komut referansı

### Çapraz terim taraması
```
Grep pattern="PATTERN" path="translation" glob="*.csv" output_mode="content" -n=true -i=true
```

### Tek asset okuma
```
Read file_path="C:\Users\veysi\...\translation\<asset>.csv"
```

### Tek asset düzeltme + deploy (dialog)
```
Edit: translation/<asset>.csv
pwsh scripts/dialog_apply.ps1 -JsonPath build/dialogue_analysis/<asset>.json \
     -CsvPath translation/<asset>.csv \
     -OutJsonPath build/work/<asset>_tr.json
tools/UAssetGUI/UAssetGUI.exe fromjson build/work/<asset>_tr.json \
     build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/<proj>/Assets/<asset>.uasset \
     tools/Mappings
retoc to-zen --version UE5_1 build/staging/TheThaumaturge build/output/pakchunk99-WinGDK_P.utoc
Copy-Item build/output/pakchunk99-WinGDK_P.* "C:\XboxGames\...\Paks\" -Force
```

### StringTable için
Aynı akış ama `stringtable_apply.ps1` ve `UI/Data/StringTables/` yolu.
