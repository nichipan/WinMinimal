# WinMinimal Architecture

This document describes the high-level architecture of the WinMinimal framework.

It is intended for users and contributors who want to understand how the project is organized and how its components interact.

Implementation details are documented separately in the technical reference documents.

---

# Architectural Goals

WinMinimal has been designed around a few long-term objectives:

- modularity;
- maintainability;
- predictability;
- reproducibility;
- simplicity;
- extensibility.

The architecture favors long-term consistency over short-term convenience.

---

# High-Level Architecture

The framework is composed of a small number of cooperating components.

```text
                 +----------------------+
                 | Run-WinMinimal.ps1   |
                 +----------+-----------+
                            |
                            |
                     Load Configuration
                            |
                            |
                 +----------v-----------+
                 |  Config / Defaults   |
                 +----------+-----------+
                            |
                            |
                 +----------v-----------+
                 |  Common Framework    |
                 +----------+-----------+
                            |
        +-------------------+-------------------+
        |                   |                   |
        v                   v                   v
  Optimization        Optimization      Optimization
     Module              Module             Module
        |                   |                   |
        +-------------------+-------------------+
                            |
                            |
                 +----------v-----------+
                 |     Reporting        |
                 +----------+-----------+
                            |
                            |
                 Execution Summary
```

Every optimization module shares the same configuration, logging and reporting infrastructure.

This architecture allows new functionality to be added without modifying the overall framework.

---

# Core Components

| Component | Responsibility |
|----------|----------------|
| **Run-WinMinimal.ps1** | Main project entry point. |
| **Config** | Runtime configuration and default settings. |
| **Modules** | Reusable implementation shared across the project. |
| **Scripts** | Executable optimization tasks. |
| **Common Framework** | Shared helper functions used by all modules. |
| **Reporting** | Execution statistics and summary generation. |
| **Logs** | Detailed execution logging. |
| **Docs** | Project documentation and technical reference. |

Each component has a clearly defined responsibility.

Responsibilities should not overlap.

---

# Execution Flow

The framework follows the same execution sequence regardless of the enabled modules.

```text
Run-WinMinimal.ps1
    |
    +-- Load project configuration
    |
    +-- Import common modules
    |
    +-- Execute enabled optimization scripts
    |
    +-- Collect execution statistics
    |
    +-- Generate execution summary
```

Each optimization script is executed independently.

Failures can either stop execution immediately or allow the remaining modules to continue, depending on the project configuration.

---

# Configuration Flow

WinMinimal separates user preferences from implementation defaults.

| File | Purpose |
|------|---------|
| `Config/Config.ps1` | User-facing configuration. |
| `Config/Defaults.ps1` | Project defaults and predefined optimization lists. |

This separation keeps normal configuration simple while preserving advanced defaults in a dedicated file.

---

# Common Framework

Reusable infrastructure belongs in the Common framework.

Examples include:

- administrator checks;
- folder initialization;
- log file creation;
- console output;
- registry helper functions.

Common functionality should not be duplicated across feature modules.

---

# Logging Framework

Logging is a framework service.

Modules write operational details to log files, while the console output remains focused on progress and final status.

This keeps the user interface clean while preserving detailed diagnostic information.

---

# Reporting Framework

Reporting is also a framework service.

Each module contributes execution counters to a shared report object.

The runner displays a final summary at the end of execution.

This provides a consistent user experience across all modules.

---

# Module Architecture

A module is defined by its responsibility, not by the implementation technique.

For example:

- physical devices belong to the Hardware module;
- network protocols belong to the Network module;
- telemetry and personalization belong to the Privacy module.

A module may use registry settings, services, scheduled tasks or PowerShell cmdlets internally, but its identity is defined by the problem domain it manages.

---

# Design Principles

The WinMinimal architecture follows a few simple rules:

- one responsibility per module;
- configuration before implementation;
- shared functionality belongs in the Common framework;
- duplicate logic should be avoided;
- every optimization should be independently executable;
- logging and reporting are framework services;
- documentation is part of the implementation.

These principles help maintain consistency as the project grows.

---

# Future Evolution

The framework has been designed to support additional optimization modules without requiring architectural changes.

Future improvements should extend the framework rather than replace existing components.

Examples include:

- additional optimization modules;
- validation tools;
- backup and rollback features;
- alternative reporting formats;
- graphical interfaces.

The overall architecture is intended to remain stable while the implementation evolves.
