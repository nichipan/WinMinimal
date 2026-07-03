# Network Module Reference

## Overview

The Network module is planned.

It will manage network protocols, discovery features and network-related services.

This module should not manage physical radio devices such as Wi-Fi or Bluetooth. Those belong to the Hardware module.

---

# Planned Scope

Initial candidates include:

- SMB;
- IPv6;
- NetBIOS;
- LLMNR;
- mDNS;
- Network Discovery;
- remote access related services, where appropriate.

---

# Design Notes

Network changes can have significant compatibility impact.

Every Network setting should clearly document:

- purpose;
- expected impact;
- possible side effects;
- reversibility;
- reboot requirements;
- affected Windows editions.

---

# Status

Planned.
