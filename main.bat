rem ���ð汾��
rem 20xx.xxָ20xx���x�µ�x������
set ver=Dev.2022.7c
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
md %tempFiles%
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
more /E /T4 Data\Texts\inside\about_us.helptext
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
echo.    [2] ʵ�ù���
echo     [P] ���� Windows ϵͳ����
echo.
@REM echo     [S] ����
echo.    [A] ���ڡ���
echo     [I] ��ϵ����
echo     [Q/E] EXIT
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c B12PSAIQEL /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==0 (
    rem �û��жϲ�����
    echo NO TRUE CHOICE INPUT
)
if %ERRORLEVEL%==255 (
    rem CHOICE.exe��������״̬��
    set ERRORCODE=CSBB/API:Choice.BackErrorCode
    call subbatch\errorscreen.bat
)
if %ERRORLEVEL%==1 (
    rem ģ�����
    set errorcode=CSBB/main:Debug.BOOM
    call subbatch\errorscreen.bat
)
if %ERRORLEVEL%==12 api\openurl.exe -u https://space.bilibili.com/1987247870
if %ERRORLEVEL%==2 goto sys_show/menu
if %ERRORLEVEL%==3 goto sysUsefull/menu
if %ERRORLEVEL%==4 call SubBatch\winsat.bat
@REM if %ERRORLEVEL%==5 call SubBatch\settings.bat
if %ERRORLEVEL%==6 goto CSBB/about
if %ERRORLEVEL%==7 goto CSBB/Issues
if %ERRORLEVEL%==8 goto CSBB/exit.sure
if %ERRORLEVEL%==9 goto CSBB/exit.sure
if %ERRORLEVEL%==10 api\openurl.exe -u https://gitee.com/kdXiaoyi/changing-sys-by-bat/blob/master/LICENSE/
goto CSBB/menu

:sys_show/menu
cls
echo ^> ϵͳ���
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [J] ���ÿ�ݷ�ʽС��ͷ
echo.    [X] ���á�
echo     [1] �Ҽ��˵��е��Կ����ò˵�����
@REM echo     [U] ����[�ɹ�����Windows]����
echo     [C] �Ҽ��˵�������/�Ƴ�[����·��]ѡ��
echo     [A] ΪWindows 8+����AeroЧ��
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0JX1UCA /N /M ����ѡ��һ��^>
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
if %ERRORLEVEL%==7 call SubBatch\Aero.bat
goto sys_show_menu

:sysUsefull/menu
cls
echo ^> ʵ�ù���
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [A] Android Debug Bridge
echo.    [C] ��������
echo     [R] #�ڴ��������#                                          (BETA VERSION)
echo     [N] Ntsd - Microsoft Windows Debugger
echo     [T] ���þ���ٳ�
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0CANRTI /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 goto CSBB/menu
if %ERRORLEVEL%==2 (
    cls
    echo.
    echo  ����������...
    echo.
    echo tempĿ¼/�ļ�
    del %temp%\*.* /q
    del %tmp%\*.* /q
    del C:\*.tmp /q
    del D:\*.log /q
    del C:\*.tmp /q
    del D:\*.log /q
    del %windir%\temp\*.* /q
    echo Ӧ�ñ����󱨸��ļ�
	del /q /f /s "%LOCALAPPDATA%\microsoft\windows\wer\reportArchive\*.*"
	del /q /f /s "%LOCALAPPDATA%\microsoft\windows\wer\reportQueue\*.*"
    echo ramEmpty
    api\ramEmpty.exe *
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
@REM echo     [3] ��ע���
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
goto sysUsefull/ramEmpty.menu

:CSBB/Issues
cls
echo ^> CSBB���ⷴ��
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] �ύIssues (��Ҫ��¼��Github)
echo     [2] �ύ�����ʼ� (��Ҫ��¼��QQ)
echo     [3] �鿴ȫ����Issues
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0123 /N /M ����ѡ��һ��^>
@REM cls
if "%ERRORLEVEL%"=="1" goto csbb/menu
if "%ERRORLEVEL%"=="2" api\openurl.exe -u http://github.com/kdXiaoyi/change-sys-by-bat/issues/new
if "%ERRORLEVEL%"=="3" api\openurl.exe -u http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme^&email=9cTHzMTDwcPBxcS1hITblpqY
if "%ERRORLEVEL%"=="4" api\openurl.exe -u http://github.com/kdXiaoyi/change-sys-by-bat/issues/
cls
goto csbb/menu