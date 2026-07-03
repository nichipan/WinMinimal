# Startup Module Reference



## Overview



The Startup module optimizes Windows startup performance by configuring

Windows services and scheduled tasks.



The objective is **not** to disable as many services as possible, but to

disable or reduce only those that are unnecessary for the target system.



The module follows the WinMinimal design principles:



* Safe by default

* Configuration-driven

* Idempotent

* Fully logged

* Report-aware



---



# Optimization Strategy



The module performs two independent operations:



* Windows Services optimization

* Scheduled Tasks optimization



Each operation can be enabled or disabled independently.



---



# Windows Services



WinMinimal changes the startup type of selected Windows services.



Possible startup types are:



* Automatic

* Manual

* Disabled



Only services explicitly defined in the configuration are modified.



---



# Service Categories



The current service list includes categories such as:



## Telemetry



Examples:



* DiagTrack

* InventorySvc



Purpose



Reduces Windows telemetry and background diagnostics.



---



## Xbox



Examples:



* XblAuthManager

* XblGameSave

* XboxGipSvc

* XboxNetApiSvc



Purpose



Disables Xbox-related background services on systems where gaming is not required.



---



## Search



Example:



* WSearch



Purpose



Disables Windows Search indexing when fast local search is not required.



Recommended for HTPC and appliance-like systems.



---



## SysMain



Example:



* SysMain



Purpose



Disables memory preloading and application prediction.



Useful on systems equipped with SSD storage where SysMain provides little benefit.



---



## Miscellaneous



Other services are disabled because they provide functionality that is not required in a minimal Windows installation, for example:



* Fax

* MapsBroker

* PhoneSvc

* RetailDemo

* WalletService



---



# Scheduled Tasks



The module disables selected scheduled tasks that generate telemetry,

consumer-oriented behaviour or unnecessary background activity.



Current categories include:



* Customer Experience Improvement Program

* Feedback

* Maps



Additional tasks may be added in future releases.



---



# Configuration



Main options:



```powershell

$EnableServiceOptimization = $true

$EnableScheduledTaskOptimization = $true



$DisableTelemetry = $true

$DisableWindowsSearch = $true

$DisableSysMain = $true

$RemoveXboxComponents = $true

```



The complete list of services and scheduled tasks is maintained in:



```text

Config\Defaults.ps1

```



---



# Safety



The module modifies only services and scheduled tasks explicitly listed in the project configuration.



Running the module multiple times is safe.



Missing services or scheduled tasks are skipped automatically.



---



# Logging



The module records:



* services modified

* startup type changes

* scheduled tasks disabled

* warnings

* errors



All details are written to the execution log.



---



# Reporting



The module contributes the following execution counters:



* Services disabled

* Services set to Manual

* Scheduled tasks disabled

* Warnings

* Errors



These values are displayed in the WinMinimal execution summary.



---



# Future Improvements



Future versions may introduce:



* Startup optimization profiles

* Automatic service backup

* Restore capability

* Service dependency analysis

* Optional optimization levels



---



# References



* Microsoft Service Control Manager documentation.

* Microsoft Scheduled Tasks documentation.

* WinMinimal source code (`WinMinimal.Services.psm1`).
