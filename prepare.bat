@echo off
set QT_VERSION_MAJOR=5
SET QT_VERSION_MINOR=%QT_VERSION_MAJOR%.12
SET QT_VERSION_PATCH=%QT_VERSION_MINOR%.5
SET QT_VERSION_STR=%QT_VERSION_PATCH%

call:logInfo "Unpacking Qt5 libs %QT_VERSION_STR%"
7z x .\Qt-%QT_VERSION_STR%.7z

call:logInfo "Removing extracted qt archive"
del .\Qt-%QT_VERSION_STR%.7z

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF
