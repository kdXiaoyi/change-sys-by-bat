rem ���ð汾��
set ver=Dev.2022.21a
set y=2022
goto HEAD

:head
@echo off
cls
title Change System By Batch - [%ver%]
goto getUACAdmin

:CSBB/api.load
rem �޸���Ļ��С
mode CON: COLS=80 LINES=30
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
goto CSBB/menu

:getUACAdmin
@REM rem ����path·��
@REM if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
rem ͨ������bcd�ķ����ж��Ƿ���UAC����ԱȨ��
bcdedit >>nul
if "%RunByNoAdmin%"=="1" goto CSBB/api.load
set RunByNoAdmin=0
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)

:UACPrompt
rem ͨ��VBS�����õ�UAC����ԱȨ��
rem mshta��һ������ִ��JS/VBS�ű��������й���
%1 start "CSBB/GetUACAdmin:getting" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit 0 /b
exit 0 /b

:UACAdmin
cd /d "%~dp0"
echo ��ǰ����·���ǣ�%CD%
echo �ѻ�ȡ����ԱȨ��
set IsGotUAC=1
set IsGetUAC=1
goto CSBB/api.load

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
api\OpenURL.exe -e -u %CrashFile%
exit

:CSBB/about
cls
echo ^> About us
echo ================================================================================
more /E /T4 texts\about_us.helptext
echo ================================================================================
echo ��������ء���
pause>nul
goto CSBB/menu

:CSBB/exit.sure
cls
echo ^> EXIT Screen
echo ================================================================================
echo.
echo         ��ȷ��Ҫ�˳���
echo.
echo  ����[Y]���س�����ɲ�����
echo.
echo Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%sysbit%
set /p input=^> 
if "%input%"=="Y" exit
if "%input%"=="y" exit
goto CSBB/menu

:CSBB/menu
cls
echo ^> ���˵�
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] ϵͳ���
echo.    [2] ϵͳʵ��
echo     [3] ����ľ����רɱ/Ԥ������
echo     [S] ���� Windows ϵͳ����
echo.
echo.    [A] About us
echo     [Q/E] EXIT
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c P12AQE3S /N /M ����ѡ��һ��^>
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
if %ERRORLEVEL%==2 goto sys_show/menu
if %ERRORLEVEL%==3 goto sysUsefull/menu
if %ERRORLEVEL%==4 goto CSBB/about
if %ERRORLEVEL%==5 goto CSBB/exit.sure
if %ERRORLEVEL%==6 goto CSBB/exit.sure
if %ERRORLEVEL%==7 call SubBatch\Virus_Defender.bat
if %ERRORLEVEL%==8 call SubBatch\winsat.bat
goto CSBB/menu

:sys_show/menu
cls
echo ^> ϵͳ��۲˵�
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [A] ���ÿ�ݷ�ʽС��ͷ
echo.    [B] ���á�
echo     [1] �Ҽ��˵��е��Կ����ò˵�����
echo     [U] ����[�ɹ�����Windows]����
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0AB1U /N /M ����ѡ��һ��^>
echo.
if %ERRORLEVEL%==2 (
    rem ɱ�������������
    echo ���棡 �⽫�����Aero��ë����Ч��һ��ʱ�䣬û�лָ�������ǰ��[���Ի�]���ã�
    echo.
    taskkill /f /im explorer.exe
    taskkill /f /im dwm.exe
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,196" /t reg_sz /f
    attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
    rem �޸�iconcache�ļ�
    ren "%userprofile%\AppData\Local\iconcache.db" "%userprofile%\AppData\Local\iconcache_BANNED.db"
    attrib +s +r +h "%userprofile%\AppData\Local\iconcache_BANNED.db"
    start explorer.exe
    start dwm.exe
    echo Change Ok.
    pause
    goto sys_show_menu
)
if %ERRORLEVEL%==3 (
    rem ɱ�������������
    echo ���棡 �⽫�����Aero��ë����Ч��һ��ʱ�䣬û�лָ�������ǰ��[���Ի�]���ã�
    echo.
    taskkill /f /im explorer.exe
    taskkill /f /im dwm.exe
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
    attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
    rem �޸�iconcache�ļ�
    del /q "%userprofile%\AppData\Local\iconcache.db"
    attrib +s +r +h "%userprofile%\AppData\Local\iconcache.db"
    start explorer.exe
    start dwm.exe
    echo Change Ok.
    pause
    goto sys_show_menu
)
if %ERRORLEVEL%==4 call SubBatch\display_yjmenu.bat
if %ERRORLEVEL%==1 goto CSBB/menu
if %ERRORLEVEL%==5 start /d %windir%\system32 WindowsAnytimeUpgradeResults.exe
goto sys_show_menu

:sysUsefull/menu
cls
echo ^> ϵͳʵ��
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [A] Android Debug Bridge
echo.    [C] ��������
echo     [N] Ntsd - Microsoft Windows Debugger
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0CAN /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 goto CSBB/menu
if %ERRORLEVEL%==2 (
    cls
    echo.
    echo  ����������...
    echo.
    rem tempĿ¼
    del %temp%\*.* /q
    del %tmp%\*.* /q
    rem .TMP/log �ļ�
    del C:\*.tmp /q
    del D:\*.log /q
    del C:\*.tmp /q
    del D:\*.log /q
    rem ��������Ŀ¼
    del %windir%\temp\*.* /q
)
if %ERRORLEVEL%==3 call SubBatch\Android_Debug_Bridge.bat
if %ERRORLEVEL%==4 call SubBatch\ntsd.bat
goto sysUsefull/menu