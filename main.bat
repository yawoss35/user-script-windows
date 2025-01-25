@echo off
:: Yönetici izni kontrolü
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Running as Administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Buradan itibaren yönetici izinleriyle çalışır
echo Administrator mode active!
@echo off
:menu
cls
echo *********
echo   Menu
echo *********
echo.
echo 1) List Users on Windows
echo 2) Create a New User
echo 3) Change a Users Password
echo 4) Delete a User Account
echo.
set /p choice=Choose an option: 

if "%choice%"=="1" (
    net user
    pause
    goto menu
) else if "%choice%"=="2" (
    set /p user=Enter username: 
    set /p pass=Enter password: 
    echo Creating user %user%...
    net user %user% %pass% /add
    if errorlevel 1 (
        echo Error! Failed to create user. Please run this script as Administrator.
    ) else (
        echo User created successfully!
    )
    pause
    goto menu
) else if "%choice%"=="3" (
    set /p chguser=Enter username to change password: 
    set /p chgpass=Enter new password: 
    echo Changing password for %chguser%...
    net user %chguser% %chgpass%
    if errorlevel 1 (
        echo Error! Failed to change password. Please run this script as Administrator.
    ) else (
        echo Password changed successfully!
    )
    pause
    goto menu
) else if "%choice%"=="4" (
    set /p deluser=Enter username to delete: 
    echo Deleting user %deluser%...
    net user %deluser% /delete
    if errorlevel 1 (
        echo Error! Failed to delete user. Please run this script as Administrator.
    ) else (
        echo User deleted successfully!
    )
    pause
    goto menu
) else (
    echo Error! Invalid option.
    pause
    goto menu
)
