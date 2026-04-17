# The Thaumaturge TR Yama — Uygulama Planı

> **Agentic çalışanlar için:** Gerekli alt-skill — `superpowers:subagent-driven-development` (önerilen) veya `superpowers:executing-plans`. Adımlar checkbox (`- [ ]`) ile takip edilir.

**Hedef:** The Thaumaturge oyunu için açık kaynak Türkçe yama altyapısını kurmak, ilk test (proof-of-concept) yamasıyla teknik yolun çalıştığını doğrulamak, ve çeviri iş akışını başlatacak noktaya gelmek.

**Yaklaşım:** Önce iskelet + araçlar; sonra oyun paklarını açıp AES riskini elemek; küçük bir UI çevirisiyle baştan sona roundtrip (extract → translate → pack → verify) doğrulamak; bu doğrulandıktan sonra glossary/stil rehberi ve çeviri iş akışı hazırlanır.

**Teknoloji:** PowerShell scriptler, UEExtractor v1.0.7.5, retoc, FModel (Dec 2025), git, CSV (UTF-8 BOM), The Thaumaturge Xbox GDK kurulumu (`C:\XboxGames\The Thaumaturge`).

**Referans spec:** `docs/superpowers/specs/2026-04-17-thethaumaturge-tr-design.md`

**Not (kullanıcı tercihleri):**
- Aşırı formal proje yönetimi/TDD yok; adımlar pratik, her biri 2-10 dakikalık tekil aksiyon.
- Komutlar PowerShell'de çalışır (Windows 11).
- Oyun dosyalarına dokunulmaz; her şey repo içi `build/` klasöründe üretilir.

---

## Dosya yapısı (bu planın ürünü)

```
TheThaumaturge-TR/                    # Git kök, proje dizini
├── .git/                             # git init (Görev 1)
├── .gitignore                        # build/, tools/, *.pak, *.ucas, *.utoc (Görev 1)
├── README.md                         # Proje tanıtımı (Görev 2)
├── LICENSE                           # MIT + CC BY-SA 4.0 (Görev 2)
├── CHANGELOG.md                      # Boş iskelet (Görev 2)
├── CONTRIBUTING.md                   # Stil kuralı özeti (Görev 8'den sonra doldurulur)
│
├── docs/
│   ├── superpowers/
│   │   ├── specs/
│   │   │   └── 2026-04-17-thethaumaturge-tr-design.md  # (var)
│   │   └── plans/
│   │       └── 2026-04-17-thethaumaturge-tr.md         # (bu dosya)
│   ├── glossary.md                   # (Görev 8)
│   ├── style-guide.md                # (Görev 8)
│   ├── character-voices.md           # (Görev 8)
│   └── workflow.md                   # (Görev 9)
│
├── source/                           # (Görev 6'dan sonra dolar)
│   ├── en/                           # Oyundan çıkan İngilizce CSV'ler
│   └── pl/                           # Referans Lehçe CSV'ler
│
├── translation/                      # (Görev 7'den sonra başlar, ilk dosya POC)
│   └── ui-poc.csv                    # Proof-of-concept (Görev 7)
│
├── scripts/
│   ├── extract.ps1                   # (Görev 5)
│   ├── pack.ps1                      # (Görev 7)
│   └── README.md                     # Script kullanım notları (Görev 5)
│
├── tools/                            # .gitignore'da; binary araçlar
│   ├── UEExtractor/                  # (Görev 3)
│   ├── retoc/                        # (Görev 3)
│   └── FModel/                       # (Görev 3)
│
└── build/                            # .gitignore'da; staging ve output
    ├── extracted/                    # UEExtractor çıktıları (Görev 5)
    ├── staging/                      # Düzenlenmiş .locres (Görev 7)
    └── output/                       # Mod pak dosyaları (Görev 7)
```

**Bu planın bitiş noktası:** Görev 9 tamamlandığında, küçük bir UI çevirisi oyunda Türkçe görünüyor, glossary ve stil rehberi taslak halinde ve ilk gerçek çeviri dosyası için iş akışı hazır.

---

### Görev 1: Proje iskeleti ve git init

**Dosyalar:**
- Oluştur: `.gitignore`
- Komut: `git init`

- [ ] **Adım 1.1: Proje dizinine gir**

PowerShell:
```powershell
cd C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge
```

- [ ] **Adım 1.2: Git reposu başlat**

```powershell
git init
git branch -M main
```

Beklenen: "Initialized empty Git repository in ...".

- [ ] **Adım 1.3: .gitignore oluştur**

`C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge\.gitignore` içeriği:

```
# Build çıktıları — git'e girmez
build/

# Binary araç klasörleri — kullanıcı yerel olarak indirir
tools/

# Unreal arşivleri — telif; hiçbir zaman commit edilmez
*.pak
*.ucas
*.utoc
*.uasset
*.uexp
*.ubulk

# Geçici / OS artıkları
*.tmp
*.log
Thumbs.db
.DS_Store
desktop.ini

# IDE
.vscode/
.idea/
```

- [ ] **Adım 1.4: Alt dizinleri oluştur**

```powershell
mkdir docs\glossary, docs, source\en, source\pl, translation, scripts, tools, build\extracted, build\staging, build\output -Force -ErrorAction SilentlyContinue
```

Not: `docs/superpowers/specs/` ve `docs/superpowers/plans/` zaten mevcut.

- [ ] **Adım 1.5: İlk commit (spec dahil)**

```powershell
git add .gitignore docs/superpowers/specs/2026-04-17-thethaumaturge-tr-design.md docs/superpowers/plans/2026-04-17-thethaumaturge-tr.md
git commit -m "chore: initial project skeleton with design and plan"
```

---

### Görev 2: README, LICENSE ve CHANGELOG iskeletleri

**Dosyalar:**
- Oluştur: `README.md`, `LICENSE`, `CHANGELOG.md`

- [ ] **Adım 2.1: README.md yaz**

`C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge\README.md` içeriği:

````markdown
# TheThaumaturge-TR

The Thaumaturge (Fool's Theory / 11 bit studios, 2024) için açık kaynak, manuel çevrilmiş Türkçe yama projesi.

## Durum

🚧 Geliştirme aşamasında — henüz yayın yok.

## Nedir?

Bu proje The Thaumaturge için Türkçe dil yaması sunar. Tüm metin çevirileri tek tek insan gözüyle gözden geçirilir, 1905 Varşova atmosferini ve karakter tonlarını korumak hedeflenir.

- **Kapsam:** Diyaloglar, UI/menüler, codex, item/yetenek açıklamaları, başarımlar, alt yazılar, yükleme ipuçları. (Hata mesajları hariç.)
- **Platform desteği:** Steam, GOG, Epic, Xbox GDK (Game Pass).
- **Ses:** Yalnız metin; dublaj yok.

## Kurulum

Yayın çıktığında bu bölüm güncellenecek. Özetle: mod pak dosyası oyun `Paks/` klasörüne kopyalanır, kaldırmak için silinir.

## Katkı

Bu proje tek yazarlıdır (çeviri: Claude, QA: veysiemrah). Ancak açık kaynaktır — fork etmekte, öneri sunmakta serbestsiniz. Detay için `CONTRIBUTING.md`.

## Lisans

- **Kod ve scriptler:** MIT
- **Çeviri metni:** CC BY-SA 4.0

`LICENSE` dosyasına bakın.

## Telif notu

Oyun içi İngilizce/Lehçe metinler Fool's Theory ve 11 bit studios'un telifidir; bu depoda yalnızca çeviri karşılaştırması amacıyla yer alır. Oyun binary'leri (`.pak`, `.ucas`, `.utoc`) bu depoda yoktur ve asla olmayacaktır.
````

- [ ] **Adım 2.2: LICENSE dosyası oluştur**

`LICENSE` içeriği (iki bölümlü — MIT kod için, CC BY-SA 4.0 çeviri için):

```
This repository uses dual licensing:

## Code and scripts (scripts/, .ps1, .yml, .gitignore, etc.)

MIT License

Copyright (c) 2026 veysiemrah

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Translation text (translation/, docs/glossary.md, docs/style-guide.md, docs/character-voices.md)

Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
https://creativecommons.org/licenses/by-sa/4.0/

You are free to share and adapt this material for any purpose, provided that:
- You give appropriate attribution to this project.
- If you modify or build upon it, you distribute your contributions under
  the same license.

## Third-party content

The English and Polish source texts referenced in source/en/ and source/pl/
are the intellectual property of Fool's Theory and 11 bit studios. They are
included solely for translation reference purposes and are not relicensed by
this repository.
```

- [ ] **Adım 2.3: CHANGELOG.md iskelet**

`CHANGELOG.md`:

```markdown
# Changelog

Tüm anlamlı değişiklikler bu dosyada tutulur. Format: [Keep a Changelog](https://keepachangelog.com/), sürüm numaraları [Semantic Versioning](https://semver.org/) benzeri.

## [Yayınlanmamış]

### Eklendi
- Proje iskeleti, tasarım ve uygulama planı.
- İlk araç yığını kurulumu.
```

- [ ] **Adım 2.4: Commit**

```powershell
git add README.md LICENSE CHANGELOG.md
git commit -m "docs: add README, LICENSE, and CHANGELOG"
```

---

### Görev 3: Araçları indir ve kur

**Dosyalar:**
- Oluştur: `tools/UEExtractor/`, `tools/retoc/`, `tools/FModel/` (git'te yok, `.gitignore`)
- Oluştur: `tools/README.md` (araç indirme rehberi)

- [ ] **Adım 3.1: `tools/README.md` yaz**

`C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge\tools\README.md`:

```markdown
# Araçlar

Bu klasör `.gitignore`'dadır. Her katkıcı kendi yerel ortamına şu araçları indirmelidir:

## UEExtractor (zorunlu)

- Kaynak: https://github.com/SolicenTEAM/UEExtractor/releases
- Versiyon: v1.0.7.5 veya üzeri (.NET 10 gerekli)
- Konum: `tools/UEExtractor/UEExtractor.exe`

## retoc (zorunlu)

- Kaynak: https://github.com/trumank/retoc/releases
- Versiyon: En güncel (Nisan 2026 itibarıyla aktif bakımlı)
- Konum: `tools/retoc/retoc.exe`

## FModel (opsiyonel, denetim için)

- Kaynak: https://github.com/4sval/FModel/releases
- Versiyon: Dec 2025 veya üzeri
- Konum: `tools/FModel/FModel.exe`

## Ön koşul: .NET 10 runtime

UEExtractor için gerekli. https://dotnet.microsoft.com/download
```

- [ ] **Adım 3.2: UEExtractor indir**

Tarayıcıdan https://github.com/SolicenTEAM/UEExtractor/releases → en güncel release → zip dosyasını indir → `tools/UEExtractor/` altına aç.

Doğrulama:
```powershell
Test-Path "tools\UEExtractor\UEExtractor.exe"
```
Beklenen: `True`.

- [ ] **Adım 3.3: retoc indir**

Tarayıcıdan https://github.com/trumank/retoc/releases → en güncel release → Windows binary'yi indir → `tools/retoc/` altına aç.

Doğrulama:
```powershell
Test-Path "tools\retoc\retoc.exe"
.\tools\retoc\retoc.exe --version
```

- [ ] **Adım 3.4: FModel indir**

Tarayıcıdan https://github.com/4sval/FModel/releases → en güncel → installer veya zip → `tools/FModel/` altına aç.

Doğrulama: FModel.exe çalışıyor mu (GUI açılıyor mu)?

- [ ] **Adım 3.5: tools/README.md commit**

```powershell
git add tools/README.md
git commit -m "docs: add tool download guide"
```

Not: `tools/` altındaki binary'ler `.gitignore`'da, commit'e dahil olmaz.

---

### Görev 4: AES ve oyun paki açılabilirlik testi (kritik risk eleme)

**Hedef:** `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\` altındaki GDK paklarının şifreli olup olmadığını tespit et. Şifreliyse Plan B'ye geç.

- [ ] **Adım 4.1: FModel ile oyun paklarını aç**

FModel'i başlat → Settings (Directory Selector):
- Game Directory: `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks`
- UE Version: Seçimi otomatik bırak veya UE 5.3/5.4 dene.

"Load" tıkla.

**İki olasılık:**
- (A) Archive ağacı açılır, içeride `.uasset`/`.locres` görünür → **AES şifreli değil, devam**.
- (B) "AES Key required" hatası çıkar → **Plan B'ye geç**.

- [ ] **Adım 4.2: (A durumu) Locres dosyalarını listele**

FModel sol panelde arama: `.locres`. Oyun locres dosyaları ana dilleri için görünmeli:
- `Game.locres` (en/, pl/, de/, fr/, es/, it/, ja/, zh-Hans/, ru/, pt-BR/, ...)

Hangi dillerin mevcut olduğunu not al. **Türkçe (`tr/`) muhtemelen yok** — yoksa sorun değil, biz oluşturacağız.

- [ ] **Adım 4.3: (A durumu) Ek dil ekleme yaklaşımı karar ver**

Oyun sadece önceden tanımlı dilleri tanıyorsa mevcut bir dili (örn. `en-US`) override etmek gerekebilir. Başka bir alternatif: yeni `tr-TR` culture kodu eklemek, ama oyunun dil seçim menüsü bunu tanıyıp tanımadığı test edilir (Görev 7).

Karar notunu `docs/workflow.md`'ye ekle (Görev 9'da).

- [ ] **Adım 4.4: (B durumu) Plan B — Steam sürümünden kaynak al**

Eğer GDK paki şifreliyse:
1. Steam sürümü pakları tipik olarak şifresizdir. Ancak Steam kurulumu gerekmeden, aynı projenin Steam release'i için topluluk tarafından çıkarılmış `Game.locres` dosyaları GitHub/ModDB'de dolaşıyor olabilir.
2. Alternatif: Steam demo veya deneme sürümü kullanılabilir.
3. Kaynak metinleri Steam'den alıp, mod pakı doğrudan GDK'nın `Paks/` klasörüne bırakma denenecek (aynı motor, aynı content hashleri → çalışma ihtimali yüksek).

Bu durumda plan güncellenecek ve ek görev eklenecek. **Şu anda (A) durumu varsayılarak devam edilecek; (B) olursa plan revize edilir.**

- [ ] **Adım 4.5: Test sonucunu kaydet**

`docs/workflow.md` dosyasına (Görev 9'da yazılacak) şu satır eklenecek not:
> "GDK sürümünde AES şifreleme: [evet/hayır — test sonucuna göre]. Test tarihi: 2026-04-??."

Şimdilik bu notu basit bir `notes.md` dosyasına yaz:

`C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge\docs\workflow-notes.md`:
```markdown
# Geçici iş akışı notları

(Görev 9'da tam `docs/workflow.md`'ye taşınacak.)

- AES şifreleme testi (Görev 4.1): [SONUÇ]
- Mevcut diller: [LİSTE]
```

- [ ] **Adım 4.6: Commit**

```powershell
git add docs/workflow-notes.md
git commit -m "docs: add initial workflow notes from AES/tool verification"
```

---

### Görev 5: `extract.ps1` — Locres çıkarma scripti

**Dosyalar:**
- Oluştur: `scripts/extract.ps1`, `scripts/README.md`

- [ ] **Adım 5.1: `scripts/extract.ps1` yaz**

`C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge\scripts\extract.ps1`:

```powershell
# extract.ps1
# Oyun paklarından İngilizce ve Lehçe locres dosyalarını CSV olarak çıkarır.
# Çıktı: build/extracted/ altında ham .locres + source/en/, source/pl/ altında CSV.

param(
    [string]$GamePath = "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks",
    [string]$OutputPath = "$PSScriptRoot\..\build\extracted",
    [string]$UEExtractor = "$PSScriptRoot\..\tools\UEExtractor\UEExtractor.exe"
)

$ErrorActionPreference = "Stop"

Write-Host "Game path:    $GamePath"
Write-Host "Output path:  $OutputPath"
Write-Host "UEExtractor:  $UEExtractor"

if (-not (Test-Path $UEExtractor)) {
    throw "UEExtractor bulunamadı: $UEExtractor. tools/README.md'yi okuyun."
}
if (-not (Test-Path $GamePath)) {
    throw "Oyun yolu bulunamadı: $GamePath"
}

New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null

# UEExtractor drag-drop tabanlı; CLI argüman yapısını README'den doğrulayın.
# Nisan 2026 v1.0.7.5'te tipik kullanım:
& $UEExtractor --input "$GamePath" --output "$OutputPath" --format csv

Write-Host "Çıkarma tamamlandı: $OutputPath"
```

**Not:** UEExtractor'ın tam CLI argüman listesi için `tools/UEExtractor/` klasöründeki README'yi veya `UEExtractor.exe --help` çıktısını kontrol edin. Yukarıdaki satır örnek — ilk çalıştırmada argümanları doğrulayın.

- [ ] **Adım 5.2: `scripts/README.md` yaz**

`scripts/README.md`:

```markdown
# Scripts

Tüm scriptler proje kökünden çalıştırılır.

## extract.ps1

Oyun paklarından locres'leri CSV olarak çıkarır.

Kullanım:
```powershell
.\scripts\extract.ps1
```

Varsayılan yollar: `C:\XboxGames\The Thaumaturge\...\Paks`. Değiştirmek için `-GamePath` parametresi.

## pack.ps1

(Görev 7'de eklenecek.) Çevrilmiş locres'leri mod pak haline getirir.
```

- [ ] **Adım 5.3: extract.ps1'i çalıştır**

```powershell
.\scripts\extract.ps1
```

Beklenen: `build/extracted/` altında CSV dosyaları görünür. Eğer argümanlar yanlışsa hata mesajı verir; hata varsa UEExtractor help çıktısına göre script düzeltilir.

- [ ] **Adım 5.4: Sonucu incele**

```powershell
Get-ChildItem build\extracted -Recurse -Filter *.csv | Select-Object Name, Length
```

Kaç CSV üretildi, toplam satır sayısı kabaca kaç? (Head bak:)
```powershell
Get-Content "build\extracted\<bir dosya>.csv" -Head 10
```

- [ ] **Adım 5.5: CSV'leri `source/en/` ve `source/pl/` altına taşı**

```powershell
# Örnek — gerçek yapı UEExtractor çıktısına göre ayarlanır
Move-Item build\extracted\en\*.csv source\en\
Move-Item build\extracted\pl\*.csv source\pl\
```

- [ ] **Adım 5.6: Commit**

```powershell
git add scripts/extract.ps1 scripts/README.md source/en/ source/pl/
git commit -m "feat: add locres extraction script and import source CSVs"
```

---

### Görev 6: Kaynak CSV'lerin sağlığını doğrula

**Amaç:** Çıkarılan CSV'lerin UTF-8 encoding, satır sayısı, kırık stringe karşı kontrolü.

- [ ] **Adım 6.1: Tüm kaynak CSV'lerinin toplam satır sayısını yazdır**

```powershell
Get-ChildItem source\en -Filter *.csv | ForEach-Object {
    $lines = (Get-Content $_.FullName).Count
    "{0,-40} {1,8}" -f $_.Name, $lines
}
```

- [ ] **Adım 6.2: UTF-8 BOM kontrolü**

```powershell
Get-ChildItem source\en -Filter *.csv | ForEach-Object {
    $bytes = [System.IO.File]::ReadAllBytes($_.FullName) | Select-Object -First 3
    if ($bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        "UTF-8 BOM: $($_.Name)"
    } else {
        "!! BOM yok: $($_.Name)"
    }
}
```

Tüm dosyalar UTF-8 BOM olmalı. Olmayan varsa UEExtractor çıktı ayarını gözden geçir.

- [ ] **Adım 6.3: EN ile PL satır sayısı eşleşiyor mu?**

```powershell
Compare-Object `
    (Get-ChildItem source\en -Filter *.csv | ForEach-Object { "$($_.BaseName):$((Get-Content $_.FullName).Count)" }) `
    (Get-ChildItem source\pl -Filter *.csv | ForEach-Object { "$($_.BaseName):$((Get-Content $_.FullName).Count)" })
```

Beklenen: hiçbir çıktı (tam eşleşme). Farklılık varsa not edilir, bazı diller daha az/fazla string içerebilir.

- [ ] **Adım 6.4: En küçük CSV'yi manuel incele**

```powershell
Get-ChildItem source\en -Filter *.csv | Sort-Object Length | Select-Object -First 1 | ForEach-Object { Get-Content $_.FullName }
```

Format beklenen gibi mi (Key, Namespace, Source sütunları varsa)? Türkçe hedef sütunu eklemek için scripting gerekirse not alınır.

---

### Görev 7: Proof-of-Concept — UI çevirisi, pack ve oyun-içi doğrulama

**Amaç:** Küçük bir UI dosyasını (örn. ana menü) çevirip, oyuna mod pak olarak enjekte edip Türkçe metnin göründüğünü ve fontun desteklediğini doğrulamak.

**Dosyalar:**
- Oluştur: `translation/ui-poc.csv`
- Oluştur: `scripts/pack.ps1`

- [ ] **Adım 7.1: Küçük bir UI CSV seç**

`source/en/` içinden en küçük UI CSV'sini (muhtemelen 20-80 satır) `translation/ui-poc.csv` olarak kopyala:

```powershell
# Örnek — gerçek dosya adı çıktıya göre
Copy-Item "source\en\UI.csv" "translation\ui-poc.csv"
```

- [ ] **Adım 7.2: CSV'ye TR sütunu ekle**

Claude tarafından, `ui-poc.csv`'ye `Translation_TR` sütunu eklenir ve birkaç satır örnek Türkçe çeviri yapılır. Özellikle Türkçe karakterleri test edecek satırlar eklenir:
- "Settings" → "Ayarlar"
- "New Game" → "Yeni Oyun"
- "Continue" → "Devam Et"
- "Load Game" → "Oyun Yükle"
- "Quit" → "Çıkış"

Bir satıra özellikle tüm Türkçe özel karakterleri içeren bir test stringi (`"çğıöşü ÇĞIİÖŞÜ"`) ekle (key'i `TR_CHAR_TEST` vb.).

- [ ] **Adım 7.3: CSV'yi .locres'e dönüştür**

UEExtractor'ın CSV → .locres özelliğiyle:

```powershell
& .\tools\UEExtractor\UEExtractor.exe --input "translation\ui-poc.csv" --output "build\staging\tr\UI.locres" --format locres
```

Not: Tam argüman UEExtractor help çıktısına göre ayarlanır.

Beklenen: `build\staging\tr\UI.locres` dosyası oluşur.

- [ ] **Adım 7.4: `scripts/pack.ps1` yaz**

`scripts/pack.ps1`:

```powershell
# pack.ps1
# build/staging altındaki tr/ locres dosyalarını retoc ile mod pak haline getirir.
# Çıktı: build/output/pakchunk99-WinGDK_P.{pak,ucas,utoc}

param(
    [string]$StagingPath = "$PSScriptRoot\..\build\staging",
    [string]$OutputPath  = "$PSScriptRoot\..\build\output",
    [string]$Retoc       = "$PSScriptRoot\..\tools\retoc\retoc.exe",
    [string]$ModName     = "pakchunk99-WinGDK_P"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $Retoc))       { throw "retoc bulunamadı: $Retoc" }
if (-not (Test-Path $StagingPath)) { throw "Staging yolu yok: $StagingPath" }

New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null

# retoc'un tam CLI'si için `retoc --help` çıktısına bakın. Tipik komut:
& $Retoc to-zen --input $StagingPath --output "$OutputPath\$ModName"

Write-Host "Mod pak üretildi: $OutputPath\$ModName.*"
```

**Not:** retoc'un CLI'si versiyonla değişebilir. İlk çalıştırmadan önce `.\tools\retoc\retoc.exe --help` çalıştır, doğru alt-komutu (to-zen veya pack) seç.

- [ ] **Adım 7.5: pack.ps1'i çalıştır**

```powershell
.\scripts\pack.ps1
```

Beklenen: `build/output/pakchunk99-WinGDK_P.pak` + `.ucas` + `.utoc` oluşur.

- [ ] **Adım 7.6: Mod pakı oyun klasörüne kopyala**

```powershell
$gamePaks = "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks"
Copy-Item build\output\pakchunk99-WinGDK_P.* $gamePaks
```

Not: Game Pass / GDK kurulumları bazen yazma izni reddeder. Eğer "access denied" hatası gelirse PowerShell'i yönetici olarak çalıştır.

- [ ] **Adım 7.7: Oyunu aç, menü dilini TR'ye ayarla ve doğrula**

1. The Thaumaturge'ü Xbox Game Bar / Microsoft Store'dan başlat.
2. Options → Language → Türkçe'yi ara. Türkçe seçeneği listedeyse seç; değilse en yakın override edilmiş dili seç (örn. EN'i override ettiysek EN seçili).
3. Menüde "Ayarlar", "Yeni Oyun" gibi Türkçe metinlerin görünüp görünmediğini kontrol et.
4. Türkçe özel karakter testi için ekranda `TR_CHAR_TEST` key'li string'i içeren menü öğesini incele (varsa).

**İki olası sonuç:**
- **Başarı:** Türkçe görünüyor ve karakterler düzgün → POC doğrulandı, sonraki görevlere geç.
- **Kısmi başarı:** Türkçe görünüyor ama karakterler `?` veya kutu → font sorunu, ayrı bir görev (bu planın kapsamı dışında, ek iş) gerekir.
- **Hata:** Mod pak yüklenmiyor, oyun İngilizce kalıyor → dosya adı (`_P` son ek), konum (`Paks/` vs `~mods/`), veya retoc pack komutu hatalı. Debug döngüsü.

- [ ] **Adım 7.8: Sonucu belgele ve commit**

`docs/workflow-notes.md`'ye sonucu ekle:
> "POC testi 2026-04-??: [başarılı/font sorunu/yüklenmedi]. Detay: ..."

```powershell
git add translation/ui-poc.csv scripts/pack.ps1 docs/workflow-notes.md
git commit -m "feat: proof-of-concept UI translation with pack script"
```

**Kontrol noktası:** POC başarısızsa, sonraki görevlere geçmeden önce sorun çözülür. Başarılıysa devam.

---

### Görev 8: Glossary, stil rehberi ve karakter sesleri taslağı

**Dosyalar:**
- Oluştur: `docs/glossary.md`, `docs/style-guide.md`, `docs/character-voices.md`

- [ ] **Adım 8.1: Anahtar terimleri source CSV'lerinden topla**

Kaynaklarda en çok geçen özel isimler ve oyun-spesifik terimler Claude tarafından taranır:
- Karakterler: Wiktor Szulski, Abram, Tatarin, Rasputin, vb.
- Mekânlar: Varşova semtleri — Praga, Powiśle, Wola, Śródmieście
- Salutor isimleri (Upiór, Czart, vb. — oyun evreninin eterik varlıkları)
- Mekanikler: Thaumaturge, Salutor, Flaw, Brand, Sign
- Tarihsel terimler: 1905 Rusya işgali, Okhrana, dönem terimi

- [ ] **Adım 8.2: `docs/glossary.md` yaz**

Claude Görev 8.1'deki listeyi alıp, her terim için önerilen Türkçe karşılığı ve kısa açıklama hazırlar. Örnek:

```markdown
# Glossary — Terimler Sözlüğü

Kararlar sohbette alındıkça bu dosya güncellenir.

## Mekanikler

| EN | PL | TR (karar) | Not |
|---|---|---|---|
| Thaumaturge | Thaumaturg | Tılsımkâr | "Büyücü"den daha özel; Wiktor'un mesleği |
| Salutor | Salutor | Salutor | Özel isim, çevrilmez |
| Flaw | Skaza | Kusur | Salutorların zayıf yönü, mekanik terim |
| ... | ... | ... | ... |

## Karakterler

(İsimler çevrilmez. Aksan/karakter notları `character-voices.md`'de.)

## Mekânlar

| EN | PL | TR | Not |
|---|---|---|---|
| Warsaw | Warszawa | Varşova | Tarihî |
| Praga | Praga | Praga | Semt adı |
| Powiśle | Powiśle | Powiśle | Semt, çevrilmez |
```

**Önemli:** Bu dosya ilk çeviri batch'i başlamadan kullanıcıyla tartışılıp onaylanmalı. Görev 8'in sonu kullanıcı onayını bekler.

- [ ] **Adım 8.3: `docs/style-guide.md` yaz**

```markdown
# Stil Rehberi

## Genel ilkeler

- Türkçenin doğal cümle yapısı önceliklidir; İngilizce kelime sırasına bağlı kalma.
- Hitap: karakterler arası uygun hitap ("siz/sen") tarihsel ve sosyal bağlamdan çıkarılır.
- Gotik-mistik ton: ağır kelime seçimi, dönem tınısı (ama arkaik olmayacak kadar akıcı).

## Noktalama

- Türkçe üç nokta `…` (ASCII üç nokta değil).
- Tırnak: `"..."` (köşeli) tercih; iç tırnak: `'...'`.
- Uzun çizgi: `—` (em dash). Kısa çizgi `-` kelime bileşiminde.

## Terminoloji tutarlılığı

- `docs/glossary.md`'de geçen terimler sabit kullanılır.
- Belirsiz bir terim oluştuğunda dosyaya not düşülür, kullanıcıyla karar alınır, glossary güncellenir.

## Karakter sesi

`docs/character-voices.md` dosyasına bakılır. Her ana karakterin konuşma tarzı ayrı ayrı tanımlıdır.
```

- [ ] **Adım 8.4: `docs/character-voices.md` iskeleti**

```markdown
# Karakter Sesleri

İlk geçişte boştur; her yeni karakter diyalogu çevrilirken, karakter belirgin bir ses profili gösterirse bu dosyaya eklenir.

## Wiktor Szulski (baş karakter)

(Metin incelendikçe doldurulacak — ilk izlenim: ölçülü, entelektüel, zaman zaman ironik.)

## Rasputin

(Oyunda yer alıyor; tarihsel Rasputin'in bilinen söylem tarzı referans alınacak.)

## Abram

(Yahudi-Lehçe karakter; Yidiş tınısı ve kültürel referanslar dikkate alınacak.)
```

- [ ] **Adım 8.5: İlk glossary için kullanıcı onayı**

Bu görev tamamlanmaz (commit edilmez) kullanıcı `docs/glossary.md`'yi görüp terim kararlarını onaylamadan. Claude terimleri sunar, sohbette tartışılır, kararlar dosyaya işlenir.

- [ ] **Adım 8.6: Commit**

```powershell
git add docs/glossary.md docs/style-guide.md docs/character-voices.md
git commit -m "docs: initial glossary, style guide, and character voices drafts"
```

---

### Görev 9: Resmi `docs/workflow.md` ve çeviri başlangıcı için hazırlık

**Dosyalar:**
- Oluştur: `docs/workflow.md`
- Güncelle: `CONTRIBUTING.md`
- Sil: `docs/workflow-notes.md` (içeriği workflow.md'ye taşınır)

- [ ] **Adım 9.1: `docs/workflow.md` yaz**

```markdown
# İş Akışı

## Bir dosya nasıl çevrilir

1. `source/en/<dosya>.csv` ve karşılık gelen `source/pl/<dosya>.csv` okunur.
2. Dosya `translation/<dosya>.csv` olarak kopyalanır; `Translation_TR` sütunu eklenir.
3. Claude dosyayı sırayla çevirir, emin olmadığı satırlara `Notes` sütununa açıklama düşer.
4. Kullanıcı inceler; sohbette veya dosyada düzeltme verir.
5. Claude revize eder, tekrar bakılır, tamam denince dosya commit edilir.

## Pack ve test

1. `scripts/extract.ps1` (bir kerelik, kaynakları almak için).
2. Yeni CSV `scripts/pack.ps1` ile locres'e dönüştürülür, mod pak üretilir.
3. Mod pak oyun `Paks/` klasörüne kopyalanır, oyun içi test edilir.

## Oyun güncellenirse

1. `scripts/extract.ps1` tekrar çalıştırılır, yeni EN CSV alınır.
2. `git diff source/en/` ile değişen satırlar tespit edilir.
3. Sadece değişen satırlar `translation/` altında güncellenir.

## Teknik notlar (Görev 4'ten toplananlar)

- GDK AES şifreleme durumu: [sonuç]
- Mevcut oyun-içi diller: [liste]
- Font Türkçe karakter desteği: [POC testi sonucuna göre]
- Mod pak yükleme konumu: [Paks/ veya ~mods/]
```

- [ ] **Adım 9.2: CONTRIBUTING.md yaz**

```markdown
# Katkı Rehberi

Bu proje şu iş bölümü ile ilerler:

- **Çeviri:** Claude (AI asistan) yapar.
- **Kalite kontrol ve onay:** veysiemrah yapar.

## Katkıcı olabilir miyim?

Fork edip kendi varyantınızı yapabilirsiniz (CC BY-SA 4.0). Ana depoya PR göndermek isterseniz:

1. Önce bir issue açın — yama kapsamında mı, değişiklik gerekçesi ne.
2. Küçük, bağımsız değişiklikler tercih edilir (yazım hatası, yerelleştirme sorunu vb.).
3. `docs/style-guide.md` ve `docs/glossary.md`'ye uyum zorunlu.

## Terim/stil önerisi

Glossary'ye yeni bir terim eklenmesini veya değiştirilmesini öneriyorsanız, issue açın; tartışma sonucunda karar verilir.
```

- [ ] **Adım 9.3: workflow-notes.md'yi sil (artık gerek yok)**

```powershell
git rm docs/workflow-notes.md
```

- [ ] **Adım 9.4: Commit**

```powershell
git add docs/workflow.md CONTRIBUTING.md
git commit -m "docs: finalize workflow and contributing guide"
```

---

## Özet: Planın bitişinde elinizde olacak

Tüm 9 görev tamamlandığında:
- ✅ Git reposu initialize, MIT+CC BY-SA 4.0 lisanslı.
- ✅ README, CHANGELOG, CONTRIBUTING, workflow, glossary, stil rehberi, karakter sesleri taslak olarak mevcut.
- ✅ UEExtractor, retoc, FModel yerel olarak kurulu.
- ✅ GDK paklarının AES riski elenmiş (veya Plan B devreye alınmış).
- ✅ İngilizce + Lehçe source CSV'ler `source/` altında.
- ✅ Bir UI çevirisi oyunda Türkçe görünür ve karakterler doğru gösterilir.
- ✅ `extract.ps1` ve `pack.ps1` çalışır durumda.
- ✅ İlk gerçek çeviri batch'ine başlamaya hazır.

**Sonraki adım (bu planın dışında):** Kullanıcı hangi dosyadan (UI tam, ana menü tam, ilk diyalog sahnesi, vs.) başlanmasını istediğini seçer; Claude o dosya için normal çeviri döngüsüne girer.
