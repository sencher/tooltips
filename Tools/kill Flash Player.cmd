echo off
tasklist /fi "imagename eq flashplayer*" |find ":" > nul
if errorlevel 1 taskkill /f /im "flashplayer*"
exit