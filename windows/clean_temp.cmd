@echo off
echo Are sure you want clean temporal files? 
pause  
del /s /q %temp% 
msg * cleaned!
endlocal