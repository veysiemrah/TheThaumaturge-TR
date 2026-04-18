# Çeviri İlerleme Durumu

Bu dosya **tek kanonik ilerleme kaydıdır**. Her yeni çeviri seti sonrası buradaki tablolar güncellenir; CLAUDE.md ve workflow-notes yalnızca özet + bu dosyaya link tutar.

**Son güncelleme:** 2026-04-18 (ana story Journal 25/25 ✓)

---

## Toplu özet

| Kategori | Çevrilen | Toplam | % | Satır |
|---|---|---|---|---|
| **StringTable (UI)** | 26 | 27 | %96 | ~1539 |
| **Diyalog** | 148 asset | 687 asset | %21.5 | ~3810 |
| **Journal (ana story)** | 25 asset | 91 asset | %27 | ~386 |
| **Journal (LW)** | 14 asset | 14 asset | %100 | ~242 |
| **Codex DT** | 5 asset | 5 asset | %100 | ~497 |
| **GENEL** | — | — | — | **~6474 satır** |

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

## Bir sonraki oturum için hazırlık (2026-04-18 akşamı)

**Yapılmış keşif:**
- Journal 91 asset tamamen dump'lı, `source/pl/` altında 91 CSV hazır
- JSON'lar `build/journal_json/` altında (git dışı ama lokal var)
- Toplam 1327 satır ölçüldü

**Yapılan:**
- Ana story Journal 25/25 ✓ (386 satır, 2026-04-18)
- Codex DT 5/5 ✓ (497 satır, 2026-04-19)
- LW Journal 14/14 ✓ (242 satır, 2026-04-19)

**İlk yapılacak çeviri (öncelik sırasıyla):**
1. ~~Ana story Journal (25 asset / 385 satır)~~ ✓ TAMAM
2. ~~Codex DataTable (5 asset / 497 satır)~~ ✓ TAMAM
3. ~~LW Journal (14 asset / 242 satır)~~ ✓ TAMAM
4. POI Journal + Postcards (44 asset / 203 satır)

**Pipeline:** Her journal için `translation/<name>.csv` yaz (Hash,NodeName,PL,TR,Notes); sonra `dialog_apply -AllRawExports` → `UAssetGUI fromjson` → staging/journal altına. `retoc to-zen` ile mevcut mod pak'a ekle.

**Kritik not:** Journal dosyaları `Quests/Journal/<quest>/<name>.uasset` yolunda. Staging yolu orijinali koruyacak. Codex DT'ler `Quests/Journal/Codex/` altında.

**Bootstrap için:**
```powershell
# Ana story journal'dan başlamak istersen:
ls source/pl/q*_journal.csv       # 25 dosya
ls source/pl/Codex*.csv           # 5 dosya
ls source/pl/lw_*_journal.csv     # 14 dosya
ls source/pl/lw_POI_*.csv         # 47 dosya (POI + Postcards)
```
