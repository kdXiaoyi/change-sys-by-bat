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
goto IFEO/menu

rem ����ٳ����õ�ע���
rem  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options

rem ��� abc.exe �Ľٳ�Ϊ 123.exe
rem reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\abc.exe" /t REG_SZ /v debugger /d 123.exe
rem ɾ�� abc.exe �Ľٳ�����
rem reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\abc.exe" /f

:ifeo/menu
cls
echo ^> ����ٳֹ���
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [A] ��������ٳ�������
echo.    [D] ɾ������ٳ�������
echo.
echo     [H] �˽�ʲô�Ǿ���ٳ�
echo.
echo.    [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 0HAD /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 call main.bat
if %ERRORLEVEL%==2 (
    cls
    echo ^> ʲô�Ǿ���ٳ�?
    echo ================================================================================
    more /E /T4 texts\HelpForIFEO.helptext
    echo.
    pause >nul
)
cls
if %ERRORLEVEL%==3 goto ifeo/add
if %ERRORLEVEL%==4 goto ifeo/del
goto ifeo/menu

:ifeo/add
echo ^> ����ٳֹ��� ^> ���
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    ���·�����Ҫ�����Ϣ���� 
echo.
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
set /p input=���ٳֵľ�����^> 
set /p i=�ٳֵ��ĳ�����(�������������)^> 
echo.
echo From : %input%
echo To   : %i%
echo Time : %time%
echo Date : %date%
for /f %%o in ('api\GetGUID.exe') do (set GUID=%%o)
echo Code : 
:ifeo/del