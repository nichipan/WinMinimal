###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Hardware.psm1
#
#  Description:
#      Functions used to apply hardware-related Windows settings.
#
###########################################################################

function Disable-WMHardwareService {
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
        Write-WMLog "Skipping hardware service disabled by configuration: $($ServiceDefinition.Name)" $LogFile $EnableLogging
        return
    }

    $serviceName = $ServiceDefinition.Service
    $matchMode = $ServiceDefinition.MatchMode

    if ($matchMode -eq "Prefix") {
        $services = Get-Service -Name "$serviceName*" -ErrorAction SilentlyContinue
    }
    else {
        $services = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
    }

    if (-not $services) {
        Write-WMLog "Hardware service not found: $serviceName" $LogFile $EnableLogging
        return
    }

    foreach ($service in $services) {
        Write-WMLog "Disabling hardware service: $($service.Name)" $LogFile $EnableLogging

        try {
            Set-Service -Name $service.Name -StartupType Disabled -ErrorAction Stop
            Write-WMLog "Hardware service disabled: $($service.Name)" $LogFile $EnableLogging

            if ($Report -and $Report.ContainsKey("HardwareSettingsApplied")) {
                $Report["HardwareSettingsApplied"]++
            }
        }
        catch {
            Write-WMWarning "Could not disable hardware service: $($service.Name) - $($_.Exception.Message)" $LogFile $EnableLogging

            if ($Report -and $Report.ContainsKey("Warnings")) {
                $Report["Warnings"]++
            }

            if (-not $ContinueOnError) {
                throw
            }
        }
    }
}

function Invoke-WMOptimizeHardware {
    param(
        [array]$HardwareServicesToDisable,
        [array]$HardwareRegistrySettings,
        [hashtable]$Configuration,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    Write-WMLog "Hardware services selected: $($HardwareServicesToDisable.Count)" $LogFile $EnableLogging

    foreach ($serviceDefinition in $HardwareServicesToDisable) {
        Disable-WMHardwareService `
            -ServiceDefinition $serviceDefinition `
            -Configuration $Configuration `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report
    }

    Write-WMLog "Hardware registry settings selected: $($HardwareRegistrySettings.Count)" $LogFile $EnableLogging

    foreach ($setting in $HardwareRegistrySettings) {
        $enabledBy = $setting.EnabledBy

        if ($Configuration.ContainsKey($enabledBy) -and -not $Configuration[$enabledBy]) {
            Write-WMLog "Skipping hardware registry setting disabled by configuration: $($setting.Name)" $LogFile $EnableLogging
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
            -ReportCounter "HardwareSettingsApplied"
    }

    Write-WMLog "Hardware optimization completed." $LogFile $EnableLogging
}
