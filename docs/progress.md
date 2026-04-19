# Çeviri İlerleme Durumu

Bu dosya **tek kanonik ilerleme kaydıdır**. Her yeni çeviri seti sonrası buradaki tablolar güncellenir; CLAUDE.md ve workflow-notes yalnızca özet + bu dosyaya link tutar.

**Son güncelleme:** 2026-04-20 (Readables Phase 3 — 12 POI + POI fluff asseti; 214 entry / ~500 satır — **Readables kategorisi %100 tamam**)

---

## Toplu özet

| Kategori | Çevrilen | Toplam | % | Satır |
|---|---|---|---|---|
| **StringTable (UI)** | 26 | 27 | %96 | ~1539 |
| **Diyalog** | 148 asset | 687 asset | %21.5 | ~3810 |
| **Journal (ana story)** | 25 asset | 91 asset | %27 | ~386 |
| **Journal (LW)** | 14 asset | 14 asset | %100 | ~242 |
| **Journal (POI + Postcard)** | 47 asset | 47 asset | %100 | ~212 |
| **Codex DT** | 5 asset | 5 asset | %100 | ~497 |
| **Readables** | 47 asset | 47 asset | %100 | ~1979 |
| **GENEL** | — | — | — | **~8665 satır** |

**Readables kategorisi %100 tamam** (47/47 asset). Journal + Codex DT + Readables = tüm metin kategorileri tamam.

**Journal kategorisi %100 tamam** (91/91 asset). Codex DT %100 tamam.

Deploy'lu mod pak: `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\pakchunk99-WinGDK_P.*`

---

## StringTable (UI metinleri) — 26/27

| Dosya | Entry | Durum | Notlar |
|---|---|---|---|
| Panels_ST | 186 | ✓ | Menüler, paneller, ayarlar, envanter kategorileri, codex başlıkları |
| Tutorial_ST | 48 | ✓ | Eğitici pop-up açıklamaları |
| TutorialName_ST | 48 | ✓ | Eğitici başlıkları |
| AbilityName_ST | 145 | ✓ | Yetenek isimleri (oyuncu + salutor + düşman + boss) |
| AbilityDescription_ST | 42 | ✓ | Yetenek açıklamaları |
| Map_ST | 169 | ✓ | Lokasyon/oda adları |
| MapDescriptions_ST | 14 | ✓ | Bölge atmosferik tanımları |
| MapPinTypes_ST | 13 | ✓ | Harita pin etiketleri |
| Combat_ST | 170 | ✓ | Savaş UI, boyut isimleri, Rasputin çağrıları |
| CombatLog_ST | 12 | ✓ | Savaş log bildirimleri |
| PopupsTexts_ST | 112 | ✓ | Pop-up, pano, difficulty, mektuplar |
| Flaw_Name_ST | 12 | ✓ | 12 Kusur adları |
| Flaw_CombatDescription_ST | 4 | ✓ | Kusurun savaşta tetiklenme metni |
| Flaw_PanelDescription_ST | 12 | ✓ | Kusur panel efekt metni |
| FlawsPanel_Descriptions_ST | 22 | ✓ | Kusur edebi kökenleri |
| StatusName_ST | 46 | ✓ | Savaş durumları |
| StatusDescription_ST | 49 | ✓ | Durum açıklamaları |
| Progression_EffectName_ST | 32 | ✓ | Yetenek ağacı efekt isimleri |
| Progression_EffectDescription_ST | 14 | ✓ | Yetenek ağacı efekt açıklamaları |
| ImprintsDescription_ST | 72 | ✓ | NPC iz/kişilik etiketleri |
| BarberName_ST | 22 | ✓ | Saç/sakal stil isimleri |
| BarberDescription_ST | 22 | ✓ | Saç/sakal stil açıklamaları |
| Street_Addresses_ST | 33 | ✓ | Sokak adları |
| UnitDataLoreDescription_ST | 16 | ✓ | Salutor/düşman lore |
| Achievements_ST | 116 | ✓ | Steam/Xbox başarımları (58 isim + 58 açıklama) |
| Exploration_ST | 108 | ✓ | Etkileşim, TimeOfDay, InputAction |
| **DebugText_ST** | ? | ✗ | Debug metinleri; oyuncu görmez. Opsiyonel. |

---

## Diyalog — 60/687 asset

### Default karakterler — 6/6 ✓

| Asset | Satır | Karakter |
|---|---|---|
| DD_smg_tailor | 39 | Terzi |
| DD_faldzej | 94 | Fałdżej |
| DD_ligia | 98 | Ligia |
| DD_samira | 136 | Samira |
| DD_smc_abaurycy | 134 | Maurycy |
| DD_wanda | 194 | Wanda |
| **Toplam** | **695** | |

### q001 — Rasputin Köyü prolog — 42/42 ✓

**Assets (ana story) — 28/28 ✓** (602 satır)

| Blok | Asset | Satır | İçerik |
|---|---|---|---|
| 00a–02a | 9 asset | 203 | Tren istasyonu → Rasputin tedavisi → Upyr vizyonu → mezarlığa yolculuk |
| 03a | 1 | 35 | Mezarlıkta Rasputin + köylüler + Bukavac tanısı |
| 04a–c | 3 | 88 | Yanmış ev + Rus askerler + Rasputin salutor teorisi |
| 05a–e | 5 | 42 | Vesna sahneleri (pazar, ev, komşular, sonuç) |
| 06a–b | 2 | 67 | Bilge Kadın (Wasilij lanetinin sırrı) |
| 07a | 1 | 15 | Rasputin ile plan |
| 08a–d | 4 | 57 | Luka yüzleşmesi + Bukavac savaşı + çözüm |
| 09a–c | 3 | 53 | Posta müdürü + Albuquerque yolcusu + epilog |

**Chats (NPC sokak sohbetleri) — 14/14 ✓** (62 satır)

| Asset | Satır | Bağlam |
|---|---|---|
| q001_00_player_chats | 8 | Wiktor iç monologları (mezarlık, yanmış ev) |
| q001_00_postmaster_chats | 2 | Posta müdürü boşta replikleri |
| q001_00_wagoner_chats | 11 | Arabacı boşta replikleri |
| q001_01_tavern_rasputin_teaching_chats | 8 | Rasputin meyhane vaazı |
| q001_01_village_entering_tavern_chats | 5 | Köylü-gardiyan gerginliği |
| q001_03_rasputin_cemetery_chats | 3 | Rasputin mezarlıkta dua |
| q001_04_burned_house_rasputin_chats | 2 | Rasputin yanmış ev |
| q001_05_village_neighbours_chat | 3 | Köylü aksi tavrı |
| q001_05_village_vesna_chats | 2 | Vesna sitem |
| q001_06_village_argument_chats | 8 | Bogdan tartışması |
| q001_06_wise_woman_chat | 3 | Bilge Kadın aksi cevapları |
| q001_07_rasputin_chat | 2 | Rasputin nazik replikleri |
| q001_08_before_confrontantion_chats | 3 | Luka'dan önce köylüler |
| q001_09_traveler_chat | 2 | Albuquerque yolcusu boşta |

### q101 — Babanın cenazesi + vasiyet — 40/40 ✓

**Assets — 24/24 ✓** (567 satır)

| Blok | Asset | Satır | İçerik | Durum |
|---|---|---|---|---|
| 00a–00b | 2 | 50 | Tren yolculuğu, Rasputin gazete | ✓ |
| 01a | 1 | 35 | Çar konuşması, Skałon atanması, Wanda tanışma | ✓ |
| 01b | 1 | 49 | Hücredeki mahkumlar (Varşova gangster argosu) | ✓ |
| 01c–d | 2 | 13 | Gardiyan hücre çıkışı + mahkum sahnesi | ✓ |
| 01e | 1 | 32 | Wanda hücre konuşması, Rotblitz daveti | ✓ |
| 01f | 1 | 34 | Parade — Wanda ayakkabı oyunu | ✓ |
| 01g | 1 | 6 | Polis kayıt | ✓ |
| 01h | 1 | 15 | İşçi çığırtkan | ✓ |
| 01k | 1 | 5 | Wanda kettling sonrası | ✓ |
| 01m | 1 | 29 | Asker çavuşu konuşması | ✓ |
| 02 | 1 | 26 | Mezarlık girişi (Konstancja gazeteci, kavgacı köylüler) | ✓ |
| 02a | 1 | 21 | Ligia ile buluşma | ✓ |
| 02b | 1 | 55 | Babanın mezarı (taziye ilanı + Konieczkin) | ✓ |
| 02c | 1 | 39 | Mezarlıktan ayrılış (Konstancja vs Sędzia, Pietia tanışma) | ✓ |
| 02d | 1 | 9 | Wujek Woronin mozolede tanışma | ✓ |
| 02e | 1 | 7 | Wujek Woronin cenazede konuşma | ✓ |
| 02f | 1 | 13 | Mordechaj Chajat taziye (kalp esprisi) | ✓ |
| 03a | 1 | 20 | Grażyna karşılama | ✓ |
| 03b | 1 | 46 | Vasiyet okuma (Kara Grimuar, Nadia dışlama) | ✓ |
| 03e | 1 | 8 | Noter öncesi sabırsızlık | ✓ |
| 03f | 1 | 48 | Woronin vasiyet öncesi (kehribar likörü) | ✓ |
| 03g | 1 | 7 | Pietia vasiyet sonrası | ✓ |

**Chats — 16/16 ✓** (69 satır)

| Asset | Satır | Bağlam |
|---|---|---|
| q101_00a_parade_observers_chat | 4 | Parade izleyicileri Skałon hakkında |
| q101_00b_newcomers_and_locals_chat | 6 | Yeni gelenler — tramvay/fayton |
| q101_01a_kettling_officers_chat | 2 | Asker çavuşu konuşması |
| q101_01b_kettling_worker_chat | 4 | İşçi direnişi |
| q101_01c_kettling_single_chats | 4 | Kettled insanların yakınması |
| q101_01d_cell_policeman_chat | 3 | Polis tehdidi |
| q101_02_cemetery_entrance_chat | 3 | Mezarlık girişi fanatik |
| q101_02a_cemetery_chats | 9 | Çiçekçi + fotoğrafçı + park kavgası + mezar soyguncu |
| q101_02b_undertaker_chat | 2 | Mezarcı |
| q101_02c_burial_chat | 11 | Cenaze misafirleri dedikodusu |
| q101_02d_mordechaj_and_woronin_chat | 2 | Mordechaj + Wujek seslenişleri |
| q101_03a_about_rain_chat | 2 | Yağmur |
| q101_03b_woronin_bottle_chat | 2 | Wujek şişe sorar — Grażyna |
| q101_03c_burial_guests_chat | 7 | Konuklar Wiktor hakkında |
| q101_03d_ligia_with_notary_chat | 1 | Ligia başlama çağrısı |
| q101_ligia_and_woronin_chat | 7 | Ligia + Wujek özel konuşma |

### q102 — Lelek yakalama — 27/27 ✓ (856 satır)

| Blok | Asset | Satır | İçerik |
|---|---|---|---|
| 00b–d | 3 | 173 | Ligia grimuar hakkında + yatak odası (sigara, Swietłana) + Grażyna mutfak |
| 01a | 1 | 6 | Wiktor'un kaçırılması |
| 02a–d | 4 | 226 | London Bar'da Abaurycy yüzleşmesi + Kazaklar + Lelek ipuçları |
| 03b | 1 | 34 | Kazaklarla sokakta |
| 04a | 1 | 96 | Art Bar — Abaurycy'nin şair yönü, Kusur keşfi |
| 05_a–g | 9 | 184 | Side Bar — Danis + Kazaklar + Rus ruleti + Lelek yakalama |
| 06a | 1 | 53 | Ertesi sabah — Ligia + Abaurycy + borç |
| Chats | 8 | 36 | NPC sokak sohbetleri (Abaurycy bar, bouncer, Kazaklar vb.) |

### Ana story kalan

| Quest | Assets | Chats | Toplam | Açıklama |
|---|---|---|---|---|
| ~~q103~~ | ~~21~~ | ~~12~~ | ~~33~~ | Weles/Hotel Imperialny ✓ tamam |
| q104 | 30 | 30 | 60 | ? (en yoğun blok) |
| q201 | 10 | 14 | 24 | Bölüm 2 başlangıç |
| q201b | 9 | 14 | 23 | q201 varyant |
| q202 | 14 | 7 | 21 | |
| q203 | 16 | 4 | 20 | |
| q301 | 18 | 18 | 36 | Bölüm 3 |
| q302 | 15 | 12 | 27 | |
| q401 | 7 | — | 7 | Bölüm 4 finali |
| **Toplam** | 140 | 111 | **251** | |

### Sq001 — Upyr vizyon sekansları — 0/39 ✗

Wiktor'un Upyr vizyonları (Vis1–Vis6, fluff chat'leriyle birlikte). Story'ye gömülü; q001 ile paralel ilerleyen.

### Yan görevler (Living World) — 0/197 ✗

| Zincir | Asset | Açıklama |
|---|---|---|
| lw_bzr01 | 10 | Bazar Różyckiego |
| lw_cm01 | 17 | Cemetery (mezarlık) |
| lw_grz01 | 14 | Grażyna |
| lw_pp01 | 9 | Powiśle Park |
| lw_pw01 | 11 | Powiśle 1 |
| lw_pw02 | 23 | Powiśle 2 |
| lw_smc01 | 17 | Śródmieście 1 |
| lw_smc02 | 12 | Śródmieście 2 |
| lw_smc03 | 22 | Śródmieście 3 |
| lw_smg02 | 17 | Śródmieście G 2 |
| lw_smg03 | 9 | Śródmieście G 3 |
| lw_smg04 | 28 | Śródmieście G 4 |
| lw_timeSkipScenes | 8 | Zaman atlama sahneleri |
| **Toplam** | **197** | |

### Diğer — 0/85 ✗

| Kategori | Asset | Açıklama |
|---|---|---|
| GenericEncounters | 46 | Rastgele sokak karşılaşmaları |
| LivingWorld | 30 | (lw_* prefix'siz genel LivingWorld) |
| Global_chats | 5 | Global NPC sohbetleri |
| Epilogues | 1 | Finali |
| Marketing | 2 | Trailer/promo |
| GrimoireCharacterNames.uasset | 1 | Karakter isimleri referans |

---

## Diyalog dışı metin asset'leri (2026-04-18 keşfi)

Oyundaki **tüm çevrilebilir metnin** %100'ünü kapsaması için keşfedilen ek asset aileleri. Hepsi dialog asset formatıyla aynı base64 blob + hash+text çiftleri kullanıyor; `scripts/dialog_dump.ps1 -AllRawExports` ve `dialog_apply.ps1 -AllRawExports` ile direkt dump/apply edilebilir.

### Readables — mektuplar, gazeteler, notlar, kitaplar

**47 asset**, `GrimoireContent/Quests/Readables/` altında.
- Alt dizinler: q001–q302, LivingWorld (lw_*), BZR, PP, SMC, SMG
- İçerik: mektuplar (Ligia'dan Wiktor'a), Tyflis'te gazete (Herold Tyfilski), kitap sayfaları, aile mektupları, Proletariatis Brdzola propaganda yazısı
- Örnek q001_readable: 16 satır (1 gazete kapak + 1 gazete makalesi + 4 mektup + 1 not başlığı)
- **Tahmini 700–1200 satır** toplamda

### Journal — görev günlüğü girdileri

**91 asset**, `GrimoireContent/Quests/Journal/` altında.
- Alt dizinler: q001–q401, sq001, lw_*, LW_Tailors, POI + **Codex** (aşağıda)
- İçerik: Wiktor'un birinci tekil ağızdan quest özet cümleleri ("Jestem niemal u celu...", "Rasputin mnie uleczył...")
- **Ölçüldü:** Tümü dump'lı, **1327 satır** toplamda
- Kırılım:
  - Ana story (q001–q302 + sq001): **25 asset / 385 satır**
  - LW quest journals (lw_bzr01 ... lw_smg04 + Tailor): **14 asset / 242 satır**
  - POI journals: **27 asset / 135 satır** (her biri ~5 satır)
  - Postcards (POI kartpostalları): **17 asset / 68 satır** (her biri 4 satır)
  - Codex DataTable (aşağıda): 5 asset / 497 satır
- Source CSV'leri `source/pl/*_journal.csv` + `source/pl/Codex*.csv` + `source/pl/lw_POI_*.csv` altında hazır
- JSON'lar `build/journal_json/` altında (git'e girmez)

### Codex DataTable'ları — aile/frakt/lokasyon/lore/salutor

**5 asset**, `Quests/Journal/Codex/` (Journal'ın alt-klasörü):
- `CodexCharactersDT` — 305 satır (karakter ansiklopedisi)
- `CodexFactionsDT` — 35 satır (hizipler)
- `CodexLocationsDT` — 75 satır (lokasyonlar)
- `CodexLoreDT` — 34 satır (dünya lore)
- `CodexSalutorsDT` — 48 satır (salutor'lar)
- **Toplam: 497 satır** (ölçüldü)
- Wiktor anlatıcı, edebî dilde; StringTable değil — Data Table formatında ama dialog pipeline çalışıyor

### InsightsConclusions (İzler ve Çıkarımlar) — 39 asset

**41 asset toplam** (2'si zaten çevrilmiş ST: ImprintsDescription_ST + FlawsPanel_Descriptions_ST).
- `GrimoireContent/Quests/InsightsConclusions/` altında
- İçerik: Eşya/nesne incelemelerinden çıkan İz metinleri ("Bu kadında Ambicja İzi görüyorum"), Çıkarım açıklamaları
- Örnek IC_bzr01: 13 satır (eşya açıklamaları + İzler + Çıkarımlar)
- **Tahmini 400–600 satır** toplamda

### Vset — ortam NPC mırıltıları

**508 asset**, `GrimoireContent/Quests/Vset/` altında.
- BZR/PP/SMC/SMG/CM lokasyonları için atmosferik NPC replikleri
- Her asset kısa: 2–8 satır (bar müşterisi, tezgâhtar, geçici NPC iç sesleri)
- Örnek bzr_vset_bar_client_f_01: 3 satır ("Spokojnie tu, lubię tu bywać.")
- **Tahmini 1500–4000 satır** toplamda
- Öncelik: düşük (oyun atmosferi, ana akış değil)

### ImprintsDescription_DT — 1 asset

`Quests/InsightsConclusions/ImprintsDescription_DT.uasset` (InsightsConclusions'ın DT varyantı, StringTable'a ek). ImprintsDescription_ST ile eşleşen/tamamlayan metinler olabilir — incelenmeli.

---

## Genel toplam

| Kategori | Asset | Satır | Durum |
|---|---|---|---|
| StringTable | 27 | ~1540 | 26 ✓, 1 kaldı (DebugText) |
| Dialog (ana+chat) | 687 | 50K–70K | 148 ✓ (3810 satır) |
| Readables | 47 | ~700–1200 (tahmini) | ✗ |
| Journal | 86 | **830** (ölçüldü, Codex hariç) | ✗ — source CSV hazır |
| Codex DT | 5 | **497** (ölçüldü) | ✗ — source CSV hazır |
| InsightsConclusions | 39 | ~400–600 (tahmini) | ✗ |
| Vset | 508 | ~1500–4000 (tahmini) | ✗ |
| **Ek toplam** | **~685 asset** | **~5000–9500 satır** | ~10% ölçüldü |

Format uyumlu (dialog pipeline çalışıyor); çeviri aynı araçlarla ilerler.

---

## Öncelik sırası (güncellendi)

**Yüksek öncelik (hikâye ve bilgi):**
1. ~~q001~~ ✓ (42/42)
2. ~~q101~~ ✓ (40/40)
3. ~~q102~~ ✓ (27/27)
4. ~~q103~~ ✓ (33/33)
5. **Journal** (91 asset) — görev başlıkları + günlük — UI'da direkt görülür
6. **Codex DT** (5 asset) — karakter/lokasyon/lore ansiklopedisi
7. **Readables** (47 asset) — mektuplar, gazeteler
8. **q104, q201-q401** — ana story ilerlemesi
9. **InsightsConclusions** (39 asset) — Wiktor'un İz yorumları
10. **sq001** (39 asset) — Upyr vizyonları

**Düşük öncelik:**
11. **lw_*** yan görevler (~197 diyalog) + ilgili Readable/Journal/IC
12. **Vset** (508 asset) — atmosferik NPC mırıltıları
13. **GenericEncounters, Global_chats, Diğer** (~85)
14. **DebugText_ST** — oyuncu görmez

---

## Güncelleme yordamı

Her çeviri seti commit'inden sonra:

1. Bu dosyanın üstündeki "Son güncelleme" tarihini değiştir
2. Toplu özet tablosundaki satır/asset sayısını güncelle
3. İlgili bölüm tablosuna yeni asset satırlarını ekle ✓ ile
4. CLAUDE.md "Proje durumu" özetini güncelle (bu dosyaya link verir)

Manifest referansları:
- `docs/dialog-assets.txt` — 687 dialog asset (statik)
- Readable/Journal/Codex/IC/Vset — `build/audit_content/TheThaumaturge/Content/GrimoireContent/Quests/` altında extract'lı

---

## Review aktivitesi (2026-04-19 akşam-gece)

10 kapsamlı review turu yapıldı; **~28 düzeltme deploy'lu**. Yeni çeviri eklenmedi. Commit zinciri (en yeniden eskiye):

- `6732e27` — q102_03b: "hakkiyle halletiniz" → "hakkıyla hallettiniz" (iki TR yazım hatası)
- `d4a1bc8` — q102_00d: çift negatif çeviri hatası (Grażyna anlamı tam tersine dönmüştü — **kritik**)
- `770776c` — q102_02a: "haltoldu" (birleşik yazım) → "boka sardı"
- `6f51d0b` — q102_00b: "beladırmış" → "belalarıymış" (çoğul iyelik eki eksikti)
- `f580932` — Map_ST + q101_journal: "Berk Rotblit(z)" tutarlılığı (z harfi + fazla 'e')
- `ce7800d` — q101_03b: "rabbimizin" → "Rabbimizin"; q103_readable: Zotiye → Zlotiye (önceki tipo tekrarı); Notes Polonyaca→Lehçe
- `27c8e6a` — q103_02c/04d: gramer + virgül; q103_06c: "Ohrana"/"Ochrana" karışık kullanım (7 yer, replace_all)
- `e60f0ee` — CodexCharactersDT 4 düzeltme: "bitirdi" → "son buldu" (3 yer, geçişli fiil); Polonyacayı→Lehçeyi (glossary); buruklukluk→burukluk; **nâsihi → duayeni** (çeviri hatası — "nâsih"=öğütçü ≠ "Nestorka"=matriark)
- `32141bd` — CodexSalutorsDT: "seçmiyorum" → "seçemiyorum" (ability negatif); q103_04c: "çağırtt"→"çağırt"
- `afc7571` — Hotel Imperialny strateji kararı (Map_ST+Achievements TR→özel isim korumasına uyum); Danis bloğu 20 TR `...` → `…`; q102_readable Zotiye/Doktor/Hakâretin; oklep → dövüş; glossary'ye Hotel Imperialny/Hotel Grand + Komisarz eklendi

**En değerli bulgular (oyuncuya doğrudan görünür):**
1. q102_00d çift negatif — anlam tam tersine dönmüştü
2. Hotel Imperialny UI/diyalog stratejisi birleştirildi
3. `oklep` çevrilmemiş Lehçe argo
4. `nâsihi` yanlış çeviri (matriark ≠ öğütçü)
5. `Ohrana` tutarsızlığı — 7 yer aynı dosyada karışık
6. `Polonyacayı` glossary ihlali (2 yer + 3 Notes)
7. `bitirdi` geçişli fiil hatası (3 yer)
8. Çeşitli yazım hataları: Berk Rotblit(z), haltoldu, Zotiye, Hakâretin, buruklukluk, çağırtt, halletiniz vb.

**Projenin şu anki review durumu:**
- Tüm 27 StringTable ✓, tüm 5 Codex DT (tam) ✓, Exploration_ST ✓
- q001 prolog tamam ✓, q101 01+02+03 ✓, q102 11 asset ✓, q103 11 asset ✓
- 6 Default_dialogues ✓, Readables (ana story) ✓, LW/POI/Postcard/Chat/Journal spot ✓
- Proje geneli yaygın hata patternları (Zotiye, buruklukluk, Hakâret, çağırtt, Polonyaca, Berek, Ohrana, nâsihi, bitirdi, haltoldu vs.) — **hepsi sıfır**

Review detay: `docs/translation-review.md`

**Kalan review (sonraki oturum için):** q102/q103 ~20 asset + q001/q101 Chats derin + LW Readables (varsa çevrilmiş olanlar). Beklenti: turda 0-1 düzeltme, marjinal getiri. Yeni çeviri turu daha yüksek etkili.

---

## Bir sonraki oturum için hazırlık (2026-04-19 gecesi)

**Yapılan (2026-04-18/19):**
- Ana story Journal 25/25 ✓ (386 satır)
- Codex DT 5/5 ✓ (497 satır) — %100
- LW Journal 14/14 ✓ (242 satır) — %100
- POI Journal + Postcards 47/47 ✓ (212 satır) — %100 — **Journal kategorisi tamam**
- Readables 47/47 dump'landı (1989 satır, `source/pl_readables/`)
- Ana story Readables 15/47 ✓ (~811 satır)
- **10 review turu + ~28 düzeltme** (yeni çeviri eklemesi yok)

**Yapılan (2026-04-20 Readables Phase 1):** 8 asset ✓ (~148 satır, 52 entry) — ortam + Tailor + PP + küçük LW:
- `BZR_readables`, `SMC_readables`, `SMG_readables`, `lw_Tailor_Readables`
- `PP_readables`, `PP_readables_chats`
- `lw_pw02_readable`, `lw_smc01_readable_chat`
- Deploy: 2026-04-20 17:01

**Yapılan (2026-04-20 Readables Phase 3):** 12 asset ✓ (~500 satır, 214 entry) — POI + POI fluff — **Readables kategorisi %100 tamam**:
- POI Readables (7): `lw_BZR_POI_Readable`, `lw_GRZ_POI_Readable`, `lw_PP_POI_Readable`, `lw_PW_POI_Readable`, `lw_SMC_POI_Readable`, `lw_SMG_POI_Readable`, `lw_CM_POI_Readable`
- POI fluff (5): `lw_cm_POI_readable_fluff`, `lw_pp_POI_readable_fluff`, `lw_pw_POI_readable_fluff`, `lw_smc_POI_readable_fluff`, `lw_smg_POI_readable_fluff`
- İçerik örnekleri: Bałucki gizemli böcek koleksiyonu, Madame Lulu tarot falcısı, WTA (Cmentarz) dewotka günlükleri, Kazimierz Prószyński sinema kâşifi, Paderewski konseri, Hotel Grand inşaat yazışmaları, Agatha Christie hayran mektubu, antisemit aşırı broşür, Warszawa Filharmonisi, Cyrk Ciniselli, Lady Dragonfly egzotik gösteri, Jan Rocki Liszt jübilesi
- Deploy: 2026-04-20 17:56 (`pakchunk99-WinGDK_P.*`)

**Yapılan (2026-04-20 Readables Phase 2):** 12 asset ✓ (~520 satır, 168 entry) — LW bölge Readables:
- `lw_bzr01_readable`, `lw_cm01_readable`, `lw_grz01_readable`, `lw_pp01_readable`, `lw_pw01_readable`
- `lw_smc01_readable`, `lw_smc02_readable`, `lw_smc03_readable` (en büyüğü, 50 entry — hasta kartları + Lechit manifestosu + Kmicic yeraltı gazetesi + Agatha Christie hayran mektubu)
- `lw_smg01_readables`, `lw_smg02_readable`, `lw_smg03_readables`, `lw_smg04_readables`
- İçerik örnekleri: WTA (VTKC) anti-tılsımkârlık cemiyeti, Uçan Üniversite direnişi, Rybak seri katil, Hotel Imperialny Pietia-Ludwik bahsi, Konstancja Szabłowska sansasyon gazeteciliği, Gabriela Zapolska tiyatro alıntısı, Wokulski parodi evlilik teklifi
- Deploy: 2026-04-20 17:32 (`pakchunk99-WinGDK_P.*`)

**İlk yapılacak çeviri (sıradaki oturum için):**
1. ~~Ana story Journal~~ ✓ / ~~Codex DT~~ ✓ / ~~LW Journal~~ ✓ / ~~POI Journal~~ ✓ / ~~Readables Phase 1/2/3~~ ✓ **Readables %100 tamam**
2. **q104-q401 ana story dialog** (39+ asset) — dump gerekli
3. **sq001 dialog** (39 asset Upyr vizyonları)
4. **InsightsConclusions** (39 asset / ~400-600 satır) — dump gerekli
3. q104-q401 ana story dialog
4. sq001 dialog (39 asset) — Upyr vizyonları
5. InsightsConclusions (39 asset / ~400-600 satır)

**Pipeline (Readables):**
```powershell
# Apply
pwsh scripts/dialog_apply.ps1 `
    -JsonPath build/readables_json/<name>.json `
    -CsvPath translation/<name>.csv `
    -OutJsonPath build/work/<name>_tr.json -AllRawExports

# Stage (yol oyundaki orijinali yansıtır; retoc to-legacy --filter <name> ile doğrula)
.\tools\UAssetGUI\UAssetGUI.exe fromjson `
    build/work/<name>_tr.json `
    build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Readables/<sub>/<name>.uasset `
    Mappings

# Pak + deploy — mevcut mod pak'a ekler
.\tools\retoc\retoc.exe to-zen --version UE5_1 `
    build/staging/TheThaumaturge `
    build/output/pakchunk99-WinGDK_P.utoc
Copy-Item build/output/pakchunk99-WinGDK_P.* `
    "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\" -Force
```

**Readables staging yol haritası:**
- Ana story quest: `Readables/<quest>/Assets/<name>.uasset` (q001-q302)
- Chat varyantları: `Readables/<quest>/Chats/<name>_chat.uasset`
- LW bölge: `Readables/LivingWorld/<lw_key>/Assets/<name>.uasset` veya doğrudan `LivingWorld/<lw_key>/<name>.uasset` (lw_bzr01, lw_smg01-04, lw_Tailors farklı)
- POI: `Readables/LivingWorld/lw_POIs/<bölge>/<name>.uasset`
- Ortam: `Readables/<BZR|PP|SMC|SMG>/Assets/<name>.uasset`
- Yolları her zaman `retoc to-legacy --filter <name>` ile doğrula.

**JSON'lar `build/readables_json/` altında** (47 dosya, git dışı).

**Bootstrap komutları:**
```powershell
# Kalan Readables çevirileri:
ls source/pl_readables/lw_*_readable*.csv     # 14 LW bölge
ls source/pl_readables/lw_*_POI_Readable.csv  # 6 POI
ls source/pl_readables/lw_*_fluff.csv         # 6 POI fluff
ls source/pl_readables/{BZR,PP,SMC,SMG}*.csv  # 5 ortam

# Çeviri şablonu:
# translation/<name>.csv yaz (Hash,NodeName,PL,TR,Notes)
# Sonra apply + stage + deploy döngüsü
```

**Glossary kısa hatırlatma:** Skaza→Kusur, Ślad→İz, Wymiar→Boyut, Pakt→Ant, Szeptucha→Bilge Kadın, Thaumaturg→Tılsımkâr, Cudotwórca→Mucizekâr, lekarz→hekim, rabin→rabbi, Kazak/Kazaklar, Yahudi cemaat terimleri (Chamaił, neszama, hawdala, parnose) PL'den düz aktarıldı.

---

## Eski bootstrap (Journal için — artık tamamlandı, referans)

```powershell
ls source/pl/q*_journal.csv       # 25 dosya
ls source/pl/Codex*.csv           # 5 dosya
ls source/pl/lw_*_journal.csv     # 14 dosya
ls source/pl/lw_POI_*.csv         # 47 dosya (POI + Postcards)
```
