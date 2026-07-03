# WinMinimal Documentation Guide

This document defines the documentation style and structure used by the WinMinimal project.

Its goal is to keep all project documentation consistent, readable and maintainable.

---

# Documentation Principle

Documentation is part of the implementation.

A feature is not considered complete until the corresponding documentation has been updated.

Documentation should explain:

- what the feature does;
- why it exists;
- how it is configured;
- what system areas it modifies;
- what impact it may have.

---

# Documentation Hierarchy

WinMinimal documentation is organized into layers.

| Layer | Purpose |
|-------|---------|
| `README.md` | Project overview and entry point. |
| `INSTALL.md` | First installation and execution. |
| `Docs/ARCHITECTURE.md` | Framework architecture. |
| `Docs/Configuration.md` | User-facing configuration reference. |
| `Docs/Modules.md` | Module catalog and responsibility map. |
| `Docs/Guides/` | Development and documentation guides. |
| `Docs/Reference/` | Technical implementation reference. |
| `Docs/Roadmap.md` | Planned future development. |
| `CHANGELOG.md` | Historical record of changes. |

Each document should have one clear responsibility.

Avoid duplicating the same information across multiple documents.

---

# Writing Style

Use simple technical English.

Prefer:

- short sentences;
- direct explanations;
- precise terminology;
- neutral language;
- concrete descriptions.

Avoid:

- marketing language;
- unnecessary adjectives;
- vague claims;
- jokes inside formal documentation;
- overly long paragraphs.

Documentation should be readable in GitHub, Visual Studio Code and plain text editors.

---

# Markdown Style

Every document should start with a single top-level title:

```markdown
# Document Title
```

Follow the title with a short introduction.

Use horizontal separators between major sections:

```markdown
---
```

Use headings consistently:

```markdown
# Main Section

## Subsection
```

Avoid going deeper than `##` unless the document genuinely requires it.

---

# Lists

Use simple bullet lists.

Preferred style:

```markdown
- first item;
- second item;
- third item.
```

Avoid deeply nested lists.

If a list becomes too complex, consider using a table instead.

---

# Tables

Use tables when comparing responsibilities, settings, modules or options.

Preferred style:

```markdown
| Item | Description |
|------|-------------|
| Example | Explanation. |
```

Keep tables readable in plain text.

Avoid very wide tables when possible.

---

# Code Blocks

Use fenced code blocks with a language identifier when appropriate.

Examples:

```markdown
```powershell
Get-Service
```
```

```markdown
```text
Config\Config.ps1
```
```

Do not include Markdown fences inside PowerShell source files.

---

# Diagrams

Use ASCII diagrams only.

Avoid Unicode arrows or decorative symbols because they may render inconsistently across browsers, terminals and editors.

Preferred style:

```text
Run-WinMinimal.ps1
    |
    +-- Load configuration
    |
    +-- Execute modules
    |
    +-- Show summary
```

Diagrams should explain architecture, not decorate the document.

---

# Document Responsibilities

| Document | Responsibility |
|----------|----------------|
| README | Explain what WinMinimal is. |
| INSTALL | Explain how to run WinMinimal for the first time. |
| Architecture | Explain how the framework is structured. |
| Configuration | Explain user-facing settings. |
| Modules | Explain module responsibilities and status. |
| Developer Guide | Explain how WinMinimal is developed. |
| Documentation Guide | Explain how documentation is written. |
| Reference | Explain implementation details. |
| Roadmap | Explain planned future work. |
| Changelog | Record historical changes. |

---

# Reference Documents

Reference documents should describe what WinMinimal changes on the system.

A reference document should usually include:

- overview;
- summary table;
- configuration options;
- registry keys, services or scheduled tasks;
- purpose;
- impact;
- reboot requirements;
- safety notes.

Reference documentation should explain Windows behavior, not PowerShell syntax.

---

# Updating Documentation

When a change is made, update only the documents affected by that change.

Typical examples:

| Change | Documentation to update |
|--------|-------------------------|
| New configuration option | `Docs/Configuration.md` |
| New module | `Docs/Modules.md`, `Docs/Reference/<Module>.md` |
| New development rule | `CONTRIBUTING.md`, `Docs/Guides/DeveloperGuide.md` |
| New architectural pattern | `Docs/ARCHITECTURE.md` |
| New release entry | `CHANGELOG.md` |

The README should change only when the project identity or documentation map changes.

---

# Final Rule

Documentation should make the project easier to understand.

If a document becomes too long or starts covering multiple responsibilities, split it into a more focused document.
