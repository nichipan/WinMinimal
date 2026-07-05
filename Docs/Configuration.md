# WinMinimal Configuration

This document describes the user-configurable settings available in WinMinimal.

The primary configuration file is:

```text
Config\Config.ps1
```

Most users will only need to edit this file.

Advanced defaults are stored in:

```text
Config\Defaults.ps1
```

---

# ProjectVersion

```powershell
$ProjectVersion = "0.5.0"
```

This is the global WinMinimal version.

---

# Core Settings

```powershell
$ActiveProfile = "HTPC"
$ConsoleVerbosity = "Normal"
$EnableLogging = $true
$TimestampLogs = $true
$ContinueOnError = $true
$RequireAdministrator = $true
```

---

# Application Removal

```powershell
$EnableAppRemoval = $true
$RemoveProvisionedPackages = $true
$RemoveCopilot = $true
$RemoveXboxComponents = $true
```

---

# Startup Optimization

```powershell
$EnableServiceOptimization = $true
$EnableScheduledTaskOptimization = $true
$DisableTelemetry = $true
$DisableWindowsSearch = $true
$DisableSysMain = $true
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

---

# Hardware Optimization

```powershell
$EnableHardwareOptimization = $true
$DisableWiFi = $true
$DisableBluetooth = $true
$DisableNearbySharing = $true
$DisableLocationServices = $true
$DisableNFC = $true
```

These settings control hardware-facing features and radio interfaces.

---

# Network Optimization

```powershell
$EnableNetworkOptimization = $true
$DisableSMBv1 = $true
$DisableLLMNR = $true
$DisableNetBIOS = $true
$DisableNetworkDiscovery = $true
$DisableMDNS = $true
```

These settings control network protocols, discovery mechanisms and network-related services.

IPv6 is intentionally not included in the initial Network configuration.

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
