@echo off
setlocal

REM ===== 配置 =====
set AHK_COMPILER="E:\Environment\bin\Ahk2Exe.exe"
set AHK_BASE="C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

set SRC="%~dp0RMT.ahk"
set BUILD_DIR="%~dp0build"
set OUT="%~dp0build\RMT.exe"

REM ===== 创建 build 目录 =====
if not exist %BUILD_DIR% (
    echo Creating build directory...
    mkdir %BUILD_DIR%
)
if exist %OUT% (
    echo Delete existing one...
    del %OUT%
)

REM ===== 编译 =====
echo Building RMT...

%AHK_COMPILER% ^
/in %SRC% ^
/out %OUT% ^
/base %AHK_BASE%

if %errorlevel% neq 0 (
    echo.
    echo Build FAILED.
    exit /b %errorlevel%
)

echo.
echo Build SUCCESS!
echo Output: %OUT%

endlocal
