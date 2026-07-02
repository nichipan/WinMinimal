###########################################################################
#
#  WinMinimal
#
#  File:
#      Config.ps1
#
#  Description:
#      User-editable configuration file.
#
#      Normal users should customize WinMinimal by editing this file only.
#      Default application, service and scheduled task lists are stored in
#      Defaults.ps1.
#
###########################################################################

# Project settings

$ProjectName    = "WinMinimal"
$ProjectVersion = "0.3.0"

# Root path

$RootPath = "C:\WinMinimal"

# Active profile.
#
# Available profiles will be stored in:
#   Config\Profiles\
#
# Initial value:
#   HTPC

$ActiveProfile = "HTPC"

# Logging

$EnableLogging = $true
$TimestampLogs = $true

# Console output verbosity.
#
# Quiet    : final summary only
# Normal   : progress + final summary
# Detailed : full execution details
#
# Recommended value:
#   Normal

$ConsoleVerbosity = "Normal"

# Safety

$ContinueOnError = $true
$RequireAdministrator = $true

# Global feature switches

$EnableAppRemoval = $true
$RemoveProvisionedPackages = $true

$EnableServiceOptimization = $true
$EnableScheduledTaskOptimization = $true

# Optional components

$RemoveCopilot = $true
$RemoveXboxComponents = $true

$DisableTelemetry = $true
$DisableWindowsSearch = $true
$DisableSysMain = $true

# Privacy optimization

$EnablePrivacyOptimization = $true

$DisableAdvertisingId = $true
$DisableActivityHistory = $true
$DisableTailoredExperiences = $true
$DisableSuggestedContent = $true
$DisableConsumerFeatures = $true
