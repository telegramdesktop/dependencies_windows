@echo off
set QT_VERSION_MAJOR=5
SET QT_VERSION_MINOR=%QT_VERSION_MAJOR%.6
SET QT_VERSION_PATCH=%QT_VERSION_MINOR%.2
SET QT_VERSION_STR=5_6_2

call:logInfo "Unpacking Qt5Core %QT_VERSION_STR%"
7z x -o.\qt%QT_VERSION_STR%\qtbase\lib .\qt%QT_VERSION_STR%\qtbase\lib\Qt5Core.7z

call:logInfo "Removing extracted qt archive"
del .\qt%QT_VERSION_STR%\qtbase\lib\Qt5Core.7z

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF
