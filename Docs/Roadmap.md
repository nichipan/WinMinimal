# WinMinimal Roadmap

This document tracks planned features, improvements and future ideas for the WinMinimal project.

The roadmap is intentionally lightweight. It describes direction, not detailed implementation plans.

---

# Completed Foundations

The following foundations are already in place:

- project directory structure;
- modular architecture;
- configuration framework;
- logging framework;
- reporting framework;
- common helper module;
- application removal module;
- startup optimization module;
- privacy optimization module;
- Explorer optimization module;
- initial project documentation;
- technical reference documentation;
- GitHub repository.

---

# Near-Term Priorities

## Project Validation

Planned work:

- PowerShell syntax validation;
- detection of accidental Markdown in source files;
- required file checks;
- module import checks;
- basic consistency checks.

Goal:

Provide a safe pre-commit validation tool for WinMinimal itself.

---

## Hardware Module

Planned scope:

- Wi-Fi;
- Bluetooth;
- camera;
- microphone;
- other physical devices and radio interfaces.

Goal:

Control hardware-facing features through a dedicated module.

---

## Network Module

Planned scope:

- SMB;
- IPv6;
- NetBIOS;
- LLMNR;
- mDNS;
- Network Discovery;
- network-related services.

Goal:

Separate network protocols from physical connectivity hardware.

---

# Mid-Term Priorities

## Defender Module

Goal:

Tune Microsoft Defender without weakening system security.

---

## Updates Module

Goal:

Control Windows Update behavior in a conservative and documented way.

---

## Cleanup Module

Planned scope:

- temporary files;
- Windows Update cache;
- component cleanup;
- log maintenance.

---

## Backup and Rollback

Planned scope:

- registry backup;
- service configuration backup;
- scheduled task backup;
- partial rollback where feasible.

---

# Future Ideas

## Reporting

- HTML report;
- JSON report;
- CSV export.

## Execution

- dry-run mode;
- interactive mode;
- module selection;
- profile-aware execution.

## Automation

- GitHub Actions;
- automated validation;
- PowerShell module packaging.

## Compatibility

- Windows Server support;
- future Windows versions;
- ARM64 evaluation.

---

# Guiding Principles

Every roadmap item should follow these principles:

- keep modules small;
- assign one responsibility per module;
- prefer explicit configuration;
- separate configuration from implementation;
- preserve Windows stability;
- document the reason for every change;
- prefer Microsoft-supported APIs and tools whenever possible.
