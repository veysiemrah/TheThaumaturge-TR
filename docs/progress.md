# Çeviri İlerleme Durumu

Bu dosya **tek kanonik ilerleme kaydıdır**. Her yeni çeviri seti sonrası buradaki tablolar güncellenir; CLAUDE.md ve workflow-notes yalnızca özet + bu dosyaya link tutar.

**Son güncelleme:** 2026-04-18 (q103)

---

## Toplu özet

| Kategori | Çevrilen | Toplam | % | Satır |
|---|---|---|---|---|
| **StringTable (UI)** | 26 | 27 | %96 | ~1539 |
| **Diyalog** | 148 asset | 687 asset | %21.5 | ~3810 |
| **GENEL** | — | — | — | **~5349 satır** |

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

## Öncelik sırası

1. **q001** ✓ tamam (42/42)
2. **q101** ✓ tamam (40/40)
3. **q102** ✓ tamam (27/27)
4. **q103** ✓ tamam (33/33)
5. **q104, q201-q401** — ana story ilerlemesi
6. **sq001** (39 asset) — Upyr vizyon sekansları
7. **lw_*** yan görevler (~197) — opsiyonel, en geç
8. **Encounters, Global_chats, Diğer** — en geç
9. **DebugText_ST** — opsiyonel, oyuncu görmez

---

## Güncelleme yordamı

Her çeviri seti commit'inden sonra:

1. Bu dosyanın üstündeki "Son güncelleme" tarihini değiştir
2. Toplu özet tablosundaki satır/asset sayısını güncelle
3. İlgili bölüm tablosuna yeni asset satırlarını ekle ✓ ile
4. CLAUDE.md "Proje durumu" özetini güncelle (bu dosyaya link verir)

Manifest referansı: `docs/dialog-assets.txt` (687 asset, statik).
