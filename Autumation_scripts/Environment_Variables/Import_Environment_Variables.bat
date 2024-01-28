@echo off

REM Define the path to the environment variables text file
set ENV_FILE=C:\dev\Environment_Variables_backup\YYYYMMDD_Environment_Variables.txt

REM Check if the environment file exists
if not exist "%ENV_FILE%" (
    echo Environment variables file not found: %ENV_FILE%
    exit /b 1
)

REM Loop through lines in the text file and set the environment variables
for /f "usebackq tokens=1* delims==" %%a in ("%ENV_FILE%") do (
    set "VAR_NAME=%%a"
    set "VAR_VALUE=%%b"

    REM Use setx to set the environment variable
    setx !VAR_NAME! "!VAR_VALUE!" /m
)

echo Environment variables imported from %ENV_FILE%
