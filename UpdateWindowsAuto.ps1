# =====================================
#  UpdateWindowsAuto.ps1
#  Automatic Windows Update Script
# =====================================

# --- Check for Administrator privileges ---
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "`n[!] Please run PowerShell as Administrator and try again." -ForegroundColor Red
    Pause
    exit
}

Write-Host "=== Windows Auto Update Script ===`n" -ForegroundColor Cyan

# --- Check if PSGallery is trusted ---
$repo = Get-PSRepository -Name "PSGallery" -ErrorAction SilentlyContinue

if ($null -eq $repo -or $repo.InstallationPolicy -ne "Trusted") {
    Write-Host "[*] PSGallery is not trusted." -ForegroundColor Yellow
    Write-Host "[+] Setting PSGallery as a trusted repository..." -ForegroundColor Green
    try {
        Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted -ErrorAction Stop
        Write-Host "[✓] PSGallery is now trusted." -ForegroundColor Green
    } catch {
        Write-Host "[!] Failed to set PSGallery as trusted. Make sure you run PowerShell as Administrator." -ForegroundColor Red
        exit
    }
} else {
    Write-Host "[✓] PSGallery is already trusted." -ForegroundColor Green
}

# --- Check if PSWindowsUpdate module exists ---
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Host "[*] PSWindowsUpdate module not found." -ForegroundColor Yellow
    Write-Host "[+] Installing PSWindowsUpdate..." -ForegroundColor Green
    Install-Module PSWindowsUpdate -Force
} else {
    Write-Host "[✓] PSWindowsUpdate module already installed." -ForegroundColor Green
}

# --- Import module ---
Import-Module PSWindowsUpdate

# --- Scan for available updates ---
Write-Host "`n=== Checking for available updates ===" -ForegroundColor Cyan
$updates = Get-WindowsUpdate

if ($updates) {
    Write-Host "`nAvailable updates:" -ForegroundColor Yellow
    $updates | Format-Table -AutoSize
    Write-Host "`nStarting installation of all updates..." -ForegroundColor Cyan
    
    # --- Install updates but do not auto reboot ---
    Install-WindowsUpdate -AcceptAll -IgnoreReboot

    # --- Check if a restart is required ---
    if (Get-WURebootStatus) {
        $restart = Read-Host "`nUpdates installed. A restart is required. Do you want to restart now? (Y/N)"
        if ($restart -match '^[Yy]') {
            Write-Host "Restarting system..." -ForegroundColor Cyan
            Restart-Computer
        } else {
            Write-Host "Restart postponed. Please remember to restart later." -ForegroundColor Yellow
        }
    } else {
        Write-Host "`nNo restart is required." -ForegroundColor Green
    }

} else {
    Write-Host "`nNo new updates available." -ForegroundColor Green
}

# --- Save update history log ---
$logPath = "C:\WindowsUpdate_Log.txt"
Write-Host "`nSaving update history to: $logPath" -ForegroundColor Cyan
Get-WUHistory | Out-File $logPath -Encoding utf8

Write-Host "`n=== Completed ===" -ForegroundColor Green
Pause
