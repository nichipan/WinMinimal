###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Network.psm1
#
#  Description:
#      Functions used to apply network-related Windows settings.
#
###########################################################################

function Disable-WMNetworkService {
    param(
        [hashtable]$ServiceDefinition,
        [hashtable]$Configuration,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    $enabledBy = $ServiceDefinition.EnabledBy

    if ($Configuration.ContainsKey($enabledBy) -and -not $Configuration[$enabledBy]) {
        Write-WMLog "Skipping network service disabled by configuration: $($ServiceDefinition.Name)" $LogFile $EnableLogging
        return
    }

    $serviceName = $ServiceDefinition.Service
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if (-not $service) {
        Write-WMLog "Network service not found: $serviceName" $LogFile $EnableLogging
        return
    }

    Write-WMLog "Disabling network service: $serviceName" $LogFile $EnableLogging

    try {
        Set-Service -Name $serviceName -StartupType Disabled -ErrorAction Stop
        Write-WMLog "Network service disabled: $serviceName" $LogFile $EnableLogging

        if ($Report -and $Report.ContainsKey("NetworkSettingsApplied")) {
            $Report["NetworkSettingsApplied"]++
        }
    }
    catch {
        Write-WMWarning "Could not disable network service: $serviceName - $($_.Exception.Message)" $LogFile $EnableLogging

        if ($Report -and $Report.ContainsKey("Warnings")) {
            $Report["Warnings"]++
        }

        if (-not $ContinueOnError) {
            throw
        }
    }
}

function Disable-WMWindowsOptionalFeature {
    param(
        [hashtable]$FeatureDefinition,
        [hashtable]$Configuration,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    $enabledBy = $FeatureDefinition.EnabledBy

    if ($Configuration.ContainsKey($enabledBy) -and -not $Configuration[$enabledBy]) {
        Write-WMLog "Skipping Windows optional feature disabled by configuration: $($FeatureDefinition.Name)" $LogFile $EnableLogging
        return
    }

    $featureName = $FeatureDefinition.Feature

    Write-WMLog "Checking Windows optional feature: $featureName" $LogFile $EnableLogging

    try {
        $feature = Get-WindowsOptionalFeature -Online -FeatureName $featureName -ErrorAction SilentlyContinue

        if (-not $feature) {
            Write-WMLog "Windows optional feature not found: $featureName" $LogFile $EnableLogging
            return
        }

        if ($feature.State -eq "Disabled") {
            Write-WMLog "Windows optional feature already disabled: $featureName" $LogFile $EnableLogging
            return
        }

        Write-WMLog "Disabling Windows optional feature: $featureName" $LogFile $EnableLogging

        Disable-WindowsOptionalFeature -Online -FeatureName $featureName -NoRestart -ErrorAction Stop | Out-Null

        Write-WMLog "Windows optional feature disabled: $featureName" $LogFile $EnableLogging

        if ($Report -and $Report.ContainsKey("NetworkSettingsApplied")) {
            $Report["NetworkSettingsApplied"]++
        }
    }
    catch {
        Write-WMWarning "Could not disable Windows optional feature: $featureName - $($_.Exception.Message)" $LogFile $EnableLogging

        if ($Report -and $Report.ContainsKey("Warnings")) {
            $Report["Warnings"]++
        }

        if (-not $ContinueOnError) {
            throw
        }
    }
}

function Invoke-WMOptimizeNetwork {
    param(
        [array]$NetworkWindowsOptionalFeaturesToDisable,
        [array]$NetworkServicesToDisable,
        [array]$NetworkRegistrySettings,
        [hashtable]$Configuration,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    Write-WMLog "Network optional features selected: $($NetworkWindowsOptionalFeaturesToDisable.Count)" $LogFile $EnableLogging

    foreach ($featureDefinition in $NetworkWindowsOptionalFeaturesToDisable) {
        Disable-WMWindowsOptionalFeature `
            -FeatureDefinition $featureDefinition `
            -Configuration $Configuration `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report
    }

    Write-WMLog "Network services selected: $($NetworkServicesToDisable.Count)" $LogFile $EnableLogging

    foreach ($serviceDefinition in $NetworkServicesToDisable) {
        Disable-WMNetworkService `
            -ServiceDefinition $serviceDefinition `
            -Configuration $Configuration `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report
    }

    Write-WMLog "Network registry settings selected: $($NetworkRegistrySettings.Count)" $LogFile $EnableLogging

    foreach ($setting in $NetworkRegistrySettings) {
        $enabledBy = $setting.EnabledBy

        if ($Configuration.ContainsKey($enabledBy) -and -not $Configuration[$enabledBy]) {
            Write-WMLog "Skipping network registry setting disabled by configuration: $($setting.Name)" $LogFile $EnableLogging
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
            -ReportCounter "NetworkSettingsApplied"
    }

    Write-WMLog "Network optimization completed." $LogFile $EnableLogging
}