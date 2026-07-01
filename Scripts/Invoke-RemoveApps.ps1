###########################################################################
#
#  WinMinimal
#
#  Script:
#      Invoke-RemoveApps.ps1
#
#  Description:
#      Removes unwanted AppX applications and provisioned AppX packages
#      according to the active WinMinimal configuration.
#
#  Version:
#      0.1.1
#
###########################################################################

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Applications.psm1" -Force

. "$RootPath\Config\Config.ps1"
. "$RootPath\Config\Defaults.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Invoke-RemoveApps"
$LogFile = New-WMLogFile -ScriptName $ScriptName -RootPath $RootPath -TimestampLogs $TimestampLogs

Write-WMHeader -ProjectName $ProjectName -ScriptName $ScriptName -Version $ProjectVersion

Write-WMLog "Starting application removal." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

if (-not $EnableAppRemoval) {
    Write-WMLog "Application removal disabled by configuration." $LogFile $EnableLogging
}
else {
    $AppsToRemove = @()
    $AppsToRemove += $DefaultAppsToRemove

    if ($RemoveCopilot) {
        $AppsToRemove += $CopilotAppsToRemove
    }

    if ($RemoveXboxComponents) {
        $AppsToRemove += $XboxAppsToRemove
    }

    Invoke-WMRemoveApps `
        -AppsToRemove $AppsToRemove `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError `
        -RemoveProvisionedPackages $RemoveProvisionedPackages
}

Write-WMLog "Finished application removal." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

Write-Host ""
Write-Host "Done."
Write-Host "Log file: $LogFile"
Write-Host ""