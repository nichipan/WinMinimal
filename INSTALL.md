# WinMinimal Installation Guide

This guide explains how to install and execute WinMinimal for the first time.

---

# Prerequisites

Before using WinMinimal, make sure you have:

- Windows 11 Pro
- Administrator privileges
- Windows PowerShell 5.1 or newer
- Git, if you want to clone the repository

Git is optional. You can also download the project as a ZIP archive from GitHub.

---

# Clone the Repository

If Git is installed, open PowerShell and run:

```powershell
git clone https://github.com/nichipan/WinMinimal.git
cd WinMinimal
```

Alternatively, download the project as a ZIP archive from GitHub and extract it to a local folder.

---

# Open PowerShell as Administrator

Open the Start menu and search for:

```text
PowerShell
```

Right-click **Windows PowerShell** and select:

```text
Run as administrator
```

Accept the User Account Control prompt.

Administrator privileges are required because WinMinimal modifies Windows applications, services, scheduled tasks and registry settings.

---

# Allow Script Execution

By default, Windows may prevent PowerShell scripts from running.

Enable script execution only for the current PowerShell session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

If prompted, answer:

- **Y** on English Windows
- **S** on Italian Windows

This setting is temporary and automatically disappears when the PowerShell window is closed.

---

# Review the Configuration

Before executing WinMinimal, review:

```text
Config\Config.ps1
```

This file contains the main user-configurable settings.

Advanced defaults are stored in:

```text
Config\Defaults.ps1
```

Normal users should usually customize `Config.ps1` only.

---

# Execute WinMinimal

Run the main project runner:

```powershell
.\Run-WinMinimal.ps1
```

The runner executes the enabled modules in the configured order.

---

# Verify the Results

After execution:

- review the console summary;
- check the execution logs stored in `Logs`;
- reboot Windows if requested or recommended by a module.

---

# Updating the Project

If you cloned the repository using Git:

```powershell
git pull
```

If you downloaded the ZIP archive, download the latest version from GitHub and replace the project files.

---

# Need Help?

Before opening an issue, check:

- `README.md`
- `Docs/Configuration.md`
- `Docs/Modules.md`
- `Docs/Reference/`

When reporting a problem, include:

- Windows version;
- WinMinimal version;
- console output;
- relevant log files;
- steps to reproduce the issue.

---

# Disclaimer

WinMinimal modifies Windows configuration.

Although the project is designed to be conservative and well documented, always review the configuration before execution and understand the changes being applied.

Use WinMinimal at your own risk.
