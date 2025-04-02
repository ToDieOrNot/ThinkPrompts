@echo off
setlocal enabledelayedexpansion

:: Default path prefix
set "default_path_prefix=D:\Code\"

:: Parse command line arguments
set "path_to_create="

:parse_args
if "%~1"=="" goto :end_parse
set "arg=%~1"

:: Check if the argument is --path
if "!arg:~0,6!"=="--path" (
    set "path_part=!arg:--path=!"
    if defined path_part (
        set "path_to_create=!path_part!"
    ) else (
        shift
        if "%~1"=="" (
            echo Error: Missing value for --path
            exit /b 1
        )
        set "path_to_create=%~1"
        shift
    )
) else (
    :: Check if the argument is path=
    if "!arg:~0,5!"=="path=" (
        set "path_to_create=!arg:path=!"
    ) else (
        :: Default to the first argument as the path
        if not defined path_to_create (
            set "path_to_create=%~1"
        )
    )
    shift
)
goto :parse_args

:end_parse

:: Handle default path
if not defined path_to_create (
    echo Error: Path not specified
    exit /b 1
)

:: Check if the path is absolute
if "!path_to_create:~1,1!"==":" (
    set "final_path=!path_to_create!"
) else (
    set "final_path=!default_path_prefix!!path_to_create!"
)

:: Ensure the path exists
if not exist "!final_path!" (
    echo Creating directory: !final_path!
    mkdir "!final_path!" 2>nul
    if !errorlevel! neq 0 (
        echo Failed to create directory: !final_path!
        exit /b 1
    )
)

:: Output the final path
echo Final path: !final_path!

:: Change to the specified directory
cd /d "!final_path!" || (
    echo Failed to change directory to: !final_path!
    exit /b 1
)

:: Check if the Python executable already exists
set "python_exe=!final_path!\Scripts\python.exe"
if exist "!python_exe!" (
    echo Python executable already exists at: !python_exe!
    echo Skipping virtual environment creation.
) else (
    :: Create a virtual environment
    set "venv_name=ENV_DIR"
    python -m venv "!venv_name!" || (
        echo Failed to create virtual environment: !venv_name!
        exit /b 1
    )
)

:: Activate the virtual environment
set "activate_script=!final_path!\Scripts\activate.bat"
if exist "!activate_script!" (
    call "!activate_script!" || (
        echo Failed to activate virtual environment.
        exit /b 1
    )
    echo Virtual environment activated successfully.
) else (
    echo Activate script not found: !activate_script!
    exit /b 1
)