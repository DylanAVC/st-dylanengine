@echo off
copy NUL gz.log > nul
set logfile=gz.log
call :loghere > %logfile%
exit /b

:loghere
if exist "C:\Program Files\7-Zip\7z.exe" (
    goto zip
) else (
    start "" http://www.7zip.org/download.html
)

:zip
cd code
"C:\Program Files\7-Zip\7z.exe" a -tzip "../build/gameZip/game.love" .

"../build/gameZip/game.love"

echo Done!
