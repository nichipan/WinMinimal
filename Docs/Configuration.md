\# WinMinimal Configuration



This document describes the user-configurable settings available in WinMinimal.



The primary configuration file is:



```text

Config\\Config.ps1

```



Most users will only need to edit this file.



Advanced configuration, including the default lists of applications, services and scheduled tasks, is stored in:



```text

Config\\Defaults.ps1

```



Those settings are intended for advanced users and contributors.



\---



\# Configuration Philosophy



WinMinimal follows a simple principle:



\* `Config.ps1` contains \*\*user preferences\*\*.

\* `Defaults.ps1` contains \*\*project defaults\*\*.

\* Modules contain \*\*implementation logic\*\*.



This separation keeps the project easier to understand, maintain and extend.



\---



\# ConsoleVerbosity



`ConsoleVerbosity` controls how much information is displayed in the console while WinMinimal is running.



Example:



```powershell

$ConsoleVerbosity = "Normal"

```



Supported values:



| Value      | Description                                                                          |

| ---------- | ------------------------------------------------------------------------------------ |

| `Quiet`    | Displays only the final execution summary.                                           |

| `Normal`   | Displays execution progress and the final summary. This is the recommended setting.  |

| `Detailed` | Displays detailed execution information. Useful for troubleshooting and development. |



Regardless of the selected verbosity level, \*\*all execution details are always written to the log files\*\*.



\---



\# Recommended Settings



\## Normal execution



```powershell

$ConsoleVerbosity = "Normal"

```



Recommended for most users.



The console displays:



\* Current operation

\* Execution progress

\* Final summary



\---



\## Troubleshooting



```powershell

$ConsoleVerbosity = "Detailed"

```



Recommended when:



\* investigating unexpected behavior;

\* reporting an issue;

\* developing new modules.



The console displays every operation performed by WinMinimal.



\---



\## Silent execution



```powershell

$ConsoleVerbosity = "Quiet"

```



Recommended for:



\* automated execution;

\* scripting;

\* environments where minimal console output is preferred.



Only the final execution summary is displayed.



\---



\# Logging



Console verbosity \*\*does not affect logging\*\*.



WinMinimal always writes detailed information to the log files located in:



```text

Logs\\

```



This allows the console output to remain clean while preserving complete diagnostic information.



\---



\# Future Configuration Options



Additional user-configurable settings will be documented here as they become available.



Planned options include:



\* Active profile

\* Logging options

\* Error handling

\* Dry-run mode

\* Report generation

\* Backup options



\---



\# Best Practice



For normal usage, only modify:



```text

Config\\Config.ps1

```



Avoid editing:



```text

Config\\Defaults.ps1

```



unless you are customizing WinMinimal itself or contributing to the project.



