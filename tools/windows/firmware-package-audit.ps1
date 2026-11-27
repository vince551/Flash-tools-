# Firmware Package Audit — read-only helper
# Computes SHA-256 and lists ZIP contents. It does NOT extract, modify, or flash firmware.
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$PackagePath,
    [Parameter(Mandatory = $false)]
    [string]$ExpectedSha256
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($PackagePath)) {
    $PackagePath = Read-Host "Enter full path to the firmware archive"
}

if (-not (Test-Path -LiteralPath $PackagePath -PathType Leaf)) {
    throw "File not found: $PackagePath"
}

$file = Get-Item -LiteralPath $PackagePath
$hash = Get-FileHash -LiteralPath $PackagePath -Algorithm SHA256

Write-Host ""
Write-Host "=== Firmware package audit (read-only) ===" -ForegroundColor Cyan
Write-Host ("File:   {0}" -f $file.FullName)
Write-Host ("Size:   {0:N2} MB" -f ($file.Length / 1MB))
Write-Host ("SHA256: {0}" -f $hash.Hash)

if (-not [string]::IsNullOrWhiteSpace($ExpectedSha256)) {
    if ($hash.Hash -eq $ExpectedSha256.Trim().ToUpperInvariant()) {
        Write-Host "Hash comparison: MATCH" -ForegroundColor Green
    } else {
        Write-Warning "Hash comparison: MISMATCH — do not use this package."
    }
} else {
    Write-Host "No expected hash supplied; compare this value with the trusted publisher's value."
}

if ([IO.Path]::GetExtension($PackagePath).ToLowerInvariant() -eq ".zip") {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [IO.Compression.ZipFile]::OpenRead($PackagePath)
    try {
        Write-Host ""
        Write-Host "Archive entries (names and sizes only):" -ForegroundColor Cyan
        $archive.Entries |
            Select-Object @{Name="Path";Expression={$_.FullName}},
                          @{Name="SizeKB";Expression={[math]::Round($_.Length / 1KB, 2)}} |
            Format-Table -AutoSize
    }
    finally {
        $archive.Dispose()
    }
} else {
    Write-Host "Archive listing skipped: this helper currently lists ZIP files only."
}

Write-Host ""
Write-Host "Audit complete. A matching hash proves file integrity against that expected hash; it does not prove model compatibility or firmware authenticity."
