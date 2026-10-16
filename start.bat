@echo off
rem Prefer an ASCII junction to the project root when one is present:
rem C++ libraries inside torch/sentencepiece cannot open files whose path
rem contains non-ASCII characters, and a junction keeps every path derived
rem from __file__ ASCII. Falls back to this script's own directory.
set "APP_DIR=%~dp0"
if exist "D:\LiveTranslate\.venv\Scripts\python.exe" set "APP_DIR=D:\LiveTranslate\"
set PATH=%LOCALAPPDATA%\Microsoft\WinGet\Links;%PATH%

if not exist "%APP_DIR%.venv\Scripts\python.exe" (
    echo [ERROR] Virtual environment not found.
    echo Please run install.bat first to set up the environment.
    echo.
    pause
    exit /b 1
)

if not exist "%APP_DIR%.venv\.livetranslate-ready" (
    echo [ERROR] Virtual environment setup is incomplete.
    echo Please run install.bat again to finish installing and verifying dependencies.
    echo.
    pause
    exit /b 1
)

echo Starting LiveTranslate...
"%APP_DIR%.venv\Scripts\python.exe" "%APP_DIR%main.py"
if errorlevel 1 (
    echo.
    echo [ERROR] LiveTranslate exited with an error.
    pause
)
