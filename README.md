# WinMinimal

**WinMinimal** is a modular PowerShell framework designed to create a clean, lightweight and predictable Windows 11 baseline.

WinMinimal is **not** a blind debloater.
It is a configurable optimization framework where every change is documented, repeatable and easy to understand.

---

# Goals

* Remove unnecessary preinstalled Windows applications.
* Remove provisioned AppX packages.
* Disable selected unnecessary services.
* Disable selected scheduled tasks.
* Reduce background activity.
* Keep Windows Update, Microsoft Defender and core system components intact.
* Provide detailed execution logs.
* Keep configuration separate from implementation.
* Make the project easy to maintain and extend.

---

# Project Structure

```text
WinMinimal/
│
├── README.md
├── Run-WinMinimal.ps1
│
├── Config/
│   ├── Config.ps1
│   ├── Defaults.ps1
│   └── Profiles/
│       └── HTPC.ps1
│
├── Modules/
│   └── WinMinimal.Common.psm1
│
├── Scripts/
│   ├── Remove-Apps.ps1
│   └── Optimize-Startup.ps1
│
├── Docs/
├── Logs/
└── Backup/
```

---

# Requirements

* Windows 11 Pro (recommended)
* PowerShell 5.1 or newer
* Administrator privileges

---

# Running PowerShell as Administrator

Open the Start menu and search for:

```text
PowerShell
```

Right-click **Windows PowerShell** and choose:

```text
Run as administrator
```

Accept the UAC prompt.

---

# Temporary Execution Policy

Windows may prevent PowerShell scripts from running.

Before executing any WinMinimal script, allow script execution **only for the current PowerShell session**:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

If prompted, answer:

* **Y** on English Windows
* **S** on Italian Windows

This command **does not permanently modify** the system execution policy.

---

# Basic Usage

Open an elevated PowerShell window:

```powershell
cd C:\WinMinimal
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Then execute the desired scripts:

```powershell
.\Scripts\Remove-Apps.ps1
.\Scripts\Optimize-Startup.ps1
```

Future versions will include:

```powershell
.\Run-WinMinimal.ps1
```

to automatically execute all enabled modules in the correct order.

---

# Configuration

Most users should only edit:

```text
Config\Config.ps1
```

This file contains the user-selectable configuration options.

Example:

```powershell
$ActiveProfile = "HTPC"

$RemoveCopilot = $true
$RemoveXboxComponents = $true

$DisableTelemetry = $true
$DisableWindowsSearch = $true
$DisableSysMain = $true
```

Advanced users may also customize:

```text
Config\Defaults.ps1
```

which contains the default lists of:

* AppX packages
* Services
* Scheduled Tasks

managed by WinMinimal.

---

# Profiles

Profiles are stored in:

```text
Config\Profiles\
```

The active profile is selected through:

```powershell
$ActiveProfile = "HTPC"
```

Initially the following profiles are planned:

| Profile        | Description                                                                                                                         |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Default        | Generic baseline configuration.                                                                                                     |
| HTPC           | Home theater / multimedia appliance. Removes consumer applications, Xbox components and Copilot while reducing background services. |
| Desktop        | Balanced desktop configuration.                                                                                                     |
| Developer      | Preserves developer-related components and avoids aggressive optimization.                                                          |
| VirtualMachine | Optimized for disposable or laboratory virtual machines.                                                                            |

Future versions will document every profile in detail inside:

```text
Docs\Profiles.md
```

---

# Logging

Execution logs are automatically stored in:

```text
Logs\
```

When timestamped logging is enabled, each execution generates a separate log file.

Example:

```text
Logs\20260630-203000-Remove-Apps.log
```

---

# Backup

The `Backup` directory is reserved for future use.

Future versions may automatically export registry settings, service configurations and other information required to restore previous states.

---

# Design Principles

WinMinimal follows a few simple principles:

* Small modules.
* One responsibility per module.
* Short functions.
* Explicit names.
* Configuration separated from implementation.
* No hidden magic.
* Prefer Microsoft-native tools.
* Keep changes understandable and, whenever possible, reversible.

---

# Current Modules

| Module               | Purpose                                                 |
| -------------------- | ------------------------------------------------------- |
| Remove-Apps.ps1      | Remove unwanted AppX packages and provisioned packages. |
| Optimize-Startup.ps1 | Optimize startup-related services and scheduled tasks.  |

---

# Planned Modules

| Module                | Purpose                                              |
| --------------------- | ---------------------------------------------------- |
| Optimize-Privacy.ps1  | Configure Windows privacy settings.                  |
| Optimize-Explorer.ps1 | Configure File Explorer behavior.                    |
| Optimize-Network.ps1  | Network optimization and hardening.                  |
| Optimize-Defender.ps1 | Tune Microsoft Defender without reducing protection. |
| Cleanup.ps1           | Final cleanup tasks.                                 |
| Report.ps1            | Generate a complete execution report.                |

---

# Roadmap

Planned future improvements include:

* Interactive execution mode.
* Dry-run / WhatIf mode.
* Automatic rollback where possible.
* HTML reports.
* JSON reports.
* Additional optimization profiles.
* Windows Server support.
* Windows 12 support (when available).

---

# Disclaimer

WinMinimal modifies Windows applications, services and scheduled tasks.

Although the project aims to be conservative and well documented, no warranty is provided.

Always review the configuration before executing the scripts and use WinMinimal at your own risk.

---

# License

License information will be added before the first public release.
