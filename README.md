# Automatic-Windows-Update-Script
# UpdateWindowsAuto.ps1  

# 🪟 UpdateWindowsAuto.ps1

A simple PowerShell script that automatically checks for and installs all available Windows Updates.  
It also ensures that the required PowerShell repository and module (`PSWindowsUpdate`) are properly configured before running updates.

---

## 🔧 Features

- Checks for **Administrator privileges**
- Verifies that **PowerShell Gallery (PSGallery)** is trusted
- Installs **PSWindowsUpdate** module if missing
- Scans for available Windows updates
- Installs all updates automatically (`-AcceptAll -AutoReboot`)
- Saves a **log file** of update history to `C:\WindowsUpdate_Log.txt`
- Displays all progress directly in PowerShell console

---

## 📋 Requirements

- **Windows 10 / 11**
- **PowerShell 5.1+** or **PowerShell 7+**
- Internet connection
- Run as **Administrator**

---

## 🚀 Installation

1. Download or copy the script: UpdateWindowsAuto.ps1.
2. Save it anywhere (e.g., Desktop or Scripts folder).
3. Open **PowerShell as Administrator**.
4. Allow the script to run for this session:
