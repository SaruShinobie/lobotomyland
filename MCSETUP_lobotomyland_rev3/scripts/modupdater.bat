@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
cd /D %%~dp0

set folder="%USERPROFILE%\AppData\Roaming\.minecraft\mods\"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
    @timeout /t 3 >nul 2>&1
xcopy "%USERPROFILE%\Downloads\MCSETUP_lobotomyland\mods\" "%folder%" /e
    @timeout /t 3 >nul 2>&1
exit