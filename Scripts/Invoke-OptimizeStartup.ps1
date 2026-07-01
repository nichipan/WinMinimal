###########################################################################
#
#  WinMinimal
#
#  Script:
#      Invoke-OptimizeStartup.ps1
#
#  Description:
#      Optimizes Windows startup by configuring services and scheduled
#      tasks according to the active WinMinimal configuration.
#
#  Version:
#      0.1.0
#
###########################################################################

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Services.psm1" -Force

. "$RootPath\Config\Config.ps1"
. "$RootPath\Config\Defaults.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Invoke-OptimizeStartup"

$LogFile = New-WMLogFile `
    -ScriptName $ScriptName `
    -RootPath $RootPath `
    -TimestampLogs $TimestampLogs

Write-WMHeader `
    -ProjectName $ProjectName `
    -ScriptName $ScriptName `
    -Version $ProjectVersion

Write-WMLog "Starting startup optimization." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

#
# Build the service lists according to the selected configuration.
#

$ServicesToDisable = @()

$ServicesToDisable += $DefaultServicesToDisable

if ($DisableTelemetry) {
    $ServicesToDisable += $TelemetryServicesToDisable
}

if ($DisableWindowsSearch) {
    $ServicesToDisable += $SearchServicesToDisable
}

if ($DisableSysMain) {
    $ServicesToDisable += $SysMainServicesToDisable
}

if ($RemoveXboxComponents) {
    $ServicesToDisable += $XboxServicesToDisable
}

if ($EnableServiceOptimization) {

    Invoke-WMOptimizeServices `
        -ServicesToDisable $ServicesToDisable `
        -ServicesToManual $ServicesToManual `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError

}
else {

    Write-WMLog "Service optimization disabled by configuration." $LogFile $EnableLogging

}

if ($EnableScheduledTaskOptimization) {

    Invoke-WMOptimizeScheduledTasks `
        -ScheduledTasksToDisable $ScheduledTasksToDisable `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError

}
else {

    Write-WMLog "Scheduled task optimization disabled by configuration." $LogFile $EnableLogging

}

Write-WMLog "Startup optimization completed." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

Write-Host ""
Write-Host "Done."
Write-Host "Log file:"
Write-Host $LogFile
Write-Host ""
