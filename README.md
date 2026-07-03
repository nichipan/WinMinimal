# WinMinimal

> **A modular framework for building clean, predictable and maintainable Windows installations.**

WinMinimal is **not** another Windows "debloat" script.

It is an open-source framework designed to optimize Windows through a modular, configuration-driven and fully documented approach.

The primary objective of WinMinimal is not simply to remove components or disable services, but to provide a structured and reproducible way to build Windows installations that remain understandable and maintainable over time.

---

# Why WinMinimal?

Many Windows optimization scripts focus on immediate results, often sacrificing readability, maintainability or predictability.

WinMinimal follows a different philosophy.

Every optimization is:

* configurable;
* documented;
* logged;
* reported;
* implemented using Microsoft-native technologies whenever possible.

Rather than being a collection of independent scripts, WinMinimal is designed as a reusable framework that can evolve while preserving consistency across the entire project.

---

# Design Goals

WinMinimal has been designed with a few long-term goals in mind.

* Keep Windows understandable.
* Keep optimizations reproducible.
* Keep the framework easy to extend.
* Keep configuration separate from implementation.
* Favor maintainability over short-term gains.

Every design decision should improve the framework without introducing unnecessary complexity.

---

# Project Philosophy

WinMinimal follows a small set of engineering principles.

* One responsibility per module
* Explicit configuration
* Configuration separated from implementation
* Deterministic behavior
* Repeatable execution
* Idempotent operations whenever possible
* Safe by default
* Readable code
* Comprehensive documentation
* Simplicity over cleverness

---

# Features

WinMinimal provides:

* Modular architecture
* Configuration-driven execution
* Structured logging
* Execution summary reporting
* Microsoft-native implementation
* Comprehensive technical documentation
* Easy extensibility
* Reproducible execution

The framework is designed to grow by adding new independent modules while preserving a consistent architecture.

---

# Project Organization

The project is organized into a small number of well-defined components.

| Component   | Purpose                                                               |
| ----------- | --------------------------------------------------------------------- |
| **Config**  | Project configuration and default optimization settings.              |
| **Modules** | Reusable PowerShell modules implementing the framework functionality. |
| **Scripts** | Executable tasks responsible for a specific optimization area.        |
| **Docs**    | Project documentation, developer guides and technical reference.      |
| **Logs**    | Execution logs generated during script execution.                     |
| **Backup**  | Backup files created before modifying the operating system.           |

---

# Execution Flow

The execution flow is intentionally simple.

```text
                    Run-WinMinimal.ps1
                              |
                              |
                   Loads project configuration
                              |
                              |
                     Imports common modules
                              |
                              |
               Executes enabled optimization scripts
                              |
      +-----------+-----------+-----------+-----------+
      |           |           |           |           |
      v           v           v           v           v
 Applications  Startup    Privacy   Explorer   Future Modules
      |           |           |           |           |
      +-----------+-----------+-----------+-----------+
                              |
                              |
                       Execution report
                              |
                              |
                      Final execution summary
```

Each optimization area is implemented independently while sharing the same configuration, logging and reporting framework.

---

# Documentation

The project documentation is organized into dedicated documents, each with a specific purpose.

| Document                          | Purpose                                          |
| --------------------------------- | ------------------------------------------------ |
| **INSTALL.md**                    | Installation and first execution.                |
| **Docs/ARCHITECTURE.md**          | Framework architecture and design principles.    |
| **Docs/Configuration.md**         | Configuration reference.                         |
| **Docs/Modules.md**               | Overview of the project modules.                 |
| **Docs/Roadmap.md**               | Planned future development.                      |
| **Docs/Guides/DeveloperGuide.md** | Development workflow and project conventions.    |
| **Docs/Reference/**               | Technical reference for each implemented module. |
| **CHANGELOG.md**                  | Project version history.                         |
| **CONTRIBUTING.md**               | Contribution guidelines.                         |
| **SECURITY.md**                   | Security policy.                                 |
| **CODE_OF_CONDUCT.md**            | Community guidelines.                            |

The documentation is intentionally organized into different layers.

The **Architecture** document explains how the framework is designed.

The **Guides** describe development practices and project conventions.

The **Reference** documents describe implementation details such as registry modifications, Windows services, scheduled tasks, expected impact, reboot requirements and design rationale for each implemented module.

---

# Contributing

Contributions, ideas, bug reports and feature requests are always welcome.

Please read **CONTRIBUTING.md** before opening an Issue or submitting a Pull Request.

---

# License

WinMinimal is released under the **GNU General Public License v3.0 (GPL-3.0)**.

See the **LICENSE** file for details.

---

# Final Note

WinMinimal is not simply a collection of Windows tweaks.

Its objective is to provide a structured, understandable and reproducible framework for building Windows installations.

> **Clean Windows. Predictable Windows. Documented Windows.**
