\# Privacy Module Reference



\## Overview



The Privacy module applies Windows settings intended to reduce telemetry,

personalization and consumer-oriented features while preserving full system

functionality.



The module follows the WinMinimal design principles:



\* Safe by default

\* Configuration-driven

\* Idempotent

\* Fully logged

\* Fully documented



Unless otherwise stated, every optimization is reversible.



\---



\# Privacy Settings Summary



| Setting                      | Safe |    Reboot   | Reversible |

| ---------------------------- | :--: | :---------: | :--------: |

| Disable Advertising ID       |   ✔  |      No     |     Yes    |

| Disable Activity History     |   ✔  | Recommended |     Yes    |

| Disable Tailored Experiences |   ✔  |      No     |     Yes    |

| Disable Suggested Content    |   ✔  |      No     |     Yes    |

| Disable Consumer Features    |   ✔  | Recommended |     Yes    |



\---



\# Disable Advertising ID



\## Configuration



```powershell

$DisableAdvertisingId = $true

```



\## Registry



```text

HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\AdvertisingInfo



Enabled = 0

```



\## Purpose



Disables the Windows Advertising ID used by applications to personalize

advertising.



\## Impact



\* Improves user privacy.

\* Reduces application personalization.



\## Reboot Required



No.



\---



\# Disable Activity History



\## Configuration



```powershell

$DisableActivityHistory = $true

```



\## Registry



```text

HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows\\System



PublishUserActivities = 0

UploadUserActivities = 0

```



\## Purpose



Prevents Windows from publishing and synchronizing user activity history.



\## Impact



Improves privacy by reducing synchronization of Timeline-related data.



\## Reboot Required



Recommended.



\---



\# Disable Tailored Experiences



\## Configuration



```powershell

$DisableTailoredExperiences = $true

```



\## Registry



```text

HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Privacy



TailoredExperiencesWithDiagnosticDataEnabled = 0

```



\## Purpose



Disables Windows tailored experiences based on diagnostic data.



\## Impact



Reduces Microsoft personalization features.



\## Reboot Required



No.



\---



\# Disable Suggested Content



\## Configuration



```powershell

$DisableSuggestedContent = $true

```



\## Registry



```text

HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager

```



Modified values:



\* SubscribedContent-338388Enabled = 0

\* SilentInstalledAppsEnabled = 0

\* SystemPaneSuggestionsEnabled = 0



\## Purpose



Disables Windows suggestions, promoted content and silent installation of

consumer applications.



\## Impact



Provides a cleaner Windows experience with fewer recommendations.



\## Reboot Required



No.



\---



\# Disable Consumer Features



\## Configuration



```powershell

$DisableConsumerFeatures = $true

```



\## Registry



```text

HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent



DisableWindowsConsumerFeatures = 1

```



\## Purpose



Disables Windows Consumer Features through Group Policy registry settings.



\## Impact



Prevents Windows from enabling several consumer-oriented features.



\## Reboot Required



Recommended.



\---



\# References



\* Microsoft Windows Policy documentation.

\* Microsoft Windows registry documentation.

\* WinMinimal source code (`WinMinimal.Privacy.psm1`).



