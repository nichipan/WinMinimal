###########################################################################
#
#  WinMinimal
#
#  Script:
#      Run-WinMinimal.ps1
#
#  Description:
#      Main WinMinimal runner.
#
#      Executes the enabled WinMinimal scripts in the defined order.
#
###########################################################################

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force
Import-Module "$RootPath\Modules\WinMinimal.Reporting.psm1" -Force

. "$RootPath\Config\Config.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Run-WinMinimal"

$LogFile = New-WMLogFile -ScriptName $ScriptName -RootPath $RootPath -TimestampLogs $TimestampLogs

$Report = New-WMReport -Name "WinMinimal"

Write-WMHeader -ProjectName $ProjectName -ScriptName $ScriptName -Version $ProjectVersion

Write-WMLog "Starting WinMinimal runner." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

$ScriptsToRun = @(
    @{
        Name = "Removing applications"
        Path = "$RootPath\Scripts\Invoke-RemoveApps.ps1"
    },
    @{
        Name = "Optimizing startup"
        Path = "$RootPath\Scripts\Invoke-OptimizeStartup.ps1"
    },
    @{
        Name = "Optimizing privacy"
        Path = "$RootPath\Scripts\Invoke-OptimizePrivacy.ps1"
    },
    @{
        Name = "Optimizing Explorer"
        Path = "$RootPath\Scripts\Invoke-OptimizeExplorer.ps1"
    }
    @{
        Name = "Optimizing hardware"
        Path = "$RootPath\Scripts\Invoke-OptimizeHardware.ps1"
    }
    @{
        Name = "Optimizing network"
        Path = "$RootPath\Scripts\Invoke-OptimizeNetwork.ps1"
    }
)

$Report["ModulesPlanned"] = $ScriptsToRun.Count

$totalScripts = $ScriptsToRun.Count
$currentScript = 0

foreach ($script in $ScriptsToRun) {
    $currentScript++
    $scriptNameToShow = $script.Name
    $scriptPath = $script.Path

    Write-WMConsole -Message ("[{0}/{1}] {2}..." -f $currentScript, $totalScripts, $scriptNameToShow) -Level "Normal" -ConsoleVerbosity $ConsoleVerbosity -Color "Cyan"

    if (-not (Test-Path $scriptPath)) {
        Write-WMWarning "Script not found: $scriptPath" $LogFile $EnableLogging $ConsoleVerbosity
        Add-WMReportValue -Report $Report -Key "Warnings"
        continue
    }

    Write-WMLog "Executing script: $scriptPath" $LogFile $EnableLogging

    try {
        & $scriptPath -Silent -Report $Report
        Add-WMReportValue -Report $Report -Key "ModulesExecuted"
        Write-WMLog "Script completed: $scriptPath" $LogFile $EnableLogging
        Write-WMConsole -Message "Completed." -Level "Normal" -ConsoleVerbosity $ConsoleVerbosity -Color "Green"
        Write-WMConsole -Message "" -Level "Normal" -ConsoleVerbosity $ConsoleVerbosity
    }
    catch {
        Add-WMReportValue -Report $Report -Key "Errors"
        Write-WMError "Script failed: $scriptPath - $($_.Exception.Message)" $LogFile $EnableLogging $ConsoleVerbosity

        if (-not $ContinueOnError) {
            throw
        }
    }
}

Complete-WMReport -Report $Report

Write-WMLog "WinMinimal runner completed." $LogFile $EnableLogging
Write-WMLog "Status: $($Report["Status"])" $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

Show-WMReport -Report $Report -LogFile $LogFile