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

:vd/kill.WORM.Microsoft_Word,WsF
echo ԭ���ߣ�[@���ø���]����ɾ��   ԭ���ߵİ�Ȩ������About�˵���
echo.
echo ����������ڲ�ɱ������Ϊ"MICROSOFT_WORD.WSF"��U����没��
echo �������U���е����п�ݷ�ʽ�������ű�
echo ���ָ����������ص��ļ���ʾ
set input=00000
set password=%random%%random%
echo.
echo  ������֤���������
echo     ^> %password% ^<
echo.
set /p input=Captcha Code Here ^> 
echo.
if "%password%"=="%input%" (
    cls
    echo.
    echo �����У����Ժ�...
    echo.
    echo ���ڲ��Ҳ����ű�...
    if not exist "C:\Users\Administrator\AppData\Roaming\Microsoft Office\Microsoft Word.WsF" (
        echo     ���ļ������δ��Ⱦ�˲�����
    ) else (
        echo     ��⵽������
        echo �����������...
        for /F "delims=, tokens=2" %%i IN ('tasklist /fo csv /fi "imagename eq WSCRIPT.EXE" /nh') DO start "CSBB/ntsd:kill.imagename" api\ntsd.exe -c q -p %%i
        taskkill /f /t /im wscript.exe >nul 2>nul
        del /f /s /q "C:\Users\Administrator\AppData\Roaming\Microsoft Office\" >nul 2>nul
        echo     �����������
    )
    echo ���ڻָ�U���ļ�ϵͳ...
    echo     �˹��̿��ܺ�ʱ�ϳ��������ĵȴ�...
    rem ��һ��for /f �ο���[@Batcher]��˼·����wmic��ȡ���ƶ������̷�
    for /f "tokens=2 delims==" %%D in ('wmic LogicalDisk where "DriveType='2'" get DeviceID /value') do (
        rem %%D���ǿ��ƶ������̷���
        del /f /s /q "%%D\Microsoft Word.WsF" >nul 2>nul
        attrib -r -a -s -h %%D\*.* /s /d >nul 2>nul
        echo     �ѻָ��ļ���ʾ��
        del %%D\*.lnk /f /s /q >nul 2>nul
        echo     �����������Ч��ݷ�ʽ��
    )
    echo.
    echo ��ɱ��ɣ���������˳�...
    pause>nul
) ELSE (
    rem ��֤�����
    echo Bad Captcha Code
    pause>nul
)
rem ��������֤����ɺ��ͨ�ò���
goto vd/menu