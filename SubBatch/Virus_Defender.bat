rem ################################################################################
rem ��ʶ�ڵ���ɣ�
rem [(��)�����ռ�]/[��1].[��2].��.[��n]
rem                                                  [CSBB]��Ϊ�������ռ�ʱ�������������ռ�
rem Virus_Defender.bat�У������ռ�Ϊ[vd]
rem ################################################################################
rem �ڵ���ɣ�
rem /menu.
rem  �˵�
rem     .x
rem      ��ζ��������ĸΪ[x]�ļ���ҳ
rem /kill.         ([��������].[������])
rem  ɱ��������
rem     .worm.
rem      �����
rem     .blackmail.
rem      ������
rem ################################################################################

if not "%isgotuac%"=="1" (
    echo off
    cls
    echo.
    echo    ����Ȩ�޲��㡣
    echo  [User] ^< Need:[UAC-Admin]
    echo.
    ping 127.0.0.1 -n 5 >nul
    call main.bat
)
goto vd/menu

:vd/menu
cls
echo ^> Virus Defender - �����������˵�
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo  ������ĸ�����Ҷ�Ӧ������֧�ֲ��ҵ��У�
echo.
echo.    [M] 
echo.
echo     [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0m /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 call main.bat
if %ERRORLEVEL%==2 goto vd/menu.M
goto vd/menu

:vd/menu.M
cls
echo ^> Virus Defender - �����������˵� -^> ����ĸ[M]
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] (����ɱ^|���) Microsoft Word.WsF
echo.
echo     [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 01 /N /M ����ѡ��һ��^>
cls
if %ERRORLEVEL%==1 goto vd/menu
if %ERRORLEVEL%==2 goto vd/kill.WORM.Microsoft_Word,WsF
goto vd/menu

:Error
rem ��ʾ������Ϣ
color F4
title Stopped by a error ^| ERRORCODE^>%Errorcode%
rem д��������Ϣ
set i=1
set CrashFile="%temp%\CSBB\Crash-s\%Random%%Random%%Random%%Random%%Random%\"
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
echo CPU NAME = %PROCESSOR_ARCHITECTURE% >>"%CrashFile%\CRASH_REPORT.log"
echo CPU INFO = %PROCESSOR_ARCHITEW6432% >>"%CrashFile%\CRASH_REPORT.log"
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
echo      %i% % complete
echo.
echo            If you want to feed back, give me this info:
echo            E-Mail Address : popo0713@foxmail.com
echo            Stop code : %errorcode%
echo.
echo  Any key to open error info.
echo   ERROR_INFO_FILE=%CrashFile%
pause>nul
api\OpenURL.exe -u https://game.bilibili.com/linkfilter/?url=%CrashFile%
exit 65535

:vd/kill.WORM.Microsoft_Word,WsF
echo ԭ���ߣ�[@���ø���]   ԭ���ߵİ�Ȩ������About�˵���
echo.
echo 