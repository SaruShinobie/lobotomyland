@echo off

cd /D "%~dp0"

set scriptfolder="%~dp0\programfiles\scripts"
set modfolder="%USERPROFILE%\AppData\Roaming\.minecraft\mods"
set newmodfolder="%~dp0\programfiles\mods"
set keyfolder="%USERPROFILE%\Documents"
set setupfolder=/D "%~dp0"


echo  _____     _     ____   ____   ___   ____   ____   _____  _____  _   _  ____  
echo ^|  ___^|   / \   ^| __ ^) ^|  _ \ ^|_ _^| / ___^| / ___^| ^| ____^|^|_   _^|^| ^| ^| ^|^|  _ \ 
echo ^| ^|_     / _ \  ^|  _ \ ^| ^|_^) ^| ^| ^| ^| ^|     \___ \ ^|  _^|    ^| ^|  ^| ^| ^| ^|^| ^|_^) ^|
echo ^|  _^|   / ___ \ ^| ^|_^) ^|^|  _ ^<  ^| ^| ^| ^|___   ___^) ^|^| ^|___   ^| ^|  ^| ^|_^| ^|^|  __/ 
echo ^|_^|    /_/   \_\^|____/ ^|_^| \_\^|___^| \____^| ^|____/ ^|_____^|  ^|_^|   \___/ ^|_^|  v0.2.4
echo.                                                                       
echo.
echo.

echo Welcome to the fabric installer!
echo.
    @timeout /t 2 >nul 2>&1
    rem could be alot better, detect run


cd %keyfolder%
if exist %USERPROFILE%\Documents\lobotomyland.key (
    echo Previous run detected, skipping explanations.
    @timeout /t 1 >nul 2>&1
    goto :fastmode
)

cd %setupfolder%

    echo In a second you'll be asked if you want to install ^& setup or update your mod folder.
        @timeout /t 1 >nul 2>&1
    echo If you bought a new PC, reinstalled Minecraft recently, or aren't sure, enter `setup`
        @timeout /t 1 >nul 2>&1
    echo If you're sure you've run this program before and are set up, or you were told to update your mods, enter `update`
        @timeout /t 1 >nul 2>&1
    echo It's important you type your answer exactly as it appears.
    echo.
        @timeout /t 2 >nul 2>&1
    :question
    set choice=
        set /p setupmode=Enter "setup" or "update" here:
        if '%setupmode%'=='setup' goto :setup
        if '%setupmode%'=='update' goto :update
        echo Invalid answer. Check you typed your answer exactly without any extra spaces or etc.
        goto :question

:setup
cls
echo  _____     _     ____   ____   ___   ____   ____   _____  _____  _   _  ____  
echo ^|  ___^|   / \   ^| __ ^) ^|  _ \ ^|_ _^| / ___^| / ___^| ^| ____^|^|_   _^|^| ^| ^| ^|^|  _ \ 
echo ^| ^|_     / _ \  ^|  _ \ ^| ^|_^) ^| ^| ^| ^| ^|     \___ \ ^|  _^|    ^| ^|  ^| ^| ^| ^|^| ^|_^) ^|
echo ^|  _^|   / ___ \ ^| ^|_^) ^|^|  _ ^<  ^| ^| ^| ^|___   ___^) ^|^| ^|___   ^| ^|  ^| ^|_^| ^|^|  __/ 
echo ^|_^|    /_/   \_\^|____/ ^|_^| \_\^|___^| \____^| ^|____/ ^|_____^|  ^|_^|   \___/ ^|_^|  v0.2.4
echo.                                                                       
echo.
echo.
    @timeout /t 2 >nul 2>&1
echo Installation will begin in a second, a window will pop up and you'll be asked to change some settings.
    @timeout /t 3 >nul 2>&1
echo Make sure to change the "Minecraft Version" option to "1.20.1," and then click install.
    @timeout /t 3 >nul 2>&1
echo Ignore the "Loader Version" and "Launcher Location" options, in all likelihood they don't apply to you.
    @timeout /t 3 >nul 2>&1

echo.
echo.
echo Continue once you've finished reading, and the fabric installer will open.
echo.
echo.
pause

cd %scriptfolder%
start fabricinstaller.exe
    @timeout /t 15 >nul 2>&1

echo.
echo.
echo Once installed, continue.
rem FIX THIS, DETECT PROGRAM
pause

echo.
echo.
echo This next step will install Cloudflared. This is a small program that will open a direct connection to the server.
echo This won't affect you in any way.
    @timeout /t 2 >nul 2>&1
echo.
echo Continue to install Cloudflared. You'll have to agree to their TOS by entering "y" and hitting enter. 
    @timeout /t 3 >nul 2>&1
pause

winget install --id Cloudflare.cloudflared
    @timeout /t 2 >nul 2>&1

:update
    cls
    echo  _   _  ____   ____      _     _____  _____ 
    echo ^| ^| ^| ^|^|  _ \ ^|  _ \    / \   ^|_   _^|^| ____^|
    echo ^| ^| ^| ^|^| ^|_^) ^|^| ^| ^| ^|  / _ \    ^| ^|  ^|  _^|  
    echo ^| ^|_^| ^|^|  __/ ^| ^|_^| ^| / ___ \   ^| ^|  ^| ^|___ 
    echo  \___/ ^|_^|    ^|____/ /_/   \_\  ^|_^|  ^|_____^| v0.2.4
    echo.
        @timeout /t 1 >nul 2>&1   
    echo Continue to update your mods folder with the files contained in this setup folder. 
    echo.
        @timeout /t 2 >nul 2>&1   
    echo This will delete all the previously existing files in the folder, so if you've downloaded
    echo and installed mods before, now's the time to back them up to another folder.
        @timeout /t 2 >nul 2>&1
    echo This will also create a desktop shortcut to open the cloudflared tunnel for convenience.
    echo You WILL receive errors in the console. Don't be alarmed.
        @timeout /t 2 >nul 2>&1
    pause
    cd %scriptfolder%
    start tunnelcopier.bat    
    ::modupdater
        cd %modfolder%
        for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
            @timeout /t 3 >nul 2>&1
        xcopy "%newmodfolder%" "%modfolder%" /e
        @timeout /t 6 >nul 2>&1
    echo DONE!
    rem could be much better

:endscript
    cls 
    echo  ____   _____  _____  _   _  ____     ____   ___   __  __  ____   _      _____  _____  _____  _ 
    echo / ___^| ^| ____^|^|_   _^|^| ^| ^| ^|^|  _ \   / ___^| / _ \ ^|  \/  ^|^|  _ \ ^| ^|    ^| ____^|^|_   _^|^| ____^|^| ^|
    echo \___ \ ^|  _^|    ^| ^|  ^| ^| ^| ^|^| ^|_^) ^| ^| ^|    ^| ^| ^| ^|^| ^|\/^| ^|^| ^|_^) ^|^| ^|    ^|  _^|    ^| ^|  ^|  _^|  ^| ^|
    echo  ___^) ^|^| ^|___   ^| ^|  ^| ^|_^| ^|^|  __/  ^| ^|___ ^| ^|_^| ^|^| ^|  ^| ^|^|  __/ ^| ^|___ ^| ^|___   ^| ^|  ^| ^|___ ^|_^|
    echo ^|____/ ^|_____^|  ^|_^|   \___/ ^|_^|      \____^| \___/ ^|_^|  ^|_^|^|_^|    ^|_____^|^|_____^|  ^|_^|  ^|_____^|^(_^)
    echo.

        @timeout /t 3 >nul 2>&1
    echo This program will close once you continue.
    pause
    cd %keyfolder%
    echo this file enables quick upgrade mode in the setup script for lobotomyland>> %USERPROFILE%\Documents\lobotomyland.key
    exit

:fastmode
    cls
        echo   _____ _    ____ _____   _   _ ____   ____ ____      _    ____  _____ 
        echo  ^|  ___/ \  / ___^|_   _^| ^| ^| ^| ^|  _ \ / ___^|  _ \    / \  ^|  _ \^| ____^|
        echo  ^| ^|_ / _ \ \___ \ ^| ^|   ^| ^| ^| ^| ^|_^) ^| ^|  _^| ^|_^) ^|  / _ \ ^| ^| ^| ^|  _^|  
        echo  ^|  _/ ___ \ ___^) ^|^| ^|   ^| ^|_^| ^|  __/^| ^|_^| ^|  _ ^<  / ___ \^| ^|_^| ^| ^|___ 
        echo  ^|_^|/_/   \_\____/ ^|_^|    \___/^|_^|    \____^|_^| \_\/_/   \_\____/^|_____^| v0.2.4
        echo.
        echo.
    echo Do you want to update? If you enter [N] NO, you'll be sent to the setup menu.
    echo You should generally only have to enter [Y] YES, unless you haven't run through the standard setup script before.
    echo.
    :question2
        set choice=
            set /p setupmode2=Do you want to upgrade? [Y/N]:
            if '%setupmode2%'=='n' goto :setup
            if '%setupmode2%'=='y' goto :fastupdate
            echo Invalid answer. Check you typed your answer exactly without any extra spaces or etc.
            goto :question2

:fastupdate
    cls
    echo  _   _  ____   ____      _     _____  _____ 
    echo ^| ^| ^| ^|^|  _ \ ^|  _ \    / \   ^|_   _^|^| ____^|
    echo ^| ^| ^| ^|^| ^|_^) ^|^| ^| ^| ^|  / _ \    ^| ^|  ^|  _^|  
    echo ^| ^|_^| ^|^|  __/ ^| ^|_^| ^| / ___ \   ^| ^|  ^| ^|___ 
    echo  \___/ ^|_^|    ^|____/ /_/   \_\  ^|_^|  ^|_____^| v0.2.4
    echo.
    echo Creating tunnel...
    cd %scriptfolder%
    start tunnelcopier.bat    
    @timeout /t 1 >nul 2>&1
    echo Deleting old files and copying...
        cd /d %modfolder%
        del *.jar
        @timeout /t 1 >nul 2>&1
        xcopy %newmodfolder% %modfolder% /e /y
        echo ===============================
        echo DONE! Continue to close window.
        echo ===============================
        pause


