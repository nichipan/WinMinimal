###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Reporting.psm1
#
#  Description:
#      Reporting functions used to collect and display execution summaries.
#
###########################################################################

function New-WMReport {
    param(
        [string]$Name = "WinMinimal"
    )

    return @{
        Name                    = $Name
        StartTime               = Get-Date
        EndTime                 = $null
        Status                  = "UNKNOWN"

        ModulesPlanned          = 0
        ModulesExecuted         = 0

        ApplicationsProcessed   = 0
        ApplicationsRemoved     = 0

        ServicesDisabled        = 0
        ServicesSetToManual     = 0
        ScheduledTasksDisabled  = 0

        PrivacySettingsApplied  = 0
        ExplorerSettingsApplied = 0

        Warnings                = 0
        Errors                  = 0
    }
}

function Add-WMReportValue {
    param(
        [hashtable]$Report,
        [string]$Key,
        [int]$Value = 1
    )

    if ($Report.ContainsKey($Key)) {
        $Report[$Key] += $Value
    }
}

function Complete-WMReport {
    param(
        [hashtable]$Report
    )

    $Report["EndTime"] = Get-Date

    if ($Report["Errors"] -gt 0) {
        $Report["Status"] = "FAILED"
    }
    elseif ($Report["Warnings"] -gt 0) {
        $Report["Status"] = "SUCCESS WITH WARNINGS"
    }
    else {
        $Report["Status"] = "SUCCESS"
    }
}

function Show-WMReport {
    param(
        [hashtable]$Report,
        [string]$LogFile
    )

    if (-not $Report["EndTime"]) {
        $Report["EndTime"] = Get-Date
    }

    $duration = New-TimeSpan -Start $Report["StartTime"] -End $Report["EndTime"]

    $statusColor = "Green"

    if ($Report["Status"] -eq "SUCCESS WITH WARNINGS") {
        $statusColor = "Yellow"
    }

    if ($Report["Status"] -eq "FAILED") {
        $statusColor = "Red"
    }

    Write-Host ""
    Write-Host "=================================================="
    Write-Host " WinMinimal Summary"
    Write-Host "=================================================="
    Write-Host ""

    Write-Host ("Status....................... ") -NoNewline
    Write-Host $Report["Status"] -ForegroundColor $statusColor

    Write-Host ("Modules executed............. {0} / {1}" -f $Report["ModulesExecuted"], $Report["ModulesPlanned"])
    Write-Host ("Applications processed....... {0}" -f $Report["ApplicationsProcessed"])
    Write-Host ("Applications removed......... {0}" -f $Report["ApplicationsRemoved"])
    Write-Host ("Services disabled............ {0}" -f $Report["ServicesDisabled"])
    Write-Host ("Services set to Manual....... {0}" -f $Report["ServicesSetToManual"])
    Write-Host ("Scheduled tasks disabled..... {0}" -f $Report["ScheduledTasksDisabled"])
    Write-Host ("Privacy settings applied..... {0}" -f $Report["PrivacySettingsApplied"])
    Write-Host ("Explorer settings applied.... {0}" -f $Report["ExplorerSettingsApplied"])
    Write-Host ("Warnings..................... {0}" -f $Report["Warnings"])
    Write-Host ("Errors....................... {0}" -f $Report["Errors"])
    Write-Host ("Execution time............... {0}" -f $duration.ToString("hh\:mm\:ss"))
    Write-Host ("Log file..................... {0}" -f $LogFile)

    Write-Host ""
    Write-Host "=================================================="
    Write-Host ""
}