###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Privacy.psm1
#
#  Description:
#      Functions used to apply privacy-related Windows settings.
#
###########################################################################

function Set-WMRegistryValue {
    param(
        [string]$Name,
        [string]$Path,
        [string]$Key,
        [string]$Type,
        [object]$Value,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    Write-WMLog "Applying registry setting: $Name" $LogFile $EnableLogging
    Write-WMLog "Path: $Path" $LogFile $EnableLogging
    Write-WMLog "Key: $Key" $LogFile $EnableLogging
    Write-WMLog "Value: $Value" $LogFile $EnableLogging

    try {
        if (-not (Test-Path $Path)) {
            New-Item -Path $Path -Force | Out-Null
            Write-WMLog "Created registry path: $Path" $LogFile $EnableLogging
        }

        New-ItemProperty `
            -Path $Path `
            -Name $Key `
            -Value $Value `
            -PropertyType $Type `
            -Force | Out-Null

        Write-WMLog "Registry setting applied: $Name" $LogFile $EnableLogging

        if ($Report -and $Report.ContainsKey("PrivacySettingsApplied")) {
            $Report["PrivacySettingsApplied"]++
        }
    }
    catch {
        Write-WMWarning "Could not apply registry setting: $Name - $($_.Exception.Message)" $LogFile $EnableLogging

        if ($Report) {
            $Report["Warnings"]++
        }

        if (-not $ContinueOnError) {
            throw
        }
    }
}

function Invoke-WMOptimizePrivacy {
    param(
        [array]$PrivacyRegistrySettings,
        [hashtable]$Configuration,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    Write-WMLog "Privacy settings selected: $($PrivacyRegistrySettings.Count)" $LogFile $EnableLogging

    foreach ($setting in $PrivacyRegistrySettings) {
        $enabledBy = $setting.EnabledBy

        if ($Configuration.ContainsKey($enabledBy) -and -not $Configuration[$enabledBy]) {
            Write-WMLog "Skipping privacy setting disabled by configuration: $($setting.Name)" $LogFile $EnableLogging
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
            -Report $Report
    }

    Write-WMLog "Privacy optimization completed." $LogFile $EnableLogging
}