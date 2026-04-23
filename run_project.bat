@echo off
SETLOCAL EnableDelayedExpansion

:: Set colors for better visibility
COLOR 0A

echo ===================================================
echo    LogSense AI - Analytics System Launcher
echo ===================================================
echo.

:: Check if Node.js is installed
node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is not installed or not in PATH.
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

:: Check for node_modules
IF NOT EXIST "node_modules\" (
    echo [INFO] node_modules not found. Installing dependencies...
    echo This might take a few minutes...
    call npm install
    IF !ERRORLEVEL! NEQ 0 (
        echo [ERROR] Dependency installation failed.
        pause
        exit /b !ERRORLEVEL!
    )
    echo [SUCCESS] Dependencies installed.
) ELSE (
    echo [INFO] Dependencies are already present.
)

echo.
echo [INFO] Starting the development server...
echo.

:: Run the dev server
:: Using call to ensure the script continues if needed, though npm run dev usually stays open
call npm run dev

IF !ERRORLEVEL! NEQ 0 (
    echo.
    echo [ERROR] Failed to start the development server.
    pause
)

ENDLOCAL
