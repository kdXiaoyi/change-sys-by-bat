if NOT "%isgotuac%"=="1" (
    cls
    echo.
    echo    ����Ȩ�޲��㡣
    echo  [User] ^< Need:[UAC-Admin]
    echo.
    ping 127.0.0.1 -n 5 >nul
    call main.bat
) else (goto win11/menu)

:win11/menu
cls
echo ^> Windows 11 ר��
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo       ! ����ר��ΪWin11�û���д�Ĺ��ܣ�����ϵͳ������ʹ�á�
echo.
echo     [S] ��װStartAllBack(Win11��Դ��������У����)
echo.
echo     [1] ������
echo.
echo     [0] EXIT
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 01 /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 call main.bat
if %ERRORLEVEL%==2 goto win11/taskbar
if %ERRORLEVEL%==3 goto win11/startallback
goto win11/menu

:win11/taskbar
cls
echo ^> Windows 11 ר�� - ������
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo     [1] ��������С
echo     [2] ������λ��
echo.
echo     [0] ����
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c 120 /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==1 goto win11/taskbar.size
if %ERRORLEVEL%==2 goto win11/taskbar.pos
if %ERRORLEVEL%==3 goto win11/menu
goto win11/taskbar

:win11/taskbar.size
echo.
echo ����һ����Сֵ��Ĭ��Ϊ1��
set size=1
api\choice.exe /c 102 /N /M ��0~2ѡ��һ��^>
if %ERRORLEVEL%==1 set size=1
if %ERRORLEVEL%==2 set size=0
if %ERRORLEVEL%==3 set size=2
if "%size%"=="-1" set size=1
rem Reg�ı���������С
rem HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarSi [DWORD 32] = %size%
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarSi /t REG_DWORD /d %size% /f
echo Reg��������
echo Restart Explorer
taskkill /f /im explorer.exe
start explorer.exe
echo Finished.
ping 127.0.0.1 -n 5 >nul
goto win11/taskbar

:win11/taskbar.pos
echo.
echo U=�Ϸ� D=�·� 
echo ����΢�����ƣ����ҷ�����BUG
echo ����һ��ֵ��Ĭ��ΪU��
set p=-1
api\choice.exe /c UDLR /N /M ��[U,D]ѡ��һ��^>
if %ERRORLEVEL%==1 set p=01
if %ERRORLEVEL%==2 set p=03
if %ERRORLEVEL%==4 set p=02
if %ERRORLEVEL%==3 set p=04
if "%p%"=="-1" set p=03
rem 01=�������� 03=��������
for /f "tokens=1-2*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings^|find /i "Settings"') do (
  rem �г�ָ��ע���2���Ƶ�ȫ�����ݲ����������
  set settings=%%C
)
echo ԭ�ȣ�%settings%
rem ƴ�ձ����е�25-26�ַ�������
set settings=%settings:~0,24%%p%%settings:~26%
echo ����Ϊ��%settings%
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /t REG_BINARY /d %settings% /f
echo �������ݣ�
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings |find /i "Settings"
echo Restart Explorer
taskkill /f /im explorer.exe
start explorer.exe
echo Finished.
ping 127.0.0.1 -n 5 >nul
goto win11/taskbar

:win11/StartAllBack
cls
echo ^> Windows 11 ר�� - StartAllBack
echo ================================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo     StartAllBack��һ�ֿ�������߶��Զ���Win11��Դ�������Ĺ��ߡ�
echo       - ��ʼ�˵�������win7��һ������
echo       - �������������������win10��
echo       - ��Դ���ڣ��°治�ÿ�����
echo ���ĺ���Ӫ������û��?
echo.
echo  *������Ҫ����������
echo.
echo     [X] ȡ��    [Y] ��װ
echo  Made by kdXiaoyi. %y%��Ȩ����
echo ================================================================================
echo SysBit=x%SysBit%
api\choice.exe /c XY /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==2 goto win11/StartAllBack.install else goto win11/menu

:win11/StartAllBack.install
@REM api\taskbarmsg.exe 9000;;�������ⲿ��վ - CSBB/WIN11#@0;;StartAllBack 3.5 repacked ���̷���;; ;;data\startallback.ico
rem  api������Ҫ��д
api\taskbarmsg.exe "�������ⲿ��վ - CSBB/WIN11" "StartAllBack 3.5 repacked ���̷���" 2 "" data\startallback.ico
api\openurl.exe -u https://pan.huang1111.cn/s/6KAziN