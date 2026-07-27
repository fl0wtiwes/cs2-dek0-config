@echo off
title MANAGER CS2 CONFIG

:FIND_STEAM
set "STEAMPATH="
set "ACTIVE_USER="

:: Ищем путь к Steam в реестре
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Valve\Steam" /v SteamPath 2^>nul') do set "STEAMPATH=%%B"
if defined STEAMPATH set "STEAMPATH=%STEAMPATH:/=\%"

:: Определение ID активного аккаунта (если Steam открыт/был запущен)
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Valve\Steam\ActiveProcess" /v ActiveUser 2^>nul') do set "ACTIVE_USER=%%B"

:: Если в реестре не нашлось, ищем по дискам
if not defined STEAMPATH if exist "C:\Program Files (x86)\Steam\userdata" set "STEAMPATH=C:\Program Files (x86)\Steam"
if not defined STEAMPATH if exist "C:\Steam\userdata" set "STEAMPATH=C:\Steam"
if not defined STEAMPATH if exist "D:\Steam\userdata" set "STEAMPATH=D:\Steam"
if not defined STEAMPATH if exist "D:\Games\Steam\userdata" set "STEAMPATH=D:\Games\Steam"
if not defined STEAMPATH if exist "E:\Steam\userdata" set "STEAMPATH=E:\Steam"
if not defined STEAMPATH if exist "E:\Games\Steam\userdata" set "STEAMPATH=E:\Games\Steam"
if not defined STEAMPATH if exist "F:\Steam\userdata" set "STEAMPATH=F:\Steam"

:MENU
cls
echo =========================================================================
echo                   MANAGER USTANOVKI I SBROSA DEK0.CFG
echo =========================================================================
echo.
if defined STEAMPATH (
    echo [INFO] Steam nayden po puti: "%STEAMPATH%"
) else (
    echo [WARNING] Steam ne nayden avtomaticheski!
)

if defined ACTIVE_USER (
    if not "%ACTIVE_USER%"=="0x0" (
        echo [INFO] Aktivniy akkaynt Steam ID: %ACTIVE_USER%
    )
)
echo.
echo [1] Ochistit stariy config i cash (Sbros 730)
echo [2] Ustanovit dek0.cfg v CS2
echo [3] Ukazat put k Steam vruchuyu
echo [4] Vihod
echo.
echo =========================================================================
set "choice="
set /p choice="Vyberite punkt (1-4) i nazhmite Enter: "

if "%choice%"=="1" goto RESET_CONFIG
if "%choice%"=="2" goto INSTALL_CFG
if "%choice%"=="3" goto MANUAL_STEAM
if "%choice%"=="4" exit
goto MENU

:MANUAL_STEAM
cls
echo =========================================================================
echo                   UKAZHITE PUT K PAPKE STEAM
echo =========================================================================
echo.
echo Primer: D:\Steam ili C:\Program Files (x86)\Steam
echo.
set /p STEAMPATH="Vvedite put k Steam: "
goto MENU

:RESET_CONFIG
cls
echo =========================================================================
echo                   SBROS STARIH NASTROEK I CONFIGA CS2
echo =========================================================================
echo.

if not defined STEAMPATH goto NO_STEAM_PATH
if not exist "%STEAMPATH%\userdata" goto NO_USERDATA_FOLDER

echo [1] Otkryvaem papku userdata v provodnike...
start "" "%STEAMPATH%\userdata"

echo.
echo =========================================================================
echo INSTRUCTION / CHTO DELAT DALSHY:
echo =========================================================================
echo 1. V otkryvsheysya papke naydite papku s vashim ID (cifry).
if defined ACTIVE_USER (
    if not "%ACTIVE_USER%"=="0x0" (
        echo    * VASH AKTIVNIY ID AKKAYNTA: %ACTIVE_USER%
    )
)
echo 2. Dlya spravki (kak uznat ID v kLIente Steam):
echo    Steam -> Druzya -> Dobavit druga -> Skopiruyte vash Kod druzhby.
echo 3. Nazhmite Enter nizhe, chtoby vvesti etot ID i ochistit cash CS2.
echo =========================================================================
echo.

set "STEAM_ID="
set /p STEAM_ID="Vvedite vash Kod druzhby (ID) i nazhmite Enter (ili prosto Enter dlya otmeny): "

if "%STEAM_ID%"=="" goto MENU

set "USER_730=%STEAMPATH%\userdata\%STEAM_ID%\730"

if not exist "%USER_730%" goto ID_NOT_FOUND

echo.
echo [2] Otkryvaem papku 730...
start "" "%USER_730%"

echo [3] Ochishchaem papku remote...
if exist "%USER_730%\remote" (
    del /f /q /s "%USER_730%\remote\*.*" >nul 2>&1
    for /d %%p in ("%USER_730%\remote\*") do rmdir /s /q "%%p" >nul 2>&1
)

echo [4] Ochishchaem papku local...
if exist "%USER_730%\local" (
    del /f /q /s "%USER_730%\local\*.*" >nul 2>&1
    for /d %%p in ("%USER_730%\local\*") do rmdir /s /q "%%p" >nul 2>&1
)

echo.
echo =========================================================================
echo [USPEH] Papki remote i local v 730 uspeshno ochishcheny!
echo =========================================================================
goto PAUSE_MENU

:ID_NOT_FOUND
echo.
echo [OSHIBKA] Papka s ID "%STEAM_ID%" ne naydena v userdata!
goto PAUSE_MENU

:NO_STEAM_PATH
echo [OSHIBKA] Put k Steam ne nayden! Vyberite punkt 3 i ukazhite vruchuyu.
goto PAUSE_MENU

:NO_USERDATA_FOLDER
echo [OSHIBKA] Papka userdata ne naydena po puti: "%STEAMPATH%\userdata"
goto PAUSE_MENU

:INSTALL_CFG
cls
echo =========================================================================
echo                     AVTOMATICHESKAYA USTANOVKA dek0.cfg
echo =========================================================================
echo.
if not defined STEAMPATH goto NO_STEAM_PATH

set "CSGO_CFG=%STEAMPATH%\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"

if not exist "%CSGO_CFG%" goto NO_CS2
if not exist "dek0.cfg" goto NO_CFG_FILE

copy /Y "dek0.cfg" "%CSGO_CFG%\dek0.cfg" >nul
echo =========================================================================
echo [USPEH] Fayl dek0.cfg skopirovan v papku CS2!
echo.
echo V CS2 otkroyte konsol i napishite: exec dek0.cfg
echo =========================================================================
goto PAUSE_MENU

:NO_CS2
echo [OSHIBKA] Ne naydena papka CS2 po puti: "%CSGO_CFG%"
goto PAUSE_MENU

:NO_CFG_FILE
echo [OSHIBKA] Fayl dek0.cfg ne nayden ryadom s batnikom!
goto PAUSE_MENU

:PAUSE_MENU
echo.
echo Nazhmite lubuyu klavishu dlya vozvrata v menu...
pause >nul
goto MENU
