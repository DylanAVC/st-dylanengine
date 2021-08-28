@echo off
cls
title windowsPlugin.cmd Init
echo Project Init Lib
echo %cd%
set /p a=name:  

cd "Copy/"
copy "exe.bat" "../../projects/%a%/"

pause