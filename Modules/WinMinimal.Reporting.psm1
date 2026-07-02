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
#  Version:
#      0.2.2
#
###########################################################################

function New-WMReport {
    param(
        [string]$Name = "WinMinimal"
    )

    return @{
        Name                   = $Name
        StartTime              = Get-Date
        EndTime                = $null

        ApplicationsProcessed  = 0
        ApplicationsRemoved    = 0

        ServicesDisabled       = 0
        ServicesSetToManual    = 0

        ScheduledTasksDisabled = 0

        Warnings               = 0
        Errors                 = 0
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

    Write-Host ""
    Write-Host "=================================================="
    Write-Host " WinMinimal Summary"
    Write-Host "=================================================="
    Write-Host ""
    Write-Host ("Applications processed........ {0}" -f $Report["ApplicationsProcessed"])
    Write-Host ("Applications removed.......... {0}" -f $Report["ApplicationsRemoved"])
    Write-Host ("Services disabled............. {0}" -f $Report["ServicesDisabled"])
    Write-Host ("Services set to Manual........ {0}" -f $Report["ServicesSetToManual"])
    Write-Host ("Scheduled tasks disabled...... {0}" -f $Report["ScheduledTasksDisabled"])
    Write-Host ("Warnings...................... {0}" -f $Report["Warnings"])
    Write-Host ("Errors........................ {0}" -f $Report["Errors"])
    Write-Host ("Execution time................ {0}" -f $duration.ToString("hh\:mm\:ss"))
    Write-Host ""
    Write-Host "Main log file:"
    Write-Host $LogFile
    Write-Host ""
    Write-Host "=================================================="
    Write-Host ""
}