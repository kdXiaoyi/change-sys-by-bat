cls
echo.
if "%IsGotUAC%" NEQ "1" (
    echo    ����Ȩ�޲��㡣
    echo  [User] ^< Need:[UAC-Admin]
    echo.
    ping 127.0.0.1 -n 5 >nul
    call main.bat
)
set input=00000
set password=%random%%random%
echo  [�����ļ�·��(^&A)]�˵� - ����˵��
echo.
echo  û�о��Զ���ӣ��оͻ�ɾ��
echo  ���[D:\]��[�Ҽ��˵�.ico]����������Ϊ�Ҽ��˵���ͼ��
echo.
echo  ������֤���������
echo     ^> %password% ^<
echo.
set /p input=Captcha Code Here ^> 
echo.
if "%password%"=="%input%" (
    rem ��֤����ȷ
    echo Good Captcha Code
    goto AODCPIRMM/work
) ELSE (
    echo ��֤�����
)
rem ��������֤����ɺ��ͨ�ò���
goto AODCPIRMM/back

:AODCPIRMM/back
echo.
echo ��������ء���
pause>nul
call main.bat

:AODCPIRMM/work
for /f "tokens=2 delims=[" %%i in ('ver') do (
    for /f "tokens=2,3 delims=. " %%j in ("%%i") do if %%j LSS 10 (
        set input=156
    ) else (
        set input=-5302
    )
)
if exist "D:\�Ҽ��˵�.ico" (
    reg query "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)">nul 2>nul && (reg delete "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)" /f >nul & echo ��ִ��ɾ������ & goto AODCPIRMM/back) || (reg add "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)" /v "icon" /t REG_SZ /d "%cd%\�Ҽ��˵�.ico" /f & reg add "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)\command" /ve /t REG_SZ /d "cmd /c echo \"%%1\"<nul|clip" /f & echo ��װ���! & goto AODCPIRMM/back)
) else (
    reg query "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)">nul 2>nul && (reg delete "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)" /f >nul & echo ��ִ��ɾ������ & goto AODCPIRMM/back) || (reg add "HKCR\AllFilesystemObjects\shell\�����ļ�·��(&A)\command" /ve /t REG_SZ /d "cmd /c echo \"%%1\"<nul|clip" /f & echo ��װ���! & goto AODCPIRMM/back)
)
goto AODCPIRMM/back