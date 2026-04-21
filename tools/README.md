# Araçlar

Bu klasör `.gitignore`'dadır. Her katkıcı kendi yerel ortamına aşağıdaki araçları indirmelidir.

## retoc (zorunlu)

IoStore formatı (`.ucas`/`.utoc`) ile klasik PAK arasında dönüşüm; mod pak üretimi.

- Kaynak: https://github.com/trumank/retoc/releases
- Sürüm: En güncel (aktif bakımlı)
- Konum: `tools/retoc/retoc.exe`

Kullanım özeti:

```powershell
# Oyun dosyalarından extract
.\tools\retoc\retoc.exe to-legacy --filter "QuestName" --no-shaders "C:\XboxGames\...\Paks" "build\work"

# Mod pak üretimi
.\tools\retoc\retoc.exe to-zen --version UE5_1 "build\staging\TheThaumaturge" "build\output\pakchunk99-WinGDK_P.utoc"
```

## UAssetGUI (zorunlu)

`.uasset` ↔ `.json` dönüşümü; Unreal Engine 5.1.1 varlık dosyalarını düzenlenebilir JSON'a çevirir.

- Kaynak: https://github.com/atenfyr/UAssetGUI/releases
- Sürüm: En güncel UE5 desteğiyle
- Konum: `tools/UAssetGUI/UAssetGUI.exe`
- Mappings: `tools/UAssetGUI/Mappings.usmap` (UE 5.1.1 reflection data — repoda yok, ayrıca temin edilir)

Kullanım özeti:

```powershell
# .uasset → .json
.\tools\UAssetGUI\UAssetGUI.exe tojson "input.uasset" "output.json" VER_UE5_1 Mappings

# .json → .uasset
.\tools\UAssetGUI\UAssetGUI.exe fromjson "input_tr.json" "output.uasset" Mappings
```

## Mappings.usmap

UE 5.1.1 reflection verisi. UAssetGUI'nin doğru type bilgisiyle parse edebilmesi için gerekli.

- The Thaumaturge'e özel: FModel veya UEExtractor ile oyun dosyalarından üretilir.
- Konum: `tools/Mappings.usmap` (yedek kopya) veya `tools/UAssetGUI/Mappings.usmap`

## FModel (opsiyonel — keşif ve denetim için)

Unreal Engine dosya gezgini. Hangi asset'lerin nerede olduğunu bulmak için kullanılır.

- Kaynak: https://github.com/4sval/FModel/releases
- Konum: `tools/FModel/FModel.exe`

## Ön koşul: PowerShell 7+

Tüm scriptler PowerShell 7 (pwsh) gerektirir.

```powershell
winget install Microsoft.PowerShell
```
