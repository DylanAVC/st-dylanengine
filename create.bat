@echo off
title Project Init
if exist "C:/Program Files/Git/" (
    Goto cproj
) else (
    start "" "https://git-scm.com/"
    exit
)

:cproj

set /p Input1=What is the name Of the Project:  

set RepoQ=
set /p RepoQ=Do you want to create a Git Repository?:  
if not '%RepoQ%'=='' set RepoQ=%RepoQ:~0,1%
IF '%RepoQ%'=='Y' GOTO RepoQYes
IF '%RepoQ%'=='y' GOTO RepoQYes
IF '%RepoQ%'=='N' GOTO RepoQNo
IF '%RepoQ%'=='n' GOTO RepoQNo
IF '%RepoQ%'=='' GOTO RepoQNo
rem i copied and pasted this from https://gist.github.com/jcefoli/fb9400aafee2ac585db3

:RepoQNo
cd projects
goto clone

:RepoQYes
cd projects
git clone https://github.com/st-developer-owner/st-dylanengine-project.git
if exist st-dylanengine-project (
    goto clone2
) else (
    echo.
    echo.
    echo "error: bat:35"
    echo "traceback:"
    echo "    Check your internet connection (-1)"
    echo "    exception(e) fatal: unable to access 'https://github.com/st-developer-owner/st-dylanengine-project.git/': Could not resolve host: github.com"
    echo "this project was canceled due to an error please check the error"
    pause
    exit
)
:clone2
ren st-dylanengine-project %Input1%
if exist %Input1% (
    cd %Input1%
    git init
    echo Done!
    pause
    vscode .
) else (
    echo.
    echo.
    echo "error: bat:46"
    echo "traceback:"
    echo "Duplicate file error (-1)"
    echo "exception(e) A duplicate file name exists, or the file cannot be found."
    rd st-dylanengine-project
    echo "this project was deleted due to an error please check the error"
    pause
    exit
)


:clone
git clone https://github.com/st-developer-owner/st-dylanengine-project.git
ren st-dylanengine-project %Input1%
cd %Input1%
rd .git
echo Done!
pause
code .
