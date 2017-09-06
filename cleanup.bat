@echo off

:: This script should be executed after build the dependencies.
:: It removes all files, which are not necessary for building TDesktop.

call:deleteSourceFiles
call:deleteProjectFiles
call:deleteScripts
call:deleteLogFiles
call:deleteImages
call:deleteDocumentation
call:deleteOther

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF

:deleteSourceFiles
    call:logInfo "Deleting source files"

    PowerShell Remove-Item .\*\* -include *.cpp  -force -recurse
    PowerShell Remove-Item .\*\* -include *.c    -force -recurse
    PowerShell Remove-Item .\*\* -include *.cc   -force -recurse
    PowerShell Remove-Item .\*\* -include *.cs   -force -recurse
    PowerShell Remove-Item .\*\* -include *.asm  -force -recurse
    PowerShell Remove-Item .\*\* -include *.S    -force -recurse
    PowerShell Remove-Item .\*\* -include *.v    -force -recurse
    PowerShell Remove-Item .\*\* -include *.java -force -recurse
    PowerShell Remove-Item .\*\* -include *.pl   -force -recurse
    PowerShell Remove-Item .\*\* -include *.m    -force -recurse
    PowerShell Remove-Item .\*\* -include *.o    -force -recurse
    PowerShell Remove-Item .\*\* -include *.d    -force -recurse

    PowerShell Remove-Item .\*\* -include *.py  -force -recurse
    PowerShell Remove-Item .\*\* -include *.pyc -force -recurse
    PowerShell Remove-Item .\*\* -include *.pyo -force -recurse
    PowerShell Remove-Item .\*\* -include *.pyd -force -recurse
GOTO:EOF

:deleteProjectFiles
    call:logInfo "Deleting solution and project files"

    PowerShell Remove-Item .\*\* -include *.mk      -force -recurse
    PowerShell Remove-Item .\*\* -include *.sln     -force -recurse
    PowerShell Remove-Item .\*\* -include *.vcproj  -force -recurse
    PowerShell Remove-Item .\*\* -include *.vcxproj -force -recurse
    PowerShell Remove-Item .\*\* -include *.gyp     -force -recurse
    PowerShell Remove-Item .\*\* -include *.pro     -force -recurse
GOTO:EOF

:deleteScripts
    call:logInfo "Deleting scripts"

    ::keep ninja/ninja.exe, qt5_6_2\qtbase\bin\moc.exe, qt5_6_2\qtbase\bin\rcc.exe
    rename .\ninja\ninja.exe ninja.KEEP_ME
    rename .\qt5_6_2\qtbase\bin\moc.exe moc.KEEP_ME
    rename .\qt5_6_2\qtbase\bin\rcc.exe rcc.KEEP_ME
    PowerShell Remove-Item .\*\* -include *.exe -force -recurse
    rename .\ninja\ninja.KEEP_ME ninja.exe
    rename .\qt5_6_2\qtbase\bin\moc.KEEP_ME moc.exe
    rename .\qt5_6_2\qtbase\bin\rcc.KEEP_ME rcc.exe

    PowerShell Remove-Item .\*\* -include *.sh  -force -recurse
    PowerShell Remove-Item .\*\* -include *.ps1 -force -recurse
    PowerShell Remove-Item .\*\* -include *.bat -force -recurse
    PowerShell Remove-Item .\*\* -include *.dll -force -recurse
GOTO:EOF

:deleteLogFiles
    call:logInfo "Deleting log files"

    PowerShell Remove-Item .\*\* -include *.log  -force -recurse
    PowerShell Remove-Item .\*\* -include *.tlog -force -recurse
GOTO:EOF

:deleteImages
    call:logInfo "Deleting images"

    PowerShell Remove-Item .\*\* -include *.jpg  -force -recurse
    PowerShell Remove-Item .\*\* -include *.jpeg -force -recurse
    PowerShell Remove-Item .\*\* -include *.png  -force -recurse
    PowerShell Remove-Item .\*\* -include *.bmp  -force -recurse
    PowerShell Remove-Item .\*\* -include *.gif  -force -recurse
    PowerShell Remove-Item .\*\* -include *.tif  -force -recurse
    PowerShell Remove-Item .\*\* -include *.tiff -force -recurse
    PowerShell Remove-Item .\*\* -include *.svg  -force -recurse
GOTO:EOF

:deleteDocumentation
    call:logInfo "Deleting documentation"

    PowerShell Remove-Item .\*\* -include *.md       -force -recurse
    PowerShell Remove-Item .\*\* -include *.qdoc     -force -recurse
    PowerShell Remove-Item .\*\* -include *.qdocconf -force -recurse
    PowerShell Remove-Item .\*\* -include *.qdocinc  -force -recurse
    PowerShell Remove-Item .\*\* -include *.txt      -force -recurse
GOTO:EOF

:deleteOther
    call:logInfo "Deleting other files"

    PowerShell -command "& { Get-ChildItem *.obj -File -Recurse | Foreach-Object {Remove-Item $_.FullName} }"
    PowerShell Remove-Item .\*\* -include *.js        -force -recurse
    PowerShell Remove-Item .\*\* -include *.css       -force -recurse
    PowerShell Remove-Item .\*\* -include *.htm       -force -recurse
    PowerShell Remove-Item .\*\* -include *.html      -force -recurse
    PowerShell Remove-Item .\*\* -include *.ttf       -force -recurse
    PowerShell Remove-Item .\*\* -include *.eot       -force -recurse
    PowerShell Remove-Item .\*\* -include *.woff      -force -recurse
    PowerShell Remove-Item .\*\* -include *.xml       -force -recurse
    PowerShell Remove-Item .\*\* -include *.xsl       -force -recurse
    PowerShell Remove-Item .\*\* -include *.mo        -force -recurse
    PowerShell Remove-Item .\*\* -include *.po        -force -recurse
    PowerShell Remove-Item .\*\* -include *.m4        -force -recurse
    PowerShell Remove-Item .\*\* -include *.gitignore -force -recurse
    PowerShell Remove-Item .\*\* -include *.tmp       -force -recurse
    PowerShell Remove-Item .\*\* -include *.cache     -force -recurse
    PowerShell Remove-Item .\*\* -include *.test      -force -recurse
    PowerShell Remove-Item .\*\* -include *.conf      -force -recurse

    :: Remove git folders
    IF EXIST .git (
        PowerShell Rename-Item '.git' '.KEEP_ME' -Force
    )

    PowerShell "Get-ChildItem -path . -Include '.git' -Recurse -force | Remove-Item -force -Recurse"

    IF EXIST .KEEP_ME (
        PowerShell Rename-Item '.KEEP_ME' '.git' -Force
    )
GOTO:EOF
