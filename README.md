# The Thaumaturge — Türkçe Yama

> **English summary:** Open-source Turkish translation patch for The Thaumaturge (Fool's Theory / 11 bit studios, 2024). Human-reviewed, atmosphere-faithful. ~20,500 translated strings covering UI, dialogues, codex, journal, readables and achievements. Download the latest release pak and drop it in your `Paks/` folder.

---

Fool's Theory ve 11 bit studios'un 2024 yapımı **The Thaumaturge** oyunu için açık kaynak, insan gözüyle gözden geçirilmiş Türkçe çeviri projesi.

Çeviri: yapay zeka destekli taslak + manuel QA. 1905 Varşova atmosferi ve karakter tonları korunmaya özen gösterilir.

## Kurulum

1. [Releases](../../releases) sayfasından en son sürümü indirin.
2. Arşivi açın; içinden `pakchunk99-WinGDK_P.pak`, `.ucas`, `.utoc` dosyalarını çıkarın.
3. Bu üç dosyayı oyunun `Paks/` klasörüne kopyalayın:

   | Platform | Paks klasörü |
   |---|---|
   | **Game Pass (Xbox GDK)** | `C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks\` |
   | **Steam** | `[Steam kütüphanesi]\The Thaumaturge\Content\Paks\` |
   | **GOG / Epic** | Benzer yol, yükleyiciden kontrol edin |

4. Oyunu başlatın. Türkçe metin otomatik aktif olur; ek ayar gerekmez.

**Kaldırmak için:** Üç `pakchunk99-WinGDK_P.*` dosyasını silin.

> Kurulum sırasında oyun kapalı olmalıdır; özellikle `.ucas` dosyası oyun açıkken kilitlidir.

## Kapsam ve durum

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

## Katkı

Bu projeye katkı sunmak isterseniz:

- Hata ve öneri için [Issues](../../issues) açın.
- Çeviri düzeltmesi için önce `docs/glossary.md` ve `docs/style-guide.md`'yi okuyun, ardından PR gönderin.
- Yeni dil bölümü veya araç katkısı için `CONTRIBUTING.md`'e bakın.

## Geliştirici ortamı kurulumu

Çevirileri kendiniz derlemek veya katkıda bulunmak için:

```
1. Repoyu klonlayın.
2. tools/ altındaki araçları indirin (bkz. tools/README.md).
3. Oyun dosyalarını retoc ile çıkarın.
4. translation/ altındaki CSV'leri düzenleyin.
5. scripts/dialog_apply.ps1 veya scripts/stringtable_apply.ps1 ile uygulayın.
6. retoc to-zen ile mod pak üretin.
```

Detaylı pipeline: `docs/workflow-notes.md`

## Lisans

- **Kod ve scriptler:** [MIT](LICENSE)
- **Çeviri metni:** [CC BY-SA 4.0](LICENSE)

Oyun içi orijinal Lehçe metinler Fool's Theory ve 11 bit studios'un telifidir; `source/pl/` klasöründe yalnızca çeviri referansı amacıyla bulunur, yeniden lisanslanmamıştır.
