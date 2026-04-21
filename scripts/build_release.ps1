# build_release.ps1
# Dağıtım ZIP paketini üretir: 3 pak dosyası + install.bat + uninstall.bat + KURULUM.txt
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
$installBat = @'
@echo off
chcp 65001 >nul
echo ============================================================
echo  The Thaumaturge — Türkçe Yama Kurulumu
echo ============================================================
echo.

set SCRIPT_DIR=%~dp0

:: --- Game Pass (Xbox GDK) yolu ---
set GAMEPASS_PAKS=C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks
if exist "%GAMEPASS_PAKS%\" (
    echo [+] Game Pass kurulumu bulundu.
    echo     Kopyalanıyor: %GAMEPASS_PAKS%
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.pak"  "%GAMEPASS_PAKS%\" >nul
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.ucas" "%GAMEPASS_PAKS%\" >nul
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.utoc" "%GAMEPASS_PAKS%\" >nul
    echo     Tamam!
    echo.
)

:: --- Steam yolu (yaygın varsayılan) ---
set STEAM_PAKS=C:\Program Files (x86)\Steam\steamapps\common\The Thaumaturge\Content\Paks
if exist "%STEAM_PAKS%\" (
    echo [+] Steam kurulumu bulundu.
    echo     Kopyalanıyor: %STEAM_PAKS%
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.pak"  "%STEAM_PAKS%\" >nul
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.ucas" "%STEAM_PAKS%\" >nul
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.utoc" "%STEAM_PAKS%\" >nul
    echo     Tamam!
    echo.
)

:: --- Hiçbiri bulunamazsa el ile yol iste ---
if not exist "%GAMEPASS_PAKS%\" if not exist "%STEAM_PAKS%\" (
    echo [!] Oyun klasörü otomatik bulunamadı.
    echo.
    echo     Lütfen oyununuzun Paks klasörünü girin.
    echo     Örnek: C:\SteamLibrary\steamapps\common\The Thaumaturge\Content\Paks
    echo.
    set /p CUSTOM_PAKS=Paks klasörü:
    if not exist "%CUSTOM_PAKS%\" (
        echo [HATA] Klasör bulunamadı: %CUSTOM_PAKS%
        pause
        exit /b 1
    )
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.pak"  "%CUSTOM_PAKS%\" >nul
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.ucas" "%CUSTOM_PAKS%\" >nul
    copy /Y "%SCRIPT_DIR%pakchunk99-WinGDK_P.utoc" "%CUSTOM_PAKS%\" >nul
    echo     Tamam!
    echo.
)

echo ============================================================
echo  Kurulum tamamlandı. Oyunu başlatın — Türkçe otomatik aktif.
echo  Kaldırmak için uninstall.bat çalıştırın.
echo ============================================================
pause
'@
$installBat | Set-Content (Join-Path $tmpDir "install.bat") -Encoding UTF8NoBOM

# --- uninstall.bat ---
$uninstallBat = @'
@echo off
chcp 65001 >nul
echo ============================================================
echo  The Thaumaturge — Türkçe Yama Kaldırma
echo ============================================================
echo.

set GAMEPASS_PAKS=C:\XboxGames\The Thaumaturge\Content\TheThaumaturge\Content\Paks
set STEAM_PAKS=C:\Program Files (x86)\Steam\steamapps\common\The Thaumaturge\Content\Paks

for %%P in ("%GAMEPASS_PAKS%" "%STEAM_PAKS%") do (
    if exist "%%~P\pakchunk99-WinGDK_P.ucas" (
        echo [+] %%~P
        del /F /Q "%%~P\pakchunk99-WinGDK_P.pak"  2>nul
        del /F /Q "%%~P\pakchunk99-WinGDK_P.ucas" 2>nul
        del /F /Q "%%~P\pakchunk99-WinGDK_P.utoc" 2>nul
        echo     Silindi.
    )
)

echo.
echo Yama kaldırıldı. Oyun orijinal diline döndü.
pause
'@
$uninstallBat | Set-Content (Join-Path $tmpDir "uninstall.bat") -Encoding UTF8NoBOM

# --- KURULUM.txt ---
$readme = @"
The Thaumaturge — Türkçe Yama v$Version
=========================================

KURULUM
-------
1. Oyununuzu kapatın.
2. install.bat dosyasına çift tıklayın.
3. Oyunu başlatın — Türkçe metin otomatik aktif olur.

Otomatik tespit edilemeyen bir Steam kütüphanesi kullanıyorsanız
kurulum sırasında Paks klasörünü elle girmeniz istenecektir.
Örnek: D:\Oyunlar\The Thaumaturge\Content\Paks

KALDIRMA
--------
uninstall.bat dosyasına çift tıklayın.

KAPSAM
------
~20.500 çevrilmiş satır: diyaloglar, menüler, codex, journal,
okunabilir belgeler, başarımlar, harita isimleri, yetenekler.
Ses (Lehçe/İngilizce seslendirme) değişmez.

KAYNAK KOD / HATA BİLDİRİMİ
-----------------------------
https://github.com/veysiemrah/TheThaumaturge-TR
"@
$readme | Set-Content (Join-Path $tmpDir "KURULUM.txt") -Encoding UTF8NoBOM

# --- ZIP oluştur ---
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path (Join-Path $tmpDir "*") -DestinationPath $zipPath
Remove-Item $tmpDir -Recurse -Force

$size = [math]::Round((Get-Item $zipPath).Length / 1MB, 1)
Write-Host "Paket hazır: release\$zipName ($size MB)"
