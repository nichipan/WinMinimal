# Network Module Reference

This document describes the Network optimization module implemented by WinMinimal.

The module manages network protocols, discovery mechanisms and network-related services.

---

# Overview

The Network module controls Windows network behavior that may be unnecessary or undesirable on minimal, fixed-purpose or appliance-like systems.

Its current scope includes:

- SMBv1;
- LLMNR;
- Network Discovery services;
- mDNS-related services where present.

IPv6 is intentionally excluded from the initial implementation.

---

# Network Settings Summary

| Setting | Safe | Reboot | Reversible |
|----------|:----:|:------:|:----------:|
| Disable SMBv1 | Yes | Recommended | Yes |
| Disable LLMNR | Yes | Recommended | Yes |
| Disable NetBIOS | Depends | Recommended | Yes |
| Disable Network Discovery | Depends | Recommended | Yes |
| Disable mDNS | Depends | Recommended | Yes |

---

# Configuration

Network settings are configured through:

```text
Config\Config.ps1
```

Default implementation lists are stored in:

```text
Config\Defaults.ps1
```

---

# Technical Details

| Area | Mechanism |
|------|-----------|
| SMBv1 | Windows optional feature |
| LLMNR | Registry policy |
| Network Discovery | Windows services |
| mDNS | Windows service, where present |

---

# IPv6 Policy

IPv6 is intentionally not disabled by WinMinimal.

Disabling IPv6 can create compatibility and support issues in Windows environments.

---

# Expected Impact

The Network module can affect discovery and legacy network compatibility.

---

# Reboot Requirements

A reboot is recommended after applying Network optimizations.

---

# Reporting

The Network module contributes to the global execution summary by reporting Network settings successfully applied, warnings and errors.
