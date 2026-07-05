# Hardware Module Reference

This document describes the Hardware optimization module implemented by WinMinimal.

The module manages physical devices and radio interfaces through Windows services and registry settings where applicable.

---

# Overview

The Hardware module controls hardware-facing features that may be unnecessary on minimal, fixed-purpose or appliance-like Windows installations.

Its scope includes:

- Wi-Fi;
- Bluetooth;
- Nearby Sharing;
- location services;
- NFC-related services where present.

The module does not manage network protocols. Those belong to the Network module.

---

# Hardware Settings Summary

| Setting | Safe | Reboot | Reversible |
|----------|:----:|:------:|:----------:|
| Disable Wi-Fi | Depends | Recommended | Yes |
| Disable Bluetooth | Depends | Recommended | Yes |
| Disable Nearby Sharing | Yes | No | Yes |
| Disable Location Services | Yes | Recommended | Yes |
| Disable NFC | Yes | Recommended | Yes |

---

# Configuration

Hardware settings are configured through:

```text
Config\Config.ps1
```

Default implementation lists are stored in:

```text
Config\Defaults.ps1
```

---

# Expected Impact

The Hardware module may affect device availability.

For example:

- disabling Bluetooth may affect Bluetooth keyboards, mice, headphones or controllers;
- disabling Wi-Fi may affect wireless connectivity;
- disabling location services may affect applications that rely on location access.

---

# Reboot Requirements

A full reboot is recommended after applying Hardware optimizations.

---

# Reporting

The Hardware module contributes to the global execution summary by reporting Hardware settings successfully applied, warnings and errors.
