goto shell.main/reload
:shell.main/input
set input=
if "%isgotuac%"=="1" (set /p input=CSBB SHELL @%whoami% #Root ^> ) else (set /p input=CSBB SHELL @%whoami% ^> )
goto shell.main/doing
:shell.main/reload
echo off
cls
if "%isgotuac%"=="1" (
    title [ADMIN] Change System By Batch - [%ver%] ^| SHELL ^|
    echo --==[Admin mode]==--
    ) else (
    title Change System By Batch - [%ver%] ^| SHELL ^|
)
echo ���� [#exit] �˳�
echo ���� [#help] ��ȡ����
echo ��������������ִ�Сд
if "%loaded%"=="1" (echo Reloaded)
set loaded=1
goto shell.main/input
:shell.main/doing
for /f "tokens=1" %%a in ("%input%") do set cm=%%a
if "%cm%"=="#exit" (
    set loaded=
    call main.bat
)
if "%cm%"=="#help" goto command.help
if "%cm%"=="#reload" goto shell.main/reload
if "%cm%"=="#wiki" api\openurl.exe -u https://github.com/kdXiaoyi/change-sys-by-batch/wiki/CSBB-Shell
cmd.exe /c %input%
goto shell.main/input

:command.help
echo.
echo [CSBB/shell:help]
echo CSBB �ն� �������б�
echo ���������[#wiki]������wiki
echo #######�����ñ��������б���wiki�С���
api\openurl.exe -u https://github.com/kdXiaoyi/change-sys-by-batch/wiki/CSBB-Shell#%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4
goto shell.main/input