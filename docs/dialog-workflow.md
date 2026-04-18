# Diyalog Çevirisi — İş Akışı

StringTable'lardan farklı olarak diyalog metni `Quests/Dialogues/` altında dağınık. Bu doküman pipeline'ı ve kapsam takibini tanımlar.

## Asset yapısı (doğrulandı)

- **Ana graf asset'i:** `Quests/Dialogues/<proj>/Assets/<grafadı>.uasset` (ve `Default_dialogues/Assets/DD_*.uasset`). Metin burada.
- **Sinematik Seq/VO/Lipsync:** Aynı klasör hiyerarşisi altında `Seq/`, `VO/`, `Lipsync/` alt-klasörlerinde. Gerçek metin içermez (kamera timeline, ses, yüz animasyonu). **Dokunulmaz.**
- Toplam **687 graf asset'i** (`docs/dialog-assets.txt` tam manifest).

## Metin formatı

Her `CinematicNode_Choice_*` ve `CinematicNode_Response_*` export'unun `RawExport.Data` base64 blob'unda:

```
... [mevcut byte'lar — node metadata, graph bağlantıları] ...
[int32 len=33]         ← hash FString prefix
[32 hex char + '\0']   ← unique dialog satırı ID'si (Seq-*/VO-* dosya adlarıyla eşleşir)
[int32 len]            ← text FString prefix (pozitif = UTF-8 bytes, negatif = UTF-16LE chars)
[text body + '\0']     ← dialog satırı (PL baseline)
... [devam byte'lar] ...
```

Bir export'ta birden çok hash-text çifti bulunur; birçok `Choice_*` ve `Response_*` export'u vardır (ortalama 50-150 satır/asset).

## Pipeline

### 1. Extract (tek seferlik toplu)

```powershell
.\tools\retoc\retoc.exe to-legacy --filter "Quests/Dialogues" --no-shaders `
    "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks" `
    "build\dialogue_analysis"
```

Bu büyük (~650 MB — tüm Seq/VO/Lipsync dahil). **`build/dialogue_analysis/` git'e girmez.**

### 2. Graf asset'ini JSON'a çevir

```powershell
.\tools\UAssetGUI\UAssetGUI.exe tojson `
    "build\dialogue_analysis\...\<asset>.uasset" `
    "build\dialogue_analysis\<asset>.json" `
    VER_UE5_1 tools/Mappings
```

UAssetGUI bazen sessiz fail eder — `Start-Sleep 2` ile bekleyip output dosyayı doğrula.

### 3. Kaynak CSV dump (ilk kez)

```powershell
pwsh -File scripts\dialog_dump.ps1 `
    -JsonPath "build\dialogue_analysis\<asset>.json" `
    -CsvPath "source\pl\<asset>.csv" `
    -SkipNumericTexts
```

CSV formatı: `Hash,NodeName,PL`. `-SkipNumericTexts` flag'i "1", "2", "3" gibi choice sıra numaralarını atlar.

### 4. Çeviri CSV yaz

`translation/<asset>.csv` formatı: `Hash,NodeName,PL,TR,Notes`. `source/pl/`'den baz al, `TR` sütununu doldur.

### 5. Çeviriyi uygula

```powershell
pwsh -File scripts\dialog_apply.ps1 `
    -JsonPath "build\dialogue_analysis\<asset>.json" `
    -CsvPath "translation\<asset>.csv" `
    -OutJsonPath "build\work\<asset>_tr.json"
```

Çıktı: `Replaced / Unchanged / Missing-in-CSV` raporu. Numerik text'leri atladığımız için Missing-in-CSV > 0 normaldir.

### 6. JSON → .uasset (staging'e)

Staging göreli yolu orijinal oyundaki yolla aynı olmalı:

```powershell
$stagingDir = "build\staging\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues\<proj>\Assets"
New-Item -ItemType Directory -Force -Path $stagingDir | Out-Null
.\tools\UAssetGUI\UAssetGUI.exe fromjson `
    "build\work\<asset>_tr.json" `
    "$stagingDir\<asset>.uasset" `
    tools/Mappings
```

### 7. Mod pak + deploy

StringTable'larla aynı son iki adım: `retoc to-zen` ile pak üret, oyunun `Paks/` klasörüne kopyala (oyun kapalıyken).

## Kapsam

**687 asset / tahmini 50.000–70.000 satır.** Kategori kırılımı:

| Kategori | Asset sayısı |
|---|---|
| Ana story quests (q001–q401) | ~230 |
| Yan görevler (lw_*) | ~180 |
| Encounters / Chats / Hubs | ~60 |
| Default karakterler (DD_*) | 6 |
| Diğer | ~211 |

Örnek satır sayıları:
- `DD_faldzej`: 94
- `DD_ligia`: 98
- `DD_samira`: 136
- `DD_smc_abaurycy`: 134
- `DD_smg_tailor`: 39
- `bzr01_yeller`: 28

## Öncelik sırası (önerilen)

1. **Default_dialogues** (6 asset) — her yerde sık sık çıkar.
2. **Ana story (q001–q401)** — oyunun ana hikâyesi, lineer.
3. **Yan görevler (lw_*)** — opsiyonel içerik.
4. **Encounter / Chat / Fluff** — NPC sokak konuşmaları.

## İlerleme takibi

Bitirilen asset'ler `translation/` altında `.csv` olarak durur; `git log` + `ls translation/` ilerleme göstergesidir.

Kalan asset'lerin tam listesi: `docs/dialog-assets.txt`.
