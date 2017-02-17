@echo off

:: This script should be executed after build the dependencies.
:: It removes all files, which are not necessary for building TDesktop.

call:deleteSourceFiles
call:deleteProjectFiles

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF

:deleteSourceFiles
    call:logInfo "Deleting source files"
	
	PowerShell Remove-Item .\*\* -include *.cpp -force -recurse
	PowerShell Remove-Item .\*\* -include *.c -force -recurse
	PowerShell Remove-Item .\*\* -include *.cc -force -recurse
	PowerShell Remove-Item .\*\* -include *.asm -force -recurse
	PowerShell Remove-Item .\*\* -include *.S -force -recurse
GOTO:EOF

:deleteProjectFiles
    call:logInfo "Deleting solution and project files"
	
	PowerShell Remove-Item .\*\* -include *.mk -force -recurse
	PowerShell Remove-Item .\*\* -include *.sln -force -recurse
	PowerShell Remove-Item .\*\* -include *.vcproj -force -recurse
	PowerShell Remove-Item .\*\* -include *.vcxproj -force -recurse
	PowerShell Remove-Item .\*\* -include *.gyp -force -recurse
	PowerShell Remove-Item .\*\* -include *.pro -force -recurse
GOTO:EOF
