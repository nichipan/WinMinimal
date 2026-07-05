###########################################################################
#
#  WinMinimal
#
#  Script:
#      Invoke-OptimizeHardware.ps1
#
#  Description:
#      Applies hardware-related Windows settings according to the active
#      WinMinimal configuration.
#
###########################################################################

param(
    [switch]$Silent,
    [hashtable]$Report
)

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Hardware.psm1" -Force

. "$RootPath\Config\Config.ps1"
. "$RootPath\Config\Defaults.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Invoke-OptimizeHardware"

$LogFile = New-WMLogFile -ScriptName $ScriptName -RootPath $RootPath -TimestampLogs $TimestampLogs

if (-not $Silent) {
    Write-WMHeader -ProjectName $ProjectName -ScriptName $ScriptName -Version $ProjectVersion
}

Write-WMLog "Starting hardware optimization." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

if (-not $EnableHardwareOptimization) {
    Write-WMLog "Hardware optimization disabled by configuration." $LogFile $EnableLogging
}
else {
    $Configuration = @{
        DisableWiFi             = $DisableWiFi
        DisableBluetooth        = $DisableBluetooth
        DisableNearbySharing    = $DisableNearbySharing
        DisableLocationServices = $DisableLocationServices
        DisableNFC              = $DisableNFC
    }

    Invoke-WMOptimizeHardware `
        -HardwareServicesToDisable $HardwareServicesToDisable `
        -HardwareRegistrySettings $HardwareRegistrySettings `
        -Configuration $Configuration `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError `
        -Report $Report
}

Write-WMLog "Finished hardware optimization." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

if (-not $Silent) {
    Write-Host ""
    Write-Host "Done."
    Write-Host "Log file:"
    Write-Host $LogFile
    Write-Host ""
}