# Lesson 24 — Firmware Package Audit Utility

The repository includes a read-only Windows PowerShell helper:

`tools/windows/firmware-package-audit.ps1`

## What it does

- Computes a SHA-256 hash for a selected firmware file.
- Optionally compares the result with a hash supplied by the trusted firmware publisher.
- Lists ZIP archive entry names and uncompressed sizes.
- Does not extract, modify, unlock, reset or flash a device.

## Run on Windows

Open PowerShell in the repository folder:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\tools\windows\firmware-package-audit.ps1
```

Or pass a file and expected hash:

```powershell
.\tools\windows\firmware-package-audit.ps1 -PackagePath "C:\Firmware\package.zip" -ExpectedSha256 "PASTE_PUBLISHER_SHA256_HERE"
```

The expected hash must come from the official OEM/authorized source. Never invent one.

## Interpretation

- **MATCH:** the file matches the expected hash. This does not prove the package is for your phone.
- **MISMATCH:** stop; do not use the package.
- **No expected hash:** the script reports the hash for comparison, but cannot authenticate the file.

A hash only checks file integrity against a known value. Still verify exact model, board, region, build, signature and authorization separately.

## Safety

Run only on a firmware file obtained lawfully from a trusted source. Do not upload firmware packages or customer data to public repositories.
