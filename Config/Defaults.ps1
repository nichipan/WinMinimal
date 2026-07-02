###########################################################################
#
#  WinMinimal
#
#  File:
#      Defaults.ps1
#
#  Description:
#      Default application, service and scheduled task lists.
#
#      This file contains the baseline definitions used by WinMinimal.
#      End users should normally customize Config.ps1 instead.
#
###########################################################################

###########################################################################
# Default AppX packages to remove
###########################################################################

$DefaultAppsToRemove = @(
    "Clipchamp",
    "MicrosoftTeams",
    "Microsoft.Todos",
    "Microsoft.BingNews",
    "Microsoft.BingWeather",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.WindowsCommunicationsApps",
    "Microsoft.PowerAutomateDesktop",
    "Microsoft.DevHome",
    "Microsoft.OutlookForWindows"
)

###########################################################################
# Optional AppX groups
###########################################################################

$CopilotAppsToRemove = @(
    "Microsoft.Copilot"
)

$XboxAppsToRemove = @(
    "Microsoft.GamingApp",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.GamingServices"
)

###########################################################################
# Services to disable
###########################################################################

$DefaultServicesToDisable = @(
    "MapsBroker",
    "RetailDemo",
    "RemoteRegistry",
    "Fax",
    "lfsvc",
    "PhoneSvc",
    "WalletService",
    "WbioSrvc",
    "wisvc",
    "DusmSvc",
    "TrkWks",
    "PcaSvc",
    "CDPSvc",
    "WSAIFabricSvc",
    "InventorySvc",
    "whesvc"
)

$TelemetryServicesToDisable = @(
    "DiagTrack"
)

$XboxServicesToDisable = @(
    "XblAuthManager",
    "XblGameSave",
    "XboxGipSvc",
    "XboxNetApiSvc"
)

$SearchServicesToDisable = @(
    "WSearch"
)

$SysMainServicesToDisable = @(
    "SysMain"
)

###########################################################################
# Services to set to Manual
###########################################################################

$ServicesToManual = @(
    "bthserv",
    "TabletInputService",
    "SensorService",
    "SensrSvc",
    "Spooler"
)

###########################################################################
# Scheduled tasks to disable
###########################################################################

$ScheduledTasksToDisable = @(
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater",
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
    "\Microsoft\Windows\Maps\MapsToastTask",
    "\Microsoft\Windows\Maps\MapsUpdateTask",
    "\Microsoft\Windows\Feedback\Siuf\DmClient",
    "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
)

###########################################################################
# Privacy registry settings
###########################################################################

$PrivacyRegistrySettings = @(
    @{
        Name  = "Disable Advertising ID"
        Path  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
        Key   = "Enabled"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableAdvertisingId"
    },
    @{
        Name  = "Disable Activity History publishing"
        Path  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
        Key   = "PublishUserActivities"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableActivityHistory"
    },
    @{
        Name  = "Disable Activity History upload"
        Path  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
        Key   = "UploadUserActivities"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableActivityHistory"
    },
    @{
        Name  = "Disable Tailored Experiences"
        Path  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy"
        Key   = "TailoredExperiencesWithDiagnosticDataEnabled"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableTailoredExperiences"
    },
    @{
        Name  = "Disable Windows Consumer Features"
        Path  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        Key   = "DisableWindowsConsumerFeatures"
        Type  = "DWord"
        Value = 1
        EnabledBy = "DisableConsumerFeatures"
    },
    @{
        Name  = "Disable subscribed content suggestions"
        Path  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Key   = "SubscribedContent-338388Enabled"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableSuggestedContent"
    },
    @{
        Name  = "Disable silent installed apps"
        Path  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Key   = "SilentInstalledAppsEnabled"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableSuggestedContent"
    },
    @{
        Name  = "Disable content delivery manager suggestions"
        Path  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Key   = "SystemPaneSuggestionsEnabled"
        Type  = "DWord"
        Value = 0
        EnabledBy = "DisableSuggestedContent"
    }
)
