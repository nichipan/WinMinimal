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
#  Version:
#      0.1.0
#
###########################################################################

$RootPath = "C:\WinMinimal"

Import-Module "$RootPath\Modules\WinMinimal.Common.psm1" -Force

. "$RootPath\Config\Config.ps1"

Assert-WMAdministrator -RequireAdministrator $RequireAdministrator
Initialize-WMFolders -RootPath $RootPath

$ScriptName = "Run-WinMinimal"

$LogFile = New-WMLogFile `
    -ScriptName $ScriptName `
    -RootPath $RootPath `
    -TimestampLogs $TimestampLogs

Write-WMHeader `
    -ProjectName $ProjectName `
    -ScriptName $ScriptName `
    -Version $ProjectVersion

Write-WMLog "Starting WinMinimal runner." $LogFile $EnableLogging
Write-WMLog "Active profile: $ActiveProfile" $LogFile $EnableLogging

$ScriptsToRun = @(
    "$RootPath\Scripts\Invoke-RemoveApps.ps1",
    "$RootPath\Scripts\Invoke-OptimizeStartup.ps1"
)

foreach ($script in $ScriptsToRun) {

    if (-not (Test-Path $script)) {
        Write-WMWarning "Script not found: $script" $LogFile $EnableLogging
        continue
    }

    Write-WMLog "Executing script: $script" $LogFile $EnableLogging

    try {
        & $script
        Write-WMLog "Script completed: $script" $LogFile $EnableLogging
    }
    catch {
        Write-WMError "Script failed: $script - $($_.Exception.Message)" $LogFile $EnableLogging

        if (-not $ContinueOnError) {
            throw
        }
    }
}

Write-WMLog "WinMinimal runner completed." $LogFile $EnableLogging
Write-WMLog "Log file: $LogFile" $LogFile $EnableLogging

Write-Host ""
Write-Host "WinMinimal completed."
Write-Host "Main log file:"
Write-Host $LogFile
Write-Host ""
