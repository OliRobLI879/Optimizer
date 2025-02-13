@echo off
:: Windows 10 PC Optimizer Batch Script
:: Created by Your Name
:: Version 3.0

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrative privileges.
) else (
    echo Please run this script as an administrator.
    pause
    exit /b
)

:: Title
title Windows 10 PC Optimizer

:: Main Menu
:menu
cls
echo ==============================
echo    Windows 10 PC Optimizer
echo ==============================
echo 1. Clean Temporary Files
echo 2. Clear DNS Cache
echo 3. Optimize Drives (Defragment)
echo 4. Clear Windows Update Cache
echo 5. Clear Thumbnail Cache
echo 6. Clear Windows Logs
echo 7. Clear Recycle Bin
echo 8. Disable Unnecessary Startup Programs
echo 9. Reset Windows Store Cache
echo 10. Disable Telemetry
echo 11. Disable Cortana
echo 12. Disable Windows Tips
echo 13. Create System Restore Point
echo 14. Perform All Tasks
echo 15. Exit
echo ==============================
set /p choice=Choose an option (1-15): 

if %choice%==1 goto clean_temp
if %choice%==2 goto clear_dns
if %choice%==3 goto optimize_drives
if %choice%==4 goto clear_update_cache
if %choice%==5 goto clear_thumbnail_cache
if %choice%==6 goto clear_logs
if %choice%==7 goto clear_recycle_bin
if %choice%==8 goto disable_startup
if %choice%==9 goto reset_store_cache
if %choice%==10 goto disable_telemetry
if %choice%==11 goto disable_cortana
if %choice%==12 goto disable_windows_tips
if %choice%==13 goto create_restore_point
if %choice%==14 goto perform_all
if %choice%==15 exit

:: Invalid Choice
echo Invalid choice. Please try again.
pause
goto menu

:: Clean Temporary Files
:clean_temp
echo Cleaning temporary files...
rd /s /q %temp%
md %temp%
echo Temporary files cleaned.
pause
goto menu

:: Clear DNS Cache
:clear_dns
echo Clearing DNS cache...
ipconfig /flushdns
echo DNS cache cleared.
pause
goto menu

:: Optimize Drives (Defragment)
:optimize_drives
echo Optimizing drives...
defrag /C /H /V
echo Drives optimized.
pause
goto menu

:: Clear Windows Update Cache
:clear_update_cache
echo Clearing Windows Update cache...
net stop wuauserv
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
echo Windows Update cache cleared.
pause
goto menu

:: Clear Thumbnail Cache
:clear_thumbnail_cache
echo Clearing thumbnail cache...
del /f /s /q %localappdata%\Microsoft\Windows\Explorer\thumbcache*.db
echo Thumbnail cache cleared.
pause
goto menu

:: Clear Windows Logs
:clear_logs
echo Clearing Windows logs...
for /f "tokens=*" %%a in ('wevtutil el') do wevtutil cl "%%a"
echo Windows logs cleared.
pause
goto menu

:: Clear Recycle Bin
:clear_recycle_bin
echo Clearing Recycle Bin...
rd /s /q C:\$Recycle.bin
echo Recycle Bin cleared.
pause
goto menu

:: Disable Unnecessary Startup Programs
:disable_startup
echo Disabling unnecessary startup programs...
wmic startup where "name like '%%'" call delete
echo Unnecessary startup programs disabled.
pause
goto menu

:: Reset Windows Store Cache
:reset_store_cache
echo Resetting Windows Store cache...
wsreset.exe
echo Windows Store cache reset.
pause
goto menu

:: Disable Telemetry
:disable_telemetry
echo Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
echo Telemetry disabled.
pause
goto menu

:: Disable Cortana
:disable_cortana
echo Disabling Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo Cortana disabled.
pause
goto menu

:: Disable Windows Tips
:disable_windows_tips
echo Disabling Windows Tips...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
echo Windows Tips disabled.
pause
goto menu

:: Create System Restore Point
:create_restore_point
echo Creating a system restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Optimizer Restore Point", 100, 7
if %errorlevel%==0 (
    echo System restore point created successfully.
) else (
    echo Failed to create a system restore point. Please check if System Restore is enabled.
)
pause
goto menu

:: Perform All Tasks
:perform_all
echo Performing all optimization tasks...
call :create_restore_point
call :clean_temp
call :clear_dns
call :optimize_drives
call :clear_update_cache
call :clear_thumbnail_cache
call :clear_logs
call :clear_recycle_bin
call :disable_startup
call :reset_store_cache
call :disable_telemetry
call :disable_cortana
call :disable_windows_tips
echo All tasks completed.
pause
goto menu