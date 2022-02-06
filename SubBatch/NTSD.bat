@REM ������ģ�
@REM api\ntsd.exe -c q -p [pid]
@REM ����ɱPID
@REM
@REM api\ntsd.exe -p [pid]
@REM ����PID
@REM
@REM for /F "delims=, tokens=2" %%i IN ('tasklist /fo csv /fi "imagename eq [imagename]" /nh') DO start /wait "CSBB/ntsd:kill.imagename" api\ntsd.exe -c q -p %%i
@REM ��Ѱ������Ϊ[imagename]��PID�����ݵ�NTSD(ȥɱ����)
@REM
@echo off
if NOT EXIST api\ntsd.exe (
    set errorcode=CSBB/ntsd:no.ntsd.file
    call subbatch\errorscreen.bat
)
if NOT "%isgotuac%"=="1" (
    cls
    echo.
    echo    ����Ȩ�޲��㡣
    echo  [User] ^< Need:[UAC-Admin]
    echo.
    ping 127.0.0.1 -n 5 >nul
    call main.bat
)

:menu
cls
echo ^> NTSD menu
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.    [1] NTSD ǿɱ���� (������ģʽ)
echo.    [2] NTSD ǿɱ���� (PIDģʽ)
echo.    [3] NTSD ���ٵ��� (������ģʽ)
echo.    [4] NTSD ���ٵ��� (PIDģʽ)
echo.    [5] �г����н���
echo.    [6] ���ݾ�����ȡPID
echo.    [7] ����PIDȡ������
echo.
echo  WARING:NTSD���ڻ����ϵ�����������޷����ԣ�ɱ���������ܾ̾�����
echo.
echo     [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
api\choice.exe /c 01234567 /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 call main.bat
if %ERRORLEVEL%==2 goto imagename.kill
if %ERRORLEVEL%==3 goto pid.kill
if %ERRORLEVEL%==4 goto imagename.debug
if %ERRORLEVEL%==5 goto pid.debug
if %ERRORLEVEL%==6 goto tasklist.all
if %ERRORLEVEL%==7 goto imagename.to.pid
if %ERRORLEVEL%==8 goto pid.to.imagename
goto menu

:tasklist.all
cls
tasklist | more /e /c /p /s
echo.
echo Finish Work.
pause>nul
goto menu

:imagename.to.pid
cls
echo.
echo  ������Ҫת���Ľ���ͼ����
echo.
set /p input=^> 
echo.
tasklist /fo csv /fi "imagename eq %input%" >nul
echo.
for /F "delims=, tokens=2" %%i IN ('tasklist /fo csv /fi "imagename eq %input%" /nh') DO echo %input% -^> %%i
echo.
echo Finish Work.
ping 127.0.0.1 -n 9 >nul
goto menu

:pid.to.imagename
cls
echo.
echo  ������Ҫת���Ľ���PID
echo.
set /p input=^> 
echo.
tasklist /fo csv /fi "pid eq %input%" >nul 2>nul
echo.
for /F "delims=, tokens=1" %%i IN ('tasklist /fo csv /fi "pid eq %input%" /nh') DO echo %input% -^> %%i
echo.
echo Finish Work.
ping 127.0.0.1 -n 9 >nul
goto menu

:imagename.kill
cls
echo.
echo  ������Ҫɱ���Ľ���ͼ����
echo.
set /p input=^> 
echo.
tasklist /fo csv /fi "imagename eq %input%"
echo.
for /F "delims=, tokens=2" %%i IN ('tasklist /fo csv /fi "imagename eq %input%" /nh') DO start /wait "CSBB/ntsd:kill.imagename" api\ntsd.exe -c q -p %%i
echo.
echo Finish Work.
ping 127.0.0.1 -n 3 >nul
goto menu

:pid.kill
cls
echo.
echo  ������Ҫɱ���Ľ���PID
echo.
set /p input=^> 
echo.
tasklist /fo csv /fi "pid eq %input%"
echo.
start /wait "CSBB/ntsd:kill.pid" api\ntsd.exe -p %input%
echo.
echo Finish Work.
ping 127.0.0.1 -n 3 >nul
goto menu

:imagename.debug
cls
echo.
echo  ������Ҫ���ԵĽ���ͼ����
echo.
set /p input=^> 
echo.
tasklist /fo csv /fi "imagename eq %input%"
echo.
for /F "delims=, tokens=2" %%i IN ('tasklist /fo csv /fi "imagename eq %input%" /nh') DO start /wait "CSBB/ntsd:debug.imagename" api\ntsd.exe -c q -p %%i
echo.
echo Finish Work.
ping 127.0.0.1 -n 3 >nul
goto menu

:pid.debug
cls
echo.
echo  ������Ҫ���ԵĽ���PID
echo.
set /p input=^> 
echo.
tasklist /fo csv /fi "pid eq %input%"
echo.
start /wait "CSBB/ntsd:debugs.pid" api\ntsd.exe -p %input%
echo.
echo Finish Work.
ping 127.0.0.1 -n 3 >nul
goto menu
