rem ���ð汾��
set Appver=Dev.2022.4b
goto HEAD

:head
@echo off
cls
title CSBB
goto CSBB/api.load

:CSBB/api.load
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
echo      %i%% complete
echo.
echo            If you want to feed back, give me this info:
echo            E-Mail Address : popo0713@foxmail.com
echo            Stop code : %errorcode%
echo.
echo  Any key to open error info.
pause>nul
api\OpenURL.exe -e -u %CrashFile%
exit

:CSBB/exit.sure
cls
echo ^> EXIT Screen
echo ===================================================================
echo.
echo         ��ȷ��Ҫ�˳���
echo.
echo  ����[Y]���س�����ɲ�����
echo.
echo Made by kdXiaoyi. 2022��Ȩ����
echo ===================================================================
echo SysBit=x%sysbit%
set /p input=^> 
if "%input%"=="Y" exit
if "%input%"=="y" exit
goto CSBB/menu

:CSBB/menu
cls
echo ^> ���˵�
echo ===================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] ϵͳ���
echo.    [2] ϵͳʵ��
echo.
echo.    [A] About us
echo     [Q/E] EXIT
echo  Made by kdXiaoyi. 2022��Ȩ����
echo ===================================================================
echo SysBit=x%SysBit%
api\choice.exe /c P12AQE /N /M ����ѡ��һ��^>
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
goto menu

:sys_show/menu
cls
echo ^> ϵͳ��۲˵�
echo ===================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] ���ÿ�ݷ�ʽС��ͷ
echo.    [2] ���á�
echo     [3] �Ҽ��˵��е��Կ����ò˵�����
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. 2022��Ȩ����
echo ===================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0123 /N /M ����ѡ��һ��^>
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
    attrib -s -r -h "%userprofile%\AppData\Local\iconcache_BANNED.db"
    rem �޸�iconcache�ļ�
    ren "%userprofile%\AppData\Local\iconcache_BANNED.db" "%userprofile%\AppData\Local\iconcache.db"
    attrib +s +r +h "%userprofile%\AppData\Local\iconcache.db"
    start explorer.exe
    start dwm.exe
    echo Change Ok.
    pause
    goto sys_show_menu
)
if %ERRORLEVEL%==4 call SubBatch\display_yjmenu.bat
if %ERRORLEVEL%==1 goto CSBB/menu
goto sys_show_menu

:sysUsefull/menu
cls
echo ^> ϵͳʵ��
echo ===================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [C] ��������
echo.
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. 2022��Ȩ����
echo ===================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0C /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 goto CSBB/menu
if %ERRORLEVEL%==2 (
    cls
    echo.
    echo  ����������...
    echo.
    rem tempĿ¼
    erase %temp%\*.* -q -s
    erase %tmp%\*.* -q -s
    rem .TMP/log �ļ�
    del C:\*.tmp -q -s
    del D:\*.log -q -s
    del C:\*.tmp -q -s
    del D:\*.log -q -s
    rem ��������Ŀ¼
    erase %windir%\temp\*.* -q -s
)
goto user_menu