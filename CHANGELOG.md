# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/) — sürüm: [Semantic Versioning](https://semver.org/) benzeri (`MAJOR.MINOR.PATCH`).

---

## [Yayınlanmamış]

Bir sonraki yayın için birikecek değişiklikler.

---

## [0.10.0] — 2026-04-26

Büyük sıçrama: **Vset (ortam NPC mırıltıları) kategorisi %63 → %99 (252 → 394 asset)**. 12 bölgeye yayılan ortam NPC fısıltıları artık tamamen Türkçe — sokak satıcıları, dilenciler, fahişeler, polisler, denizciler, balıkçılar, dok işçileri, salonda dans eden zenginler, fabrikadaki işçiler. Toplam yaklaşık 22.931 satır metin Türkçedir.

### Eklendi

**Vset (304 yeni asset / ~1.130 satır)** — kategori %99:

- **DS Skałon balosu** (37 asset) — courtlady/diplomat/rich_citizen/rich_russian/soldier/waiter; q301 baloyla bağlantılı (Çar audience çevresi)
- **PRL q001 Rasputin köyü** (18 asset) — köylü kadın/erkek (kış/hasat/"licho"=cin), meyhane patron (siwuszka), askerler (firari, Viyana), tradeswoman (firarilerle takas), çocuk halk şarkısı "Hu-hu-ha"
- **GRZ Mirów Yahudi semti** (35 asset) — Yidişçe `<yd>...</>` korunarak: berber, dilenci (akwawita kâbusu), inananlar (Sofer/Feldman/szacharit/mincha/ma'ariw — Nożyk sinagogu), commoner (Yidiş atasözleri), goon (Mojki gösterişi/Loch boks salonu), tüccarlar (Łokszyny/Kreplech/Cymesik/challah)
- **PR Praga (cerkiew + hastane)** (37 asset) — q202 ortodoks kilisesi mucizesi + Ujazdowski hastanesi: Ojczulek pederim, "<dl>cichodajka</> ladacznicę" söylenti, "<i>hameryka</>", <dl>doliniarz</> yankesici, kolera/tifüs/histeri vakaları, askerler nöbet
- **SMG Smolna semti** (38 asset) — q102 + lw_smg01 paralel: butik müşterileri (Klimkiewicz Avrupa malları), priest m_01 sempatik / m_02 sert, gizli üniversite öğrencileri (Dickstein/Skłodowska/Prus/Freud), hizmetkârlar, kokain "Koka", Smolna terzisi (21 satır küfürlü argo)
- **PW Powiśle bohem semt** (51 asset) — q201 polis seri katil bölgesi: dilenciler, balıkçılar, goon_child fabrika çocukları, Mietek Koniokrad kabadayı, "<dl>klawisz</>" gardiyan göndermeleri, Sobieski cahili, fahişeler (Ciotka Jadzia + Patrycja işi + Karın Deşen Jack imali + Mojki çetesi), ring_commoner boks tribün küfürü
- **PP Praga liman/bohem** (44 asset) — q104 Krampus + Wiktor finali: berber, abartılı kabadayı "ja tu jestem królem", balık adı serisi, "ankohol na angielki" İngiliz votkası, dock_worker "<dl>cewilizacja</>" yanlış telaffuz, Rus polisi <ru>Blyat/Polyaki</>, denizkızı doğumlu fahişe, Fransız <fr>Marseillaise</>, Latający Holender
- **SMC Śródmieście kent merkezi** (44 asset) — q201/q202/q203 ana hikâye: Londyński Bar, "<dl>Faytoncular</> kazıkçı", Mojki''ye borç + Imperial önü taciz, kıskanç koca "<dl>ressamı</> obiję", Skałonówna baloya geliyor (q302 çapraz), borsa krizi/altın yatırım, <i>Wyklęty powstań</> Internationale alıntısı
- **q104 quest-spesifik** (3 asset) — Ariel Rofe (Yidiş), Javier (İspanyolca), Oksana (Rusça) yabancı dil mırıltısı

**Diyalog ek (5 asset)** — global_chats + lw ek + Mojki çetesi sahneleri. 555/687 (%80.8).

### Düzeltildi

**18 review turu / 846 düzeltme** (10 önceki + 8 bu sürümde):
- Pakt → Ant (q301 yemin sahnesi), Ohrana → Ochrana, Doktor → Hekim, konował → şarlatan
- TR sütun toplu `...` → `…` (165 dosya, scripts/fix_tr_triple_dots.ps1)
- Naczelnik → Amir/amir bey, Çar konuşması çift olumsuz düzeltme, Cytadela → Sitadel tutarsızlık
- Mikołaj Çar adı + Rzeczpospolita özel ad tutarlılığı

**Glossary kararları**: q104 yabancı dil koruma kuralı (`<i>Muy bien</>`/`<ru>moya golova</>`/`<fr>Marseillaise</>` aynen), `<dl>` argo etiketleri (klawisz → gardiyan, gliny/glina → aynasız, kapuś → muhbir, fart → şans, wersal → saray, Mojki çetesi adı korundu, Cytadela → Sitadel).

### Proje durumu (v0.10.0)

- UI / StringTable: 26/27 (%96)
- Diyalog: **555/687 asset** (%80.8)
- **Vset: 394/398 asset (%99)** — yeni
- Journal: 91/91 (%100)
- Codex DT: 5/5 (%100)
- Readables: 47/47 (%100)
- Toplam: **~22.931 satır**
- Deploy: `pakchunk99-WinGDK_P.ucas` 15.46 MB

---

## [0.9.1] — 2026-04-23

Beta içeriğine ekleme: GenericEncounters kategorisi %100 kapandı, LivingWorld kategorisi eklendi. Toplam 44 diyalog asset / ~910 satır.

### Eklendi

**GenericEncounters kalan (14 asset / ~250 satır)** — kategori %100:
- Warsaw Mojek çetesi Wiktor'u "kafadar" diye ileri sürüyor (SMC 07)
- Aktris Olena Dąb-Zakrzewska ve Rumiancewa soirée (SMG 01)
- Tabutçu + mezar soyucuları, "meşe palto" argosu (SMG 02)
- Wiktor malikânesine gece baskını (SMG 03)
- Proleter kaldırım işçileri, Enternasyonal marşı, "yntelygenta" alayı (SMG 04)
- "Beyaz" Roman Tempermantların Kralı tekrar meydan okuyor (SMG 05)
- Faytoncu'ya sıkıyönetim haraçı, Rus askerleri + Sitadel tehdidi (SMG 06)

**LivingWorld (30 asset / ~660 satır)** — yeni kategori:
- 3 şehir berberi (Powązki / Grażyna / Powiśle) — aksan ve bölge argosu varyantları
- lw_smg01 Uçan Üniversite baskını (15 main + 12 chat):
  - Bayan Jagoda pastanesi, nostaljik karşılaşma
  - Antika dükkânında Samuel Dickstein ile tanışma, çalınan <i>Stara Baśń</>
  - Cecylia'nın entrikası, Waldemar + Lukrecja, Polina Gawriłow (Rus üye)
  - Ligia'nın kadın meselesi dersi, Skłodowska-Curie, Fleet Street göndermesi

**Kayda değer çeviri kararları**: ~25 yeni argo/terim kararı (`aligant → şıkırdım`, `klawo → süper`, `gliny → aynasız`, `fest kamrat → ta kafadar`, `dębowa jesionka → meşe palto`, Enternasyonal marşı Türkçe dizeleri vs). Detay: `docs/progress.md`.

### Proje durumu (v0.9.1)

- Diyalog: **550/687 asset** (%80.1) — GenericEncounters 45/45, LivingWorld 30/30 ✓
- Toplam: **~21 406 satır**
- Deploy: `pakchunk99-WinGDK_P.ucas` ~15 MB

---

## [0.9.0] — 2026-04-21

İlk kamuya açık beta sürüm. Ana hikâye, tüm UI, codex, journal ve readables Türkçe.

### Eklendi

**Diyalog (~15.641 satır, 506/687 asset)**

- Default karakterler: Wanda, Samira, Ligia, Abaurycy, Fałdżej, Terzi (6 asset)
- Bölüm 1 (q001): Rasputin köyü prologu — 42 asset
- Bölüm 1-2 geçiş (q101): Varşova varışı, otel, Praga — 15 asset
- Bölüm 2 (q102): Sitadel, Ochrana, Abaurycy'nin fabrikası — 16 asset
- Bölüm 2 (q103): Grażyna, grimuar, Wiktor'un geçmişi — 16 asset
- Bölüm 2-3 geçiş (q104): Powiśle katili Rybak araştırması — 15 asset
- Bölüm 3 (q201/q201b): Rasputin ayin ve Ligia sahneleri — 24 asset
- Bölüm 3 (q202): Sitadel akta, Michał ölümü, Sara Rywkin — 25 asset
- Bölüm 3 (q203): Praga mahkemesi, Rotblitz pastanesi — 16 asset
- Bölüm 3 finali (q301): Pakt + Skałon balosu + Çar audience — 36 asset
- Bölüm 3-4 geçiş (q302): Rasputin son akşam, Konieczkin ölümü — 27 asset
- Bölüm 4 finali (q401): Paris ve alternatif sonlar — 7 asset
- Upyr yan hikâyesi (sq001): 7 ana vizyon — 7 asset
- LW yan görevler (12 quest): Bazar, Powązki, Powiśle, Śródmieście, Grażyna bazar, Uçan Üniversite — 255 asset
- GenericEncounters (sokak karşılaşmaları): 9 lokasyon — 31 asset

**UI / StringTable (~1.539 entry, 26/27)**

Paneller, harita, savaş, yetenekler, kusurlar (Skaza), durumlar, başarımlar, keşif, NPC iz etiketleri, berber, sokak adresleri, salutor/düşman lore.

**Journal (91/91 asset, ~1.337 satır)**

Ana hikâye + LW bölge notları + POI/kart yazıları + Codex DT.

**Readables (47/47 asset, ~1.979 satır)**

Mektuplar, gazeteler, kitaplar, belgeler — tüm okunabilir içerik.

**Araçlar ve scriptler**

- `scripts/dialog_dump.ps1` — dialog graph JSON'undan kaynak CSV üretimi
- `scripts/dialog_apply.ps1` — CSV çevirilerini JSON'a uygulama
- `scripts/stringtable_dump.ps1` / `stringtable_apply.ps1` / `stringtable_edit.ps1`
- `scripts/validate_csv_columns.ps1` — CSV bütünlük denetimi
- `scripts/validate_tag_balance.ps1` — PL/TR tag eşitlik denetimi
- `scripts/find_tr_triple_dots.ps1` — üç nokta ihlali taraması
- `scripts/find_duplicate_uassets.ps1` — duplikat asset tespiti

### Kalan (bir sonraki sürüm için)

- LivingWorld (lw_ prefix'siz) ~30 asset
- Global_chats ~24 asset
- GenericEncounters kalan: smc_07, smg_01-06
- DebugText_ST (oyuncu görmez, opsiyonel)
