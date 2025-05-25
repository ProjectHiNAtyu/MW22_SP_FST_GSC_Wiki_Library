@echo off
title MRON AIO fixer
:: Enable ANSI escape codes for colored text (Windows 10+)
echo [1;34m==================================================================[0m
echo [0;35m                MRON AIO FIXER - Made by purrplee[0m
echo [1;34m==================================================================[0m
echo [1;33m Running as Administrator... Please wait.[0m
echo [1;34m==================================================================[0m
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [1;31m[!] Admin privileges required. Requesting elevation...[0m
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~fnx0\"' -Verb RunAs"
    exit
)

for /f "tokens=2 delims=[]" %%i in ('ver') do set version=%%i
for /f "tokens=1,2 delims=. " %%a in ("%version%") do set major=%%a& set minor=%%b

if %major% GEQ 10 (
    powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).Caption" | find /i "Windows 11" >nul && (
        set isWin11=1
        echo [1;32m[+] Windows 11 detected, starting advanced checks![0m
    ) || (
        set isWin11=0
        echo [1;32m[+] Windows 10 detected, standard fixes enabled![0m
    )
)

timeout /t 3 >nul

:: ==================================================================
:: CHECK: SECURE BOOT STATUS
:: ==================================================================
echo.
echo [1;34m[+] Checking Secure Boot Status...[0m
powershell -Command "& {Confirm-SecureBootUEFI}" | findstr "True" >nul
if %errorLevel% EQU 0 (
    echo [0;31m[WARNING] Secure Boot is ENABLED. Please disable it in BIOS to prevent issues.[0m
) else (
    echo [0;32m[+] Secure Boot is DISABLED.[0m
)
timeout /t 5 >nul

:: ==================================================================
:: CHECK: CPU VIRTUALIZATION SUPPORT
:: ==================================================================
echo.
echo [1;34m[+] Checking CPU Virtualization Support...[0m
powershell -Command "& { if ((Get-CimInstance Win32_Processor).VirtualizationFirmwareEnabled) { exit 0 } else { exit 1 } }"
if %errorLevel% EQU 0 (
    echo [1;32m[+] CPU Virtualization is ENABLED.[0m
) else (
    echo [0;32m[WARNING] CPU Virtualization is DISABLED. Please enable it in BIOS.[0m
)
timeout /t 5 >nul

:: ==================================================================
:: CHECK: VISUAL C++ REDISTRIBUTABLES (Windows 11 Only)
:: ==================================================================
if %isWin11% EQU 1 (
    echo.
    echo [1;34m[+] Checking for Microsoft Visual C++ Redistributables...[0m
    reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" >nul 2>&1
    if %errorLevel% neq 0 (
        echo [1;33m[WARNING] Visual C++ Redistributables are missing![0m
        echo [1;36m[+] Download them here:[0m
        echo    https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170
    ) else (
        echo [1;32m[+] Microsoft Visual C++ Redistributables are installed.[0m
    )
    timeout /t 5 >nul
)

:: ==================================================================
:: REMINDER: UPDATE DIRECTX & DRIVERS
:: ==================================================================
echo.
echo [1;36m[+] Reminder: Ensure DirectX 11/12 is installed.[0m
echo [1;36m[+] Keeping GPU and CPU drivers updated is recommended.[0m
echo [1;36m    - NVIDIA: https://www.nvidia.com/download/index.aspx[0m
echo [1;36m    - AMD: https://www.amd.com/en/support[0m
echo [1;36m    - Intel: https://www.intel.com/content/www/us/en/download-center.html[0m
timeout /t 5 >nul

:: ==================================================================
:: DISABLE DISCORD OVERLAY (Optional)
:: ==================================================================
echo.
echo [1;34m[+] Disabling Discord Overlay...[0m
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Discord" /t REG_SZ /d "" /f
reg add "HKCU\Software\Discord" /v "OverlayEnabled" /t REG_DWORD /d 0 /f
echo [1;36m[+] Re-enable overlays after playing with MRON[0m
echo [1;32m[+] Done.[0m
timeout /t 3 >nul

:: ==================================================================
:: DISABLE HYPER-V (Requires Restart)
:: ==================================================================
echo.
echo [1;34m[+] Disabling Hyper-V...[0m
bcdedit /set hypervisorlaunchtype off
echo [1;32m[+] Done. A system restart is required for changes to take effect.[0m
timeout /t 5 >nul

:: ==================================================================
:: Windows Defender & Security Checks
:: ==================================================================
echo.
echo [1;34m[+] Checking Windows Defender settings...[0m
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v RunAsPPL /t REG_DWORD /d 0 /f
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
echo [1;31m[+] Windows Defender real-time protection DISABLED. Re-enable manually after injection.[0m

:: ==================================================================
:: DISABLE CORE ISOLATION & MEMORY INTEGRITY
:: ==================================================================
echo.
echo [1;34m[+] Checking Core Isolation and Memory Integrity Status...[0m
for /f "tokens=2 delims=    " %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled 2^>nul') do set memIntegrity=%%A
if "%memIntegrity%"=="0x1" (
    echo [1;33m[WARNING] Memory Integrity is ENABLED. Disabling it now...[0m
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f
    echo [1;32m[+] Memory Integrity Disabled. A restart is required for full effect.[0m
) else (
    echo [1;32m[+] Memory Integrity is already disabled.[0m
)

:: ==================================================================
:: System restart?
:: ==================================================================
echo.
echo [1;34m[+] Some changes require a system restart.[0m
choice /C YN /M "Restart now? "
if %errorLevel% EQU 1 shutdown /r /t 5

:: ==================================================================
:: Checks done!
:: ==================================================================
echo.
echo [1;32m[+] MRON Mod Fixer has completed all system checks and optimizations.[0m
echo [1;34m==================================================================[0m
echo [1;36m    Press any key to exit...[0m
pause >nul
