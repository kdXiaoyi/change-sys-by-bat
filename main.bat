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
goto menu