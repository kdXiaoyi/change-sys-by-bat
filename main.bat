rem ���ð汾��
set Appver=Dev.0.0.1.0
goto HEAD

:head
@echo off
cls
title CSBB
goto api_load

:menu
cls
echo ^> ���˵�
echo ===================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.
echo.
echo.
echo  Made by kdXiaoyi. 2022��Ȩ����
echo ===================================================================
echo SysBit=x%SysBit%
choice.exe /c 1234567890 /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==0 (
    rem �û��жϲ�����
    echo NO TRUE CHOICE INTUT
)
if %ERRORLEVEL%==255 (
    rem CHOICE.exe��������״̬��
    set ERRORCODE=CSBB/API:Choice.ErrorEffect
    goto Error
)
goto menu

:api_load
rem ���ϵͳλ��
set SysBit=UNKNOW
if EXIST %windir%\SysWOW64\ (
    rem x64
    set SysBit=64
) ELSE (
    rem x86
    set SysBit=86
)
echo SysBit=x%SysBit%
rem ��ʼ��API����
cd "%cd%\API"
goto menu

:Error
rem ��ʾ������Ϣ
color FC
title Stopped by a error ^| ERRORCODE^>%Errorcode%
rem д��������Ϣ
set time2=%time%
md "%temp%\CSBB\Crash\"
set CrashFile="%temp%\CSBB\Crash-s\%time2%\"
echo Crash Report >>%CrashFile%
echo ================================================= >>%CrashFile%
echo  ^> Oh,no,this is the 115414th crash report! >>%CrashFile%
echo. >>%CrashFile%
echo Time = %time2% >>%CrashFile%
echo Errorcode = %errorcode% >>%CrashFile%
echo SysBit = x%SysBit% >>%CrashFile%
echo SysVer =  >>%CrashFile%
Ver >>%CrashFile%
echo Lang = %LANG% >>%CrashFile%
echo SysDrive = %SystemDrive% >>%CrashFile%
echo PROCESSOR ARCHITECTURE = %PROCESSOR_ARCHITECTURE% >>%CrashFile%
echo OS Center = %OS% >>%CrashFile%
echo Command Spec = %ComSpec% >>%CrashFile%
echo Temp File = %temp% >>%CrashFile%
echo App Ver = %AppVer% >>%CrashFile%
echo. >>%CrashFile%
echo Sub.End () >>%CrashFile%