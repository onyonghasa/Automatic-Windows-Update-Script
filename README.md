# 🪟 Automatic Windows Update Script  
### `UpdateWindowsAuto.ps1`

A simple PowerShell script that automatically checks for, downloads, and installs all available Windows Updates on **Windows 10 / 11**.  
The script ensures that the required PowerShell repository and module (`PSWindowsUpdate`) are properly configured before running updates.  
This version will **ask the user before restarting the system** after installing updates.

---

## 🔧 Features

- Checks for **Administrator privileges**
- Verifies that **PowerShell Gallery (PSGallery)** is trusted
- Installs **PSWindowsUpdate** module if missing
- Scans for available Windows updates
- Installs all updates automatically (`-AcceptAll`) but **does not auto-reboot**
- Prompts the user to restart the system if required
- Saves a **log file** of update history to `C:\WindowsUpdate_Log.txt`
- Displays all progress directly in the PowerShell console

---

## 📋 Requirements

- **Windows 10 / 11**
- **PowerShell 5.1+** or **PowerShell 7+**
- Internet connection
- Must be run as **Administrator**

---

## ⚡ Run Directly from GitHub (One-Line Command)

You can run the script directly from GitHub without downloading it manually.

### ▶ Run immediately (execute in memory)

Open **PowerShell as Administrator** and run:

```powershell
irm https://raw.githubusercontent.com/onyonghasa/Automatic-Windows-Update-Script/main/UpdateWindowsAuto.ps1 | iex
```

> ⚠️ This method executes the script directly from the internet.  
> Only use this if you trust the source repository.

---

### ✅ Safer Method (Download first, then run)

Recommended if you want to inspect the script before execution:

```powershell
irm https://raw.githubusercontent.com/onyonghasa/Automatic-Windows-Update-Script/main/UpdateWindowsAuto.ps1 -OutFile UpdateWindowsAuto.ps1
.\UpdateWindowsAuto.ps1
```

---

## 🚀 Installation & Usage (Manual Download)

1. **Download or copy** the script:  
   `UpdateWindowsAuto.ps1`

2. **Save it** anywhere (for example: `Desktop`, `C:\Scripts`, etc.)

3. **Open PowerShell as Administrator**

4. **Allow script execution for this session only (recommended)**:

```powershell
set-executionpolicy -scope process -executionpolicy bypass
```

> 💡 On Windows 10, PowerShell will display the "Execution Policy Change" prompt:
>
> ```
> Execution Policy Change
> [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"):
> ```
>
> Type `Y` and press **Enter**.  
> This change is temporary and only applies to the current PowerShell session. Once PowerShell is closed, the execution policy returns to the default system setting.

5. (Optional) If the script was downloaded from the internet, unblock it first:

```powershell
Unblock-File -Path "C:\Path\To\UpdateWindowsAuto.ps1"
```

6. **Run the script**:

```powershell
.\UpdateWindowsAuto.ps1
```

7. **The script will**:

- Check if **PSWindowsUpdate** is installed  
- Prompt to install it if missing  
- Scan, download, and install all updates  
- If a restart is required, **ask the user** before rebooting

---

## 🧩 Example Output

```
=== Windows Auto Update Script ===

[✓] PSGallery is already trusted.
[✓] PSWindowsUpdate module already installed.

=== Checking for available updates ===

Available updates:
 KB5006670  Security Update  Installed
 KB5006746  Cumulative Update Installed

Starting installation of all updates...
Installing updates... Please wait...

Updates installed. A restart is required. Do you want to restart now? (Y/N): N
Restart postponed. Please remember to restart later.

Saving update history to: C:\WindowsUpdate_Log.txt

=== Completed ===
```

---

## 🪪 License

This project is licensed under the **MIT License** — feel free to use, modify, and distribute it.  
See the [LICENSE](LICENSE) file for details.
