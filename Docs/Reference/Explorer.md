\# Explorer Module Reference



This document describes the Explorer optimization module implemented by WinMinimal.



The module configures selected Windows File Explorer preferences to improve usability while preserving predictable system behavior.



All settings are configurable and can be individually enabled or disabled through the project configuration.



\---



\# Overview



The Explorer module currently manages a small set of user interface preferences.



Its primary goals are to:



\* improve usability;

\* reduce unnecessary visual clutter;

\* expose useful information by default;

\* keep every modification reversible.



The module modifies only per-user Explorer settings.



No system components are removed or disabled.



\---



\# Explorer Settings Summary



| Setting                               | Safe | Reboot | Reversible |

| ------------------------------------- | :--: | :----: | :--------: |

| Show file extensions                  |   ✔  |   No   |     Yes    |

| Show hidden files                     |   ✔  |   No   |     Yes    |

| Hide protected operating system files |   ✔  |   No   |     Yes    |

| Open Explorer to \*\*This PC\*\*          |   ✔  |   No   |     Yes    |

| Disable Recent Files                  |   ✔  |   No   |     Yes    |

| Disable Frequent Folders              |   ✔  |   No   |     Yes    |



\---



\# Configuration



Explorer settings are controlled through:



```text

Config\\Config.ps1

```



Default values are defined in:



```text

Config\\Defaults.ps1

```



Users should normally modify only `Config.ps1`.



\---



\# Registry Changes



The module currently modifies the following registry values.



| Registry Value    | Purpose                                                |

| ----------------- | ------------------------------------------------------ |

| `HideFileExt`     | Show or hide file name extensions.                     |

| `Hidden`          | Show or hide hidden files.                             |

| `ShowSuperHidden` | Show or hide protected operating system files.         |

| `LaunchTo`        | Open File Explorer to \*\*This PC\*\* or \*\*Quick Access\*\*. |

| `ShowRecent`      | Enable or disable Recent Files.                        |

| `ShowFrequent`    | Enable or disable Frequent Folders.                    |



All registry modifications are performed under the current user profile.



\---



\# Expected Impact



The Explorer module affects only the File Explorer user interface.



No changes are made to:



\* installed applications;

\* Windows services;

\* scheduled tasks;

\* security features;

\* network configuration.



The module is designed to be low risk and suitable for everyday desktop environments.



\---



\# Reboot Requirements



A full system reboot is not normally required.



Some Explorer settings may require:



\* restarting \*\*Windows Explorer\*\*; or

\* signing out and signing in again.



WinMinimal does not currently restart Explorer automatically.



\---



\# Logging



The module records every applied change through the common logging framework.



Detailed execution logs are written to the project log directory.



\---



\# Reporting



The Explorer module contributes to the global execution summary by reporting:



\* Explorer settings processed;

\* Explorer settings successfully applied;

\* warnings;

\* errors.



These values are displayed together with the results of the other optimization modules.



\---



\# Safety Notes



The Explorer module is intentionally conservative.



Every implemented setting:



\* is reversible;

\* uses documented Windows configuration mechanisms;

\* affects only the current user;

\* does not modify system binaries;

\* does not reduce Windows security.



\---



\# Future Evolution



Possible future Explorer optimizations include:



\* compact mode;

\* navigation pane customization;

\* default folder view preferences;

\* additional File Explorer usability options.



Any new optimization should remain optional, documented and individually configurable.



