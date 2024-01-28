@echo off
setlocal enabledelayedexpansion

REM Get the current date in YYYYMMDD format
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
   set day=%%a
   set month=%%b
   set year=%%c
)
set CURRENT_DATE=!year!!month!!day!

REM Define the output directory
set OUTPUT_DIR=C:\dev\Environment_Variables_backup

REM Check if the directory exists
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

REM Export the environment variables
set > "%OUTPUT_DIR%\%CURRENT_DATE%_Environment_Variables.txt"
