###########################################################################
#
#  WinMinimal
#
#  Module:
#      WinMinimal.Common.psm1
#
#  Description:
#      Common helper functions used by WinMinimal scripts.
#
#  Version:
#      0.1.0
#
###########################################################################

function Test-WMAdministrator {
    $currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentIdentity)

    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Assert-WMAdministrator {
    param(
        [bool]$RequireAdministrator = $true
    )

    if ($RequireAdministrator -and -not (Test-WMAdministrator)) {
        Write-Host ""
        Write-Host "ERROR: PowerShell must be run as Administrator." -ForegroundColor Red
        Write-Host ""
        Write-Host "Right-click PowerShell and choose 'Run as administrator'."
        Write-Host ""
        Pause
        exit 1
    }
}

function Initialize-WMFolders {
    param(
        [string]$RootPath = "C:\WinMinimal"
    )

    $folders = @(
        $RootPath,
        "$RootPath\Config",
        "$RootPath\Config\Profiles",
        "$RootPath\Modules",
        "$RootPath\Scripts",
        "$RootPath\Docs",
        "$RootPath\Logs",
        "$RootPath\Backup"
    )

    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder | Out-Null
        }
    }
}

function New-WMLogFile {
    param(
        [string]$ScriptName,
        [string]$RootPath = "C:\WinMinimal",
        [bool]$TimestampLogs = $true
    )

    Initialize-WMFolders -RootPath $RootPath

    $safeName = $ScriptName -replace '[\\/:*?"<>| ]', '-'

    if ($TimestampLogs) {
        $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
        return "$RootPath\Logs\$timestamp-$safeName.log"
    }

    return "$RootPath\Logs\$safeName.log"
}

function Write-WMHeader {
    param(
        [string]$ProjectName,
        [string]$ScriptName,
        [string]$Version
    )

    # Clear-Host
    Write-Host "==============================================="
    Write-Host " $ProjectName"
    Write-Host " $ScriptName"
    Write-Host " Version $Version"
    Write-Host "==============================================="
    Write-Host ""
}

function Write-WMLog {
    param(
        [string]$Message,
        [string]$LogFile,
        [bool]$EnableLogging = $true
    )

    $line = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Message"

    Write-Host $Message

    if ($EnableLogging -and $LogFile) {
        $line | Out-File -FilePath $LogFile -Append -Encoding UTF8
    }
}

function Write-WMWarning {
    param(
        [string]$Message,
        [string]$LogFile,
        [bool]$EnableLogging = $true
    )

    Write-Host "WARNING: $Message" -ForegroundColor Yellow

    if ($EnableLogging -and $LogFile) {
        "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - WARNING: $Message" |
            Out-File -FilePath $LogFile -Append -Encoding UTF8
    }
}

function Write-WMError {
    param(
        [string]$Message,
        [string]$LogFile,
        [bool]$EnableLogging = $true
    )

    Write-Host "ERROR: $Message" -ForegroundColor Red

    if ($EnableLogging -and $LogFile) {
        "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - ERROR: $Message" |
            Out-File -FilePath $LogFile -Append -Encoding UTF8
    }
}

function Import-WMConfiguration {
    param(
        [string]$RootPath = "C:\WinMinimal"
    )

    $configFile = "$RootPath\Config\Config.ps1"
    $defaultsFile = "$RootPath\Config\Defaults.ps1"

    if (-not (Test-Path $configFile)) {
        throw "Configuration file not found: $configFile"
    }

    if (-not (Test-Path $defaultsFile)) {
        throw "Defaults file not found: $defaultsFile"
    }

    . $configFile
    . $defaultsFile
}