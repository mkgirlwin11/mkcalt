@echo off
setlocal enabledelayedexpansion

set "NAME=mkcalt"
set "DEVELOPER=mkgirl"
set "VERSION=0.1"

if "%1"=="" (
    echo %NAME% v%VERSION% by %DEVELOPER%
    echo Simple batch calculator.
    echo.
    echo Usage: %NAME% [number] operator [number]
    echo Type "%NAME% help" for more info.
    exit /b 0
)

if /i "%1"=="help" goto :help
if "%1"=="/?" goto :help

if /i "%1"=="x32" (
    echo 2147483647
    exit /b 0
)
if /i "%1"=="x64" (
    echo 9223372036854775807
    exit /b 0
)
if /i "%1"=="hi" (
    echo hi
    exit /b 0
)
if /i "%1"=="Hello" if /i "%2"=="world" (
    echo hi user
    exit /b 0
)

set "num1=%1"
set "op=%2"
set "num2=%3"

if "%1"=="++" if not "%2"=="" (
    set /a _r=%2 + 1
    echo !_r!
    exit /b 0
)
if "%1"=="--" if not "%2"=="" (
    set /a _r=%2 - 1
    echo !_r!
    exit /b 0
)
if "%2"=="++" (
    set /a _r=%1 + 1
    echo !_r!
    exit /b 0
)
if "%2"=="--" (
    set /a _r=%1 - 1
    echo !_r!
    exit /b 0
)

if "%op%"=="" (
    echo Error: No operator specified.
    exit /b 1
)

if "%num2%"=="" (
    if /i "%op%"=="x32" (
        set /a _d=2147483647 - !num1!
        echo !_d!
        exit /b 0
    )
    if /i "%op%"=="x64" (
        echo 64-bit signed max: 9223372036854775807
        echo Your number: !num1!
        exit /b 0
    )
    echo Error: Missing operand.
    exit /b 1
)

if "%op%"=="**" (
    set /a _b=!num1!
    set /a _e=!num2!
    if !_e! lss 0 (
        echo Error: Negative exponent not supported.
        exit /b 1
    )
    if !_e! gtr 100 (
        echo Error: Exponent too large.
        exit /b 1
    )
    set /a _r=1
    for /l %%i in (1,1,!_e!) do set /a _r*=_b
    echo !_r!
    exit /b 0
)

if "%op%"=="//" (
    set /a _r=!num1! / !num2!
    echo !_r!
    exit /b 0
)

set /a _r=!num1! !op! !num2!
echo !_r!
exit /b 0

:help
echo %NAME% v%VERSION% by %DEVELOPER%
echo.
echo A simple batch calculator.
echo.
echo Usage: %NAME% [number] operator [number]
echo.
echo Operators:
echo   +   Addition
echo   -   Subtraction
echo   *   Multiplication
echo   /   Division
echo   **  Exponentiation
echo   //  Integer division
echo   ++  Increment by 1
echo   --  Decrement by 1
echo.
echo Special:
echo   x32        Show 32-bit signed max value
echo   N x32      Distance from 32-bit max
echo   x64        Show 64-bit signed max value
echo   N x64      Show 64-bit context
echo   Hello world  Display greeting
echo   hi         Display greeting
echo.
echo Examples:
echo   %NAME% 5 + 3
echo   %NAME% 2 ** 10
echo   %NAME% 100 x32
exit /b 0
