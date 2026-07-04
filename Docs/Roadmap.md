\# WinMinimal Roadmap



This document tracks planned features, improvements and future ideas for the WinMinimal project.



The roadmap is intentionally divided into milestones so that development remains focused and incremental.



\---



\# Version 0.1.0 (Current)



\## Core framework



\* \[x] Project directory structure

\* \[x] Modular architecture

\* \[x] Configuration files

\* \[x] Logging framework

\* \[x] Common PowerShell module

\* \[x] Application removal module

\* \[x] Startup optimization module

\* \[x] Main project runner

\* \[x] Initial project documentation



\---



\# Version 0.2.0



\## Reporting



\* \[ ] Execution summary

\* \[ ] Number of applications removed

\* \[ ] Number of services modified

\* \[ ] Number of scheduled tasks disabled

\* \[ ] Number of warnings

\* \[ ] Number of errors

\* \[ ] Execution time

\* \[ ] Better console output formatting



\## Configuration



\* \[ ] Introduce `WinMinimal.Configuration.psm1`

\* \[ ] Move configuration building out of the runner scripts

\* \[ ] Simplify runner scripts



\---



\# Version 0.3.0



\## Profiles



Implement configuration profiles.



Planned profiles:



\* \[ ] Default

\* \[ ] HTPC

\* \[ ] Desktop

\* \[ ] Developer

\* \[ ] VirtualMachine



Documentation:



\* \[ ] Docs/Profiles.md



\---



\# Version 0.4.0



\## Privacy



New module:



\* \[ ] Invoke-OptimizePrivacy.ps1



Features:



\* \[ ] Telemetry settings

\* \[ ] Advertising ID

\* \[ ] Activity history

\* \[ ] Suggested content

\* \[ ] Consumer experiences

\* \[ ] Cloud content



Documentation:



\* \[ ] Docs/Privacy.md



\---



\# Version 0.5.0



\## Explorer



New module:



\* \[ ] Invoke-OptimizeExplorer.ps1



Possible features:



\* \[ ] File extensions

\* \[ ] Hidden files

\* \[ ] Navigation pane

\* \[ ] Explorer preferences



Documentation:



\* \[ ] Docs/Explorer.md



\---



\# Version 0.6.0



\## Network



New module:



\* \[ ] Invoke-OptimizeNetwork.ps1



Possible features:



\* \[ ] SMB tuning

\* \[ ] Network discovery

\* \[ ] Optional IPv6 configuration

\* \[ ] Delivery Optimization



Documentation:



\* \[ ] Docs/Network.md



\---



\# Version 0.7.0



\## Microsoft Defender



New module:



\* \[ ] Invoke-OptimizeDefender.ps1



Goal:



Tune Microsoft Defender without reducing system security.



\---



\# Version 0.8.0



\## Cleanup



New module:



\* \[ ] Invoke-Cleanup.ps1



Possible features:



\* \[ ] Temporary files

\* \[ ] Windows Update cache

\* \[ ] Component cleanup

\* \[ ] Log maintenance



\---



\# Version 0.9.0



\## Advanced Features



\* \[ ] Dry Run / WhatIf mode

\* \[ ] Interactive mode

\* \[ ] Backup support

\* \[ ] Partial rollback

\* \[ ] Configuration validation

\* \[ ] Windows version compatibility checks



\---



\# Version 1.0.0



\## First stable release



Deliverables:



\* \[ ] Complete documentation

\* \[ ] Stable API

\* \[ ] GitHub repository

\* \[ ] CHANGELOG.md

\* \[ ] CONTRIBUTING.md

\* \[ ] SECURITY.md

\* \[ ] LICENSE

\* \[ ] Release notes



\---



\# Future Ideas



These ideas are intentionally postponed to avoid over-engineering during early development.



\## Reporting



\* \[ ] HTML report

\* \[ ] JSON report

\* \[ ] CSV export



\## Configuration



\* \[ ] Configuration wizard

\* \[ ] Automatic profile detection



\## Automation



\* \[ ] GitHub Actions

\* \[ ] Automated testing

\* \[ ] PowerShell module packaging



\## Restore



\* \[ ] Registry backup

\* \[ ] Service configuration backup

\* \[ ] Scheduled task backup



\## Compatibility



\* \[ ] Windows Server support

\* \[ ] Windows 12 support

\* \[ ] ARM64 support



\---



\# Guiding Principles



Every new feature should follow these principles:



\* Keep modules small.

\* One responsibility per module.

\* Prefer explicit configuration over hidden behavior.

\* Separate configuration from implementation.

\* Keep scripts readable.

\* Avoid unnecessary complexity.

\* Preserve Windows stability.

\* Prefer Microsoft-supported APIs and tools whenever possible.



