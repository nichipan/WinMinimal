# WinMinimal Modules

This document provides a high-level overview of the WinMinimal module catalog.

Modules are organized by responsibility, not by implementation technique.

A module may use registry settings, services, scheduled tasks or PowerShell cmdlets internally, but its identity is defined by the system area it manages.

---

# Module Catalog

| Module | Status | Scope |
|--------|:------:|-------|
| Applications | Implemented | Installed applications and provisioned AppX packages. |
| Startup | Implemented | Startup behavior, Windows services and scheduled tasks. |
| Privacy | Implemented | Privacy, telemetry and personalization settings. |
| Explorer | Implemented | File Explorer behavior and user interface preferences. |
| Hardware | Planned | Physical devices and radio interfaces. |
| Network | Planned | Network protocols and network-related services. |
| Defender | Planned | Microsoft Defender configuration. |
| Updates | Planned | Windows Update behavior. |
| Cleanup | Planned | Maintenance and temporary file cleanup. |
| Backup | Planned | Backup and rollback support. |

---

# Responsibility Boundaries

The following table helps determine where a new feature should belong.

| If the feature affects... | Module |
|---------------------------|--------|
| Built-in applications | Applications |
| Services started at boot | Startup |
| Scheduled background tasks | Startup |
| Explorer user interface | Explorer |
| Telemetry and personalization | Privacy |
| Wi-Fi, Bluetooth, camera or microphone | Hardware |
| SMB, IPv6, NetBIOS, LLMNR or mDNS | Network |
| Microsoft Defender | Defender |
| Windows Update | Updates |
| Temporary files or component cleanup | Cleanup |
| Restore points, backups or rollback | Backup |

---

# Implemented Modules

## Applications

Removes unwanted AppX applications and provisioned packages.

Reference:

```text
Docs\Reference\Applications.md
```

---

## Startup

Optimizes Windows services and scheduled tasks.

Reference:

```text
Docs\Reference\Startup.md
```

---

## Privacy

Applies privacy-related registry and policy settings.

Reference:

```text
Docs\Reference\Privacy.md
```

---

## Explorer

Configures Windows File Explorer behavior and user interface preferences.

Reference:

```text
Docs\Reference\Explorer.md
```

---

# Planned Modules

## Hardware

Manages physical devices and radio interfaces such as Wi-Fi, Bluetooth, camera, microphone and similar hardware-facing features.

The Hardware module should not manage network protocols. Those belong to the Network module.

---

## Network

Manages network protocols, discovery features and network-related services.

Examples include SMB, IPv6, NetBIOS, LLMNR, mDNS and Network Discovery.

---

## Defender

Manages Microsoft Defender configuration.

The goal is to tune Defender without weakening system security.

---

## Updates

Manages Windows Update behavior.

This module should focus on update policy and user experience rather than disabling Windows Update entirely.

---

## Cleanup

Manages temporary files, Windows Update cache and maintenance tasks.

---

## Backup

Provides backup and rollback support before applying system modifications.

---

# Design Rule

A module is defined by its responsibility, not by the implementation method.

Avoid creating modules named after technologies such as Registry, Services or PowerShell unless they are framework-level utilities.
