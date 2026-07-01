###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Applications.psm1
#
#  Description:
#      Functions used to remove unwanted AppX applications and provisioned
#      AppX packages.
#
#  Version:
#      0.1.1
#
###########################################################################

function Remove-WMInstalledApp {
    param(
        [string]$AppName,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true
    )

    $packages = Get-AppxPackage -AllUsers "*$AppName*" -ErrorAction SilentlyContinue

    if (-not $packages) {
        Write-WMLog "Installed package not found: $AppName" $LogFile $EnableLogging
        return
    }

    foreach ($package in $packages) {
        Write-WMLog "Removing installed package: $($package.Name)" $LogFile $EnableLogging

        try {
            Remove-AppxPackage -Package $package.PackageFullName -AllUsers -ErrorAction Stop
            Write-WMLog "Removed installed package: $($package.Name)" $LogFile $EnableLogging
        }
        catch {
            Write-WMWarning "Could not remove installed package: $($package.Name) - $($_.Exception.Message)" $LogFile $EnableLogging

            if (-not $ContinueOnError) {
                throw
            }
        }
    }
}

function Remove-WMProvisionedApp {
    param(
        [string]$AppName,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true
    )

    $packages = Get-AppxProvisionedPackage -Online |
        Where-Object { $_.DisplayName -like "*$AppName*" }

    if (-not $packages) {
        Write-WMLog "Provisioned package not found: $AppName" $LogFile $EnableLogging
        return
    }

    foreach ($package in $packages) {
        Write-WMLog "Removing provisioned package: $($package.DisplayName)" $LogFile $EnableLogging

        try {
            Remove-AppxProvisionedPackage -Online -PackageName $package.PackageName -ErrorAction Stop | Out-Null
            Write-WMLog "Removed provisioned package: $($package.DisplayName)" $LogFile $EnableLogging
        }
        catch {
            Write-WMWarning "Could not remove provisioned package: $($package.DisplayName) - $($_.Exception.Message)" $LogFile $EnableLogging

            if (-not $ContinueOnError) {
                throw
            }
        }
    }
}

function Invoke-WMRemoveApps {
    param(
        [string[]]$AppsToRemove,
        [string]$LogFile,
        [bool]$EnableLogging = $true,
        [bool]$ContinueOnError = $true,
        [bool]$RemoveProvisionedPackages = $true
    )

    $apps = $AppsToRemove | Sort-Object -Unique

    Write-WMLog "Applications selected for removal: $($apps.Count)" $LogFile $EnableLogging

    foreach ($app in $apps) {
        Write-WMLog "Processing application pattern: $app" $LogFile $EnableLogging

        Remove-WMInstalledApp `
            -AppName $app `
            -LogFile $LogFile `
            -EnableLogging $EnableLogging `
            -ContinueOnError $ContinueOnError

        if ($RemoveProvisionedPackages) {
            Remove-WMProvisionedApp `
                -AppName $app `
                -LogFile $LogFile `
                -EnableLogging $EnableLogging `
                -ContinueOnError $ContinueOnError
        }
        else {
            Write-WMLog "Provisioned package removal disabled by configuration." $LogFile $EnableLogging
        }
    }

    Write-WMLog "Application removal completed." $LogFile $EnableLogging
}