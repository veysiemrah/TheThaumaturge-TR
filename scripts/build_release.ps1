# build_release.ps1
# Dağıtım ZIP paketini üretir: 3 pak dosyası + install.bat + uninstall.bat + BENİOKU.txt
#
# Kullanım:
#   .\scripts\build_release.ps1 [-Version "0.9.0"]
#
# Çıktı: release\TheThaumaturge-TR-v{VERSION}.zip

param(
    [string] $Version = "0.9.0"
)

$ErrorActionPreference = "Stop"
$root    = Split-Path $PSScriptRoot -Parent
$pakDir  = Join-Path $root "build\output"
$tmpDir  = Join-Path $root "build\release_tmp"
$outDir  = Join-Path $root "release"
$zipName = "TheThaumaturge-TR-v$Version.zip"
$zipPath = Join-Path $outDir $zipName

# --- Ön kontrol ---
$required = @(
    "pakchunk99-WinGDK_P.pak",
    "pakchunk99-WinGDK_P.ucas",
    "pakchunk99-WinGDK_P.utoc"
)
foreach ($f in $required) {
    if (-not (Test-Path (Join-Path $pakDir $f))) {
        Write-Error "Eksik dosya: build\output\$f — önce retoc to-zen çalıştırın."
    }
}

# --- Geçici klasör ---
if (Test-Path $tmpDir) { Remove-Item $tmpDir -Recurse -Force }
New-Item -ItemType Directory -Path $tmpDir | Out-Null
New-Item -ItemType Directory -Path $outDir -Force | Out-Null

# --- Pak dosyalarını kopyala ---
foreach ($f in $required) {
    Copy-Item (Join-Path $pakDir $f) (Join-Path $tmpDir $f)
}

# --- install.bat ---
# Not: Yönetici yükseltmesi kendiliğinden yapılır (Program Files / XboxGames için gerekli).
# İnternet'ten indirilen .bat dosyaları Windows tarafından engellenebilir;
# BENİOKU.txt'de "Engeli Kaldır" adımı açıklanmaktadır.
$installBat = @'
@echo off
chcp 65001 >nul

:: ---------------------------------------------------------------
:: Yönetici kontrolü — gerekiyorsa kendiliğinden yükselt
:: ---------------------------------------------------------------
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Yonetici haklari gerekiyor, onay penceresi acilacak...
    powershell -NoProfile -Command ^
        "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: ---------------------------------------------------------------
:: Kurulum
:: ---------------------------------------------------------------
echo ============================================================
echo  The Thaumaturge - Turkce Yama Kurulumu
echo ============================================================
echo.

set SCRIPT_DIR=%~dp0
set FOUND=0

:: --- Game Pass (Xbox GDK) ---
set GAMEPASS_PAKS=C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks
if exist "%GAMEPASS_PAKS%\" (
    echo [+] Game Pass kurulumu bulundu.
    echo     Kopyalaniyor...
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.pak"  "%GAMEPASS_PAKS%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.ucas" "%GAMEPASS_PAKS%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.utoc" "%GAMEPASS_PAKS%\" >nul 2>&1
    echo     Tamam.
    echo.
    set FOUND=1
)

:: --- Steam (varsayilan yol) ---
set STEAM_PAKS=C:\Program Files (x86)\Steam\steamapps\common\The Thaumaturge\Content\Paks
if exist "%STEAM_PAKS%\" (
    echo [+] Steam kurulumu bulundu.
    echo     Kopyalaniyor...
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.pak"  "%STEAM_PAKS%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.ucas" "%STEAM_PAKS%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.utoc" "%STEAM_PAKS%\" >nul 2>&1
    echo     Tamam.
    echo.
    set FOUND=1
)

:: --- Bulunamazsa el ile yol iste ---
if %FOUND%==0 (
    echo [!] Oyun klasoru otomatik bulunamadi.
    echo.
    echo     Oyununuzun Paks klasorunu girin.
    echo     Ornek: D:\Oyunlar\The Thaumaturge\Content\Paks
    echo.
    set /p CUSTOM_PAKS=Paks klasoru:
    if not exist "%CUSTOM_PAKS%\" (
        echo.
        echo [HATA] Klasor bulunamadi. BENiOKU.txt dosyasina bakin.
        pause
        exit /b 1
    )
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.pak"  "%CUSTOM_PAKS%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.ucas" "%CUSTOM_PAKS%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.utoc" "%CUSTOM_PAKS%\" >nul 2>&1
    echo     Tamam.
    echo.
)

echo ============================================================
echo  Kurulum tamamlandi!
echo  Oyunu baslatabilirsiniz — Turkce otomatik aktif olur.
echo  Kaldirmak icin uninstall.bat calistirin.
echo ============================================================
pause
'@
$installBat | Set-Content (Join-Path $tmpDir "install.bat") -Encoding UTF8NoBOM

# --- uninstall.bat ---
$uninstallBat = @'
@echo off
chcp 65001 >nul

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -NoProfile -Command ^
        "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo ============================================================
echo  The Thaumaturge - Turkce Yama Kaldirma
echo ============================================================
echo.

set FOUND=0

set GAMEPASS_PAKS=C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks
if exist "%GAMEPASS_PAKS%\pakchunk99-WinGDK_P.ucas" (
    echo [+] Game Pass: kaldiriliyor...
    del /F /Q "%GAMEPASS_PAKS%\pakchunk99-WinGDK_P.pak"  2>nul
    del /F /Q "%GAMEPASS_PAKS%\pakchunk99-WinGDK_P.ucas" 2>nul
    del /F /Q "%GAMEPASS_PAKS%\pakchunk99-WinGDK_P.utoc" 2>nul
    echo     Tamam.
    set FOUND=1
)

set STEAM_PAKS=C:\Program Files (x86)\Steam\steamapps\common\The Thaumaturge\Content\Paks
if exist "%STEAM_PAKS%\pakchunk99-WinGDK_P.ucas" (
    echo [+] Steam: kaldiriliyor...
    del /F /Q "%STEAM_PAKS%\pakchunk99-WinGDK_P.pak"  2>nul
    del /F /Q "%STEAM_PAKS%\pakchunk99-WinGDK_P.ucas" 2>nul
    del /F /Q "%STEAM_PAKS%\pakchunk99-WinGDK_P.utoc" 2>nul
    echo     Tamam.
    set FOUND=1
)

if %FOUND%==0 (
    echo Yuklu yama bulunamadi.
)

echo.
echo Yama kaldirildi. Oyun orijinal diline dondu.
pause
'@
$uninstallBat | Set-Content (Join-Path $tmpDir "uninstall.bat") -Encoding UTF8NoBOM

# --- BENİOKU.txt ---
$benioku = @"
╔══════════════════════════════════════════════════════════════╗
║       The Thaumaturge — Türkçe Yama  v$Version                    ║
║       https://github.com/veysiemrah/TheThaumaturge-TR        ║
╚══════════════════════════════════════════════════════════════╝

Bu yama The Thaumaturge oyununu Türkçe'ye çevirir. Yaklaşık
20.500 satır metin insan gözüyle gözden geçirilerek çevrilmiştir:
diyaloglar, menüler, codex, journal, başarımlar ve daha fazlası.

Ses değişmez (Lehçe/İngilizce seslendirme korunur).


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ÖNEMLİ — WINDOWS GÜVENLİK UYARISI
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

İnternetten indirilen .bat dosyaları Windows tarafından
engellenebilir. Kurulumdan ÖNCE aşağıdaki adımı uygulayın:

  1. install.bat dosyasına SAĞ TIKLAYIN.
  2. "Özellikler"i seçin.
  3. Pencerenin en altında "Engeli kaldır" kutusunu işaretleyin.
  4. "Tamam"a tıklayın.

Aynı adımı uninstall.bat için de uygulayın.

(Bu uyarıyı görmüyorsanız bu adımı atlayabilirsiniz.)


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  KURULUM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Oyunu kapatın.
  2. install.bat dosyasına çift tıklayın.
  3. "Bu uygulamanın cihazınızda değişiklik yapmasına izin
     vermek istiyor musunuz?" sorusuna "Evet" deyin.
  4. Kurulum tamamlanınca bir tuşa basın.
  5. Oyunu başlatın — Türkçe otomatik olarak aktif olur.

Oyun kurulumunuz standart dışı bir konumdaysa (örneğin
D:\Oyunlar\) kurulum Paks klasörünü elle girmenizi ister.
Bu durumda oyun klasörünü açıp Paks yolunu kopyalayın.

  Örnek yollar:
    Game Pass : C:\XboxGames\The Thaumaturge\Content\
                TheThaumaturge\Content\Paks
    Steam     : C:\Program Files (x86)\Steam\steamapps\
                common\The Thaumaturge\Content\Paks


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  KALDIRMA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  uninstall.bat dosyasına çift tıklayın.
  Oyun otomatik olarak orijinal diline döner.

  Ya da Paks klasöründen şu üç dosyayı elle silin:
    pakchunk99-WinGDK_P.pak
    pakchunk99-WinGDK_P.ucas
    pakchunk99-WinGDK_P.utoc


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  SORUN GİDERME
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Kurulum sonrası metin hâlâ Lehçe/İngilizce görünüyorsa:

  • Oyun kurulumdan önce kapalı mıydı? Açıkken .ucas dosyası
    kilitlenir; kurulum başarısız olur. Kapatıp tekrar deneyin.

  • Doğru Paks klasörü mü seçildi? Klasörde başka .pak
    dosyaları olmalıdır (oyunun kendi verileri).

  • Antivirüs yazılımınız dosyayı silmiş olabilir. İstisnaya
    ekleyip tekrar kurun.

Sorun çözülmezse GitHub'da konu açın:
  https://github.com/veysiemrah/TheThaumaturge-TR/issues


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  LİSANS VE TELİF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Çeviri metni: CC BY-SA 4.0 — kaynak göstererek paylaşabilirsiniz.
Kurulum scriptleri: MIT.

The Thaumaturge, Fool's Theory ve 11 bit studios'un ürünüdür.
Bu yama resmi değildir; oyun dosyaları dağıtılmamaktadır.
"@
$benioku | Set-Content (Join-Path $tmpDir "BENiOKU.txt") -Encoding UTF8NoBOM

# --- ZIP oluştur ---
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path (Join-Path $tmpDir "*") -DestinationPath $zipPath
Remove-Item $tmpDir -Recurse -Force

$size = [math]::Round((Get-Item $zipPath).Length / 1MB, 1)
Write-Host "Paket hazir: release\$zipName ($size MB)"
Write-Host "Icerik:"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
$zip.Entries | ForEach-Object { "  $($_.Name)  ($([math]::Round($_.Length/1KB)) KB)" }
$zip.Dispose()
