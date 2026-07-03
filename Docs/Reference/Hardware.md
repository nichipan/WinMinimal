# Hardware Module Reference

## Overview

The Hardware module is planned.

It will manage physical devices and radio interfaces such as Wi-Fi, Bluetooth, camera, microphone and similar hardware-facing features.

This module should not manage network protocols. Those belong to the Network module.

---

# Planned Scope

Initial candidates include:

- Wi-Fi;
- Bluetooth;
- camera;
- microphone;
- NFC or similar device interfaces, when applicable.

---

# Design Notes

Hardware settings may require different implementation techniques depending on the device type.

Possible mechanisms include:

- Windows services;
- device manager state;
- registry settings;
- PowerShell cmdlets;
- Windows policy settings.

The module responsibility is defined by the device domain, not by the implementation mechanism.

---

# Status

Planned.
