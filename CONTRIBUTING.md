# Contributing

Thank you for your interest in WinMinimal.

WinMinimal is an open-source project whose goal is to provide a clean, maintainable and reproducible framework for building minimal Windows installations.

Contributions, ideas and constructive feedback are welcome.

---

# Project Principles

WinMinimal follows a few simple engineering principles:

- small modules;
- one responsibility per module;
- explicit configuration;
- simple and readable code;
- deterministic behavior;
- repeatable execution;
- idempotent operations whenever possible;
- clear documentation;
- safe defaults.

Prefer simplicity over cleverness.

---

# WinMinimal Development Rule

A module is considered complete only when it includes:

- implementation;
- configuration;
- logging;
- reporting;
- user documentation;
- technical reference documentation.

Code alone is not considered a completed feature.

Every WinMinimal module should be:

- configurable;
- executable;
- logged;
- reported;
- understandable by users;
- maintainable by developers.

---

# Keep Modules Small

Each module should have a single, well-defined responsibility.

Avoid creating large modules that perform unrelated tasks.

If a feature grows beyond its original scope, consider splitting it into multiple modules rather than increasing complexity.

Small modules are easier to understand, test, document, maintain and reuse.

---

# Coding Style

- Use PowerShell approved verbs whenever possible.
- Keep functions short and focused.
- Prefer explicit code over clever code.
- Write comments and documentation in English.
- Keep configuration separate from implementation.
- Avoid duplicated information.
- Prefer one authoritative source for every configurable value.
- Write code that is easy to read six months later.

---

# Documentation

Documentation is part of the implementation.

When adding or modifying functionality, update the relevant documentation where applicable:

- `README.md`
- `CHANGELOG.md`
- `Docs/Configuration.md`
- `Docs/Modules.md`
- `Docs/Guides/DeveloperGuide.md`
- `Docs/Guides/DocumentationGuide.md`
- `Docs/Reference/<Module>.md`

---

# Pull Requests

Before submitting a Pull Request:

- test your changes;
- update the documentation;
- keep commits focused on a single logical change;
- verify that logging and reporting remain consistent;
- ensure the project still follows the WinMinimal Development Rule.

---

# Project Philosophy

WinMinimal is not a collection of unrelated Windows tweaks.

Its goal is to provide a structured, understandable and reproducible framework for building minimal Windows installations.

Every contribution should improve one or more of these qualities:

- simplicity;
- maintainability;
- consistency;
- reliability;
- documentation.
