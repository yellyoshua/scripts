@echo off
echo Release internet connection and clean dns records
echo Continue?
pause
ipconfig /all
ipconfig /release
ipconfig /renew
ipconfig /flushdns
msg * internet connection updated!
endlocal