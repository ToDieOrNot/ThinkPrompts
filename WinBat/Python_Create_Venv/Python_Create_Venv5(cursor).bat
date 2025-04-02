@echo off
setlocal EnableDelayedExpansion

REM 检查是否提供了参数
if "%~1"=="" (
    echo 错误：请提供项目目录路径
    echo 用法：Python_Create_Venv.bat [项目目录路径]
    exit /b 1
)

REM 获取项目路径
set "PROJECT_PATH=%~1"

REM 检查是否是相对路径（不包含冒号，表示没有驱动器号）
echo !PROJECT_PATH! | findstr ":" >nul
if errorlevel 1 (
    REM 是相对路径，添加默认目录D:\Code
    set "PROJECT_PATH=D:\Code\!PROJECT_PATH!"
)

REM 获取项目目录名（最后一个文件夹名）
for %%i in ("!PROJECT_PATH!") do set "PROJECT_NAME=%%~ni"

REM 创建项目目录
echo 创建项目目录: !PROJECT_PATH!
md "!PROJECT_PATH!" 2>nul

REM 切换到项目目录
echo 切换到项目目录: !PROJECT_PATH!
cd /d "!PROJECT_PATH!"

REM 创建虚拟环境
echo 创建虚拟环境: !PROJECT_NAME!
python -m venv !PROJECT_NAME!

REM 激活虚拟环境
echo 激活虚拟环境
call "!PROJECT_PATH!\!PROJECT_NAME!\Scripts\activate.bat"

echo.
echo 虚拟环境已成功创建并激活！
echo 项目目录: !PROJECT_PATH!
echo 虚拟环境: !PROJECT_NAME!

endlocal 