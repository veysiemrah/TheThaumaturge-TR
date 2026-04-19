# Çeviri İlerleme Durumu

Bu dosya **tek kanonik ilerleme kaydıdır**. Her yeni çeviri seti sonrası buradaki tablolar güncellenir; CLAUDE.md ve workflow-notes yalnızca özet + bu dosyaya link tutar.

**Son güncelleme:** 2026-04-21 (q201 + q201b Bölüm 2 giriş + Golem katakomb ritüeli tam — 47 asset / ~2064 satır)

---

## Toplu özet

| Kategori | Çevrilen | Toplam | % | Satır |
|---|---|---|---|---|
| **StringTable (UI)** | 26 | 27 | %96 | ~1539 |
| **Diyalog (ana story + Default + Chat)** | 255 asset | 687 asset | %37.1 | ~6962 |
| **Journal (ana story)** | 25 asset | 91 asset | %27 | ~386 |
| **Journal (LW)** | 14 asset | 14 asset | %100 | ~242 |
| **Journal (POI + Postcard)** | 47 asset | 47 asset | %100 | ~212 |
| **Codex DT** | 5 asset | 5 asset | %100 | ~497 |
| **Readables** | 47 asset | 47 asset | %100 | ~1979 |
| **GENEL** | — | — | — | **~11817 satır** |

**%100 tamam:** StringTable %96 (DebugText hariç), Journal (91/91), Codex DT (5/5), Readables (47/47).
Diyalog ana story: Default + q001 + q101 + q102 + q103 + q104 + q201 + q201b ✓ (255/687 asset, %37.1).

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

## Diyalog — 208/687 asset

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

### q104 — Bölüm 1 finali (Praga Limanı + Abaurycy + Swietłana kaçışı) — 60/60 ✓ (~1088 satır)

**Assets (ana story) — 30/30 ✓** (965 satır)

| Blok | Asset | Satır | İçerik |
|---|---|---|---|
| 00a–b | 2 | 109 | Abaurycy işkence + Rasputin Swietłana'yı teslim |
| 01a–f | 6 | 170 | Ring fedaisi + Ariel Rofe + ring + bookmaker + Gordon kardeşler |
| 01g–k | 5 | 115 | Javier = Barszczyk ifşa + Romek + polis/Roman tekne |
| 02a–f | 6 | 161 | Gossiping woman + Ochrana Swietłana + ring dövüşü Wiktor |
| 03a–e | 6 | 139 | Marina (Stanisław vatansever ifşa) + Rofe port + Javier vagon + aldatılmış koca + Karaş ablukası |
| 04a–d | 4 | 62 | Zwi Migdal Golem dersi + smugglers Ochrana + Golem saldırısı + Swietłana ölümü |
| 05a | 1 | 109 | Konieczkin Wanię vurur + Kara Grimuar pazarlığı |
| 06a | 1 | 88 | Rasputin evde — Swietłana'nın sırrı + şantaj teklifi |

**Chats — 30/30 ✓** (123 satır)

Sokak NPC'leri: Swietłana meyhane dumanı, bar entliczek sayması, Abaurycy fedaisi, Javier dedikoduları, Karaş polis devriyeleri, Gordon kardeşler ring kıskançlığı, Rasputin parti selamı, Swietłana hideout, Ariel kaçakçılar, Marina chattie, aldatılmış koca, Golem sonrası kargaşa.

### q201 + q201b — Bölüm 2 girişi + Golem katakomb ritüeli — 47/47 ✓ (~2064 satır)

**q201 Assets — 10/10 ✓** (~1000 satır)

| Asset | Satır | İçerik |
|---|---|---|
| 00a_ligia_talk_at_szulscy | 179 | Ligia-Wiktor ev salonunda Rasputin/Konieczkin/Golem/Swietłana sorgulaması |
| 00b_breakfast_talk | 75 | Ligia-Wiktor kahvaltı, rüya, Konieczkin teklifi, Mirów gitme |
| 00c_entering_the_shop_with_ligia | 31 | Dükkân girişi, mumya/kafatası tozu |
| 00d_synagogue_setup | 63 | Sinagog Rabbi Feldman + işçi çatı tartışması (Yidişçe) |
| 00d_wiktor_dream | 35 | Baba rüyası (Kibir Kusuru, kan laneti) |
| 01a_ligia_talk_at_shop | 323 | Mirów dükkân kapsamlı: Chajat fotoğrafı, Skaza, Uçan Üniversite, pączki oyunu |
| 01b_rabbi_talk_in_synagogue | 72 | Rabbi Feldman + Horowitz + Golem kabala dersi |
| 02a_mordechaj_talk_in_office | 133 | Mordechaj Chajat yüzleşme, Horowitz/Sofer itirafı |
| 02b_catacombs_talk | 159 | Katakomb — Chajat'ın Golem yaratma vizyonu + Rofe önerisi |
| 02f_jewish_goons_talk | 20 | Chajat adamlarıyla sokak çatışması |

**q201 Chats — 14/14 ✓** (~70 satır): Grażyna kahvaltı + Wiktor iç monologlar + dükkân/sinagog/çatı işçi replikleri + Mordechaj/Feldman katakomb mırıldanmaları.

**q201b Assets — 9/9 ✓** (~900 satır)

| Asset | Satır | İçerik |
|---|---|---|
| 01a_policemen_talk | 41 | Rus polis devriyesi, rüşvet denemesi, `<ru>` tag'ler |
| 01b_smugglers_talk | 60 | Kaçakçı ikilisi Ariel için iş, Różyc ipucu |
| 02c_ring_workers | 56 | Ring ""Zindan"" — ""Śródmieście'nin Oğlu"" tanınma + dövüş |
| 03a_ariel_rofe_about_golem | 227 | Ariel Rofe kapsamlı — Berur ritüeli, Skaza pazarlığı, Ligia kararı |
| 03b_bimber_shop_bouncer | 71 | Ogóras fedai + Ariel girişi |
| 04a_catacombs_before_ritual | 129 | Ritüel hazırlık — Ligia getirme, ""funt ciała"" (Shakespeare) |
| 04b_catacombs_ritual | 58 | Kaddish duası, Ariel ihaneti/anlaşma |
| 04c_catacombs_after_ritual | 22 | Ritüel sonrası çatışma (Ariel vs Wiktor) |
| 05a_ligia_in_bed_after_ritual | 175 | Ligia uyanış — Wiktor özür, ""Baban gibisin"" eleştirisi |

**q201b Chats — 14/14 ✓** (~65 satır): Smuggler hideout, ring işçileri, Ariel flat, bazaar, spitting kids, clients, Ligia müşteri sahnesi.

### Ana story kalan

| Quest | Assets | Chats | Toplam | Açıklama |
|---|---|---|---|---|
| q202 | 14 | 7 | 21 | |
| q203 | 16 | 4 | 20 | |
| q301 | 18 | 18 | 36 | Bölüm 3 |
| q302 | 15 | 12 | 27 | |
| q401 | 7 | — | 7 | Bölüm 4 finali |
| **Toplam** | 70 | 41 | **111** | (q104 + q201 + q201b tamamlandı) |

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
| Dialog (ana+chat) | 687 | 50K–70K | **255 ✓ (~6962 satır)** |
| Readables | 47 | 1979 (ölçüldü) | **47 ✓** |
| Journal | 86 | 830 (ölçüldü, Codex hariç) | **86 ✓** |
| Codex DT | 5 | 497 (ölçüldü) | **5 ✓** |
| InsightsConclusions | 39 | ~400–600 (tahmini) | ✗ — henüz dump'lanmadı |
| Vset | 508 | ~1500–4000 (tahmini) | ✗ — düşük öncelik |
| **Deploy'lu toplam** | **403 asset** | **~11817 satır** | StringTable + Journal + Codex + Readables + 255 Dialog |

Format uyumlu (dialog pipeline çalışıyor); çeviri aynı araçlarla ilerler.

---

## Öncelik sırası (güncellendi)

**Yüksek öncelik (hikâye ve bilgi):**
1. ~~q001~~ ✓ (42/42) / ~~q101~~ ✓ (40/40) / ~~q102~~ ✓ (27/27) / ~~q103~~ ✓ (33/33) / ~~q104~~ ✓ (60/60)
2. ~~q201 + q201b~~ ✓ (47/47) — Bölüm 2 giriş + katakomb
3. ~~Journal~~ ✓ (91/91) / ~~Codex DT~~ ✓ (5/5) / ~~Readables~~ ✓ (47/47)
4. **q202 + q203** (41 asset) — Bölüm 2 devamı (sıradaki iş)
5. **q301 + q302** (63 asset) — Bölüm 3
6. **q401** (7 asset) — Bölüm 4 finali
7. **InsightsConclusions** (39 asset) — Wiktor'un İz yorumları (dump gerekli)
8. **sq001** (39 asset) — Upyr vizyonları

**Düşük öncelik:**
9. **lw_*** yan görevler (~197 diyalog) + ilgili Readable/Journal/IC
10. **Vset** (508 asset) — atmosferik NPC mırıltıları
11. **GenericEncounters, Global_chats, Diğer** (~85)
12. **DebugText_ST** — oyuncu görmez

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

## Bir sonraki oturum için hazırlık (2026-04-21)

**Bu oturumda yapılanlar (2026-04-21):** q201 + q201b tam — 47 asset / ~2064 satır (19 Assets + 28 Chats).

**Yeni özel isimler / glossary katkıları:**
- Mordechaj Feldman (Sofer'in yerine geçen rabbi) — yeni rabbi
- Ariel Rofe — gangster-kabalist-tılsımkâr (q104'te de geçmişti, burada derinleştirildi)
- Mordechaj Chajat — babanın eski tezgâhtarı, pralnia sahibi
- Abraham Horowitz — aranan eczacı (ölü)
- Pani Jagoda — fırıncı (çocukluk tanıdığı)
- Synagoga Nożyków — Varşova sinagogu
- Uniwersytet Latający → Uçan Üniversite (tarihsel Polonya gizli kadın eğitimi)
- Bazar Różyckiego kısaltması Różyc
- Berur ritüeli — kabalist ayırma ritüeli (aynen)
- `<yd>emet</>`/`<yd>met</>`/`<yd>L'Chaim</>` Yidişçe kelimeler korundu
- `<yd>kapcan</>`/`<yd>szmondak</>`/`<yd>mecyje</>`/`<yd>puryc</>`/`<yd>geszeft</>` Yidiş argo
- Kaddish duası başı `<yd>Yit-ga-dal v'-yit-ka-dash sh-'meih ra-ba...</>` aynen
- ""funt ciała"" — Shakespeare Venedik Taciri Shylock göndermesi → ""bir libre et"" TR
- ""Satanisław"" klątwa (Satan + Stanisław kelime oyunu — q102 Abaurycy parody'si)
- Altın Ördek (Złota Kaczka) — Varşova efsanesi
- Ochrana, Kierbedź, Marszałkowska (Varşova topografya)
- Ogóras (Salatalık) — fedai lakabı (frengi referansı)

Son deploy: **2026-04-21 22:50** (`pakchunk99-WinGDK_P.*`).

### Sıradaki iş: q202 + q203 (Bölüm 2 devamı, 41 asset)

q202 + q203 Bölüm 2 devamı: büyük olasılıkla Ariel ihanetinin takibi, bir başka büyü/ritüel zinciri, Swietłana akıbeti veya yeni salutor.

**1. Extract + JSON:**
```powershell
# Tüm q202 + q203 asset'lerini extract et:
.\tools\retoc\retoc.exe to-legacy --filter q202 --no-shaders `
    "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks" "build\q202_extract"
.\tools\retoc\retoc.exe to-legacy --filter q203 --no-shaders `
    "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks" "build\q203_extract"
```

**2. Dump (her asset için):**
```powershell
# UAssetGUI tojson:
.\tools\UAssetGUI\UAssetGUI.exe tojson <uasset> build\q201_json\<name>.json VER_UE5_1 Mappings

# Assets için (CinematicNode_*):
pwsh scripts\dialog_dump.ps1 -JsonPath build\q201_json\<name>.json -CsvPath source\pl\<name>.csv

# Chats için (-AllRawExports bayrağı):
pwsh scripts\dialog_dump.ps1 -JsonPath build\q201_json\<name>.json -CsvPath source\pl\<name>.csv -AllRawExports
```

Pratik: q104'teki `tmp_q104_dump.ps1` ve `tmp_q104_dump_chats.ps1` şablonları yeniden kullanılabilir — `q201_extract`/`q201_json` yollarına uyarla.

**3. Translate:** `translation/<name>.csv` yaz — `Hash,NodeName,PL,TR,Notes` (Notes zorunlu, boş olsa bile `,""` veya boş alan).

**4. Apply + Stage:**
```powershell
pwsh scripts\dialog_apply.ps1 -JsonPath build\q201_json\<name>.json `
    -CsvPath translation\<name>.csv -OutJsonPath build\work\<name>_tr.json [`-AllRawExports` for Chats]

.\tools\UAssetGUI\UAssetGUI.exe fromjson build\work\<name>_tr.json `
    build\staging\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues\q201[b]\{Assets,Chats}\<name>.uasset Mappings
```

**5. Pak + deploy:**
```powershell
.\tools\retoc\retoc.exe to-zen --version UE5_1 build\staging\TheThaumaturge build\output\pakchunk99-WinGDK_P.utoc
Copy-Item build\output\pakchunk99-WinGDK_P.* "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\" -Force
```

### Bootstrap komutları (next session başı)

```powershell
# Extract:
.\tools\retoc\retoc.exe to-legacy --filter q201 --no-shaders `
    "C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks" "build\q201_extract"

# Top-level Dialogues uassets say:
(Get-ChildItem build\q201_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues -Recurse -Filter *.uasset |
  Where-Object { $_.DirectoryName -match '(Assets|Chats)$' }).Count
```

q201 sonrası: q202 (21), q203 (20), q301 (36), q302 (27), q401 (7) — toplam 158 asset kaldı (q104 düşülmüş).

### Glossary hatırlatma (q201+ için önemli olanlar)

- Ana karakterler: Wiktor, Ligia, Rasputin, Swietłana, Abaurycy, Javier, Ariel Rofe, Konieczkin, Grażyna, Pietia, Samira, Wujek Woronin, Skałon (genel vali) — aynen.
- Yeni beklenen: Mordechaj Feldman (sinagog), Rabbi (rabin), Golem (Yahudi mistik varlığı — q104'ten).
- Özel terimler: Thaumaturg→Tılsımkâr, Salutor→aynen, Skaza→Kusur, Grymuar→grimuar, Ochrana→aynen, Cytadela→Kale, Lechici→Lehitler, Wisła/Praga/Powiśle/Śródmieście aynen.
- Yidişçe `<yd>...</>`, Rusça `<ru>...</>`, İspanyolca `<sp>...</>`, İngilizce `<i>...</>` dil kodları olduğu gibi korunur.

### Bilinen follow-up (review)

- `q104_03a_marina_quarell` "komitywa" ifadesi: glossary'de `Komitywa → Cemiyet` var; çeviride tırnaklı olarak "komitywa" bırakıldı — ya glossary'ye uyumlanıp "Cemiyet" yapılmalı, ya da glossary'ye "context-dependent quoted term" notu eklenmeli. (Düşük öncelik — review turunda görülecek.)

---

## Eski bootstrap (referans — artık tamamlanmış kategoriler)

```powershell
# Journal (91/91 ✓):
ls source/pl/q*_journal.csv       # 25 dosya
ls source/pl/Codex*.csv           # 5 dosya
ls source/pl/lw_*_journal.csv     # 14 dosya
ls source/pl/lw_POI_*.csv         # 47 dosya

# Readables (47/47 ✓):
ls source/pl_readables/*.csv      # 47 dosya

# q104 dialog (60/60 ✓):
ls source/pl/q104_*.csv           # 60 dosya (30 Asset + 30 Chat)
```
