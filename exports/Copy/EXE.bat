@echo off
copy NUL exe.log > nul
set logfile=exe.log
call :loghere > %logfile%
exit /b

:loghere
if exist "C:\Program Files\LOVE\" (
    goto 7z
) else (
    echo you need to install LOVE First
    echo visit https://love2d.org/downloads
)
:7z
if exist "C:\Program Files\7-Zip\7z.exe" (
    if exist "code/main.lua" (
            goto zip
        ) else (
        echo You need a main file here.
        pause
        exit
    )
    
) else (
    start "" http://www.7zip.org/download.html
)

:zip

cd code
"C:\Program Files\7-Zip\7z.exe" a -tzip "../build/gameZip/game.love" .
cd ..
goto bin

:bin
echo.
if exist "build/exe/" (
    goto build
) else ( 
    cd build
    mkdir exe
    cd ..
    goto build
)


:build
rem time to build
echo Building has started
echo.
copy /b "../../exports/windowsPlugin/" "build/exe/"
copy NUL "build/exe/game.exe"
cd build/exe
copy /b "../gamezip/" . 
copy /b "C:\Program Files\LOVE\love.exe"+"game.love" "game.exe"
del game.love
"game.exe"

cd ../../../