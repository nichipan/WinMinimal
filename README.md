# WinMinimal

> **A modular PowerShell framework to build a clean, lightweight and predictable Windows 11 installation.**

WinMinimal is **not** another Windows "debloat" script.

It is an open-source project designed around modularity, maintainability and repeatability, with the goal of creating a clean Windows installation while preserving system stability.

---

# Philosophy

WinMinimal follows a few simple engineering principles:

* Small modules
* One responsibility per module
* Explicit configuration
* Configuration separated from implementation
* Readable code
* Deterministic behavior
* Repeatable execution
* Simplicity over cleverness

---

# Features

* Modular PowerShell architecture
* User-configurable settings
* Detailed execution logs
* Repeatable execution
* Microsoft-native tools
* Designed for Windows 11 Pro
* Easy to extend

---

# Quick Start

If this is your first time using WinMinimal, begin with:

➡ **INSTALL.md**

The installation guide explains every required step, including PowerShell configuration and first execution.

---

# Project Structure

```text
WinMinimal
│
├── README.md
├── INSTALL.md
├── ARCHITECTURE.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── LICENSE
├── .gitignore
├── Run-WinMinimal.ps1
│
├── Config
│   ├── Config.ps1
│   ├── Defaults.ps1
│   └── Profiles
│
├── Modules
│
├── Scripts
│
├── Docs
│
├── Logs
│
└── Backup
```

---

# Current Modules

Current implementation includes:

* Application removal
* Startup optimization

Additional modules are planned and tracked in **Docs/Roadmap.md**.

---

# Documentation

| Document        | Purpose                          |
| --------------- | -------------------------------- |
| INSTALL.md      | Installation and first execution |
| ARCHITECTURE.md | Project architecture             |
| CHANGELOG.md    | Version history                  |
| CONTRIBUTING.md | Contribution guidelines          |
| SECURITY.md     | Security policy                  |
| Docs/Roadmap.md | Planned features                 |

---

# Roadmap

Planned future improvements include:

* Configuration profiles
* Privacy optimization
* Explorer optimization
* Network optimization
* Microsoft Defender tuning
* Cleanup module
* HTML and JSON reports
* Dry-run mode
* Backup and partial rollback

See **Docs/Roadmap.md** for the complete roadmap.

---

# Project Status

WinMinimal is currently under active development.

The core architecture has been established and new modules will be added incrementally while maintaining backward compatibility whenever possible.

---

# Contributing

Contributions, ideas, bug reports and feature requests are always welcome.

Please read **CONTRIBUTING.md** before submitting a Pull Request.

---

# License

WinMinimal is released under the **GNU General Public License v3.0 (GPL-3.0)**.

See the **LICENSE** file for details.

---

# Final Note

WinMinimal was created with a simple idea:

> **Clean Windows. Predictable Windows. Documented Windows.**
