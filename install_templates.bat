@echo off

:NoDomain
set INSTALLPATH=C:\Users\%username%\AppData\Local\FlashDevelop\

:Continue

XCOPY "%cd%"\flashdevelopTemplates "%INSTALLPATH%Projects\" /S /y

pause