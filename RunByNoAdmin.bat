@echo off
cls
rem �޸���Ļ��С
mode CON: COLS=80 LINES=30
title CSBB/GetUACAdmin:noAdmin.run.sure
rem ͨ������bcd�ķ����ж��Ƿ���UAC����ԱȨ��
bcdedit >>nul
if '%errorlevel%' NEQ '0' (echo ^> ȷ��Ҫ��û��UAC��ȡ�������������?) else (call main.bat)
echo ================================================================================
echo.
echo   ������󲿷ֹ�����ҪUAC��Ȩ�ſ������С�
echo    ���ޱ�Ҫ����ֱ��˫��[Main.bat]���С�
echo.
echo  ȷ���밴[Y]���س�����ɲ�����
echo    ֱ�ӻس������������С�
echo.
echo ================================================================================
set /p input=^> 
if 115414-%input%==115414-y goto sure
if 115414-%input%==115414-Y goto sure
echo Bad Input.
set RunByNoAdmin=0
call main.bat

:sure
echo.
set RunByNoAdmin=1
echo RunByNoAdmin=%RunByNoAdmin%
call main.bat