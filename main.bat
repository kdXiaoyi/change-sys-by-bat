rem ���ð汾��
rem 20xx.xxָ20xx���x�µ�x������
set ver=Dev.2022.5a
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
rem �����ӳٱ�����չ(����ʹ��[!]��Ϊ�ӳٱ���)
SetLocal EnabledElayedExpansion
rem ������ʱĿ¼
set tmp="%temp%\CSBB"
set tmp\="%temp%\CSBB\"
set tempFiles="%temp%\CSBB"
set tempFiles\="%temp%\CSBB\"
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
set IsGotUACAdmin=1
set IsGetUACAdmin=1
goto CSBB/api.load

:CSBB/about
cls
echo ^> About us
echo ================================================================================
more /E /T4 Data\Texts\about_us.helptext
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
echo     [3] #����ľ����רɱ/Ԥ������#                              (Test Version)
echo     [S] ���� Windows ϵͳ����
echo.
echo.    [A] About us
echo     [Q/E] EXIT
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c P12AQE3SH /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==0 (
    rem �û��жϲ�����
    echo NO TRUE CHOICE INTUT
)
if %ERRORLEVEL%==255 (
    rem CHOICE.exe��������״̬��
    set ERRORCODE=CSBB/API:Choice.ErrorEffect
    call subbatch\errorscreen.bat
)
if %ERRORLEVEL%==1 (
    rem ģ�����
    set errorcode=CSBB/main:Debug.BOOM
    call subbatch\errorscreen.bat
)
if %ERRORLEVEL%==2 goto sys_show/menu
if %ERRORLEVEL%==3 goto sysUsefull/menu
if %ERRORLEVEL%==4 goto CSBB/about
if %ERRORLEVEL%==5 goto CSBB/exit.sure
if %ERRORLEVEL%==6 goto CSBB/exit.sure
if %ERRORLEVEL%==7 call SubBatch\Virus_Defender.bat
if %ERRORLEVEL%==8 call SubBatch\winsat.bat
if %ERRORLEVEL%==9 api\openurl.exe https://gitee.com/kdXiaoyi/changing-sys-by-bat/blob/master/LICENSE/
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
echo     [C] �Ҽ��˵�������/�Ƴ�[����·��]ѡ��
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0AB1UC /N /M ����ѡ��һ��^>
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
if %ERRORLEVEL%==6 call SubBatch\AddOrDeleteCopyPathInRightMouseMenu.bat
goto sys_show_menu

:sysUsefull/menu
cls
echo ^> ϵͳʵ��
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [A] Android Debug Bridge
echo.    [C] ��������
echo.    [D] ɾ��ϵͳ����
echo.    [E] ɾ��ϵͳ����(�����)
echo     [R] #�ڴ��������#                                          (BETA VERSION)
echo     [N] Ntsd - Microsoft Windows Debugger
echo     [T] ���þ���ٳ�
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0CANRT /N /M ����ѡ��һ��^>
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
	del /q /f /s "%LOCALAPPDATA%\microsoft\windows\wer\reportArchive\*.*"
	del /q /f /s "%LOCALAPPDATA%\microsoft\windows\wer\reportQueue\*.*"
	rem Ӧ�ñ����󱨸��ļ�
    del %windir%\temp\*.* /q
)
if %ERRORLEVEL%==3 call SubBatch\Android_Debug_Bridge.bat
if %ERRORLEVEL%==4 call SubBatch\ntsd.bat
if %ERRORLEVEL%==5 goto sysUsefull/ramEmpty.menu
if %ERRORLEVEL%==6 call subbatch\ImageFileExecutionOptions.bat
goto sysUsefull/menu

:sysUsefull/ramEmpty.menu
cls
echo ^> �ڴ��������
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] �����ͷ��ڴ�
@REM echo.    [2] ע���ͷ��ڴ�Ϊ����(�����Ϳ��Զ�ʱ�ͷ���)
echo     [3] ��ע���
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0123 /N /M ����ѡ��һ��^>
@REM cls
if "%ERRORLEVEL%"=="1" goto sysUsefull/menu
if "%ERRORLEVEL%"=="2" (
    echo Working...
    echo ^> �ͷ��ڴ�
    echo ================================================================================
    start "RAM Cleaner" /wait api\ramEmpty.exe *
    echo.
    echo Finish Working.
    ping 127.0.0.1 -n 2 >nul
    goto sysUsefull/ramEmpty.menu
)
rem �����ӳٱ�����չ(����ʹ��[!]��Ϊ�ӳٱ���)
SetLocal EnabledElayedExpansion
if "%ERRORLEVEL%"=="3" (
    if not "%isgotuacadmin%"=="1" (
        cls
        echo.
        echo    ����Ȩ�޲��㡣
        echo  [User] ^< Need:[UAC-Admin]
        echo.
        ping 127.0.0.1 -n 5 >nul
        goto sysUsefull/ramEmpty.menu
    )
    echo Working...
    echo ^> ע���ͷ��ڴ�Ϊ����
    echo ================================================================================
    echo ��װ�ͷ��ڴ�APIΪפ��API����
    copy api\ramEmpty.exe "%windir%\system32\"
    attrib +r +a +s "%windir%\system32\ramEmpty.exe"
    echo ʵ��RamEmpty����������
    if exist "%ALLUSERSPROFILE%\CSBB\API.Stay\ramEmpty_.bat" (
        echo.
        echo ������Ѿ���װ�������ˡ�ǿ�Ƽ������ܻ�������⡣
        echo.
        echo ǿ�Ƽ�����[Ctrl]+[C]      ȷ����[Y]
        echo.
        api\choice /c Y /N /M (Y/Ctrl+C)^>
        if %ERRORLEVEL%==1 goto sysUsefull/ramEmpty.menu
    )
    md "%ALLUSERSPROFILE%\CSBB\API.Stay\"
    echo.
    echo "%windir%\system32\ramEmpty.exe" * >"%ALLUSERSPROFILE%\CSBB\API.Stay\ramEmpty_.bat"
    echo ����һ������ֵ���⽫��Ϊ�ͷ��ڴ�������е�Ƶ��(����)��
    echo *Ĭ��30����
    echo *�������һ��1-599940֮�������(int)
    set /p input=^> 
    if "!input!"=="" set input=30
    schtasks create /ru SYSTEM /sc daily /d * /m * /tn AutoCleanRAM /rt !input! /rl highest /tr "%ALLUSERSPROFILE%\CSBB\API.Stay\ramEmpty_.bat"
)
rem �����ӳٱ�����չ(����ʹ��[!]��Ϊ�ӳٱ���)
SetLocal EnabledElayedExpansion
if "%ERRORLEVEL%"=="4" (
    if not "%isgotuacadmin%"=="1" (
        cls
        echo.
        echo    ����Ȩ�޲��㡣
        echo  [User] ^< Need:[UAC-Admin]
        echo.
        ping 127.0.0.1 -n 5 >nul
        goto sysUsefull/ramEmpty.menu
    )
    echo Working...
    echo ^> ��ע���ͷ��ڴ�Ϊ����
    echo ================================================================================
    api\choice.exe /c YN /N /M ж���ͷ��ڴ�APIΪפ��API?(Y/N)^> 
    if %ERRORLEVEL%==1 (
        attrib -r -a -s "%windir%\system32\ramEmpty.exe"
        del /f /q "%windir%\system32\ramEmpty.exe"
    )
    echo ж��RamEmpty����������
    del /f /q "%ALLUSERSPROFILE%\CSBB\API.Stay\ramEmpty_.bat"
    sc stop AutoCleanRAM 1:5:20 "Stop service for unsetup AutoCleanRAM"
    sc delete AutoCleanRAM
)
ping 127.0.0.1 -n 3 >nul
goto sysUsefull/ramEmpty.menu
