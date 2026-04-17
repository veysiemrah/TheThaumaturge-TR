# İş akışı notları

(Bu dosya Görev 9'da tam `docs/workflow.md`'ye taşınacak.)

## 2026-04-17 — Teknik keşif ve POC tamamlandı ✅

### Doğrulanan pipeline

```
Bir kerelik kurulum:
  UE4SS'i oyun Binaries klasörüne koy → oyunu bir kez çalıştır → Ctrl+Numpad 6 → Mappings.usmap üretilir
  (Mappings dosyasını tools/Mappings.usmap olarak sakla, UE4SS daha sonra kaldırılabilir.)

Rutin akış:
  1. retoc to-legacy --filter "<asset_name>" Paks_dir  build/sample
  2. UAssetGUI tojson <asset>.uasset <asset>.json VER_UE5_1 Mappings
  3. scripts/stringtable_edit.ps1 ile JSON içindeki base64 blob parse edilir, key/value düzenlenir
  4. UAssetGUI fromjson <modified>.json <new>.uasset Mappings
  5. retoc to-zen --version UE5_1 build/staging/TheThaumaturge build/output/pakchunk99-WinGDK_P.utoc
  6. Oyun Paks/ klasörüne kopyala
```

### Oyun mimarisi — KRİTİK BULGU

**Oyunun dil seçimi menü/UI metinlerini değiştirmiyor.** Tüm diller (EN, PL, FR, DE, RU, ES, vb.) aynı StringTable'dan okuyor.

**Doğrulama:** Panels_ST'de `Menu_Quit` değerini "Wyjdź z gry" → "TR TEST" yaptığımızda **hangi dil seçili olursa olsun** ana menüde "TR TEST" görünüyor.

**Anlamı:**
- **UI/menü/başarım/item/yetenek metinleri** → Tek StringTable, tek çeviri, tüm dillerde görünür.
- **Diyalog/alt yazı** → `Seq/en/` ve `Seq/pl/` ayrı asset'ler. Kullanıcı dil seçimine göre biri yüklenir.

Bu yapı çeviri iş hacmini yarıya indiriyor. UI tarafı için **tek bir Türkçe katman** yeterli.

### Mevcut StringTable listesi (27 adet)

`GrimoireContent/UI/Data/StringTables/`:
- Achievements_ST (116 entry)
- AbilityName_ST, AbilityDescription_ST
- BarberName_ST, BarberDescription_ST
- Combat_ST, CombatLog_ST
- DebugText_ST
- Exploration_ST
- Flaw_Name_ST, Flaw_CombatDescription_ST, Flaw_PanelDescription_ST, FlawsPanel_Descriptions_ST
- ImprintsDescription_ST
- Map_ST, MapDescriptions_ST, MapPinTypes_ST
- Panels_ST (186 entry) ← menü başlıkları
- PopupsTexts_ST
- Progression_EffectName_ST, Progression_EffectDescription_ST
- StatusName_ST, StatusDescription_ST, UnitDataLoreDescription_ST
- Street_Addresses_ST
- Tutorial_ST, TutorialName_ST

### Diyalog asset yapısı (ileride ele alınacak)

`GrimoireContent/Quests/Dialogues/<quest_id>/Assets/<scene_GRAPH>/`:
- `Seq/{en,pl}/Lines/Seq-*.uasset` — line metinleri (ayrıştırılmalı)
- `Seq/*.uasset` — kamera/animasyon (dile bağımsız)
- `VO/{en,pl}/VO-*.uasset` — voice over metadata
- `Lipsync/{en,pl}/Lip-*.uasset` — dudak senkronu

İlk sürüm için **Seq/en/Lines** üzerinde Türkçe yazılabilir (oyuncu English dilini seçer, TR alt yazı görür).

### Araçlar — sabit yığın

| Araç | Sürüm | Yol | Görev |
|---|---|---|---|
| retoc | v0.1.5 | `tools/retoc/` | IoStore ↔ Legacy |
| UAssetGUI | v1.0.3 | `tools/UAssetGUI/` | .uasset ↔ .json |
| UnrealLocres | v1.1.1 | `tools/UnrealLocres/` | Yedek (kullanılmıyor) |
| FModel | Dec 2025 | `tools/FModel/` | Görsel denetim |
| Mappings.usmap | UE5.1.1 | `tools/Mappings.usmap` | UAssetGUI tojson için |
| stringtable_edit.ps1 | - | `scripts/` | StringTable data blob düzenleme |
| .NET 10 Runtime | 10.0.6 | sistem | UEExtractor için (artık değil) |
| .NET 8 Desktop Runtime | 8.0 | sistem | UAssetGUI için |

**Artık gerekmeyen:** UEExtractor (non-interactive terminal'de crash). UnrealLocres (.locres yok). UE4SS (usmap alındı — oyun klasöründen kaldırılabilir).

### Sonraki adımlar

1. UE4SS'i oyun Binaries'ten temizle (log hataları yaratıyor, gerek yok).
2. Test mod pak'ını oyundan kaldır ("TR TEST" geri alınsın).
3. Gerçek çeviriye başla — önce küçük bir StringTable (örn. Panels_ST veya Achievements_ST) tamamen çevrilir, glossary oluşur.
4. `pack.ps1` ve `extract.ps1` scriptlerini güncel yaklaşıma göre yaz.
