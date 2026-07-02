# WinMinimal Configuration

This document describes the user-configurable settings available in WinMinimal.

The primary configuration file is:

```text
Config\Config.ps1
```

Most users will only need to edit this file.

Advanced configuration, including the default lists of applications, services, scheduled tasks and registry settings, is stored in:

```text
Config\Defaults.ps1
```

---

# Configuration Philosophy

WinMinimal follows a simple principle:

* `Config.ps1` contains **user preferences**.
* `Defaults.ps1` contains **project defaults**.
* Modules contain **implementation logic**.

This separation keeps the project easier to understand, maintain and extend.

---

# ProjectVersion

```powershell
$ProjectVersion = "0.4.0"
```

This is the global WinMinimal version.

The project version is defined only in `Config\Config.ps1`.

Individual scripts and modules should not contain their own version numbers.

---

# ActiveProfile

```powershell
$ActiveProfile = "HTPC"
```

Selects the active WinMinimal profile.

Profile support is planned and will be expanded in future versions.

Profiles will be stored in:

```text
Config\Profiles\
```

---

# ConsoleVerbosity

```powershell
$ConsoleVerbosity = "Normal"
```

Controls how much information is displayed in the console while WinMinimal is running.

| Value      | Description                                                                          |
| ---------- | ------------------------------------------------------------------------------------ |
| `Quiet`    | Displays only the final execution summary.                                           |
| `Normal`   | Displays execution progress and the final summary. Recommended.                      |
| `Detailed` | Displays detailed execution information. Useful for troubleshooting and development. |

Console verbosity does **not** affect logging.

Detailed information is always written to the log files.

---

# Logging

```powershell
$EnableLogging = $true
$TimestampLogs = $true
```

Logs are written to:

```text
Logs\
```

When timestamped logs are enabled, each execution creates a separate log file.

---

# Safety

```powershell
$ContinueOnError = $true
$RequireAdministrator = $true
```

`ContinueOnError` controls whether WinMinimal should continue when a non-critical operation fails.

`RequireAdministrator` enforces execution from an elevated PowerShell session.

Administrator privileges are required because WinMinimal modifies applications, services, scheduled tasks and registry settings.

---

# Application Removal

```powershell
$EnableAppRemoval = $true
$RemoveProvisionedPackages = $true

$RemoveCopilot = $true
$RemoveXboxComponents = $true
```

These settings control removal of unwanted AppX applications.

`RemoveProvisionedPackages` also removes provisioned AppX packages, preventing them from being installed automatically for newly created users.

---

# Startup Optimization

```powershell
$EnableServiceOptimization = $true
$EnableScheduledTaskOptimization = $true

$DisableTelemetry = $true
$DisableWindowsSearch = $true
$DisableSysMain = $true
```

These settings control service and scheduled task optimization.

The actual service and scheduled task lists are defined in:

```text
Config\Defaults.ps1
```

---

# Privacy Optimization

```powershell
$EnablePrivacyOptimization = $true

$DisableAdvertisingId = $true
$DisableActivityHistory = $true
$DisableTailoredExperiences = $true
$DisableSuggestedContent = $true
$DisableConsumerFeatures = $true
```

These settings control privacy-related registry and policy changes.

## DisableAdvertisingId

```powershell
$DisableAdvertisingId = $true
```

Disables the Windows advertising ID for the current user.

## DisableActivityHistory

```powershell
$DisableActivityHistory = $true
```

Disables publishing and uploading of user activity history through Windows policy registry keys.

## DisableTailoredExperiences

```powershell
$DisableTailoredExperiences = $true
```

Disables tailored experiences based on diagnostic data.

## DisableSuggestedContent

```powershell
$DisableSuggestedContent = $true
```

Disables selected Windows suggested content and silent app installation settings.

## DisableConsumerFeatures

```powershell
$DisableConsumerFeatures = $true
```

Disables Windows consumer features through policy registry settings.

---

# Explorer Optimization

```powershell
$EnableExplorerOptimization = $true

$ShowFileExtensions = $true
$ShowHiddenFiles = $true
$ShowProtectedOperatingSystemFiles = $false
$DisableExplorerRecentFiles = $true
$DisableExplorerFrequentFolders = $true
$OpenExplorerToThisPC = $true
```

These settings are planned for the Explorer optimization module.

They will control File Explorer behavior such as file extensions, hidden files, recent files and default startup location.

---

# Best Practice

For normal usage, only modify:

```text
Config\Config.ps1
```

Avoid editing:

```text
Config\Defaults.ps1
```

unless you are customizing WinMinimal itself or contributing to the project.
