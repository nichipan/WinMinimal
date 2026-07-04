\# WinMinimal Installation Guide



This guide explains how to install and execute WinMinimal for the first time.



\---



\# Prerequisites



Before using WinMinimal, make sure you have:



\* Windows 11 Pro (recommended)

\* Administrator privileges

\* PowerShell 5.1 or newer

\* Git (optional, only if cloning the repository)



\---



\# Clone the Repository



If Git is installed:



```powershell

git clone https://github.com/nichipan/WinMinimal.git

cd WinMinimal

```



Alternatively, download the project as a ZIP archive from GitHub and extract it to a local folder.



\---



\# Open PowerShell as Administrator



Open the Start menu.



Search for:



```

PowerShell

```



Right-click \*\*Windows PowerShell\*\* and select:



```

Run as administrator

```



Accept the User Account Control (UAC) prompt.



Administrator privileges are required because WinMinimal modifies Windows applications, services and scheduled tasks.



\---



\# Allow Script Execution



By default, Windows may prevent PowerShell scripts from running.



Enable script execution \*\*only for the current PowerShell session\*\*:



```powershell

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

```



If prompted, answer:



\* \*\*Y\*\* on English Windows

\* \*\*S\*\* on Italian Windows



This setting is temporary and automatically disappears when the PowerShell window is closed.



\---



\# Review the Configuration



Before executing WinMinimal, review:



```

Config\\Config.ps1

```



This file contains the user-configurable settings.



Advanced users may also customize:



```

Config\\Defaults.ps1

```



which defines the default lists of applications, services and scheduled tasks managed by the project.



\---



\# Execute WinMinimal



Run the main project runner:



```powershell

.\\Run-WinMinimal.ps1

```



The runner executes all enabled modules in the correct order.



\---



\# Verify the Results



After execution:



\* Review the console output.

\* Check the execution logs stored in the `Logs` directory.

\* Reboot Windows if requested or recommended by a module.



\---



\# Updating the Project



If you cloned the repository using Git:



```powershell

git pull

```



Otherwise, download the latest version from GitHub.



\---



\# Need Help?



Before opening an issue, please check:



\* README.md

\* ARCHITECTURE.md

\* Docs/Roadmap.md



If the problem persists, open a GitHub Issue including:



\* Windows version

\* WinMinimal version

\* Console output

\* Relevant log files

\* Description of the problem



\---



\# Disclaimer



WinMinimal modifies Windows configuration.



Although the project is designed to be conservative and well documented, you should always review the configuration before execution and understand the changes being applied.



Use WinMinimal at your own risk.



