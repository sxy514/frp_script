@echo off 
title Process Monitor

:again
tasklist|findstr -i "frpc.exe"
if ERRORLEVEL 1 (
	echo FRP is off in %Date:~0,4%-%Date:~5,2%-%Date:~8,2% %Time:~0,2%:%Time:~3,2%
	start /b D:\FRP\frpc.exe -c D:\FRP\frpc.toml
)
choice /t 30 /d y /n > nul  
 
goto again
