###########################################################################
#
#  WinMinimal
#
#  Script:
#      Invoke-OptimizeExplorer.ps1
#
#  Description:
#      Applies Windows File Explorer preferences according to the active
#      WinMinimal configuration.
#
###########################################################################

param(
    [switch]$Silent,
    [hashtable]$Report
)

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Explorer.psm1" -Force

. "$RootPath\Config\Config.ps1"
. "$RootPath\Config\Defaults.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Invoke-OptimizeExplorer"

$LogFile = New-WMLogFile `
    -ScriptName $ScriptName `
    -RootPath $RootPath `
    -TimestampLogs $TimestampLogs

if (-not $Silent) {
    Write-WMHeader -ProjectName $ProjectName -ScriptName $ScriptName -Version $ProjectVersion
}

Write-WMLog "Starting Explorer optimization." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

if (-not $EnableExplorerOptimization) {
    Write-WMLog "Explorer optimization disabled by configuration." $LogFile $EnableLogging
}
else {
    $Configuration = @{
        ShowFileExtensions                 = $ShowFileExtensions
        ShowHiddenFiles                    = $ShowHiddenFiles
        ShowProtectedOperatingSystemFiles  = $ShowProtectedOperatingSystemFiles
        DisableExplorerRecentFiles         = $DisableExplorerRecentFiles
        DisableExplorerFrequentFolders     = $DisableExplorerFrequentFolders
        OpenExplorerToThisPC               = $OpenExplorerToThisPC
    }

    Invoke-WMOptimizeExplorer `
        -ExplorerRegistrySettings $ExplorerRegistrySettings `
        -Configuration $Configuration `
        -LogFile $LogFile `
        -EnableLogging $EnableLogging `
        -ContinueOnError $ContinueOnError `
        -Report $Report
}

Write-WMLog "Finished Explorer optimization." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

if (-not $Silent) {
    Write-Host ""
    Write-Host "Done."
    Write-Host "Log file:"
    Write-Host $LogFile
    Write-Host ""
}