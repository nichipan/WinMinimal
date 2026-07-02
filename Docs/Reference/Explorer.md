\# Explorer Module Reference



\## Overview



The Explorer module customizes the Windows File Explorer user experience.



Unlike other WinMinimal modules, this module focuses primarily on usability

rather than performance.



The objective is to provide a clean and efficient working environment for

technical users, administrators and power users while remaining fully

configuration-driven.



The module follows the WinMinimal design principles:



\* Safe by default

\* Configuration-driven

\* Idempotent

\* Fully logged

\* Report-aware



\---



\# Explorer Settings Summary



| Setting                               | Safe | Reboot | Reversible |

| ------------------------------------- | :--: | :----: | :--------: |

| Show file extensions                  |   ✔  |   No   |     Yes    |

| Show hidden files                     |   ✔  |   No   |     Yes    |

| Hide protected operating system files |   ✔  |   No   |     Yes    |

| Open Explorer to "This PC"            |   ✔  |   No   |     Yes    |

| Disable Recent Files                  |   ✔  |   No   |     Yes    |

| Disable Frequent Folders              |   ✔  |   No   |     Yes    |



\---



\# Show File Extensions



\## Configuration



```powershell

$ShowFileExtensions = $true

```



\## Purpose



Always display file name extensions.



\## Benefits



\* Improves security.

\* Makes file types immediately visible.

\* Avoids confusion caused by hidden extensions.



\---



\# Show Hidden Files



\## Configuration



```powershell

$ShowHiddenFiles = $true

```



\## Purpose



Displays hidden files and folders.



\## Benefits



Useful for troubleshooting, scripting and system administration.



\---



\# Hide Protected Operating System Files



\## Configuration



```powershell

$ShowProtectedOperatingSystemFiles = $false

```



\## Purpose



Keeps critical operating system files hidden.



\## Benefits



Reduces the risk of accidental deletion.



\---



\# Open Explorer to This PC



\## Configuration



```powershell

$OpenExplorerToThisPC = $true

```



\## Purpose



Opens File Explorer directly on \*\*This PC\*\* instead of \*\*Home\*\*.



\## Benefits



Provides immediate access to drives and mounted volumes.



\---



\# Disable Recent Files



\## Configuration



```powershell

$DisableExplorerRecentFiles = $true

```



\## Purpose



Disables the Recent Files section shown by File Explorer.



\## Benefits



\* Improves privacy.

\* Reduces visual clutter.



\---



\# Disable Frequent Folders



\## Configuration



```powershell

$DisableExplorerFrequentFolders = $true

```



\## Purpose



Disables the Frequent Folders section.



\## Benefits



Provides a cleaner Explorer interface.



\---



\# Safety



Explorer customization affects only user interface preferences.



No system components are removed or disabled.



All settings are reversible.



\---



\# Logging



Every applied Explorer setting is written to the execution log.



\---



\# Reporting



The module will contribute its own execution counters in the WinMinimal summary.



\---



\# Future Improvements



Possible future settings include:



\* Compact View

\* Launch folder windows in a separate process

\* Navigation Pane customization

\* Preview Pane

\* Details Pane

\* Default folder view

\* Explorer context menu options

\* Classic context menu

\* Ribbon / command bar customization



\---



\# References



\* Microsoft File Explorer documentation.

\* Microsoft Windows Shell documentation.

\* WinMinimal source code (`WinMinimal.Explorer.psm1`).



