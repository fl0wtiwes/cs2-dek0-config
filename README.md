================================================================================
       ПОЛНАЯ ИНСТРУКЦИЯ ПО УСТАНОВКЕ И СБРОСУ CS2 CONFIG (DEK0.CFG)
================================================================================

--------------------------------------------------------------------------------
🇷🇺 РУССКАЯ ВЕРСИЯ (ДЛЯ ЧАЙНИКОВ И КАМНЕЙ)
--------------------------------------------------------------------------------

В архиве лежит помощник — файл `INSTALL_DEK0CFG.bat`. Он сделает 90% работы за тебя!

[ ШАГ 1. СБРОС СТАРЫХ НАСТРОЕК / КЭША (ЕСЛИ ЕСТЬ БАГИ ИЛИ ЛАГИ) ]
1. Запусти файл `INSTALL_DEK0CFG.bat`.
2. В появившемся меню нажми цифру `1` и нажмите `Enter`.
3. Скрипт сам откроет папку `userdata` и на экране напишет твой АКТИВНЫЙ STEAM ID (Код дружбы).
4. Найди папку с этим ID, введи её номер в окно батника и нажми `Enter`.
5. Скрипт сам полностью очистит старый кэш и настройки игры (папку 730).

[ ШАГ 2. АВТОМАТИЧЕСКАЯ УСТАНОВКА КОНФИГА ]
1. В главном меню батника нажми цифру `2` и нажми `Enter`.
2. Скрипт сам найдет папку CS2 на любом диске (C, D, E, F) и скопирует туда `dek0.cfg`.

[ ШАГ 3. АКТИВАЦИЯ В ИГРЕ ]
1. Запусти CS2.
2. Зайди в Настройки -> Игра -> Включить консоль разработчика -> ДА.
3. Открой консоль на клавишу `~` (Ё / тильда).
4. Введи команду: `exec dek0.cfg` и нажми Enter.

[ ШАГ 4 (ПО ЖЕЛАНИЮ). АВТОЗАГРУЗКА ПРИ КАЖДОМ ЗАПУСКЕ ]
Чтобы не вводить команду вручную каждый раз:
В Steam нажми ПКМ по CS2 -> Свойства -> Общие -> Параметры запуска -> Впиши:
  +exec dek0.cfg


--------------------------------------------------------------------------------
📌 ТРАБЛШУТИНГ И РЕШЕНИЕ ПРОБЛЕМ:
--------------------------------------------------------------------------------
• Батник пишет "Steam не найден"? -> Выбери пункт `3` в батнике и введи путь к Steam вручную (например: D:\Steam).
• В консоли пишет "cfg not found"? -> Убедись, что файл `dek0.cfg` лежит в одной папке вместе с `INSTALL_DEK0CFG.bat` перед запуском установки.


================================================================================
🇬🇧 ENGLISH VERSION
================================================================================

Use the helper script `INSTALL_DEK0CFG.bat` included in the archive.

[ STEP 1. RESET OLD CONFIG & CACHE (RECOMMENDED) ]
1. Run `INSTALL_DEK0CFG.bat`.
2. Type `1` and press `Enter`.
3. The script will open your `userdata` directory and display your active Steam ID on screen.
4. Enter your Steam ID number into the console and press `Enter` to clean up old CS2 settings (folder 730).

[ STEP 2. AUTOMATIC CONFIG INSTALLATION ]
1. In the main menu, type `2` and press `Enter`.
2. The script will automatically locate your CS2 folder across all drives and copy `dek0.cfg` into `\csgo\cfg\`.

[ STEP 3. IN-GAME ACTIVATION ]
1. Launch CS2.
2. Go to Settings -> Game -> Enable Developer Console -> YES.
3. Open the console using the `~` key.
4. Type `exec dek0.cfg` and press Enter.

[ STEP 4 (OPTIONAL). AUTO-LOAD ON LAUNCH ]
Right-click CS2 in Steam -> Properties -> General -> Launch Options -> Add:
  +exec dek0.cfg
================================================================================
