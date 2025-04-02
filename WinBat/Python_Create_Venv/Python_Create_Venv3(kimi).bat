@echo off
setlocal enabledelayedexpansion

REM 检查是否提供了参数
if "%~1"=="" (
    echo 请提供项目目录或项目名称作为参数
    exit /b 1
)

REM 判断参数是否是完整路径
if "%~1:~1,1%"=="\" (
    set "project_dir=%~1"
) else (
    set "project_dir=D:\Code\%~1"
)

REM 获取项目目录名作为虚拟环境名
for %%i in ("%project_dir%") do set "venv_name=%%~nxi"

REM 创建项目目录
md "%project_dir%" 2>nul
if %errorlevel% neq 0 (
    echo 创建目录失败: %project_dir%
    exit /b 1
)

REM 进入项目目录
cd /d "%project_dir%"

REM 创建虚拟环境
python -m venv "%venv_name%"

REM 激活虚拟环境
call "%project_dir%\%venv_name%\Scripts\activate.bat"

echo 虚拟环境已激活: %venv_name%
endlocal