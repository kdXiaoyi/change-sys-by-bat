goto HEAD

:head
@echo off
cls
goto api_load

:menu
cls
echo ^> ���˵�
echo ===================================================================
echo         Welcome to [Changing SYS by Bat]
echo.
echo.
echo.
echo.
echo  Made by kdXiaoyi. 2022��Ȩ����
echo ===================================================================
echo SysBit=x%SysBit%
choice.exe /c 1234567890 /N /M ����ѡ��һ��^>
if %ERRORLEVEL%==0 (
    rem �û��жϲ�����
    echo NO TRUE CHOICE INTUT
)
if %ERRORLEVEL%==255 (
    rem CHOICE.exe��������״̬��
    set ERRORCODE=API.Choice.ErrorEffect
    goto Error
)
goto menu

:api_load
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
cd "%cd%\API"
goto menu

:Error
rem ��ʾ������Ϣ
color 