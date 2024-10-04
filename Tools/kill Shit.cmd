echo off

tasklist /fi "imagename eq *svn*" |find ":" > nul
if errorlevel 1 taskkill /f /im "*svn*"

tasklist /fi "imagename eq skype*" |find ":" > nul
if errorlevel 1 taskkill /f /im "skype*"

tasklist /fi "imagename eq *Adobe*" |find ":" > nul
if errorlevel 1 taskkill /f /im "*Adobe*"

exit
