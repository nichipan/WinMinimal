###########################################################################
#
#  WinMinimal
#
#  Script:
#      Invoke-OptimizePrivacy.ps1
#
#  Description:
#      Applies privacy-related Windows settings according to the active
#      WinMinimal configuration.
#
###########################################################################

param(
    [switch]$Silent,
    [hashtable]$Report
)

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Privacy.psm1" -Force

. "$RootPath\Config\Config.ps1"
. "$RootPath\Config\Defaults.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Invoke-OptimizePrivacy"

$LogFile = New-WMLogFile `
    -ScriptName $ScriptName `
    -RootPath $RootPath `
    -TimestampLogs $TimestampLogs

if (-not $Silent) {
    Write-WMHeader -ProjectName $ProjectName -ScriptName $ScriptName -Version $ProjectVersion
}

Write-WMLog "Starting privacy optimization." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

if (-not $EnablePrivacyOptimization) {
    Write-WMLog "Privacy optimization disabled by configuration." $LogFile $EnableLogging
}
else {
    $Configuration = @{
        DisableAdvertisingId        = $DisableAdvertisingId
        DisableActivityHistory      = $DisableActivityHistory
        DisableTailoredExperiences  = $DisableTailoredExperiences
        DisableSuggestedContent     = $DisableSuggestedContent
        DisableConsumerFeatures     = $DisableConsumerFeatures
    }

    Invoke-WMOptimizePrivacy `
        -PrivacyRegistrySettings $PrivacyRegistrySettings `
        -Configuration $Configuration `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError `
        -Report $Report
}

Write-WMLog "Finished privacy optimization." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

if (-not $Silent) {
    Write-Host ""
    Write-Host "Done."
    Write-Host "Log file:"
    Write-Host $LogFile
    Write-Host ""
}