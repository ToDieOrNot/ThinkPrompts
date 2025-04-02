@echo off
setlocal enabledelayedexpansion

REM 检查参数是否存在
if "%~1"=="" (
    echo 错误：请提供项目目录名或路径。
    exit /b 1
)

set "arg1=%~1"

REM 确定项目目录（处理绝对路径和相对名称）
if not "%arg1:~1,1%"==":" (
    set "project_dir=D:\Code\%arg1%"
) else (
    set "project_dir=%arg1%"
)

REM 创建项目目录
md "%project_dir%" 2>nul
if not exist "%project_dir%" (
    echo 无法创建目录：%project_dir%
    exit /b 1
)

REM 切换到项目目录
cd /d "%project_dir%"
if errorlevel 1 (
    echo 无法切换到目录：%project_dir%
    exit /b 1
)

REM 提取虚拟环境名（取路径最后一段）
for %%I in ("%project_dir%") do set "venv_name=%%~nxI"

REM 创建虚拟环境
echo 正在创建虚拟环境 "%venv_name%"...
python -m venv "%venv_name%"
if errorlevel 1 (
    echo 错误：创建虚拟环境失败。
    exit /b 1
)

REM 在新窗口中激活虚拟环境
start "" cmd /k ""%project_dir%\%venv_name%\Scripts\activate.bat""

endlocal