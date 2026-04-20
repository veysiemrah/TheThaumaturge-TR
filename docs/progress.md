# Çeviri İlerleme Durumu

Bu dosya **tek kanonik ilerleme kaydıdır**. Her yeni çeviri seti sonrası buradaki tablolar güncellenir; CLAUDE.md ve workflow-notes yalnızca özet + bu dosyaya link tutar.

**Son güncelleme:** 2026-04-20 (q401 + sq001 vizyonları + 10 lw_* yan görev (lw_smg04 en büyüğü dahil) — Bölüm 4 finali + Upyr vizyonları + tüm dump'ı çevrilebilir lw_* quest — 14 ana + 71 lw = 85 asset / ~1160 entry)

---

## Toplu özet

| Kategori | Çevrilen | Toplam | % | Satır |
|---|---|---|---|---|
| **StringTable (UI)** | 26 | 27 | %96 | ~1539 |
| **Diyalog (ana story + Default + Chat)** | 444 asset | 687 asset | %64.6 | ~14058 |
| **Journal (ana story)** | 25 asset | 91 asset | %27 | ~386 |
| **Journal (LW)** | 14 asset | 14 asset | %100 | ~242 |
| **Journal (POI + Postcard)** | 47 asset | 47 asset | %100 | ~212 |
| **Codex DT** | 5 asset | 5 asset | %100 | ~497 |
| **Readables** | 47 asset | 47 asset | %100 | ~1979 |
| **GENEL** | — | — | — | **~18913 satır** |

**%100 tamam:** StringTable %96 (DebugText hariç), Journal (91/91), Codex DT (5/5), Readables (47/47).
Diyalog ana story: Default + q001 + q101 + q102 + q103 + q104 + q201 + q201b + q202 + q203 + q301 + q302 + q401 ✓, sq001 visions (7/39 ✓), lw_* 10/12 quest ✓ + lw_smg04 (en büyüğü) ✓ (444/687 asset, %64.6). Kalan lw: lw_grz01 + lw_smg02 (dump boş — inceleme gerek).

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

### q202 + q203 — Bölüm 2 devamı — 41/41 ✓ (~1874 satır)

**q202 Assets — 14/14 ✓** (~1000 satır): 01a_conclusion (14), 02a_ochrana_agents (28), 02c_rotblitz_barman (58), 02d_rotblitz_wanda (64 — Wanda yeniden, Michał tanışma), 03_wanda_visit (58 — Wanda Szulski evi ziyareti), **04_faldzej_secret_meeting (195 — Emir Burnakowicz Tatar fałdżej, cemiyeti yeniden kurma teklifi, Âmentü kutlaması)**, 06_fort_cell_part1/2 (61+59 — Sitadel hücresinde Jan Białek 16y PPS çocuk), 06a_konietchkin_fort (138 — Konieczkin Michał'ı öldürdü, sorgu), 06b_samira_fort (134 — Samira hipnoz kaçış), 06c_fort (32), 06d_escape_part1/2 (15+19), 07_return (21 — Fałdżej evi, Âmentü duası).

**q202 Chats — 7/7 ✓** (~37 satır): Wiktor iç monologları, Berk Rotblitz bar, Wanda ev ziyareti, Sitadel hücre, kaçış Kazaklar, Fałdżej evi.

**q203 Assets — 16/16 ✓** (~775 satır): 00a_maria_at_door (52 — Maria/Magdalena Rasputin'in sevgilileri), 00b_orgy (97 — Rasputin cemaati, Aleksy Romanow/Çareviç hastalığı), 00c_afterparty_part1/2 (9+166 — Rasputin'in mahfili), 00d_hypnosis (2), **00e-h_hypnosis_morana/djinn/golem/krampus** (10+11+11+16 — hipnoz içi salutor karşılaşmaları), 01a_priest (83 — Praga'daki Katolik rahip, Rasputin Petersburg'dan geçmiş), 02a_rasputin_cemetery (180 — mezarlıkta Rasputin vs Wiktor, Romanov sarayı planı), 03a_orthodox_church (62 — Aya Maria Magdalena kilisesi egzorsizm), 04a-c_miracle_part1/2/3 (37+156+22 — Szymek tılsımkâr çocuk, patrik Kirył, Rasputin ""mucize""), 05a_arrest (25 — tutuklama, Ochrana).

**q203 Chats — 4/4 ✓** (~18 satır): orgia, afterparty kahvaltı, kilise rahibi selamı, mucize sırasındaki dualar.

### Ana story kalan

| Quest | Assets | Chats | Toplam | Açıklama |
|---|---|---|---|---|
| q301 | 18 | 18 | 36 | Bölüm 3 |
| q302 | 15 | 12 | 27 | |
| q401 | 7 | — | 7 | Bölüm 4 finali ✓ |
| **Toplam** | 47 | 30 | **77** | (q104 + q201 + q201b + q202 + q203 + q301 + q302 + q401 tamamlandı) |

### Sq001 — Upyr vizyon sekansları — 7/39 (ana story vizyonları ✓)

Wiktor'un Upyr vizyonları (Vis1–Vis6, fluff chat'leriyle birlikte). Story'ye gömülü; q001 ile paralel ilerleyen.

**Çevrilen — 7/39 ✓** (~65 entry):
- `sq001_00_upyr` — Wiktor + Upyr, Powiśle rehinci önü hazırlık sahnesi
- `sq001_01_vision` → `sq001_06_vision` (6 vizyon) — 7. yaş günü Upyr'in ilk belirişi / 10 yaş kilise-stola olayı / Baltık gezisi (Ligia manipülasyon) / 14. yaş günü Ant bağı / Abaurycy'nin babasının dükkânı / Secemin cinayeti

**Kalan — 32 asset ✗:** Chats (Vis1–Vis5 fluff_chat'leri) + GameplayFluffs (Vis1–Vis5 atmosferik).

### Yan görevler (Living World) — 71/189 ✓ (10 quest, lw_smg04 dahil)

| Zincir | Asset | Çevrilebilir | Durum | Açıklama |
|---|---|---|---|---|
| lw_bzr01 | 10 | 2 Chat | ✓ | Bazar Różyckiego — Abaurycy deposu + kavga |
| lw_cm01 | 17 | 6 Chat | ✓ | Powązki çevresi — WTA demagog + anti-vampir satıcı + park fıkra |
| lw_grz01 | 14 | 0 | ✗ | Grażyna — dump boş (metin yok sanıldı, kontrol gerek) |
| lw_pp01 | 9 | 2 Chat | ✓ | Powiśle Park — Rus karşıtı güruh |
| lw_pw01 | 11 | 5 Chat | ✓ | Powiśle 1 — Rybak cinayetleri (ressam + polis + Pielewin) |
| lw_pw02 | 23 | 8 Chat | ✓ | Powiśle 2 — Rybak yakalanıyor (Klara teyze) + fahişeler + çocuklar |
| lw_smc01 | 17 | 6 Chat | ✓ | Śródmieście 1 — Szulski oğlu gazeteci + kız arkadaş + bebek çatışması |
| lw_smc02 | 12 | 3 Chat | ✓ | Śródmieście 2 — bar + gazeteci röportajı |
| lw_smc03 | 22 | 7 Chat | ✓ | Śródmieście 3 — gazeteci + forgery (Yargıç Woronin daktilosu) + Lechit baskın + pastacı |
| lw_smg02 | 17 | 0 | ✗ | Śródmieście G 2 — dump boş (kontrol gerek) |
| lw_smg03 | 9 | 4 Chat | ✓ | Śródmieście G 3 — kumarbaz küfür + Grażynka-Cecylia + telefon |
| lw_smg04 | 28 | 28 (16 Chat + 12 Assets) | ✓ | **Śródmieście G 4** — üniversite baskını + Czesław ihaneti + Rus sokak kavgası + Polina kumarhane + Dickstein kaçış + Cecylia liderlik + Uçan Üniversite kapanış |
| lw_timeSkipScenes | 8 | — | — | Zaman atlama (muhtemelen cutscene tetikleri) |
| **Toplam** | **197** | **71** | — | |

**Deploy'lu lw_* entry sayıları (yaklaşık):**
- lw_pp01: 12 entry, lw_bzr01: 3, lw_smc02: 10, lw_smc01: 23, lw_smg03: 18, lw_pw01: 18, lw_pw02: 42, lw_cm01: 32, lw_smc03: 32, **lw_smg04: 596**
- Toplam ~786 entry deploy'lu + 47 POI fluff (pre-existing) + 14 journal (pre-existing)

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
| Dialog (ana+chat) | 687 | 50K–70K | **296 ✓ (~8836 satır)** |
| Readables | 47 | 1979 (ölçüldü) | **47 ✓** |
| Journal | 86 | 830 (ölçüldü, Codex hariç) | **86 ✓** |
| Codex DT | 5 | 497 (ölçüldü) | **5 ✓** |
| InsightsConclusions | 39 | ~400–600 (tahmini) | ✗ — henüz dump'lanmadı |
| Vset | 508 | ~1500–4000 (tahmini) | ✗ — düşük öncelik |
| **Deploy'lu toplam** | **444 asset** | **~13691 satır** | StringTable + Journal + Codex + Readables + 296 Dialog |

Format uyumlu (dialog pipeline çalışıyor); çeviri aynı araçlarla ilerler.

---

## Öncelik sırası (güncellendi)

**Yüksek öncelik (hikâye ve bilgi):**
1. ~~q001~~ ✓ (42/42) / ~~q101~~ ✓ (40/40) / ~~q102~~ ✓ (27/27) / ~~q103~~ ✓ (33/33) / ~~q104~~ ✓ (60/60)
2. ~~q201 + q201b~~ ✓ (47/47) — Bölüm 2 giriş + katakomb
3. ~~q202 + q203~~ ✓ (41/41) — Bölüm 2 devamı (Rotblitz, Fałdżej, Sitadel, Ortodoks kilise mucizesi)
4. ~~Journal~~ ✓ (91/91) / ~~Codex DT~~ ✓ (5/5) / ~~Readables~~ ✓ (47/47)
5. ~~q301 + q302~~ ✓ (63/63) — Bölüm 3
6. ~~q401~~ ✓ (7/7) — Bölüm 4 finali
7. ~~sq001 ana vizyonlar~~ ✓ (7/39) — Upyr vizyonları (Assets tamam; Chats/GameplayFluffs bekliyor)
8. **InsightsConclusions** (39 asset) — Wiktor'un İz yorumları (dump gerekli; çevrilebilir metin içermez — kapsam dışı doğrulandı)

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

## Bir sonraki oturum için hazırlık (2026-04-20)

**Bu oturumda yapılanlar (2026-04-20 ek):** q302 tam — 27 asset / ~2000 satır (15 Assets + 12 Chats). Bölüm 3 finali / Bölüm 4 girişi: Lazarew daveti + Rasputin son akşam yemeği (Powiśle genelev) + Wiktor baba rüyası (Stanisław vicdan duruşması, Baalberith) + ailecek konuşma (Ligia + Grażynka + amca + babanın muskelesi) + Konieczkin ölümü (Maurycy/Abaurycy onu vuruyor, Niedzic suç ortağı) + son karar (Rasputin vs Cemiyet vs Paris kaçışı) + Çar konuşması bloğu (Lazarew, Maria hamile, Magdalena vaiz; Çar audience, Rasputin yüzleşme). Son deploy: **2026-04-20 04:55**.

**Önceki tur (2026-04-20):** q301 tam — 36 asset / ~2050 satır.

**Önceki tur (2026-04-20):** q202 + q203 tam — 41 asset / ~1874 satır (30 Assets + 11 Chats).

**Yeni özel isimler / glossary katkıları:**
- Emir Burnakowicz, fałdżej — Tatar dilinde ""tılsımkâr""; q001 DD_faldzej karakterinin gerçek adı (q202_04)
- Jan Białek ""Janek"" — 16 yaşından küçük PPS devrimcisi çocuk, Praga'da dedesiyle yaşar (1863 Ocak Ayaklanması gazisi)
- Michał — Wanda'nın koruması; q202 Sitadel sahnesinde öldürülür
- Pankracy — Rotblitz'in pastanedeki kedisi (lakap)
- Sara Rywkin — Samira'nın gerçek adı (q202_06c Sitadel akta)
- Aniela + Lucjan Nadarzyński — Rasputin'in müritleri (Praga dairesi)
- Maria + Magdalena — Rasputin'in sevgilileri/müritleri
- Lazarew — Rus Çarlık subayı, Rasputin müridi
- Szymon ""Szymek"" — küçük tılsımkâr oğlan (Ortodoks kilise mucize sahnesi)
- Kirył — Patrik (Rasputin'in Petersburg'daki eski rakibi)
- Aleksy Romanow — Çareviç (II. Nikolay oğlu, hemofili)
- caryca Aleksandra — Çariçe (Rasputin'in Rus sarayındaki etkisi)
- Cerkiew św. Marii Magdaleny → Aya Maria Magdalena kilisesi (tarihi Praga Ortodoks kilisesi)
- Kaplica Iwerska, Sobór Kazański, Notre-Dame, Sacré-Cœur — Rasputin vizyonu
- Âmentü duası (Türkçe-Müslüman yerleşik formül) — Fałdżej tarafından Michał için okunur (q202_07)
- `<la>Vanitas vanitatum et omnia vanitas</>` — Vaiz 1:2
- `<la>Princeps militiae Caelestis, defende nos in proelio</>` — Başmelek Mikail duası (egzorsizm)
- `<ru>Batyushka</>` = peder (Rus Ortodoks)
- `<ru>Slava Rossii</>`, `<ru>bes</>`, `<ru>Dovol'no</>`, `<ru>Geroy</>` Rusça korundu
- "Kartofelek" → Patatescik (Szymek'in oyuncak ayısı adı)
- Selanikliler 5:7 alıntısı ""Uyuyanlar geceleyin uyurlar…"" (Rasputin'den)
- "Pycha kroczy przed upadkiem" → ""Gurur düşüşün habercisidir"" (atasözü)
- "Niewierny Tomasz" → ""Şüpheci Tomas"" (Aziz Tomas)

Son deploy: **2026-04-20 ~16:19** (`pakchunk99-WinGDK_P.*`) — q401 + sq001 vizyonları + 10 lw_* quest (lw_smg04 dahil).

### Bu tur (2026-04-20): q401 + sq001 vizyonları + 10 lw_* quest ✓ TAMAMLANDI

**Üçüncü tur (lw_smg04 — en büyük LW, ~16:19):** 28 asset / ~596 entry deploy'lu. Bölüm 4 Śródmieście G 4 — Uçan Üniversite baskını:
- `00a_help_request` + `00a_asking_help_chats` — Czesław Wiktor'dan yardım ister (sahte)
- `01a_imprisoned` + `01a_czeslaw_chats` — Hapishane hücresi, sigarayla oyalama
- `01b_interrogation` — Ochrana sorgusu; Wiktor Czesław'ın muhbirliğini deşifre eder, çekiç/kerpeten tehdidi, grimuar bulmaca
- `02a_janitor_entrance` + `02a_janitor_chats` + `03a_janitor_with_russians_chats` — apartman kapıcısı vs. Rus askerler
- `03a_university_leader` — Dickstein'ı uyarma; Viyana'ya kaçma planını tartışma
- `03b_crowd_about_soldiers_chats` + `03c_yelling_at_russians_chats` + `04a_crowd_after_shooting_chats` — Rus-karşıtı güruh, silahlı çatışma
- `04a_young_woman` + `04b_gamblers_quarell` + `05a_polina_with_gamblers_chats` + `05b_gamblers_chats` + `06a_gamblest_after_quarell_chats` — Polina (Rus'lu Uçan Üniversite üyesi) kumarhanede, Wiesław kavgası, ağır Lehçe küfür
- `05a_ligia_with_devotee` + `05e_ligia_alone` + `06b_young_woman_antique_shop` + `08a_ligia_with_cecylia_chats` + `08b_ligia_alone_chats` — Ligia Cecylia'yla, Konieczkin'e (gizli servis amiri) bilgi verdiği itirafı
- `06a_resolve` — Antika dükkânda toplantı; Dickstein veda eder, Cecylia belgelerle yeni lider olur, "Jeszcze uniwersytet nie zginął"
- `07a_dickstein_chats` + `09a_polina_antique_shop_chats` + `09b_university_members_chats` + `09c_antiquarian_chats` + `10a_player_chats` — kapanış sohbetleri

**lw_smg04 yeni terim/argo:**
- `<dl>komedianci</>` → <dl>komedyanlar</> (sahte oyuncular)
- `<dl>łachmyto</>` → <dl>uyuz herif</>
- `<dl>krewna</>` → <dl>batmış</> (kumar argosu: borçlu)
- `<dl>kulturnie</>` → <dl>kültürlüce</> (sarkastik)
- `<dl>chojracz</>` → <dl>Kabadayılık etme</>
- `kacapska sierota` → Rus aşağılaması (keskiden yontulmuş Rus yetimi)
- `ćwoku zapierdziany` → mankafa cibilliyetsiz
- `Dymaj` → koş getir (emir argo)
- `ponyal` (Rusça) → aynen korundu
- `manto` → bir güzel pataklar (argo dayak)
- `strzygi` → strzyga (Slav vampir-kadın figürü, aynen korundu)
- Hamlet / Rosencrantz / Ofelia → edebiyat göndermeleri aynen
- "Jeszcze uniwersytet nie zginął" → Polonya marşına mizahi gönderme korundu
- Samuel Dickstein (başkan), Cecylia Górska, Polina Gawriłow, Wiesław, Lukrecja → aynen
- Plac Zielony → Yeşil Meydan (glossary)

---

### İkinci tur (lw_* küçük yan görevler, ~15:51): 9 quest / 43 asset / ~190 entry ✓

- `lw_bzr01` (2 Chat) — Bazar Różyckiego sokak sahneleri (Abaurycy deposu, kavga)
- `lw_cm01` (6 Chat) — Powązki mezarlığı çevresi, WTA (Antitaumaturg Cemiyeti) demagog + kutsal eşya satıcısı + park sohbeti
- `lw_pp01` (2 Chat) — Powiśle Park, Rus karşıtı güruh + Wiktor iç ses
- `lw_pw01` (5 Chat) — Powiśle 1, Rybak cinayetleri (ressam + polis + Pielewin + cemaat)
- `lw_pw02` (8 Chat) — Powiśle 2, Rybak (Klara teyze) yakalanıyor, fahişeler + çocuklar + bar
- `lw_smc01` (6 Chat) — Śródmieście 1, Szulski oğlu + gazeteci + kız arkadaş + bebek çatışması
- `lw_smc02` (3 Chat) — Śródmieście 2, bar sahneleri + gazeteci röportajı
- `lw_smc03` (7 Chat) — Śródmieście 3, gazeteci + forgery (Yargıç Woronin daktilosu) + girl Jacuś + Lechit baskın + pastacı
- `lw_smg03` (4 Chat) — Śródmieście G 3, kumarbaz küfür + Grażynka-Cecylia tanışma + çığlık + telefon

**Yeni argo/terim kullanımları:**
- aligant → <dl>şıkırdım</> (glossary mevcut, uygulandı)
- łapiduch → <dl>şarlatan</> (yeni — sahte hekim argosu)
- ambaras → <i>dert</> (dönem argo, mesele)
- fircyk → züppe (şık-soytarı)
- cieć → kapıcı (küçümseyen)
- gnat → <i>pompa</> (tabanca argo)
- Rybak → Rybak (özel isim + "Balıkçı" wordplay korundu)
- Wu Esz → Wu Esz (Wiktor Szulski baş harfleri, aynen)
- WTA → WTA (Warsaw Thaumaturg Association — Antitaumaturg)

---

### İlk tur (2026-04-20 ~14:40): q401 + sq001 vizyonları ✓

q401 tam (7 Asset / ~313 entry) + sq001 ana vizyonlar (7 Asset / ~58 entry) deploy'lu. Toplam: **14 Asset / ~371 entry**.

**q401 (7 Asset, Chat YOK)** — Bölüm 4 finali (Paris epilog + alternatif sonlar):
- `q401_01_paris` (21 entry) — Paris'e varış, anne + Jean-Pierre + Ligia ile
- `q401_02a_abaurycy` (73 entry) — Abaurycy ile veda (Paris dalı), Kopciuszek/Cinderella şakası, Aramis/Üç Silahşor göndermesi
- `q401_03a_rasputin` (38 entry) — Rasputin ile veda, Mançurya'ya (güçlü salutor araştırması)
- `q401_03b_tsar` (17 entry) — Çar audience, Wiktor "Krovavyy taumaturg" (Kanlı Tılsımkâr) olarak
- `q401_04a_committee_pps` (42 entry) — Cemiyet + PPS sonu, yeni radikaller (Lechitler)
- `q401_04b_alone` (16 entry) — Yalnız son, Upyr vedası ("rüyanın öte yanında")
- `q401_05_committee` (99 entry) — Cemiyet toplantısı, Skałon'un akıbeti (Tworki tımarhanesi + intihar), yeni faşistler (Lechitler + Antytaumaturgik)

**sq001 vizyonlar (7 Asset, Chat YOK)** — Upyr vizyonları:
- `sq001_00_upyr` (7 entry) — Upyr ana karşılaşma, Powiśle rehinci önü
- `sq001_01_vision` (9 entry) — 7. yaş günü, Upyr'in ilk belirişi
- `sq001_02_vision` (7 entry) — 10 yaş, kilise-stola olayı (Algı'nın ilk tezahürü)
- `sq001_03_vision` (11 entry) — Baltık gezisi, Ligia manipülasyon (İkiz bağı vs. Manipülasyon sorgulama)
- `sq001_04_vision` (7 entry) — 14. yaş günü, grimuar hediyesi, Upyr ile Ant
- `sq001_05_vision` (7 entry) — 15 yaş, Abaurycy'nin babasının dükkânı (Wiktor kibri)
- `sq001_06_vision` (10 entry) — Mieszko Secemin cinayeti, Kibir tetikleyici

**Pipeline:** `scripts/tmp_q401sq001_apply.ps1` → apply + fromjson + staging; `retoc to-zen` → pak üretildi (12.73 MB); Paks/ kopyalandı (oyun kapalıydı).

### Sıradaki iş (2026-04-20 sonrası oturum)

10 lw_* quest (pp01, bzr01, cm01, pw01, pw02, smc01, smc02, smc03, smg03, smg04) deploy'lu. Ana story + sq001 ana vizyonlar + 10 LW + tüm StringTable + Journal + Codex + Readables tamam. Oyuncuya doğrudan görünen hemen her şey Türkçe.

**Seçim (önceliği kullanıcı belirler):**

1. **lw_grz01 + lw_smg02 inceleme** (~31 asset) — dump boş çıktı; neden araştır: ya (a) metin gerçekten yok (sadece VO/trigger), ya (b) farklı dump formatı gerek (`-AllRawExports` olmadan). Her iki klasör altındaki bir uasset örneği manuel JSON'a çevrilip Polish metin aranır.
2. **Kapsamlı review turu** — oyunda oynayıp çevirileri görsel olarak test; özellikle lw_smg04 (ağır argo/küfür) + q401 (duygu yüklü son sahneleri).
3. **GenericEncounters + Global_chats** (~51 asset) — bootstrap yeniden gerek (retoc extract --filter). Rastgele sokak karşılaşmaları.
4. **LivingWorld (lw_ prefix'siz)** (30 asset) — genel LivingWorld diyalogları, aynı şekilde bootstrap.
5. **Vset** (508 asset) — en düşük öncelik, ortam NPC mırıltıları.
6. **DebugText_ST** — oyuncu görmez, opsiyonel.

**Bootstrap komutu (lw_grz01/lw_smg02 inceleme için):**
```powershell
# Bir örnek uasset'i manuel JSON'a çevir + content kontrolü
.\tools\UAssetGUI\UAssetGUI.exe tojson "build\lw_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues\lw_grz01\Assets\lw_grz01_01a_xxx.uasset" "build\probe.json" VER_UE5_1 Mappings
# JSON içinde Polonyaca metin var mı bak (CultureInvariantString veya benzeri)
```

**Bootstrap komutu (GenericEncounters/Global_chats için):**
```powershell
.\tools\retoc\retoc.exe to-legacy --filter "GenericEncounters" --no-shaders "C:\XboxGames\...\Paks" "build\ge_extract"
# veya --filter "Global_chats"
```

### Çeviri kapsamı dışında kalan asset aileleri

- **InsightsConclusions** (39 IC_*.uasset) — **çevrilebilir metin İÇERMEZ**. Salt mantık asset'leri (tag/koşul referansları). Asıl metin zaten çevrilmiş `ImprintsDescription_ST` içinde. **Kategori kapsam-dışı işaretlendi.**
- **lw_*** yan görev diyalogları (~197 asset) — düşük öncelik, dünyanın canlılığı için
- **Vset** (~508 ortam NPC mırıltıları) — düşük öncelik
- **GenericEncounters, LivingWorld, Global_chats** (~85, düşük öncelik)
- **DebugText_ST** — oyuncu görmez, opsiyonel

#### q301 ✓ (TAMAM, 18 Asset + 18 Chat / ~2050 satır) — referans

**q301 (36 asset / ~2019 satır)** — Bölüm 3 komplo ve balo:
- 00a_faldzej_and_samira (110) — giriş
- 01a_rioters (89) + 01b_rofe (113) + 01c_old_woman (62) + 01d_angry_mob (78) — ayaklanma sokak bloğu
- 02_committee_assemble (257) — Cemiyet toplantısı (Fałdżej + Samira + Ariel + Wiktor)
- 03a_park_gate (38) + 03b_faldzej_ball (107) + 03c_siergiej_ball (103) + 03d_samira_ball (65) + 03e_skalon_part1 (128) + 03f_wanda_ball (106) + 03g_guards_hall (11) + 03h_countess_manipulation (9) + 03i_siergiej_zofia (119) + 03j_skalon_part2 (113) — **Skałon'un balosu** (büyük sosyete bloğu)
- 04a_committee_tsar (250) + 04b_tsar_speech_committee (128) — Cemiyet Çar'a karşı plan
- 18 Chats (~75 satır)

**q302 (27 asset / ~1557 satır)** — Bölüm 3 finali / Bölüm 4 girişi:
- 00a_lazarew_invitation (74)
- 01a_rasputin_last_supper (142) — Rasputin son akşam yemeği
- 01b_last_supper_aftermath (3) + 01c_wiktor_dream (234) — Wiktor baba rüyası (büyük)
- 02a_wiktor_wakes_up (18) + 02b_family_talk (111) + 02c_konieczkin_arrival (65) + 02d_konieczkin_death (62) — **Konieczkin'in ölümü** (kritik olay)
- 02e_final_decision (175) + 02f_final_decision_upyr (60) — son karar
- 03a_backgate_talk (32) + 03b_lazarew_talk (134) + 03c_maria_talk (88) + 03d_magdalena_talk (131) + 03e_tsar_speech (242) — **Çar konuşması** (büyük siyasi sahne)
- 12 Chats (~57 satır)

**Pipeline hazır** — sonraki oturum için:
1. `translation\q30*.csv` dosyalarını yaz (Hash,NodeName,PL,TR,Notes)
2. `scripts\tmp_q202_apply.ps1`'i kopyala, `q301`/`q302` yollarına uyarla → `tmp_q301_apply.ps1`
3. `pwsh scripts\tmp_q301_apply.ps1` → tüm apply + fromjson → staging
4. `retoc to-zen` → `pakchunk99-WinGDK_P.*` üret
5. Oyun `Paks\` dizinine kopyala (oyun kapalı olmalı)

**Beklenen yeni karakterler/terimler:**
- Siergiej Skałon (General-Vali'nin oğlu) + Zofia Skałonówna (Entrikacılık Kusuru)
- Countess (Kontes — muhtemelen Lermontowa)
- Skałon baloda (Haset Kusuru)
- Lazarew ve Magdalena genişletilmiş rolleri
- "committee" = Cemiyet (glossary)
- "Tadzik" (q301_01c_old_woman_tadzik_chat — NPC adı)

q301+q302 sonrası: q401 (7 asset) + sq001 (39 asset Upyr vizyonları) + InsightsConclusions (39 asset dump gerekli).

### Glossary hatırlatma (q301+ için önemli olanlar)

- Ana karakterler: Wiktor, Ligia, Rasputin, Konieczkin, Grażyna, Samira (Sara Rywkin), Fałdżej (Emir Burnakowicz), Ariel Rofe, Wanda, Skałon (General-Vali, Haset Kusuru), Zofia Skałonówna (Entrikacılık), Siergiej Skałon, Abaurycy, Ligia — aynen.
- Yeni beklenen: Lazarew (Rus subay, Rasputin müridi), Maria + Magdalena (Rasputin sevgilileri), Aniela + Lucjan Nadarzyński, Aleksy Romanow (Çareviç), Çariçe Aleksandra, Kontes (muhtemelen Lermontowa), Tadzik (q301_01c NPC).
- Cemiyet, Kusur (12 tanesi), Boyut (Yürek/Eylem/Akıl/Söz), Ochrana, Sitadel, Âmentü (Tatar-Müslüman, q202).
- Yidişçe `<yd>...</>`, Rusça `<ru>...</>`, Fransızca `<fr>...</>`, Arapça `<ar>...</>`, Latince `<la>...</>` dil kodları olduğu gibi korunur.

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
