[CmdletBinding()]
param(
    [string]$AdbPath = "adb"
)

$ErrorActionPreference = "Stop"

function Resolve-Adb {
    if (Test-Path -LiteralPath $AdbPath -PathType Leaf) {
        return (Resolve-Path -LiteralPath $AdbPath).Path
    }

    $command = Get-Command $AdbPath -ErrorAction SilentlyContinue
    if ($null -eq $command) {
        throw "ADB was not found. Install Google Platform-Tools or pass -AdbPath with the full path to adb.exe."
    }
    return $command.Source
}

function Get-AuthorizedDevices {
    $output = @(& $script:AdbExe devices)
    if ($LASTEXITCODE -ne 0) {
        throw "ADB could not list devices. Check the Platform-Tools installation."
    }

    $found = @()
    foreach ($line in $output) {
        if ($line -match '^\s*(\S+)\s+device$') {
            $found += $Matches[1]
        }
    }
    return $found
}

try {
    $script:AdbExe = Resolve-Adb
    Write-Host ""
    Write-Host "FLASH TOOLS — ANDROID RECOVERY ASSISTANT" -ForegroundColor Cyan
    Write-Host "ADB: $script:AdbExe"
    Write-Host "This tool only requests a reboot. It never wipes, unlocks, roots or flashes."
    Write-Host ""

    $devices = @(Get-AuthorizedDevices)
    if ($devices.Count -eq 0) {
        Write-Host "No authorized Android device detected." -ForegroundColor Yellow
        Write-Host "Connect by USB, enable USB debugging, approve the RSA prompt, then retry."
        exit 2
    }

    if ($devices.Count -gt 1) {
        Write-Host "More than one authorized device is connected:" -ForegroundColor Yellow
        $devices | ForEach-Object { Write-Host " - $_" }
        Write-Host "For safety, disconnect all but the phone you intend to service, then rerun."
        exit 3
    }

    $serial = $devices[0]
    Write-Host "Connected device: $serial" -ForegroundColor Green
    Write-Host ""
    Write-Host "1. Reboot to Android Recovery"
    Write-Host "2. Reboot to Bootloader / Fastboot (if supported)"
    Write-Host "3. Recheck ADB connection"
    Write-Host "0. Exit"
    Write-Host ""

    $choice = Read-Host "Choose an action"
    switch ($choice) {
        "1" {
            Write-Host "Recovery may contain destructive options such as Wipe data/factory reset." -ForegroundColor Yellow
            Write-Host "This command does NOT select or run any recovery menu option."
            $confirm = Read-Host "Type REBOOT to restart this device into Recovery"
            if ($confirm -cne "REBOOT") {
                Write-Host "Cancelled. No command sent."
                exit 0
            }
            & $script:AdbExe -s $serial reboot recovery
            if ($LASTEXITCODE -ne 0) { throw "ADB failed to request Recovery reboot." }
            Write-Host "Recovery reboot requested. Follow the exact manufacturer's instructions on the phone."
        }
        "2" {
            Write-Host "Bootloader mode is not the same as Recovery. Do not unlock or flash anything." -ForegroundColor Yellow
            $confirm = Read-Host "Type REBOOT to restart this device into its bootloader"
            if ($confirm -cne "REBOOT") {
                Write-Host "Cancelled. No command sent."
                exit 0
            }
            & $script:AdbExe -s $serial reboot bootloader
            if ($LASTEXITCODE -ne 0) { throw "ADB failed to request Bootloader reboot." }
            Write-Host "Bootloader reboot requested. Fastboot availability varies by manufacturer."
        }
        "3" {
            & $script:AdbExe devices
            if ($LASTEXITCODE -ne 0) { throw "ADB device check failed." }
        }
        "0" {
            Write-Host "Exited. No device command sent."
        }
        default {
            Write-Host "Invalid choice. No device command sent." -ForegroundColor Yellow
            exit 1
        }
    }
}
catch {
    Write-Error $_
    exit 1
}
