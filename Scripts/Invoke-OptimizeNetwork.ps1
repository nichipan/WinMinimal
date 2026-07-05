###########################################################################
#
#  WinMinimal
#
#  Script:
#      Invoke-OptimizeNetwork.ps1
#
#  Description:
#      Applies network-related Windows settings according to the active
#      WinMinimal configuration.
#
###########################################################################

param(
    [switch]$Silent,
    [hashtable]$Report
)

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Network.psm1" -Force

. "$RootPath\Config\Config.ps1"
. "$RootPath\Config\Defaults.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Invoke-OptimizeNetwork"

$LogFile = New-WMLogFile -ScriptName $ScriptName -RootPath $RootPath -TimestampLogs $TimestampLogs

if (-not $Silent) {
    Write-WMHeader -ProjectName $ProjectName -ScriptName $ScriptName -Version $ProjectVersion
}

Write-WMLog "Starting network optimization." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

if (-not $EnableNetworkOptimization) {
    Write-WMLog "Network optimization disabled by configuration." $LogFile $EnableLogging
}
else {
    $Configuration = @{
        DisableSMBv1            = $DisableSMBv1
        DisableLLMNR            = $DisableLLMNR
        DisableNetBIOS          = $DisableNetBIOS
        DisableNetworkDiscovery = $DisableNetworkDiscovery
        DisableMDNS             = $DisableMDNS
    }

    Invoke-WMOptimizeNetwork `
        -NetworkWindowsOptionalFeaturesToDisable $NetworkWindowsOptionalFeaturesToDisable `
        -NetworkServicesToDisable $NetworkServicesToDisable `
        -NetworkRegistrySettings $NetworkRegistrySettings `
        -Configuration $Configuration `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError `
        -Report $Report
}

Write-WMLog "Finished network optimization." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

if (-not $Silent) {
    Write-Host ""
    Write-Host "Done."
    Write-Host "Log file:"
    Write-Host $LogFile
    Write-Host ""
}