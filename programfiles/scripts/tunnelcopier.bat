@echo off
set scriptfolder="%USERPROFILE%\Downloads\MCSETUP_lobotomyland\scripts"
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
cd /D %%~dp0

del %userprofile%\OneDrive\Desktop\opentunnel.bat
echo @echo off >>%userprofile%\OneDrive\Desktop\opentunnel.bat
echo if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 ^&^& start "" /min "%%~dpnx0" %%* ^&^& exit >>%userprofile%\desktop\opentunnel.bat
echo cloudflared access tcp --hostname mc.hinojosafam.casa --url localhost:9210 >>%userprofile%\desktop\opentunnel.bat
echo pause >>%userprofile%\OneDrive\Desktop\opentunnel.bat

del %userprofile%\OneDrive\Desktop\opentunnel.bat
echo @echo off >>%userprofile%\OneDrive\Desktop\opentunnel.bat
echo if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 ^&^& start "" /min "%%~dpnx0" %%* ^&^& exit >>%userprofile%\OneDrive\Desktop\opentunnel.bat
echo cloudflared access tcp --hostname mc.hinojosafam.casa --url localhost:9210 >>%userprofile%\OneDrive\Desktop\opentunnel.bat
echo pause >>%userprofile%\OneDrive\Desktop\opentunnel.bat

exit