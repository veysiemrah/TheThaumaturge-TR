# Geçici iş akışı notları

(Görev 9'da tam `docs/workflow.md`'ye taşınacak.)

## 2026-04-17 oturumu — teknik keşif özeti

### Doğrulanan gerçekler

**Oyun dosya yapısı (Xbox GDK sürümü):**
- `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\` altında UE5 IoStore
- `pakchunk0-WinGDK.{pak,ucas,utoc}` — 13 GB (ana içerik, 80.229 chunk)
- `pakchunk1-WinGDK.{pak,ucas,utoc}` — 4.9 GB (ek içerik, 111.074 chunk)
- `*optional-WinGDK.*` — opsiyonel grafik veri
- `global.{ucas,utoc}` — yalnız ScriptObjects

**AES şifreleme:** YOK. retoc anahtarsız okuyor.

**Oyun dilleri:** Yalnız `en/` ve `pl/` (iki dil).

**Metin depolama mimarisi:**
1. **StringTable asset'leri** (`*_ST.uasset`) — UI, başarım, yetenek, tutorial metinleri. ~30 adet:
   - `Achievements_ST`, `Tutorial_ST`, `Combat_ST`, `CombatLog_ST`, `Exploration_ST`
   - `Map_ST`, `MapPinTypes_ST`, `MapDescriptions_ST`, `PopupsTexts_ST`, `Panels_ST`
   - `Street_Addresses_ST`, `DebugText_ST`
   - `AbilityName_ST`, `AbilityDescription_ST`
   - `Flaw_Name_ST`, `Flaw_CombatDescription_ST`, `Flaw_PanelDescription_ST`, `FlawsPanel_Descriptions_ST`
   - `Progression_EffectName_ST`, `Progression_EffectDescription_ST`
   - `StatusName_ST`, `StatusDescription_ST`, `UnitDataLoreDescription_ST`
   - `BarberName_ST`, `BarberDescription_ST`, `TutorialName_ST`, `ImprintsDescription_ST`
2. **DataTable asset'leri** (`*_DT.uasset`, `UI/Data/` altında) — UI metinleri, pop-up'lar, kredi listesi vb.
3. **Dialog asset'leri** — `GrimoireContent/Quests/Dialogues/.../{Seq,VO,Lipsync}/{en,pl}/` altında. Kamera/animasyon verisi; gerçek diyalog metninin saklandığı asıl alan .usmap ile çözülmeden netlemek güç.

**Referans — diğer fan çevirileri (sadece halka açık bilgi):**
- İtalyanca (TurinaR, RPG Italia) — ~138 dosya, 274k kelime
- Ukraynaca (Mapsherua, Nexus Mods) — %100 tam
- Brezilya Portekizcesi, Çin-İng dual subs — mevcut
- **Kapalı dağıtımlar — indirilmeyecek / analiz edilmeyecek** (bkz. proje ilkeleri)

### Araçlar (indirildi, durum)

| Araç | Sürüm | Durum | Kullanım |
|---|---|---|---|
| retoc | v0.1.5 | ✅ çalışıyor | IoStore ↔ Legacy dönüşüm, mod pak üretim |
| FModel | Dec 2025 | ✅ indirildi | Görsel denetim (GUI), yedek |
| UAssetGUI | v1.0.3 | ⚠️ .usmap gerekiyor | `tojson`/`fromjson` CLI, asıl düzenleme aracı |
| UEExtractor | v1.0.7.5 | ❌ terpedo | Non-interactive terminal crash (`Console.CursorVisible`), proje dışına çıkarılabilir |
| UnrealLocres | v1.1.1 | ❌ locres yok, uygulanamaz | Proje dışına |
| .NET 10 Runtime | 10.0.6 | ✅ kuruldu | UEExtractor için |
| .NET 8 Desktop Runtime | 8.0 | ✅ kuruldu | UAssetGUI için |

### Tanımlanan asıl eksik

UE5 "unversioned" asset'lerini düzgün okumak için **`.usmap` mappings dosyası** gerekli. UE4SS ile oyun çalışırken DLL inject edilerek bir kerelik üretilir.

### Planlanan iş akışı (revize)

```
Bir kerelik kurulum:
  UE4SS indir → Binaries/WinGDK/ içine → oyun bir kez çalıştır → Mappings.usmap al

Rutin akış:
  1. retoc to-legacy <paks-dir> <legacy-out>  (hedef asset'leri seçerek filter ile)
  2. UAssetGUI tojson <asset>.uasset <asset>.json VER_UE5_X Mappings
  3. JSON'da String alanlarını Türkçeyle değiştir
  4. UAssetGUI fromjson <asset>.json <asset>.uasset Mappings
  5. retoc to-zen <modified-dir> <mod-pak-out>
  6. Mod pak'ı <paks> klasörüne bırak → test
```

### Sonraki adım (bir sonraki oturum)

1. UE4SS'in en güncel sürümünü indir (`tools/UE4SS/`).
2. Oyun Binaries klasörüne kopyala.
3. Oyunu bir kez çalıştır (ana menü yeter), `Mappings.usmap` üretilir.
4. Mappings.usmap'i `tools/UE4SS/` klasörünün içinde referans olarak tut.
5. Test: UAssetGUI ile `Achievements_ST.uasset`'i JSON'a çevir — başarıyla parse edilmeli.
6. JSON'da birkaç başarım adını Türkçe yap, geri .uasset'e çevir, mod pakla, oyuna enjekte et, Ayarlar/Başarımlar menüsünde Türkçe görünüyor mu kontrol et.

Bu başarılı olursa gerçek çeviri iş akışı başlar (UI StringTable'larından).
