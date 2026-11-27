<#
FLASH TOOLS — Android Device Inspector
Read-only diagnostic helper. Does not reset, unlock, erase, root, or flash a device.
Requirements: Windows PowerShell 5.1+ and Android SDK Platform-Tools (adb.exe).
Usage:
  powershell -ExecutionPolicy Bypass -File .\flash-tools-inspector.ps1
  powershell -ExecutionPolicy Bypass -File .\flash-tools-inspector.ps1 -AdbPath "C:\Android\platform-tools\adb.exe"
#>
[CmdletBinding()]
param(
    [string]$AdbPath = "adb",
    [string]$OutputDirectory = ".\reports"
)

$ErrorActionPreference = "Stop"

function Write-Section([string]$Title) {
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
}

try {
    $adbCommand = Get-Command $AdbPath -ErrorAction SilentlyContinue
    if (-not $adbCommand -and -not (Test-Path -LiteralPath $AdbPath)) {
        throw "ADB was not found. Install Android Platform-Tools or pass the full path using -AdbPath."
    }
    if ($adbCommand) { $adbExe = $adbCommand.Source } else { $adbExe = (Resolve-Path -LiteralPath $AdbPath).Path }

    Write-Host "FLASH TOOLS — Android Device Inspector" -ForegroundColor Green
    Write-Host "Read-only mode: no device settings or data will be changed."
    Write-Section "ADB version"
    & $adbExe version
    if ($LASTEXITCODE -ne 0) { throw "ADB could not run." }

    Write-Section "Connected devices"
    $deviceLines = & $adbExe devices
    $deviceLines | ForEach-Object { Write-Host $_ }
    $serials = @()
    foreach ($line in $deviceLines) {
        if ($line -match '^([^\s]+)\s+device$' -and $line -notmatch '^List') {
            $serials += $Matches[1]
        }
    }

    if ($serials.Count -eq 0) {
        Write-Warning "No authorized Android device detected. Check cable, USB debugging, OEM driver, and the RSA authorization prompt."
        exit 2
    }
    if ($serials.Count -gt 1) {
        Write-Warning "Multiple authorized devices detected. This script will inspect the first device only: $($serials[0])"
    }
    $serial = $serials[0]
    $adbArgs = @("-s", $serial, "shell")

    function Get-DeviceProp([string]$Name) {
        $value = & $adbExe @("-s", $serial, "shell", "getprop", $Name) 2>$null
        if ($LASTEXITCODE -eq 0 -and $value) { return (($value | Out-String).Trim()) }
        return "(unavailable)"
    }

    $report = [ordered]@{
        GeneratedAt = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss zzz")
        DeviceSerial = ($serial.Substring(0,[Math]::Min(4,$serial.Length)) + "… [redacted]")
        Manufacturer = Get-DeviceProp "ro.product.manufacturer"
        Brand = Get-DeviceProp "ro.product.brand"
        Model = Get-DeviceProp "ro.product.model"
        Product = Get-DeviceProp "ro.product.name"
        DeviceCodename = Get-DeviceProp "ro.product.device"
        AndroidVersion = Get-DeviceProp "ro.build.version.release"
        AndroidSdk = Get-DeviceProp "ro.build.version.sdk"
        BuildId = Get-DeviceProp "ro.build.display.id"
        BuildFingerprint = Get-DeviceProp "ro.build.fingerprint"
        BoardPlatform = Get-DeviceProp "ro.board.platform"
        PrimaryAbi = Get-DeviceProp "ro.product.cpu.abi"
        VerifiedBootState = Get-DeviceProp "ro.boot.verifiedbootstate"
        BootloaderLockedProperty = Get-DeviceProp "ro.boot.flash.locked"
    }

    Write-Section "Device information"
    foreach ($entry in $report.GetEnumerator()) {
        Write-Host ("{0}: {1}" -f $entry.Key, $entry.Value)
    }

    if (-not (Test-Path -LiteralPath $OutputDirectory)) {
        New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
    }
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $safeModel = ($report.Model -replace '[^a-zA-Z0-9_-]', '_')
    $jsonPath = Join-Path $OutputDirectory "android-inspection-$safeModel-$timestamp.json"
    $textPath = Join-Path $OutputDirectory "android-inspection-$safeModel-$timestamp.txt"
    $report | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $jsonPath -Encoding UTF8
    ($report.GetEnumerator() | ForEach-Object { "{0}: {1}" -f $_.Key, $_.Value }) |
        Set-Content -LiteralPath $textPath -Encoding UTF8

    Write-Section "Report saved"
    Write-Host (Resolve-Path -LiteralPath $jsonPath).Path -ForegroundColor Green
    Write-Host (Resolve-Path -LiteralPath $textPath).Path -ForegroundColor Green
    Write-Warning "Review reports before sharing. Build fingerprints and device details can be identifying. Never publish full serials, IMEI, account data, or customer information."
}
catch {
    Write-Error $_
    exit 1
}
