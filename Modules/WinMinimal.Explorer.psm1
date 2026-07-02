###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Explorer.psm1
#
#  Description:
#      Functions used to apply Windows File Explorer preferences.
#
###########################################################################

function Invoke-WMOptimizeExplorer {
    param(
        [array]$ExplorerRegistrySettings,
        [hashtable]$Configuration,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    Write-WMLog "Explorer settings selected: $($ExplorerRegistrySettings.Count)" $LogFile $EnableLogging

    foreach ($setting in $ExplorerRegistrySettings) {
        $enabledBy = $setting.EnabledBy

        if ($Configuration.ContainsKey($enabledBy) -and -not $Configuration[$enabledBy]) {
            Write-WMLog "Skipping Explorer setting disabled by configuration: $($setting.Name)" $LogFile $EnableLogging
            continue
        }

        Set-WMRegistryValue `
            -Name $setting.Name `
            -Path $setting.Path `
            -Key $setting.Key `
            -Type $setting.Type `
            -Value $setting.Value `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report `
            -ReportCounter "ExplorerSettingsApplied"
    }

    Write-WMLog "Explorer optimization completed." $LogFile $EnableLogging
}