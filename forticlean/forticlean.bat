:: FortiClean 4 FortiClient EMS
@echo off
title FortiClean 
echo Skrypt uruchomi ponownie komputer w trybie awaryjnym,
echo po zalogowaniu przez uzytkownika wykona zadania zmieniajace konfiguracje uslug.
echo
echo Utworzy na pulpicie uzytkownika skrypty uruchamiajace/zatrzymujace FortiClient'a.
echo Nastepnie uruchomi komputer w normalnym trybie i usunie katalog roboczy.
echo
md C:\scripttemp
cd C:\scripttemp

:: tworzenie clean.bat dla trybu awaryjnego
echo title Skrypt trybu awaryjnego FortiClean > clean.bat
echo cd \scripttemp >> clean.bat
echo bcdedit /deletevalue {current} safeboot >> clean.bat
echo sc config FA_Scheduler start= demand >> clean.bat
echo sc config FCT_SecSvr start= demand >> clean.bat
echo sc config fortiapd start= demand >> clean.bat
echo sc config FortiAptFilter start= demand >> clean.bat
echo sc config FortiDeviceGuard start= demand >> clean.bat
echo sc config fortiElam start= demand >> clean.bat
echo sc config FortiFilter start= demand >> clean.bat
echo sc config FortiFW start= demand >> clean.bat
echo sc config fortiloader start= demand >> clean.bat
echo sc config fortimon3 start= demand >> clean.bat
echo sc config Fortips start= demand >> clean.bat
echo sc config FortiShield start= demand >> clean.bat
echo sc config fortisniff start= demand >> clean.bat
echo sc config FortiTransCtrl start= demand >> clean.bat
echo sc config FortiWF start= demand >> clean.bat
echo reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "!clean" /t REG_SZ /d "C:\Windows\system32\cmd.exe /c rd /s /q C:\scripttemp" /f >> clean.bat
echo shutdown /r /f /t 00 >> clean.bat

:: tworzenie froti_start.bat i kopiowanie go na pulpit
echo title FortiClient Start Script > forti_start.bat
echo sc failure FA_Scheduler reset= 86400 actions= ////// >> forti_start.bat
echo net start FA_Scheduler >> forti_start.bat
xcopy /y "C:\scripttemp\forti_start.bat" "%userprofile%\desktop\*"

:: tworzenie forti_stop.bat i kopiowanie go na pulpit
echo title FortiClient Stop Script > forti_stop.bat
echo sc failure FA_Scheduler reset= 86400 actions= ////// >> forti_stop.bat
echo taskkill /im scheduler.exe /F >> forti_stop.bat
echo taskkill /im FortiSettings.exe /F >> forti_stop.bat
echo taskkill /im FortiTray.exe /F >> forti_stop.bat
echo taskkill /im FortiSSLVPNdaemon.exe /F >> forti_stop.bat
echo taskkill /im fortiesnac.exe /F >> forti_stop.bat
echo taskkill /im fortifws.exe /F >> forti_stop.bat
echo taskkill /im fortiproxy.exe /F >> forti_stop.bat
echo taskkill /im fortiwf.exe /F >> forti_stop.bat
echo taskkill /im scheduler.exe /T /F >> froti_stop.bat
xcopy /y "C:\scripttemp\forti_stop.bat" "%userprofile%\desktop\*"

:: uruchomienie utworzonego skryptu w trybie awaryjnym
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*!fortimod" /t REG_SZ /d "C:\scripttemp\clean.bat" /f
bcdedit /set {current} safeboot minimal
shutdown /r /f /t 00