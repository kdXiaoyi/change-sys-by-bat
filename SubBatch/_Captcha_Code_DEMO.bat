@echo off
title CSBB - Captcha Code Model Demo
:demo/loop
cls
set input=00000
set password=%random%%random%
echo.
echo  Captcha Code Model Demo
echo.
echo  ������֤���������
echo     ^> %password% ^<
echo.
set /p input=Captcha Code Here ^> 
echo.
if "%password%"=="%input%" (
    rem ��֤����ȷ
    echo Good Captcha Code
    pause>nul
) ELSE (
    rem ��֤�����
    echo Bad Captcha Code
    pause>nul
)
rem ��������֤����ɺ��ͨ�ò���
goto Demo/loop