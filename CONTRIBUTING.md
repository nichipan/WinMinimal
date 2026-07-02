\# Contributing



Thank you for your interest in WinMinimal!



WinMinimal is an open-source project whose goal is to provide a clean,

maintainable and reproducible framework for building minimal Windows

installations.



Contributions, ideas and constructive feedback are always welcome.



\---



\# Project Principles



WinMinimal follows a few simple engineering principles:



\* Small modules

\* One responsibility per module

\* Explicit configuration

\* Simple and readable code

\* Deterministic behavior

\* Repeatable execution

\* Idempotent operations

\* Clear documentation

\* Safe by default



Whenever possible, prefer simplicity over cleverness.



\---



\# WinMinimal Development Rule



A module is considered \*\*complete\*\* only when it includes all of the following:



\* Implementation

\* Configuration

\* Logging

\* Reporting

\* User documentation

\* Technical reference documentation



In other words, code alone is not considered a completed feature.



Every WinMinimal module should be:



\* configurable,

\* executable,

\* logged,

\* reported,

\* understandable by users,

\* maintainable by developers.



\---



\# Keep Modules Small



Each module should have a single, well-defined responsibility.



Avoid creating large modules that perform unrelated tasks.



If a feature grows beyond its original scope, consider splitting it into multiple modules rather than increasing complexity.



Small modules are easier to:



\* understand,

\* test,

\* document,

\* maintain,

\* and reuse.



\---



\# Coding Style



\* Use PowerShell approved verbs whenever possible.

\* Keep functions short and focused.

\* Prefer explicit code over clever code.

\* Write comments and documentation in English.

\* Keep configuration separate from implementation.

\* Avoid duplicated information.

\* Prefer one authoritative source for every configurable value.

\* Write code that is easy to read six months later.



\---



\# Documentation



Documentation is considered part of the implementation.



When adding or modifying functionality, update the relevant documentation, including where applicable:



\* `README.md`

\* `CHANGELOG.md`

\* `Docs/Configuration.md`

\* `Docs/Modules.md`

\* `Docs/Reference/<Module>.md`



\---



\# Pull Requests



Before submitting a Pull Request:



\* Test your changes.

\* Update the documentation.

\* Keep commits focused on a single logical change.

\* Verify that logging and reporting remain consistent.

\* Ensure the project still follows the WinMinimal Development Rule.



\---



\# Project Philosophy



WinMinimal is \*\*not\*\* a collection of Windows tweaks.



Its goal is to provide a structured, understandable and reproducible framework

for building minimal Windows installations.



Every contribution should improve one or more of these qualities:



\* Simplicity

\* Maintainability

\* Consistency

\* Reliability

\* Documentation



