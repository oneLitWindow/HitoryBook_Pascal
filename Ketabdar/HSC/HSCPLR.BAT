@echo off
cls
c:\clrfil
if "%1" == "" echo			       --- ERROR! use: HSCplr {filename.hsc}
if "%1" == "" echo			     Press any key to EXIT HSCPLR batch file...
if "%1" == "" pause>nul
if "%1" == "" goto e1xite
echo					Preparing to play...
c:\dos\hscplay.exe %1 >nul
echo						     Done!
echo.
Echo			   Press any key to Stop Playing...'%1'
if exist c:\dos\vgafade.exe c:\dos\vgafade.exe >nul
if exist c:\dos\vgafade.exe goto ende
pause>nul
:ende
hscplay >nul
echo.
echo					     Stopped.
:e1xite
echo.
getkeys
