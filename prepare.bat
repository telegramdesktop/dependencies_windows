@echo off
set QT_VERSION_MAJOR=5
SET QT_VERSION_MINOR=%QT_VERSION_MAJOR%.6
SET QT_VERSION_PATCH=%QT_VERSION_MINOR%.2
SET QT_VERSION_STR=5_6_2

call:logInfo "Unpacking qt %QT_VERSION_STR%"
7z x -o.\qt%QT_VERSION_STR% .\qt%QT_VERSION_STR%\qtbase.7z

call:logInfo "Removing extracted qt archive"
del .\qt%QT_VERSION_STR%\qtbase.7z

call:getQtSource

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF

:getQtSource
    call:logInfo "Downloading qt source"
	
	git clone git://code.qt.io/qt/qt%QT_VERSION_MAJOR%.git tmp
	cd tmp	
    git checkout %QT_VERSION_MINOR%
    perl init-repository --module-subset=qtbase,qtimageformats
    git checkout v%QT_VERSION_PATCH%
    cd qtbase && git checkout v%QT_VERSION_PATCH% && cd ..
    cd qtimageformats && git checkout v%QT_VERSION_PATCH% && cd ..
	
	call:logInfo "Applying the patch"
	
	cd qtbase && git apply ../../../tdesktop/Telegram/Patches/qtbase_%QT_VERSION_STR%.diff && cd ..
	
	call:logInfo "Copying header file to our compiled qt"
	xcopy *.h ..\qt%QT_VERSION_STR%\ /sy
	
	cd ..
	rmdir tmp /s /q
GOTO:EOF
