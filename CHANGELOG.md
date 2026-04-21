# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/) — sürüm: [Semantic Versioning](https://semver.org/) benzeri (`MAJOR.MINOR.PATCH`).

---

## [Yayınlanmamış]

Bir sonraki yayın için birikecek değişiklikler.

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
