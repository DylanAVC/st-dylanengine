@echo off
title Project Add Library
cd exports
dir /A:D
cd ..
echo.
set /p Library=What is the Librarys name?:  
echo {"Name":"st-dylanengine-plugins-%Library%","Lib":"PluginLib","author":"Unknown"} > "exports/%Library%.json"
"%Library%"

cd exports
windowsPlugin.cmd

