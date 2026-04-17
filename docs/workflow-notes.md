# Geçici iş akışı notları

(Görev 9'da tam `docs/workflow.md`'ye taşınacak.)

## Görev 3-4 keşifleri — 2026-04-17

### Araçlar
- ✅ retoc v0.1.5 — `tools/retoc/retoc.exe` — çalışıyor
- ✅ FModel Dec 2025 — `tools/FModel/FModel.exe` — indirildi, test edilmedi
- ✅ UEExtractor v1.0.7.5 — `tools/UEExtractor/` — `.NET 10` kuruldu ama **non-interactive terminalde crash ediyor** (`Console.CursorVisible` exception). Drag-drop için çalışıyor olabilir ama scriptten kullanılamıyor. Yedek: **UnrealLocres** indirildi ve çalışıyor (ama aşağıdaki bulgu nedeniyle kullanılmayabilir).

### GDK AES şifreleme
**Sonuç: ŞİFRELEME YOK.** retoc paklari anahtar istemeden okuyor. Bu büyük bir rahatlama — Plan B'ye gerek yok.

### Localization format bulgusu (KRİTİK)
Oyun **standart UE `.locres` formatını kullanmıyor**. Bunun yerine:

1. **StringTables** (`*_ST.uasset`) — UI, başarım, yetenek, tutorial metinleri. Yaklaşık 30 StringTable var:
   - `Achievements_ST`, `Tutorial_ST`, `Combat_ST`, `CombatLog_ST`, `Exploration_ST`, `Map_ST`, `MapPinTypes_ST`, `MapDescriptions_ST`, `PopupsTexts_ST`, `Panels_ST`, `Street_Addresses_ST`, `DebugText_ST`
   - `AbilityName_ST`, `AbilityDescription_ST`, `Flaw_Name_ST`, `Flaw_CombatDescription_ST`, `Flaw_PanelDescription_ST`, `Progression_EffectName_ST`, `Progression_EffectDescription_ST`, `StatusName_ST`, `StatusDescription_ST`, `FlawsPanel_Descriptions_ST`, `UnitDataLoreDescription_ST`
   - `BarberName_ST`, `BarberDescription_ST`, `TutorialName_ST`, `ImprintsDescription_ST`

2. **Dialog assetleri** (`GrimoireContent/Quests/Dialogues/.../Seq/{en,pl}/Lines/Seq-*.uasset`) — yaklaşık **30.869 dosya** (pakchunk0: 7.950 + pakchunk1: 22.919). Ancak bu dosyalar inceledikçe **kamera/animasyon verisi** içeriyor, metin değil (DialogueCamera_Base#### gibi). Gerçek diyalog metninin nerede olduğu **hâlâ belirsiz**.

3. **Diller:** Oyun dosyalarında sadece `en/` ve `pl/` klasörleri var. Yani oyun yalnız İngilizce ve Lehçe içeriyor.

4. **Polonya baseline**: Çıkarılan `Achievements_ST` dosyasında Polonya metinleri gömülü ("Bestia z Zakaukazia", "Trele morele" vs.). İngilizce metinlerin nerede/nasıl saklandığı henüz tespit edilemedi — muhtemelen FText'in `SourceString` vs `DisplayString` alanlarında veya başka bir asset'te.

### Orijinal planla çelişen noktalar
- Plan `.locres` tabanlı iş akışı öngörüyordu — geçersiz.
- UEExtractor `--format csv` pipeline'ı — geçersiz (locres yok + tool non-interactive'de crash).
- `UnrealLocres export/import` — geçersiz (locres yok).
- UI çevirisi için "küçük locres dosyasını CSV'ye çevir, TR sütunu doldur, geri yaz" POC — geçersiz (bütün akış yeniden düşünülmeli).

### Pivot gerekçesi
Planın teknik bel kemiği (`.locres` roundtrip) bu oyun için geçerli değil. Yeni yaklaşım gerekli.

## Seçenekler (kullanıcıyla tartışılacak)

### A) Derin R&D devam
`.uasset` formatını tam anlamak için UAssetGUI/UAssetAPI araçlarını kur, FText serialization'ı çöz, custom tooling yaz. Çok zaman alır.

### B) StringTable-sadece kapsam daraltma
Sadece ~30 StringTable'ı çevir (UI, başarım, item, yetenek). Diyalog çevirisi kapsam dışı. Oyun İngilizce diyaloglarla kalır.

### C) Mevcut TR yamayı (Calypso v3) analiz et
Hazır yamanın hangi dosyaları değiştirdiğini gör, aynı yolu kullan. Hazır çalışma modeli var, sadece dosyaları kendi çevirimizle üretelim.

### D) Fool's Theory'ye ulaş
Resmi bir soru — "Türkçe dil desteği eklemek için hangi dosyaları değiştirmeli?" 11 bit studios'un bazen topluluk çevirmenlerine yardımcı olduğu bilinir.
