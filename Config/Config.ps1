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
#  Version:
#      0.1.0
#
###########################################################################

# Project settings

$ProjectName    = "WinMinimal"
$ProjectVersion = "0.1.0"

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