@echo off
title Change System By Batch - Debugger (Subbatch)
goto menu
:Debug
title Change System By Batch - Debugger (Subbatch:%WantDebugSubbatch%)
echo ���ð汾�������
set ver=Debugging
set y=2099
echo UAC״̬����
bcdedit >>nul
if '%errorlevel%' NEQ '0' (
    set RunByNoAdmin=1
    set IsGotUAC=0
    set IsGetUAC=0
    set IsGotUACAdmin=0
    set IsGetUACAdmin=0
) else (
    set IsGotUAC=1
    set IsGetUAC=1
    set IsGotUACAdmin=1
    set IsGetUACAdmin=1
)
echo ��չ�ӳٱ�������
SetLocal EnabledElayedExpansion
echo ������ʱĿ¼
set tmp="%temp%\CSBB"
set tmp\="%temp%\CSBB\"
set tempFiles="%temp%\CSBB"
set tempFiles\="%temp%\CSBB\"
echo �޸���Ļ��С
mode CON: COLS=80 LINES=30
echo ���ϵͳλ��
set SysBit=UNKNOW
if EXIST %windir%\SysWOW64\ (
    rem x64
    set SysBit=64
) ELSE (
    rem x86
    set SysBit=86
)
echo SysBit=x%SysBit%
echo ������Ĭ��ִ��Ŀ¼
if not "%s%"=="1" cd /d ..
call subbatch\%WantDebugSubbatch%.bat
:menu
set WantDebugSubbatch=233
cls
echo ^> Debugger (SUBBATCH)
echo ===============================================================================
echo.
echo  ���·�������Ҫ���Ե�Subbatch (����.bat)
echo.
echo ===============================================================================
set /p WantDebugSubbatch=^> 
if %WantDebugSubbatch%_==main_ (
    if exist main.bat (call main.bat) else (
        cd ..
        call main.bat
    )
)
if not EXIST "%WantDebugSubbatch%.bat" (
    if exist subbatch\%WantDebugSubbatch%.bat (
        set s=1
        goto Debug
    )
    echo.
    echo ��Ч�����ơ�
    pause>nul
    goto menu
) else goto Debug