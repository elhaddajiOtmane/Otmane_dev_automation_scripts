@echo off
set DATESTAMP=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%
set BACKUP_FILE=backup_%DATESTAMP%.sql
set LOG_FILE=log_%DATESTAMP%.txt
mysqldump -u root whatbox > "C:\dev\databases_backup\%BACKUP_FILE%" 2> "C:\dev\databases_backup\%LOG_FILE%"
