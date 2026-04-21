# The Thaumaturge Türkçe Yama

[![Son Sürüm](https://img.shields.io/github/v/release/veysiemrah/TheThaumaturge-TR?label=son%20sürüm)](https://github.com/veysiemrah/TheThaumaturge-TR/releases/latest)
[![İndirme](https://img.shields.io/github/downloads/veysiemrah/TheThaumaturge-TR/total?label=toplam%20indirme)](https://github.com/veysiemrah/TheThaumaturge-TR/releases)
[![Lisans](https://img.shields.io/github/license/veysiemrah/TheThaumaturge-TR)](LICENSE)

📦 **[En son sürümü indir (TheThaumaturge-TR.zip)](https://github.com/veysiemrah/TheThaumaturge-TR/releases/latest/download/TheThaumaturge-TR.zip)**

---

Fool's Theory ve 11 bit studios'un 2024 yapımı **The Thaumaturge** oyunu için açık kaynak Türkçe yama. Yaklaşık 20.500 satır metin insan gözüyle gözden geçirilmiştir; 1905 Varşova atmosferi ve karakter tonları korunmaya özen gösterilir.

> **English summary:** Open-source Turkish translation patch for The Thaumaturge (2024). ~20,500 human-reviewed strings covering UI, dialogues, codex, journal, readables and achievements. Download the ZIP, run `install.bat`.

## Kurulum

1. [TheThaumaturge-TR.zip](https://github.com/veysiemrah/TheThaumaturge-TR/releases/latest/download/TheThaumaturge-TR.zip) dosyasını indir
2. ZIP'i boş bir klasöre çıkar
3. `BENiOKU.txt` dosyasını oku (özellikle Windows güvenlik uyarısı adımı)
4. `install.bat` dosyasına çift tıkla
5. Oyunu başlat — Türkçe metinler otomatik aktif olur

Yamayı kaldırmak için `uninstall.bat` dosyasına çift tıkla.

## Durum

| Kategori | Çevrilen | Toplam | Durum |
|---|---|---|---|
| UI / StringTable | 26 | 27 | %96 ✓ |
| Diyaloglar | 506 asset | 687 asset | %73.7 |
| Journal | 91 | 91 | %100 ✓ |
| Codex | 5 | 5 | %100 ✓ |
| Readables | 47 | 47 | %100 ✓ |
| Başarımlar | 58 | 58 | %100 ✓ |
| **Toplam satır** | **~20.500** | | |

**Kapsanan içerikler:** Tüm diyaloglar (Default + bölüm 1-4 + Upyr yan hikâyesi + LW yan görevler + sokak karşılaşmaları), tüm menüler ve UI, tüm codex girişleri, okunabilir belgeler, başarım metinleri, harita isimleri, yetenek ve durum açıklamaları.

**Ses:** Yalnızca metin çevirisi; Lehçe/İngilizce seslendirme değişmez.

## Bilinen Sorunlar

- **İlk açılışta ses yok:** Yama kurulduktan sonra oyun ilk kez açıldığında konuşma sesleri gelmeyebilir. Oyunu kapatıp yeniden başlatmak sorunu çözer.

## Katkıda Bulunma

- **Hata/öneri:** [GitHub Issues](../../issues) üzerinden bildir
- **Çeviri katkısı:** Önce `docs/glossary.md` ve `docs/style-guide.md`'yi oku, ardından [CONTRIBUTING.md](CONTRIBUTING.md)'e bak

## Nasıl Çalışır

Oyunda yerleşik Türkçe dil desteği bulunmadığından çeviri doğrudan Lehçe diyalog ve StringTable asset'lerinin içine yazılır. Mod pak dosyası oyun Paks klasörüne eklenince tüm platformlarda Türkçe görünür; ayrı bir dil ayarı gerekmez.

## Lisans

- **Kod ve scriptler:** [MIT](LICENSE)
- **Çeviri metni:** [CC BY-SA 4.0](LICENSE)

Oyun içi orijinal Lehçe metinler Fool's Theory ve 11 bit studios'un telifidir; `source/pl/` klasöründe yalnızca çeviri referansı amacıyla bulunur.
