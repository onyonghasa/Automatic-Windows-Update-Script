# 🪟 Automatic Windows Update Script  
### `UpdateWindowsAuto.ps1`

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
- Must be run as **Administrator**

---

## 🚀 Installation & Usage

1. **Download or copy** the script:  
   `UpdateWindowsAuto.ps1`

2. **Save it** anywhere (for example: `Desktop`, `C:\Scripts`, etc.)

3. **Open PowerShell as Administrator**

4. **Allow script execution for this session only (recommended)**:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```

   > 💡 This does not permanently change your system security settings.  
   > Once you close PowerShell, it returns to default policy.

5. (Optional) If the script was downloaded from the internet, unblock it first:
   ```powershell
   Unblock-File -Path "C:\Path\To\UpdateWindowsAuto.ps1"
   ```

6. **Run the script**:
   ```powershell
   .\UpdateWindowsAuto.ps1
   ```

7. The script will:
   - Check if **PSWindowsUpdate** is installed  
   - Prompt to install it if missing  
   - Then automatically scan, download, and install all updates

---

## 🧩 Example Output

```
=== Checking Administrator privileges ===
Running as Administrator... OK

=== Checking PowerShell Gallery repository ===
Repository 'PSGallery' is trusted... OK

=== Installing Windows Updates ===
Found 3 updates available...
Installing updates... Please wait...
System will reboot automatically if required.
```

---

## 🪪 License

This project is licensed under the **MIT License** — feel free to use, modify, and distribute it.  
See the [LICENSE](LICENSE) file for details.
