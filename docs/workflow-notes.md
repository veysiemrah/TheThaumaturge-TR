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

### Çevirilmiş StringTable'lar

| Dosya | Entry | Notlar |
|---|---|---|
| `Panels_ST` | 186 | Menüler, paneller, ayarlar, envanter kategorileri, codex kategori başlıkları |
| `Tutorial_ST` | 48 | Eğitici pop-up açıklama metinleri |
| `TutorialName_ST` | 48 | Eğitici başlıkları |

**Toplam: 282 entry.**

Deploy edilmiş mod pak: `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\pakchunk99-WinGDK_P.*`

### Henüz çevrilmedi (24 adet StringTable kaldı)

`Achievements_ST` (oyun-içi menüsü yok, sona bırakıldı), `AbilityName_ST`, `AbilityDescription_ST`, `BarberDescription_ST`, `BarberName_ST`, `Combat_ST`, `CombatLog_ST`, `DebugText_ST`, `Exploration_ST`, `Flaw_CombatDescription_ST`, `Flaw_Name_ST`, `Flaw_PanelDescription_ST`, `FlawsPanel_Descriptions_ST`, `ImprintsDescription_ST`, `Map_ST`, `MapDescriptions_ST`, `MapPinTypes_ST`, `PopupsTexts_ST`, `Progression_EffectDescription_ST`, `Progression_EffectName_ST`, `StatusDescription_ST`, `StatusName_ST`, `Street_Addresses_ST`, `UnitDataLoreDescription_ST`.

### Sonraki adım

Kullanıcıya hangi StringTable'ın çevrileceği sorulur. Görünürlük sırasına göre öneriler:
1. `AbilityName_ST` + `AbilityDescription_ST` (her savaşta görünür)
2. `Map_ST` + `MapDescriptions_ST` + `MapPinTypes_ST` (harita)
3. `Combat_ST` + `CombatLog_ST` (savaş bildirimleri)
4. `PopupsTexts_ST` (kaydetme/yükleme/olay pop-up'ları)
5. `Flaw_*_ST` (salutor araştırma sistemi)

### Diyalog çevirisi (henüz başlanmadı)

~30.000 `Seq-*.uasset` dosyası `Quests/Dialogues/**/Seq/{en,pl}/Lines/` altında. Bunların içinde gerçek metin var mı ya da hash referansı mı tam bilinmiyor; ilk birkaç dosyada kamera verisi görünüyordu. **Diyaloga geçmeden önce yeniden analiz gerek.** Önce StringTable'lar bitsin.

---

## Komut alışverişlerinde dikkat

- Shell: PowerShell / pwsh (bash değil)
- Path format: Windows (`C:\...`), forward slash da çalışır ama backslash native
- Build artifact'leri `build/` altında — `.gitignore`'da, commit'e girmez
- CSV encoding: UTF-8 BOM (PowerShell `Export-Csv -Encoding UTF8` varsayılan)
- Commit mesajları + narrative metinler — **Türkçe tam yazımla**, diakritik kullan

---

## Yeni oturumda başlangıç kontrol listesi

1. `docs/workflow-notes.md` (bu dosya) — proje durumu
2. `docs/glossary.md` — terim sözlüğü, sabit kararlar
3. `docs/style-guide.md` — çeviri stil rehberi (varsa)
4. `git log --oneline` — en son yapılanlar
5. `translation/` altındaki dosyalar — çevrilmiş StringTable'lar
6. Araçların yerinde olduğunu doğrula (`tools/retoc/retoc.exe --version`, `tools/UAssetGUI/UAssetGUI.exe` ve `tools/Mappings.usmap` var mı)
7. Kullanıcıya son durumu sor ve devam noktasını al
