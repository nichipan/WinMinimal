###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Services.psm1
#
#  Description:
#      Functions used to optimize Windows services and scheduled tasks.
#
###########################################################################

function Set-WMServiceStartupType {
    param(
        [string]$ServiceName,
        [string]$StartupType,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

    if (-not $service) {
        Write-WMLog "Service not found: $ServiceName" $LogFile $EnableLogging
        return
    }

    Write-WMLog "Setting service '$ServiceName' to startup type: $StartupType" $LogFile $EnableLogging

    try {
        Set-Service -Name $ServiceName -StartupType $StartupType -ErrorAction Stop
        Write-WMLog "Service updated: $ServiceName" $LogFile $EnableLogging

        if ($Report) {
            if ($StartupType -eq "Disabled") {
                $Report["ServicesDisabled"]++
            }

            if ($StartupType -eq "Manual") {
                $Report["ServicesSetToManual"]++
            }
        }
    }
    catch {
        Write-WMWarning "Could not update service: $ServiceName - $($_.Exception.Message)" $LogFile $EnableLogging

        if ($Report) {
            $Report["Warnings"]++
        }

        if (-not $ContinueOnError) {
            throw
        }
    }
}

function Disable-WMScheduledTask {
    param(
        [string]$TaskFullPath,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    $taskName = Split-Path $TaskFullPath -Leaf
    $taskPath = (Split-Path $TaskFullPath -Parent) + "\"

    $task = Get-ScheduledTask -TaskPath $taskPath -TaskName $taskName -ErrorAction SilentlyContinue

    if (-not $task) {
        Write-WMLog "Scheduled task not found: $TaskFullPath" $LogFile $EnableLogging
        return
    }

    Write-WMLog "Disabling scheduled task: $TaskFullPath" $LogFile $EnableLogging

    try {
        Disable-ScheduledTask -TaskPath $taskPath -TaskName $taskName -ErrorAction Stop | Out-Null
        Write-WMLog "Scheduled task disabled: $TaskFullPath" $LogFile $EnableLogging

        if ($Report) {
            $Report["ScheduledTasksDisabled"]++
        }
    }
    catch {
        Write-WMWarning "Could not disable scheduled task: $TaskFullPath - $($_.Exception.Message)" $LogFile $EnableLogging

        if ($Report) {
            $Report["Warnings"]++
        }

        if (-not $ContinueOnError) {
            throw
        }
    }
}

function Invoke-WMOptimizeServices {
    param(
        [string[]]$ServicesToDisable,
        [string[]]$ServicesToManual,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    $disableList = $ServicesToDisable | Sort-Object -Unique
    $manualList  = $ServicesToManual  | Sort-Object -Unique

    Write-WMLog "Services selected for disable: $($disableList.Count)" $LogFile $EnableLogging

    foreach ($service in $disableList) {
        Set-WMServiceStartupType `
            -ServiceName $service `
            -StartupType "Disabled" `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report
    }

    Write-WMLog "Services selected for manual startup: $($manualList.Count)" $LogFile $EnableLogging

    foreach ($service in $manualList) {
        Set-WMServiceStartupType `
            -ServiceName $service `
            -StartupType "Manual" `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report
    }

    Write-WMLog "Service optimization completed." $LogFile $EnableLogging
}

function Invoke-WMOptimizeScheduledTasks {
    param(
        [string[]]$ScheduledTasksToDisable,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [hashtable]$Report
    )

    $tasks = $ScheduledTasksToDisable | Sort-Object -Unique

    Write-WMLog "Scheduled tasks selected for disable: $($tasks.Count)" $LogFile $EnableLogging

    foreach ($task in $tasks) {
        Disable-WMScheduledTask `
            -TaskFullPath $task `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError `
            -Report $Report
    }

    Write-WMLog "Scheduled task optimization completed." $LogFile $EnableLogging
}