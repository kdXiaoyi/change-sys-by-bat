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
api\choice.exe /c p /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==0 (
    rem �û��жϲ�����
    echo NO TRUE CHOICE INTUT
)
if %ERRORLEVEL%==255 (
    rem CHOICE.exe��������״̬��
    set ERRORCODE=CSBB/API:Choice.ErrorEffect
    goto Error
)
if %ERRORLEVEL%==1 (
    rem ģ�����
    set errorcode=CSBB/main:Debug.BOOM
    goto error
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
goto menu

:Error
rem ��ʾ������Ϣ
color F4
title Stopped by a error ^| ERRORCODE^>%Errorcode%
rem д��������Ϣ
set i=1
set CrashFile="%temp%\CSBB\Crash-s\\"
md %CrashFile%
echo Crash Report >>"%CrashFile%\CRASH_REPORT.log"
echo ================================================= >>"%CrashFile%\CRASH_REPORT.log"
set i=20
echo  ^> Oh,no,this is the 115414th crash report! >>"%CrashFile%\CRASH_REPORT.log"
echo. >>"%CrashFile%\CRASH_REPORT.log"
echo Time = %time2% >>"%CrashFile%\CRASH_REPORT.log"
echo Errorcode = %errorcode% >>"%CrashFile%\CRASH_REPORT.log"
echo SysBit = x%SysBit% >>"%CrashFile%\CRASH_REPORT.log"
echo SysVer =  >>"%CrashFile%\CRASH_REPORT.log"
Ver >>"%CrashFile%\CRASH_REPORT.log"
set i=50
echo Lang = %LANG% >>"%CrashFile%\CRASH_REPORT.log"
echo SysDrive = %SystemDrive% >>"%CrashFile%\CRASH_REPORT.log"
echo PROCESSOR ARCHITECTURE = %PROCESSOR_ARCHITECTURE% >>"%CrashFile%\CRASH_REPORT.log"
echo OS Center = %OS% >>"%CrashFile%\CRASH_REPORT.log"
echo Command Spec = %ComSpec% >>"%CrashFile%\CRASH_REPORT.log"
echo Temp File = %temp% >>"%CrashFile%\CRASH_REPORT.log"
echo App Ver = %AppVer% >>"%CrashFile%\CRASH_REPORT.log"
echo. >>"%CrashFile%\CRASH_REPORT.log"
set i=98
echo Sub.End () >>"%CrashFile%\CRASH_REPORT.log"
set i=100
rem ��ӡ������Ϣ
cls
echo.
echo    : (
echo .
echo     This program ran into a problem and needs to restart. We're just
echo     collecting some error info, and then we'll show them for you.
echo.
echo      %i%% complete
echo.
echo            If you want to feed back, give me this info:
echo            E-Mail Address : popo0713@foxmail.com
echo            Stop code : %errorcode%
echo.
echo  Any key to open error info.
pause>nul
api\OpenURL.exe -e -u %CrashFile%