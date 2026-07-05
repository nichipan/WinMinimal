# WinMinimal Modules

This document provides a high-level overview of the WinMinimal module catalog.

Modules are organized by responsibility, not by implementation technique.

---

# Module Catalog

| Module | Status | Scope |
|--------|:------:|-------|
| Applications | Implemented | Installed applications and provisioned AppX packages. |
| Startup | Implemented | Startup behavior, Windows services and scheduled tasks. |
| Privacy | Implemented | Privacy, telemetry and personalization settings. |
| Explorer | Implemented | File Explorer behavior and user interface preferences. |
| Hardware | Implemented | Physical devices and radio interfaces. |
| Network | Implemented | Network protocols and network-related services. |
| Defender | Planned | Microsoft Defender configuration. |
| Updates | Planned | Windows Update behavior. |
| Cleanup | Planned | Maintenance and temporary file cleanup. |
| Backup | Planned | Backup and rollback support. |
| Validation | Planned | Project validation and consistency checks. |

---

# Responsibility Boundaries

| If the feature affects... | Module |
|---------------------------|--------|
| Built-in applications | Applications |
| Services started at boot | Startup |
| Scheduled background tasks | Startup |
| File Explorer user interface | Explorer |
| Telemetry and personalization | Privacy |
| Wi-Fi, Bluetooth, camera, microphone or NFC | Hardware |
| SMB, LLMNR, NetBIOS, mDNS or Network Discovery | Network |
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

## Hardware

Controls physical devices and radio interfaces such as Wi-Fi, Bluetooth, Nearby Sharing, location services and NFC-related services where present.

Reference:

```text
Docs\Reference\Hardware.md
```

---

## Network

Controls network protocols, discovery mechanisms and network-related services such as SMBv1, LLMNR, Network Discovery and mDNS-related services where present.

Reference:

```text
Docs\Reference\Network.md
```

---

# Planned Modules

## Defender

Manages Microsoft Defender configuration.

## Updates

Manages Windows Update behavior.

## Cleanup

Manages temporary files, Windows Update cache and maintenance tasks.

## Backup

Provides backup and rollback support before applying system modifications.

## Validation

Provides repository and project validation checks before commits or releases.
