# WinMinimal Developer Guide

This document describes the development workflow and conventions used throughout the WinMinimal project.

Its purpose is to ensure that every contribution follows the same architectural principles and maintains consistency across the entire framework.

---

# Development Philosophy

WinMinimal is developed as a framework rather than a collection of unrelated scripts.

Every contribution should improve one or more of the following characteristics:

- readability;
- maintainability;
- reproducibility;
- consistency;
- documentation.

Features should never increase complexity without providing clear long-term value.

---

# Choosing the Right Module

A module is defined by its responsibility, not by the implementation technique.

| If the feature affects... | Use this module |
|---------------------------|-----------------|
| Installed applications | Applications |
| Windows startup behavior | Startup |
| File Explorer behavior | Explorer |
| Privacy, telemetry or personalization | Privacy |
| Physical devices and radio interfaces | Hardware |
| Network protocols and services | Network |
| Microsoft Defender | Defender |
| Windows Update behavior | Updates |
| Temporary files and maintenance | Cleanup |
| Backup and restore | Backup |

Avoid creating modules based only on implementation techniques such as "Registry", "Services" or "PowerShell".

---

# Development Workflow

Every new feature follows the same lifecycle.

```text
New Feature
    |
    +-- Configuration
    |
    +-- Defaults
    |
    +-- Implementation
    |
    +-- Logging
    |
    +-- Reporting
    |
    +-- Documentation
    |
    +-- Validation
    |
    +-- Commit
    |
    +-- Push
```

Skipping one of these steps usually results in technical debt.

---

# Adding a New Module

A typical module consists of the following elements.

| Component | Purpose |
|----------|---------|
| Configuration | User-configurable options. |
| Defaults | Default values and registry definitions. |
| Module | Shared implementation logic. |
| Script | Executable entry point. |
| Logging | Execution trace. |
| Reporting | Summary counters. |
| Documentation | User documentation. |
| Reference | Technical implementation details. |

Modules should be independent and reusable whenever possible.

---

# Development Rules

Every WinMinimal module is considered complete only when it includes:

- implementation;
- configuration;
- logging;
- reporting;
- user documentation;
- technical reference documentation.

Code alone is not considered a completed feature.

---

# Coding Guidelines

General coding principles include:

- use PowerShell approved verbs whenever possible;
- prefer explicit code over clever code;
- keep functions focused on a single responsibility;
- avoid duplicated logic;
- move reusable functionality into the Common framework;
- keep configuration separate from implementation;
- write comments and documentation in English.

Code should be easy to understand six months after it has been written.

---

# Documentation

Documentation is considered part of the implementation.

When adding or modifying functionality, update the relevant project documentation before considering the work complete.

Typical documents include:

- `CHANGELOG.md`
- `Docs/Configuration.md`
- `Docs/Modules.md`
- `Docs/Guides/DocumentationGuide.md`
- `Docs/Reference/*`
- `CONTRIBUTING.md`, when development rules change

---

# Validation

Before creating a commit, verify that:

- the project executes successfully;
- PowerShell files contain no accidental Markdown delimiters;
- logging is consistent;
- reporting has been updated;
- documentation reflects the implemented changes;
- no obsolete code remains.

Automated validation tools may complement these checks but should not replace careful review.

---

# Design Guidelines

When making architectural decisions, prefer:

- simplicity over flexibility;
- readability over compactness;
- consistency over novelty;
- shared services over duplicated implementations.

The architecture should evolve slowly.

Individual modules may evolve more rapidly.

---

# Long-Term Vision

The goal of WinMinimal is to provide a framework that remains understandable and maintainable even as new optimization modules are introduced.

Architectural stability is considered more valuable than rapid feature growth.

Every contribution should preserve this principle.
