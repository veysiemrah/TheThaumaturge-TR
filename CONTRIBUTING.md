# Katkı Rehberi

## Hata bildirimi ve öneri

Çeviri hatası, yazım yanlışı veya eksik metin fark ettiyseniz [Issues](../../issues) açın. Lütfen şunu belirtin:

- Oyunda tam olarak ne göründüğü (Türkçe metin)
- Doğru Türkçe karşılığı öneriniz
- Mümkünse ekran görüntüsü

## Çeviri düzeltmesi (Pull Request)

1. Repoyu fork edin ve klonlayın.
2. Düzeltmek istediğiniz dosyayı `translation/` altında bulun.
3. Değişikliği yapın — önce mutlaka şunları okuyun:
   - `docs/glossary.md` — oyun terimleri sözlüğü (zorunlu)
   - `docs/style-guide.md` — hitap biçimi, noktalama, dönem tını kuralları
4. `scripts/validate_csv_columns.ps1 -CsvPath translation/DOSYA.csv` ile CSV bütünlüğünü doğrulayın.
5. `scripts/validate_tag_balance.ps1 -CsvPath translation/DOSYA.csv` ile tag eşitliğini kontrol edin.
6. PR açın; açıklamada hangi satırı ve neden değiştirdiğinizi belirtin.

### CSV formatı

```
"Hash","NodeName","PL","TR","Notes"
```

- `Hash` ve `NodeName` değiştirilmez.
- `PL` sütunu orijinal Lehçe metin — değiştirilmez.
- `TR` sütunu düzenlediğiniz alan.
- `Notes` isteğe bağlı açıklama (argo, bağlam, tercih gerekçesi).

### Korunması gerekenler

- `<tag>...</>`, `<br>`, `<i>`, `<dl>`, `<ru>`, `<fr>`, `<la>` placeholder'ları — silinmez, yerleri değişmez.
- `{int}`, `{string}`, `%s`, `[FOCUS]`, `[HP]` gibi değişkenler aynen korunur.
- Özel isimler çevrilmez: Wiktor, Rasputin, Ligia, Abaurycy, vb.
- Yerleşik Türkçesi olan yer adları kullanılır: Warszawa → Varşova.

## Geliştirici ortamı

Çevirileri sıfırdan derlemek için:

### Araçlar

`tools/README.md`'deki araçları indirin: **retoc** ve **UAssetGUI** (zorunlu).

### Pipeline özeti

```powershell
# 1. Oyun dosyalarından extract (bir kez yeterli)
.\tools\retoc\retoc.exe to-legacy --filter "QuestName" --no-shaders `
  "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks" "build\work"

# 2. .uasset → .json
.\tools\UAssetGUI\UAssetGUI.exe tojson "build\work\NAME.uasset" "build\work\NAME.json" VER_UE5_1 Mappings

# 3. Kaynak CSV oluştur (ilk kez)
.\scripts\dialog_dump.ps1 -JsonPath "build\work\NAME.json" -CsvPath "source\pl\NAME.csv"

# 4. translation\NAME.csv'yi düzenle

# 5. CSV'yi JSON'a uygula
.\scripts\dialog_apply.ps1 -JsonPath "build\work\NAME.json" -CsvPath "translation\NAME.csv" -OutJsonPath "build\work\NAME_tr.json"

# 6. .json → .uasset
.\tools\UAssetGUI\UAssetGUI.exe fromjson "build\work\NAME_tr.json" "build\staging\...\NAME.uasset" Mappings

# 7. Mod pak üret
.\tools\retoc\retoc.exe to-zen --version UE5_1 "build\staging\TheThaumaturge" "build\output\pakchunk99-WinGDK_P.utoc"
```

StringTable dosyaları için `dialog_dump/apply` yerine `stringtable_dump/apply` kullanılır.

Ayrıntılı açıklama: `docs/workflow-notes.md`

## Kapsam dışı

- Ses/dublaj değişiklikleri bu projenin kapsamı dışındadır.
- Başka dil yamalarının (Calypso TR vb.) kapalı kaynak dağıtımları analiz edilmez.
