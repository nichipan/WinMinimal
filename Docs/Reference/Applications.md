# Applications Module Reference



## Overview



The Applications module removes unwanted Microsoft AppX packages from Windows.



The primary goal is **not** to remove as much software as possible, but to

provide a clean, lightweight and reproducible Windows installation suitable

for advanced users, HTPCs, workstations and laboratory environments.



Applications are removed only if explicitly listed in the project defaults.



The module is:



* Configuration-driven

* Safe by default

* Idempotent

* Fully logged

* Report-aware



---



# Removal Strategy



WinMinimal performs two different operations.



## Installed Packages



Removes AppX packages currently installed for existing users.



PowerShell command:



```powershell

Get-AppxPackage

```



---



## Provisioned Packages



Removes AppX packages from the Windows image so that they will not be

installed automatically for newly created users.



PowerShell command:



```powershell

Get-AppxProvisionedPackage -Online

```



---



# Current Applications



The current application list is maintained in:



```text

Config\Defaults.ps1

```



The list currently includes packages such as:



* Clipchamp

* Bing News

* Bing Weather

* Copilot

* Dev Home

* Gaming App

* Gaming Services

* Get Help

* Get Started

* Microsoft Teams

* Outlook for Windows

* People

* Power Automate Desktop

* To Do

* Windows Maps

* Windows Feedback Hub

* Xbox components

* Groove Music

* Movies \& TV



The exact list may evolve between releases.



---



# Safety



The module removes only applications explicitly listed in the configuration.



No package outside the configured list is modified.



If a package is not installed, WinMinimal simply skips it.



Running the module multiple times is safe.



---



# Configuration



Main options:



```powershell

$EnableAppRemoval = $true

$RemoveProvisionedPackages = $true

$RemoveCopilot = $true

$RemoveXboxComponents = $true

```



---



# Logging



Every processed package is written to the execution log.



Examples:



* Package found

* Package removed

* Package already absent

* Removal failed



---



# Reporting



The module contributes the following execution counters:



* Applications processed

* Applications removed

* Warnings

* Errors



These values appear in the final execution summary.



---



# Future Improvements



Future versions may introduce:



* Optional package categories

* Dry-run mode

* Interactive confirmation

* Custom application lists

* Export of removed packages



---



# References



* Microsoft AppX documentation.

* Microsoft DISM provisioning documentation.

* WinMinimal source code (`WinMinimal.Applications.psm1`).
