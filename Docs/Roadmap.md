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
- Hardware optimization module;
- Network optimization module;
- initial project documentation;
- technical reference documentation;
- GitHub repository.

---

# Current Version

## Version 0.5.0

Current focus:

- Hardware optimization;
- Network optimization;
- documentation updates for Hardware and Network;
- reporting integration for Hardware and Network.

---

# Near-Term Priorities

## Project Validation

Planned work:

- PowerShell syntax validation;
- detection of accidental Markdown in source files;
- required file checks;
- module import checks;
- basic consistency checks;
- Markdown table checks.

Goal:

Provide a safe pre-commit validation tool for WinMinimal itself.

---

## Defender Module

Goal:

Tune Microsoft Defender without weakening system security.

---

## Updates Module

Goal:

Control Windows Update behavior in a conservative and documented way.

---

# Mid-Term Priorities

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
