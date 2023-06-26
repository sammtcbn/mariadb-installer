@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set MARIADB_VER=11.1.1
set zipfile=mariadb-%MARIADB_VER%-winx64.zip
set MARIADB_FOLDER_NAME=mariadb-%MARIADB_VER%-winx64

curl --fail --output %zipfile% https://archive.mariadb.org/mariadb-%MARIADB_VER%/winx64-packages/%zipfile%
if %errorlevel% neq 0 (
    echo Fail to download %zipfile%
    pause
    goto End
)

if not exist %zipfile% (
    echo %zipfile% not found
    pause
    goto End
)

powershell -command "Expand-Archive -Force %zipfile% ."

if not exist %MARIADB_FOLDER_NAME%\bin\mariadb.exe (
    echo Fail to extract %zipfile%
    pause
    goto End
)

rename %MARIADB_FOLDER_NAME% mariadb

:END
echo bye
timeout /t 5
