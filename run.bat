@echo off

copy "start.ps1" "%USERPROFILE%"
copy "uninstall.ps1" "%USERPROFILE%"

powershell.exe -ExecutionPolicy Bypass -File "install.ps1"
