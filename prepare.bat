@echo off
SET QT_VERSION=5_6_2

call:logInfo "Unpacking qt %QT_VERSION%"
7z x -o.\qt%QT_VERSION% .\qt%QT_VERSION%\lib.7z

call:logInfo "Removing extracted qt archive"
del .\qt%QT_VERSION%\lib.7z

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF
