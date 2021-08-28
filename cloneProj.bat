@echo off
title Project Init
if exist "C:/Program Files/Git/" (
    ping -n 1 github.com > logs/internet.log
    goto check
) else (
    echo "[MAIN]: Cannot Find Package Git-Scm. Does It Need To Be Installed?"
    echo "[MAIN]: Cannot Find Package Git-Scm. Does It Need To Be Installed?" > logs/main.log
    pause
    exit
)

:check

if errorlevel 1 (
    echo "error: bat:35"
    echo "traceback:"
    echo "Check your internet connection (-1)"
    echo "exception(e) Cannot Connect to github.com"
    echo "this proccess was canceled due to an error please check the error"
    echo.
    pause
    exit
) else ( Goto cproj )

:cproj

cd projects

set /p Input1=What is the Git Repository's Author:  
set /p Input2=What is the Git Repository's Name:  

if exist %Input2% (
    echo.
    echo "error: bat:32"
    echo "traceback:"
    echo "Duplicate file error (-1)"
    echo "exception(e) fatal: destination path 'st-dylanengine-project' already exists and is not an empty directory."
    echo "this Clone Proccess was Canceled due to an error please check the error"
    pause
    exit
) else (
    goto clone
)

:clone

git clone https://github.com/%Input1%/%Input2%.git



if exist %Input2% (
    goto done
) else (
    echo.
    echo "error: bat:32"
    echo "traceback:"
    echo "    Duplicate file error (-1)"
    echo "    exception(e) A duplicate file name exists, or the file cannot be found."
    echo "this project was deleted due to an error please check the error"
    pause
    exit
)


:done
cd %Input2%
echo Done!
pause
vscode .
exit