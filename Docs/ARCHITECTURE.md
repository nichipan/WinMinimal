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

# Domain Boundaries

A module is defined by its responsibility, not by the implementation technique.

| Domain | Responsibility |
|--------|----------------|
| Applications | Built-in applications and provisioned packages. |
| Startup | Startup behavior, services and scheduled tasks. |
| Privacy | Privacy, telemetry and personalization. |
| Explorer | File Explorer behavior and user interface preferences. |
| Hardware | Physical devices and radio interfaces. |
| Network | Network protocols, discovery and network-related services. |

Wi-Fi and Bluetooth are Hardware concerns because they are physical or radio interfaces.

SMB, LLMNR, NetBIOS and mDNS are Network concerns because they are protocols or network discovery mechanisms.

IPv6 is intentionally not part of the initial Network implementation because disabling it can have broad compatibility and support implications.

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
