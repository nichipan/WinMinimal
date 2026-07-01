\# WinMinimal Architecture



WinMinimal is built around a simple modular architecture.



&#x20;       Configuration



&#x20;     Config.ps1

&#x20;     Defaults.ps1

&#x20;     Profiles



&#x20;            │



&#x20;            ▼



&#x20;     Run-WinMinimal.ps1



&#x20;            │



&#x20;            ▼



&#x20;        Script Layer



&#x20;    Invoke-RemoveApps



&#x20;Invoke-OptimizeStartup



&#x20;            │



&#x20;            ▼



&#x20;        Module Layer



&#x20;Applications.psm1



&#x20;  Services.psm1



&#x20;   Common.psm1



&#x20;            │



&#x20;            ▼



&#x20;       Windows 11





The runner orchestrates the execution.



Scripts contain only orchestration logic.



Modules contain the implementation.



Configuration is completely separated from the implementation.



This design keeps the project modular, maintainable and easy to extend.

