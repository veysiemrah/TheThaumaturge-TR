# İş Akışı ve Proje Durumu

Bu dosya projenin **kanonik oturum aktarma notudur**. Yeni bir oturum başlarsa, önce bunu oku; `docs/glossary.md` ve `docs/style-guide.md` ile birlikte projeyi tam kavramaya yetecek kadar bilgi içerir.

---

## Proje nedir

**The Thaumaturge** (Fool's Theory / 11 bit studios, 2024) için açık kaynak Türkçe yama. Xbox GDK (Game Pass) sürümü üzerinden geliştiriliyor; üretilen mod pak diğer sürümlerde (Steam, GOG, Epic) de uyumlu olmalı (aynı motor, aynı asset yapısı).

- **Hedefler:** Tutarlı ve doğal Türkçe çeviri. Hata mesajları hariç tüm UI + diyalog + codex + item + başarım.
- **İş bölümü:** Claude çevirir, `veysiemrah` kalite kontrol yapar.
- **Takvim/iddia yok.** Hafif iş akışı; kalite önceliği.
- **Açık kaynak ilkeleri:** Başka dillerin kapalı dağıtımları indirilmez/analiz edilmez.

---

## Oyun dosyası mimarisi (bilmeyen için kritik)

- **Motor:** Unreal Engine 5.1.1 (Mappings.usmap adından doğrulandı)
- **Format:** UE5 IoStore (`.ucas` + `.utoc` + boş header `.pak`) — klasik `.pak` değil
- **AES şifreleme:** YOK. `retoc` anahtarsız okur.
- **`.locres` / `.locmeta` dosyası YOK.** UE'nin standart lokalizasyon yapısı bu oyunda kullanılmıyor.
- **UI metinleri:** `GrimoireContent/**/StringTables/*_ST.uasset` içindeki **StringTable** asset'lerinde gömülü (Polonya baseline değerleri).
- **Dil seçimi özelliği:** Oyun dili ayarı StringTable'ları etkilemiyor; yani UI'a dair bizim değiştirdiğimiz bir StringTable değeri **tüm dillerde aynı görünür**. Diğer dillerin UI metni nereden geliyor hâlâ tam bilinmiyor ama bu bizi kısıtlamıyor — bir StringTable çevirsek, **her dil seçiminde Türkçe çıkar**.
- **Diyalog metinleri:** `Quests/Dialogues/<quest>/Assets/<scene_GRAPH>/Seq/{en,pl}/Lines/Seq-*.uasset` — dile özel klasörler. Oyuncu dil seçimine göre yüklenir. (Henüz diyalog çevirisine geçilmedi.)
- **Mod pak stratejisi:** Orijinal `pakchunk0-WinGDK.*` dokunulmaz. Bizim çıktı: `pakchunk99-WinGDK_P.{pak,ucas,utoc}` — alfabetik sonda yüklenir, üstüne yazar.

---

## Araç yığını (`tools/` altında, git'te yok)

| Araç | Sürüm | Konum | Görev |
|---|---|---|---|
| retoc | v0.1.5 | `tools/retoc/retoc.exe` | IoStore ↔ Legacy dönüşüm, mod pak üretim |
| UAssetGUI | v1.0.3 | `tools/UAssetGUI/UAssetGUI.exe` | `.uasset` ↔ `.json` roundtrip |
| FModel | Dec 2025 | `tools/FModel/FModel.exe` | Opsiyonel: görsel denetim |
| UnrealLocres | v1.1.1 | `tools/UnrealLocres/UnrealLocres.exe` | Yedek (oyun `.locres` kullanmıyor, pratikte işe yaramıyor) |
| Mappings.usmap | UE5.1.1 | `tools/Mappings.usmap` (+ `tools/UAssetGUI/Mappings.usmap`) | UAssetGUI unversioned asset parse için zorunlu |
| UEExtractor | v1.0.7.5 | `tools/UEExtractor/` (kurulu ama kullanılmıyor) | Non-interactive terminalde crash ediyor, bu projede pratik değil |

### Sistem bağımlılıkları (winget ile kurulu)

- **.NET 10 Runtime** (`Microsoft.DotNet.Runtime.10`) — UEExtractor için (artık kullanmıyoruz)
- **.NET 8 Runtime + Desktop Runtime** (`Microsoft.DotNet.Runtime.8` ve `Microsoft.DotNet.DesktopRuntime.8`) — UAssetGUI için

### Mappings.usmap'i yeniden üretmek gerekirse

1. UE4SS `experimental-latest` indir (https://github.com/UE4SS-RE/RE-UE4SS/releases/experimental-latest — `UE4SS_v3.0.1-946-*.zip`)
2. İçindeki `dwmapi.dll` + `ue4ss/` klasörünü `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Binaries\WinGDK\` içine kopyala
3. Oyunu başlat (Game Pass); ana menüde **Ctrl + Numpad 6** bas → `Mappings.usmap` üretilir (aynı klasörde).
4. Üretilen dosyayı `tools/Mappings.usmap` ve `tools/UAssetGUI/Mappings.usmap` olarak kopyala.
5. UE4SS'i oyun klasöründen **sil** (log hataları üretiyor ve artık gerek yok).

Not: Game Pass GDK sürümünde UE4SS'in kendi GUI'si **Insert tuşuyla açılmıyor** (DX12 ile GUI overlay çakışması), ama keybind tabanlı dumpers çalışıyor.

---

## Çeviri iş akışı (standart bir StringTable için)

**Örnek:** `Panels_ST` çevirisi.

### 1. Oyun paklarından asset'i çıkar

```powershell
cd C:\Users\veysi\Projeler\TR_Yama_Projeleri\TheThaumaturge
New-Item -ItemType Directory -Force -Path build\work | Out-Null
.\tools\retoc\retoc.exe to-legacy --filter "Panels_ST" --no-shaders `
    "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks" `
    "build\work"
```

Çıktı: `build\work\TheThaumaturge\Content\GrimoireContent\UI\Data\StringTables\Panels_ST.{uasset,uexp}`

### 2. `.uasset` → `.json`

```powershell
.\tools\UAssetGUI\UAssetGUI.exe tojson `
    "build\work\TheThaumaturge\Content\GrimoireContent\UI\Data\StringTables\Panels_ST.uasset" `
    "build\work\Panels_ST.json" `
    VER_UE5_1 Mappings
```

Mappings parametresi `tools/UAssetGUI/Mappings.usmap`'e referans (uzantısız yazılır).

### 3. Key/PL değerlerini CSV olarak dump et

```powershell
.\scripts\stringtable_dump.ps1 `
    -JsonPath "build\work\Panels_ST.json" `
    -CsvPath "source\pl\Panels_ST.csv"
```

CSV formatı: `Key,Value` (Value = Polonya değeri).

### 4. Çeviri CSV'sini yaz

`translation\Panels_ST.csv` formatı: `Key,PL,TR,Notes`.

`source/pl/*.csv`'den baz alıp TR kolonunu doldur. `Notes` sütunu opsiyonel (çeviri kararı, belirsizlik, kullanıcıya soru).

### 5. Çeviriyi JSON'a uygula

```powershell
.\scripts\stringtable_apply.ps1 `
    -JsonPath "build\work\Panels_ST.json" `
    -CsvPath "translation\Panels_ST.csv" `
    -OutJsonPath "build\work\Panels_ST_tr.json"
```

Çıktı: replaced/unchanged/missing raporu. CSV'de TR boşsa PL değeri tutulur.

### 6. `.json` → `.uasset` (staging'e)

```powershell
$stagingDir = "build\staging\TheThaumaturge\Content\GrimoireContent\UI\Data\StringTables"
New-Item -ItemType Directory -Force -Path $stagingDir | Out-Null
.\tools\UAssetGUI\UAssetGUI.exe fromjson `
    "build\work\Panels_ST_tr.json" `
    "$stagingDir\Panels_ST.uasset" `
    Mappings
```

**Staging yapısı önemli:** Çevrilen asset, oyundaki **orijinal göreli yolunu koru**. Mod pak'ta bu yol orijinalin üstüne yazar.

### 7. Mod pak üret (staging'deki TÜM asset'lerle)

```powershell
Remove-Item build\output\* -Force -ErrorAction SilentlyContinue
.\tools\retoc\retoc.exe to-zen --version UE5_1 `
    "build\staging\TheThaumaturge" `
    "build\output\pakchunk99-WinGDK_P.utoc"
```

Üç dosya üretir: `pakchunk99-WinGDK_P.{pak,ucas,utoc}`.

### 8. Oyuna yükle

```powershell
$gamePaks = "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks"
Remove-Item "$gamePaks\pakchunk99*" -Force -ErrorAction SilentlyContinue
Copy-Item build\output\pakchunk99-WinGDK_P.* $gamePaks -Force
```

**Dikkat:** Oyun çalışıyorsa `.ucas` kilitli olur ve `Copy-Item` hata verir. Kullanıcıdan oyunu kapatmasını isteyin.

### 9. Commit

`build/`, `tools/`, pak dosyaları `.gitignore`'da. Commit'e giren:
- `translation/*.csv` (çeviri kaynağı)
- `source/pl/*.csv` (referans Polonya dump'ı)
- `docs/glossary.md`, `docs/style-guide.md` güncellemeleri

---

## StringTable veri formatı (önemli detay)

UAssetGUI 1.0.2 StringTable'ı bir **`RawExport.Data` base64 blob'u** olarak dump ediyor. UE FString formatında:

```
[u32 key_length]  [UTF-8 key + \0]
[i32 value_length]  (pozitif = UTF-8 byte sayısı, negatif = -UTF-16LE karakter sayısı, 0 = boş)
[UTF-8 veya UTF-16LE value + \0]
```

Türkçe diakritik içeren değerler otomatik olarak UTF-16LE'ye geçer (negatif length). ASCII-only değerler UTF-8 kalır. `scripts/stringtable_*.ps1` scriptleri bunu otomatik halleder.

---

## Proje durumu (en son)

### Çevirilmiş StringTable'lar (26 adet / ~1539 entry)

| Dosya | Entry | Notlar |
|---|---|---|
| `Panels_ST` | 186 | Menüler, paneller, ayarlar, envanter kategorileri, codex başlıkları |
| `Tutorial_ST` | 48 | Eğitici pop-up açıklama metinleri |
| `TutorialName_ST` | 48 | Eğitici başlıkları |
| `AbilityName_ST` | 145 | Yetenek isimleri (oyuncu + salutor + düşman silahları + boss) |
| `AbilityDescription_ST` | 42 | Yetenek açıklamaları (sadece oyuncu+salutor+boss, düşman silahları açıklamasız) |
| `Map_ST` | 169 | Lokasyon/oda adları (Varşova semtleri özel isim aynen) |
| `MapDescriptions_ST` | 14 | Bölge atmosferik tanımları (uzun, edebi) |
| `MapPinTypes_ST` | 13 | Harita pin etiketleri (Berber, Terzi, Fayton vs.) |
| `Combat_ST` | 170 | Savaş UI (boyut isimleri, rasputin çağrıları, ipuçları) |
| `CombatLog_ST` | 12 | Savaş log bildirimleri |
| `PopupsTexts_ST` | 112 | Pop-up, pano (StartBoard, Q102Demo), difficulty, Ligia mektubu, stüdyo manifesti |
| `Flaw_Name_ST` | 12 | Kusur adları (Kibir, Hırs, Düşüncesizlik vs.) |
| `Flaw_CombatDescription_ST` | 4 | Kusurun savaşta tetiklenme metni |
| `Flaw_PanelDescription_ST` | 12 | Kusur panel efekt metni |
| `FlawsPanel_Descriptions_ST` | 22 | Kusurların edebi kökenleri (Wiktor anlatıcı) |
| `StatusName_ST` | 46 | Savaş durumları (Parçalanma, Acı, Rasputin Boyundurukları vs.) |
| `StatusDescription_ST` | 49 | Durum açıklamaları (teknik) |
| `Progression_EffectName_ST` | 32 | Yetenek ağacı efekt isimleri |
| `Progression_EffectDescription_ST` | 14 | Yetenek ağacı efekt açıklamaları |
| `ImprintsDescription_ST` | 72 | NPC iz/kişilik etiketleri |
| `BarberName_ST` | 22 | Saç/sakal stil isimleri (yaratıcı dönem argosu) |
| `BarberDescription_ST` | 22 | Saç/sakal stil açıklamaları (uzun, dönem tınılı) |
| `Street_Addresses_ST` | 33 | Sokak adları (32 aynen, 1 çeviri: Plac Zielony) |
| `UnitDataLoreDescription_ST` | 16 | Salutor/düşman lore tek-cümle tanımları |
| `Achievements_ST` | 116 | Steam/Xbox başarımları (58 isim + 58 açıklama) |
| `Exploration_ST` | 108 | Etkileşim butonları, ReduceStress alt-etkileşimleri, TimeOfDay, InputAction, Pride diyalog mesajları |

Deploy edilmiş mod pak: `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\pakchunk99-WinGDK_P.*`

### Kalan 1 StringTable

#### `DebugText_ST`

Debug metinleri; oyuncu görmez. Çeviri önceliği düşük, opsiyonel.

### StringTable byte layout'u (doğrulandı)

Tüm `*_ST.uasset` dosyalarındaki `RawExport.Data` base64 blob'u şu yapıya sahip:

```
[6 byte prefix: 00 01 00 00 00 00]
[FString namespace]   (Exploration_ST'de boş: len=1, sadece "\0")
[int32 entry_count]
[FString key + FString value] * count
```

`scripts/stringtable_dump.ps1` ve `stringtable_apply.ps1` artık sabit 6-byte prefix'ten sonra namespace'i doğrudan okuyor (regex taraması yerine). Boş namespace bu sayede desteklenir — eski regex yaklaşımı Exploration_ST'de ilk key'i ("Interaction_Inspect") namespace sanarak parse'ı bozuyordu.

### QA aşaması — bekleyen belirsizlikler

Çevirilerin `Notes` sütunlarında kullanıcı onayı için işaretli notlar var. Kritik olanlar:

- `AbilityName_ST` Bukavac_H → "Sırp Darbesi" (PL: "Surmijski cios" — Güney Slav/Srem bölge sıfatı; pragmatik seçim)
- `Combat_ST` Salutor_Dimension1/2 — parçalı cümle inject sırası PL'den farklı; TR'de "Bu Salutor, [BOYUT] Boyutundandır. ..." olarak yeniden yapılandırıldı
- `ImprintsDescription_ST` Maria → "Sigara İçen Kadın" (Palaczka hem tiryaki hem ateşçi anlamına gelir, bağlam belirsiz)
- `Achievements_ST` wordplay: "Bülbül Muhabbeti" (Trele morele), "Şek Şük!" (Sztymunek), "Yerine!" (Waruj!), "Arabistanlı Wiktor" (Lawrence göndermesi)
- `Flaw_*` Pycha/Duma ayrımı — TR'de Gurur/Kibir farkıyla korundu

### Diyalog çevirisi (henüz başlanmadı)

~30.000 `Seq-*.uasset` dosyası `Quests/Dialogues/**/Seq/{en,pl}/Lines/` altında. Bunların içinde gerçek metin var mı ya da hash referansı mı tam bilinmiyor; ilk birkaç dosyada kamera verisi görünüyordu. **Diyaloga geçmeden önce yeniden analiz gerek.**

---

## Komut alışverişlerinde dikkat

- Shell: PowerShell / pwsh (bash değil)
- Path format: Windows (`C:\...`), forward slash da çalışır ama backslash native
- Build artifact'leri `build/` altında — `.gitignore`'da, commit'e girmez
- CSV encoding: UTF-8 BOM (PowerShell `Export-Csv -Encoding UTF8` varsayılan)
- Commit mesajları + narrative metinler — **Türkçe tam yazımla**, diakritik kullan

### CSV parse bütünlüğü (kritik)

CSV'de **PL veya TR sütunu virgül içeriyorsa o alan ÇİFT TIRNAK içine alınmalı**. Aksi hâlde `Import-Csv` kolonları kaydırır, `dialog_apply.ps1` / `stringtable_apply.ps1` yanlış metni deploy eder — çeviri kaybı sessizce olur (2026-04-18 review'da 10 satırda tespit edildi).

**Kural:** Bir alanın içinde `,` `"` veya satır sonu varsa → o alanı `"..."` ile sar. İç tırnaklar `""` olarak kaçırılır.

**Denetim:** CSV düzenlemelerinden sonra `pwsh scripts/validate_csv_columns.ps1` çalıştır. "Toplam gerçek CSV kolon uyuşmazlığı: 0" çıkmalı.

---

## Yeni oturumda başlangıç kontrol listesi

1. `docs/workflow-notes.md` (bu dosya) — proje durumu
2. `docs/glossary.md` — terim sözlüğü, sabit kararlar
3. `docs/style-guide.md` — çeviri stil rehberi (varsa)
4. `git log --oneline` — en son yapılanlar
5. `translation/` altındaki dosyalar — çevrilmiş StringTable'lar
6. Araçların yerinde olduğunu doğrula (`tools/retoc/retoc.exe --version`, `tools/UAssetGUI/UAssetGUI.exe` ve `tools/Mappings.usmap` var mı)
7. Kullanıcıya son durumu sor ve devam noktasını al
