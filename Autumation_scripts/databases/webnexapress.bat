@echo off
setlocal enabledelayedexpansion

REM Set the MySQL database information
set DB_NAME=webnexspress
set DB_USER=root

REM Get the current date in YYYYMMDD format
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
   set day=%%a
   set month=%%b
   set year=%%c
)
set DATESTAMP=!year!!month!!day!

REM Define the backup file name
set BACKUP_FILE=backup_!DB_NAME!_!DATESTAMP!.sql
set LOG_FILE=log_!DB_NAME!_!DATESTAMP!.txt

REM Perform the MySQL dump
mysqldump -u !DB_USER! !DB_NAME! > "C:\dev\databases_backup\!BACKUP_FILE!" 2> "C:\dev\databases_backup\!LOG_FILE!"

echo Database backup completed: !BACKUP_FILE!
