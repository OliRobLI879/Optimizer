@echo off
:: Windows 10 PC Optimizer Batch Script
:: Created by Your Name
:: Version 10.0 - X-to-Menu Feature

:: Set text color to green
color 0a

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
title Windows 10 PC Optimizer - Ultimate

:: Main Menu
:menu
cls
echo =========================================
echo        Windows 10 PC Optimizer
echo =========================================
echo 1. Performance Tweaks
echo 2. Privacy Enhancements
echo 3. System Cleanup Tools
echo 4. Game Optimization
echo 5. Create System Restore Point
echo 6. Perform All Tasks
echo 7. Exit
echo =========================================
echo Press the number of the option you want.
echo =========================================
set /p choice=Choose an option (1-7): 

if %choice%==1 goto performance_menu
if %choice%==2 goto privacy_menu
if %choice%==3 goto cleanup_menu
if %choice%==4 goto game_optimization_menu
if %choice%==5 goto create_restore_point
if %choice%==6 goto perform_all
if %choice%==7 exit

:: Invalid Choice
echo Invalid choice. Please try again.
pause
goto menu

:: Performance Tweaks Menu
:performance_menu
cls
echo =========================================
echo        Performance Tweaks
echo =========================================
echo 1. Optimize CPU Performance
echo 2. Optimize RAM Performance
echo 3. Optimize GPU Performance
echo 4. Enable Ultimate Performance Power Plan
echo 5. Disable Hibernation
echo 6. Disable Superfetch and Prefetch
echo 7. Disable Windows Search Indexing
echo 8. Disable Animations and Visual Effects
echo 9. Return to Main Menu
echo =========================================
echo Press the number of the option you want.
echo Press X to return to the main menu.
echo =========================================
set /p performance_choice=Choose an option (1-9 or X): 

if "%performance_choice%"=="X" goto menu
if %performance_choice%==1 goto optimize_cpu
if %performance_choice%==2 goto optimize_ram
if %performance_choice%==3 goto optimize_gpu
if %performance_choice%==4 goto enable_ultimate_performance
if %performance_choice%==5 goto disable_hibernation
if %performance_choice%==6 goto disable_superfetch_prefetch
if %performance_choice%==7 goto disable_search_indexing
if %performance_choice%==8 goto disable_animations
if %performance_choice%==9 goto menu

:: Privacy Enhancements Menu
:privacy_menu
cls
echo =========================================
echo        Privacy Enhancements
echo =========================================
echo 1. Disable Telemetry
echo 2. Disable Cortana
echo 3. Disable Windows Tips
echo 4. Disable Location Tracking
echo 5. Disable Windows Feedback
echo 6. Disable Windows Spotlight
echo 7. Disable Clipboard History
echo 8. Disable Timeline Activity History
echo 9. Return to Main Menu
echo =========================================
echo Press the number of the option you want.
echo Press X to return to the main menu.
echo =========================================
set /p privacy_choice=Choose an option (1-9 or X): 

if "%privacy_choice%"=="X" goto menu
if %privacy_choice%==1 goto disable_telemetry
if %privacy_choice%==2 goto disable_cortana
if %privacy_choice%==3 goto disable_windows_tips
if %privacy_choice%==4 goto disable_location_tracking
if %privacy_choice%==5 goto disable_windows_feedback
if %privacy_choice%==6 goto disable_windows_spotlight
if %privacy_choice%==7 goto disable_clipboard_history
if %privacy_choice%==8 goto disable_timeline_activity
if %privacy_choice%==9 goto menu

:: System Cleanup Tools Menu
:cleanup_menu
cls
echo =========================================
echo        System Cleanup Tools
echo =========================================
echo 1. Clean Temporary Files
echo 2. Clear DNS Cache
echo 3. Clear Windows Update Cache
echo 4. Clear Thumbnail Cache
echo 5. Clear Windows Logs
echo 6. Clear Recycle Bin
echo 7. Reset Windows Store Cache
echo 8. Disable Unnecessary Startup Programs
echo 9. Return to Main Menu
echo =========================================
echo Press the number of the option you want.
echo Press X to return to the main menu.
echo =========================================
set /p cleanup_choice=Choose an option (1-9 or X): 

if "%cleanup_choice%"=="X" goto menu
if %cleanup_choice%==1 goto clean_temp
if %cleanup_choice%==2 goto clear_dns
if %cleanup_choice%==3 goto clear_update_cache
if %cleanup_choice%==4 goto clear_thumbnail_cache
if %cleanup_choice%==5 goto clear_logs
if %cleanup_choice%==6 goto clear_recycle_bin
if %cleanup_choice%==7 goto reset_store_cache
if %cleanup_choice%==8 goto disable_startup
if %cleanup_choice%==9 goto menu

:: Game Optimization Menu
:game_optimization_menu
cls
echo =========================================
echo        Game Optimization
echo =========================================
echo 1. Disable Game Bar and Game DVR
echo 2. Optimize GPU for Gaming
echo 3. Disable Background Apps for Gaming
echo 4. Enable High-Performance Power Plan
echo 5. Disable Notifications During Gaming
echo 6. Return to Main Menu
echo =========================================
echo Press the number of the option you want.
echo Press X to return to the main menu.
echo =========================================
set /p game_choice=Choose an option (1-6 or X): 

if "%game_choice%"=="X" goto menu
if %game_choice%==1 goto disable_game_bar
if %game_choice%==2 goto optimize_gpu
if %game_choice%==3 goto disable_background_apps
if %game_choice%==4 goto enable_ultimate_performance
if %game_choice%==5 goto disable_notifications_ads
if %game_choice%==6 goto menu

:: Create System Restore Point
:create_restore_point
echo Creating a system restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Optimizer Restore Point", 100, 7
if %errorlevel%==0 (
    echo System restore point created successfully.
) else (
    echo Failed to create a system restore point. Please check if System Restore is enabled.
)
echo Press X to return to the main menu.
set /p restore_choice=Press X to return to the menu: 
if /i "%restore_choice%"=="X" goto menu
goto create_restore_point

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
call :optimize_cpu
call :optimize_ram
call :optimize_gpu
call :disable_background_apps
call :disable_animations
call :enable_ultimate_performance
call :disable_hibernation
call :disable_superfetch_prefetch
call :disable_search_indexing
call :disable_game_bar
call :disable_notifications_ads
echo All tasks completed.
echo Press X to return to the main menu.
set /p all_choice=Press X to return to the menu: 
if /i "%all_choice%"=="X" goto menu
goto perform_all

:: Clean Temporary Files
:clean_temp
echo Cleaning temporary files...
rd /s /q %temp%
md %temp%
echo Temporary files cleaned.
echo Press X to return to the main menu.
set /p temp_choice=Press X to return to the menu: 
if /i "%temp_choice%"=="X" goto menu
goto clean_temp

:: Clear DNS Cache
:clear_dns
echo Clearing DNS cache...
ipconfig /flushdns
echo DNS cache cleared.
echo Press X to return to the main menu.
set /p dns_choice=Press X to return to the menu: 
if /i "%dns_choice%"=="X" goto menu
goto clear_dns

:: Optimize Drives (Defragment)
:optimize_drives
echo Optimizing drives...
defrag /C /H /V
echo Drives optimized.
echo Press X to return to the main menu.
set /p drives_choice=Press X to return to the menu: 
if /i "%drives_choice%"=="X" goto menu
goto optimize_drives

:: Clear Windows Update Cache
:clear_update_cache
echo Clearing Windows Update cache...
net stop wuauserv
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
echo Windows Update cache cleared.
echo Press X to return to the main menu.
set /p update_choice=Press X to return to the menu: 
if /i "%update_choice%"=="X" goto menu
goto clear_update_cache

:: Clear Thumbnail Cache
:clear_thumbnail_cache
echo Clearing thumbnail cache...
del /f /s /q %localappdata%\Microsoft\Windows\Explorer\thumbcache*.db
echo Thumbnail cache cleared.
echo Press X to return to the main menu.
set /p thumbnail_choice=Press X to return to the menu: 
if /i "%thumbnail_choice%"=="X" goto menu
goto clear_thumbnail_cache

:: Clear Windows Logs
:clear_logs
echo Clearing Windows logs...
for /f "tokens=*" %%a in ('wevtutil el') do wevtutil cl "%%a"
echo Windows logs cleared.
echo Press X to return to the main menu.
set /p logs_choice=Press X to return to the menu: 
if /i "%logs_choice%"=="X" goto menu
goto clear_logs

:: Clear Recycle Bin
:clear_recycle_bin
echo Clearing Recycle Bin...
rd /s /q C:\$Recycle.bin
echo Recycle Bin cleared.
echo Press X to return to the main menu.
set /p recycle_choice=Press X to return to the menu: 
if /i "%recycle_choice%"=="X" goto menu
goto clear_recycle_bin

:: Disable Unnecessary Startup Programs
:disable_startup
echo Disabling unnecessary startup programs...
wmic startup where "name like '%%'" call delete
echo Unnecessary startup programs disabled.
echo Press X to return to the main menu.
set /p startup_choice=Press X to return to the menu: 
if /i "%startup_choice%"=="X" goto menu
goto disable_startup

:: Reset Windows Store Cache
:reset_store_cache
echo Resetting Windows Store cache...
wsreset.exe
echo Windows Store cache reset.
echo Press X to return to the main menu.
set /p store_choice=Press X to return to the menu: 
if /i "%store_choice%"=="X" goto menu
goto reset_store_cache

:: Disable Telemetry
:disable_telemetry
echo Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
echo Telemetry disabled.
echo Press X to return to the main menu.
set /p telemetry_choice=Press X to return to the menu: 
if /i "%telemetry_choice%"=="X" goto menu
goto disable_telemetry

:: Disable Cortana
:disable_cortana
echo Disabling Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo Cortana disabled.
echo Press X to return to the main menu.
set /p cortana_choice=Press X to return to the menu: 
if /i "%cortana_choice%"=="X" goto menu
goto disable_cortana

:: Disable Windows Tips
:disable_windows_tips
echo Disabling Windows Tips...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
echo Windows Tips disabled.
echo Press X to return to the main menu.
set /p tips_choice=Press X to return to the menu: 
if /i "%tips_choice%"=="X" goto menu
goto disable_windows_tips

:: Disable Location Tracking
:disable_location_tracking
echo Disabling Location Tracking...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
echo Location Tracking disabled.
echo Press X to return to the main menu.
set /p location_choice=Press X to return to the menu: 
if /i "%location_choice%"=="X" goto menu
goto disable_location_tracking

:: Disable Windows Feedback
:disable_windows_feedback
echo Disabling Windows Feedback...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
echo Windows Feedback disabled.
echo Press X to return to the main menu.
set /p feedback_choice=Press X to return to the menu: 
if /i "%feedback_choice%"=="X" goto menu
goto disable_windows_feedback

:: Disable Windows Spotlight
:disable_windows_spotlight
echo Disabling Windows Spotlight...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d 1 /f
echo Windows Spotlight disabled.
echo Press X to return to the main menu.
set /p spotlight_choice=Press X to return to the menu: 
if /i "%spotlight_choice%"=="X" goto menu
goto disable_windows_spotlight

:: Disable Clipboard History
:disable_clipboard_history
echo Disabling Clipboard History...
reg add "HKCU\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d 0 /f
echo Clipboard History disabled.
echo Press X to return to the main menu.
set /p clipboard_choice=Press X to return to the menu: 
if /i "%clipboard_choice%"=="X" goto menu
goto disable_clipboard_history

:: Disable Timeline Activity History
:disable_timeline_activity
echo Disabling Timeline Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
echo Timeline Activity History disabled.
echo Press X to return to the main menu.
set /p timeline_choice=Press X to return to the menu: 
if /i "%timeline_choice%"=="X" goto menu
goto disable_timeline_activity

:: Optimize CPU Performance
:optimize_cpu
echo Optimizing CPU performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo High-performance power plan activated.
echo Press X to return to the main menu.
set /p cpu_choice=Press X to return to the menu: 
if /i "%cpu_choice%"=="X" goto menu
goto optimize_cpu

:: Optimize RAM Performance
:optimize_ram
echo Optimizing RAM performance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f
echo RAM performance optimized.
echo Press X to return to the main menu.
set /p ram_choice=Press X to return to the menu: 
if /i "%ram_choice%"=="X" goto menu
goto optimize_ram

:: Optimize GPU Performance
:optimize_gpu
echo Optimizing GPU performance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d 0 /f
echo GPU performance optimized.
echo Press X to return to the main menu.
set /p gpu_choice=Press X to return to the menu: 
if /i "%gpu_choice%"=="X" goto menu
goto optimize_gpu

:: Enable Ultimate Performance Power Plan
:enable_ultimate_performance
echo Enabling Ultimate Performance power plan...
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
echo Ultimate Performance power plan enabled.
echo Press X to return to the main menu.
set /p ultimate_choice=Press X to return to the menu: 
if /i "%ultimate_choice%"=="X" goto menu
goto enable_ultimate_performance

:: Disable Hibernation
:disable_hibernation
echo Disabling hibernation...
powercfg /h off
echo Hibernation disabled.
echo Press X to return to the main menu.
set /p hibernate_choice=Press X to return to the menu: 
if /i "%hibernate_choice%"=="X" goto menu
goto disable_hibernation

:: Disable Superfetch and Prefetch
:disable_superfetch_prefetch
echo Disabling Superfetch and Prefetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f
echo Superfetch and Prefetch disabled.
echo Press X to return to the main menu.
set /p superfetch_choice=Press X to return to the menu: 
if /i "%superfetch_choice%"=="X" goto menu
goto disable_superfetch_prefetch

:: Disable Windows Search Indexing
:disable_search_indexing
echo Disabling Windows Search indexing...
net stop "Windows Search"
sc config "Windows Search" start= disabled
echo Windows Search indexing disabled.
echo Press X to return to the main menu.
set /p search_choice=Press X to return to the menu: 
if /i "%search_choice%"=="X" goto menu
goto disable_search_indexing

:: Disable Animations and Visual Effects
:disable_animations
echo Disabling animations and visual effects...
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9032078000000 /f
echo Animations and visual effects disabled.
echo Press X to return to the main menu.
set /p animations_choice=Press X to return to the menu: 
if /i "%animations_choice%"=="X" goto menu
goto disable_animations

:: Disable Game Bar and Game DVR
:disable_game_bar
echo Disabling Game Bar and Game DVR...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
echo Game Bar and Game DVR disabled.
echo Press X to return to the main menu.
set /p gamebar_choice=Press X to return to the menu: 
if /i "%gamebar_choice%"=="X" goto menu
goto disable_game_bar

:: Disable Notifications and Ads
:disable_notifications_ads
echo Disabling notifications and ads...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
echo Notifications and ads disabled.
echo Press X to return to the main menu.
set /p notifications_choice=Press X to return to the menu: 
if /i "%notifications_choice%"=="X" goto menu
goto disable_notifications_ads