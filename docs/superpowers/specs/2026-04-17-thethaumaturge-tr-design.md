# The Thaumaturge — Açık Kaynak Türkçe Yama Tasarımı

**Tarih:** 2026-04-17
**Durum:** Tasarım — uygulama öncesi
**Hedef oyun:** The Thaumaturge (Fool's Theory, 11 bit studios, 2024) — Xbox GDK sürümü (Game Pass), UE5 IoStore
**Proje adı (çalışma):** TheThaumaturge-TR

## 1. Hedefler

Açık kaynak, manuel çevrilmiş Türkçe yama. Claude çeviriyi yapar, kullanıcı (veysiemrah) kalite kontrol eder. Steam, GOG, Epic ve Xbox GDK sürümleriyle uyumlu çalışmayı hedefler.

**Öncelikler:**
- Tutarlı terminoloji ve karakter sesleri.
- Türkçenin doğal yapısına uygun çeviri — İngilizce cümle yapısının gölgesi olmayan.
- Şeffaf süreç: tüm kararlar ve çeviriler GitHub'da.
- Kurulumu basit, kaldırılabilir mod pak.

**Hedef dışı:**
- Ses dublajı.
- Oynanış/modifikasyon değişikliği.
- Sabit takvim, sprint, profesyonel proje yönetimi.
- Topluluk tabanlı çok kişili çeviri (açık kaynaktır, ama tek yazarlıdır).

## 2. Kapsam

Çevrilecek: diyaloglar, UI/menüler, codex/günlük, item ve yetenek açıklamaları, başarımlar, alt yazılar, yükleme ipuçları.

Çevrilmeyecek: hata/teknik mesajlar.

## 3. Kaynak diller

- **Ana kaynak:** İngilizce (`.locres` dosyaları İngilizcede mevcut, iş akışı EN→TR).
- **Referans:** Lehçe (orijinal yazım dili; deyim, argo, karakter aksanı, Varşova kültürel terimleri için).

## 4. Teknik iş akışı

```
[Xbox GDK .ucas/.utoc]
      ↓ UEExtractor
[CSV: Key | Namespace | Source_EN | Source_PL | Translation_TR | Notes]
      ↓ Claude çeviri
[translation/ dizininde düzenlenmiş CSV]
      ↓ Kullanıcı QA (sohbet veya notlar üstünden)
      ↓ UEExtractor (CSV → .locres)
[Güncellenmiş tr/.locres]
      ↓ retoc
[~TheThaumaturge-TR_P.pak + .ucas + .utoc]
      ↓ Kurulum
[Oyun Paks/ klasörüne kopyalanır]
```

**Araçlar (Nisan 2026 itibarıyla güncel stack):**
- **UEExtractor v1.0.7.5** (Şubat 2026) — `.ucas/.utoc` → CSV + CSV → `.locres` roundtrip. UE5.8 desteği, .NET 10.
- **retoc** (trumank) — IoStore mod pak üretimi (UnrealReZen yerine, topluluk 2026 standardı).
- **FModel** (Dec 2025) — Görsel denetim, font ve asset kontrolü.
- **UnrealLocres** (yedek) — Locres roundtrip için alternatif.

**Kullanılmayacaklar:** UnrealReZen (retoc'a geçildi), ZenTools (deprecated), UE4LocalizationsTool (UnrealLocres tercih).

**Mod pak stratejisi:** Orijinal `pakchunk*-WinGDK.*` dosyalarına dokunulmaz. `*_P.pak` uzantılı mod pak alfabetik sonda yüklenir, locres'i üstüne yazar. Kaldırmak için mod pak silinir.

**Encoding:** `.locres` UTF-16 LE. CSV'ler UTF-8 BOM. Dönüşüm UEExtractor tarafından yapılır.

## 5. Depo yapısı

```
TheThaumaturge-TR/
├── README.md                   # Tanıtım, kurulum, atıf
├── LICENSE                     # MIT (kod) + CC BY-SA 4.0 (çeviri metni)
├── CHANGELOG.md
├── CONTRIBUTING.md             # Stil rehberi özeti
│
├── docs/
│   ├── glossary.md             # EN/PL → TR sabit terim sözlüğü
│   ├── style-guide.md          # Ton, hitap, noktalama
│   ├── character-voices.md     # Ana karakterlerin konuşma tarzları
│   ├── workflow.md             # Extract/translate/pack adımları
│   └── superpowers/specs/      # Tasarım dokümanları
│
├── source/                     # Git'te: oyundan çıkarılan EN + PL CSV
│   ├── en/
│   └── pl/
│
├── translation/                # Çeviri çıktıları
│   ├── dialog/                 # Sahne/bölüm bazlı CSV'ler
│   ├── ui.csv
│   ├── codex.csv
│   ├── items.csv
│   ├── achievements.csv
│   └── misc.csv
│
├── build/                      # .gitignore (çıktılar)
├── scripts/                    # PowerShell: extract, pack, diff
├── tools/                      # .gitignore (binary araçlar)
└── .github/                    # Issue şablonları, CSV validate CI
```

**Lisans:** MIT (kod) + CC BY-SA 4.0 (çeviri metni). Türetilebilir, atıf + aynı lisans zorunlu.

**Oyun binary'leri (`.pak/.ucas/.utoc`) asla repoda yok.** Dağıtım GitHub Releases üzerinden.

**Telif:** `source/` içinde tutulan EN metinler Fool's Theory/11 bit studios telifidir; README'de açık atıf + eğitim/çeviri amaçlı kullanım notu yer alacak.

## 6. Çeviri ve QA akışı (hafif)

1. Claude mantıklı bir parça seçer (bir dosya veya bir sahne), CSV'de `Translation_TR` sütununu doldurur.
2. Kullanıcıya teslim. Kullanıcı sohbette veya CSV `Notes` sütununda geri bildirim verir.
3. Claude revize eder.
4. Tamam denince o dosya "onaylı" kabul edilir, `translation/` altında commit edilir.
5. Terim sözlüğü ve karakter sesleri rehberi, iş sürdükçe güncellenir.

**Tutarlılık:** Claude her yeni parçayı çevirmeden önce glossary'yi ve önceki onaylı dosyaları okuyup terim/ton tutarlılığını sağlar.

**Belirsiz satır protokolü:** Claude, emin olmadığı satıra yan not ekler ("X de olabilir, ne dersiniz?"). Kullanıcı sohbette karar verir, karar glossary/stil rehberine yansır.

**Takvim ve hacim:** Hiçbiri sabit değil. İlerleme hıza değil kaliteye göredir.

## 7. Sürüm yaklaşımı

- Ara sürümler (v0.1 UI, v0.5 ana hikâye vb.) istendiğinde çıkarılabilir, zorunlu değil.
- Resmi v1.0: kapsamın tamamı bitince.
- Oyun güncellenirse `scripts/diff-source.ps1` ile EN değişikliklerini tespit eder, sadece değişen satırları yeniden çevirir.
- Dağıtım: GitHub Releases zip — kurulum rehberi + mod pak dosyaları.

## 8. Riskler ve belirsizlikler

1. **Xbox GDK AES şifreleme riski** *(ilk test edilecek)* — GDK pakları şifreliyse UEExtractor anahtar ister. Plan B: Steam/GOG sürümünden kaynak alıp modu GDK'ya uygulamak (aynı motor, aynı key'ler).
2. **Font Türkçe karakter desteği** — Lehçe diakritikler destekli olduğu için TR için de çalışma ihtimali yüksek; ilk test yamasında "?" çıkarsa font değiştirilir.
3. **Mod pak yükleme davranışı** — `pakchunk99-WinGDK_P.*` alfabetik son + doğru konum (`Paks/` veya `~mods/`) ilk testte doğrulanır.
4. **Oyun güncellemeleri** — Fool's Theory yama çıkarırsa hash/key değişebilir, diff süreci ile yakalanır.
5. **Telif / takedown** — Açık repoda EN kaynak tutmak tamamen risksiz değil. README atıf + non-commercial notu riski azaltır.
6. **Claude bağlam sınırı** — Memory'de glossary + karakter sesleri kaydıyla oturum arası tutarlılık korunur.

**Bilinçli kabul ettiğimiz trade-off'lar:**
- Claude çeviri yaptığı için profesyonel çevirmen stilinden farklılıklar olabilir. Mutlak "gold standard" iddiası yok.
- Topluluk katkısı alınmıyor; fork'a açık.

## 9. Sonraki adım

Bu tasarım onaylandıktan sonra `superpowers:writing-plans` ile uygulama planı hazırlanır. İlk plan adımı muhtemelen: Xbox GDK paklarını UEExtractor ile açma denemesi (AES riskini eleme veya Plan B'ye geçme).
