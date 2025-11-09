🪟 Automatic Windows Update Script
UpdateWindowsAuto.ps1

A simple PowerShell script that automatically checks for and installs all available Windows Updates.
It also ensures that the required PowerShell repository and module (PSWindowsUpdate) are properly configured before running updates.

🔧 Features

Checks for Administrator privileges

Verifies that PowerShell Gallery (PSGallery) is trusted

Installs PSWindowsUpdate module if missing

Scans for available Windows updates

Installs all updates automatically (-AcceptAll -AutoReboot)

Saves a log file of update history to C:\WindowsUpdate_Log.txt

Displays all progress directly in PowerShell console

📋 Requirements

Windows 10 / 11

PowerShell 5.1+ or PowerShell 7+

Internet connection

Must be run as Administrator

🚀 Installation & Usage

Download or copy the script:
UpdateWindowsAuto.ps1

Save it anywhere (for example: Desktop, C:\Scripts, etc.)

Open PowerShell as Administrator

Allow script execution for this session only (recommended):

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


💡 This does not permanently change your system security settings.
Once you close PowerShell, it returns to default policy.

(Optional) If the script was downloaded from the internet, unblock it first:

Unblock-File -Path "C:\Path\To\UpdateWindowsAuto.ps1"


Run the script:

.\UpdateWindowsAuto.ps1


The script will:

Check if PSWindowsUpdate is installed

Prompt to install it if missing

Then automatically scan, download, and install all updates
