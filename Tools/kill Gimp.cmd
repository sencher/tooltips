echo off

tasklist /fi "imagename eq gimp*" |find ":" > nul
if errorlevel 1 taskkill /f /im "gimp*"

tasklist /fi "imagename eq dds.exe" |find ":" > nul
if errorlevel 1 taskkill /f /im "dds.exe*"

exit
