# Case Study 1 — itel A60s (A662LM)

## Objective

Build a complete, safe service record for an itel A60s handset. This case study begins with identification and read-only diagnosis. It does **not** assume that every A60s variant uses the same firmware, and it does not perform a firmware write.

## 1. Confirm the model

The manufacturer's declaration of conformity identifies model **A662LM** as an itel mobile phone. The official A60s product page lists the product family and general specifications.

- Official product overview: https://www.itel-life.com/products/phone/a-series/a60s
- Official product specifications: https://www.itel-life.com/products/phone/a-series/a60s/spec
- Manufacturer declaration for A662LM: https://www.itel-life.com/fileadmin/assets/img/support/EU_FILE/A662LM_E__Declaration_of_conformity.pdf
- Official support / service network: https://www.carlcare.com/

A public device database associates A662LM with Unisoc SC9863A. Treat this as a research lead, not proof for the handset on your bench. Verify the platform from the phone's own read-only properties and authorized service documentation before choosing tools.

## 2. Intake and safety

Before connecting the phone:

- Confirm the owner has authorized inspection.
- Ask whether data is backed up.
- Record the fault exactly as reported.
- Inspect the cable, USB port, charging port and battery condition.
- Do not work on a swollen, wet, overheating or physically unsafe battery/device.
- Do not publish IMEI, serial number, customer details, account screenshots or private logs.

## 3. Read-only inspection on Windows

Install Android SDK Platform-Tools from https://developer.android.com/tools/releases/platform-tools.

On a Windows PC, open Command Prompt or PowerShell in the Platform-Tools folder. On your Android phone, you can read and prepare these commands in GitHub; they are not Windows commands to run inside the phone browser.

First confirm ADB:

```bash
adb version
adb devices -l
```

If the phone shows `unauthorized`, unlock it and approve the computer's RSA prompt only if the owner consents. If it is not listed, troubleshoot the cable, USB mode and driver. Do not proceed by installing unknown driver packs.

Collect read-only identity:

```bash
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.product.name
adb shell getprop ro.board.platform
adb shell getprop ro.boot.hardware
adb shell getprop ro.build.fingerprint
adb shell getprop ro.build.version.release
adb shell getprop ro.build.version.sdk
adb shell getprop ro.build.version.security_patch
adb shell getprop ro.boot.slot_suffix
```

Some properties may be blank or vendor-specific. Record the exact output; do not fill missing values by guessing.

Optional read-only health information:

```bash
adb shell dumpsys battery
adb shell df -h
adb shell uptime
adb shell getprop sys.boot_completed
```

Logs can contain personal information. Do not publish raw logs.

## 4. Identify the service family

If reliable device properties and authorized documentation confirm Unisoc SC9863A, use the Unisoc learning module:

- [Lesson 14 — Unisoc / Spreadtrum servicing](14-unisoc-servicing.md)
- [Lesson 16 — Tool download directory](16-tool-download-directory.md)
- [Lesson 17 — Android command reference](17-command-reference.md)

Do not assume a Research Download utility or a particular PAC package is automatically supported just because the chipset appears to match. OEM authorization, board identity, hardware revision, region and package metadata still matter.

## 5. Firmware package verification

Do not download firmware from an unknown mirror or use a file because its name contains A60s or A662LM.

Before any restoration, obtain written confirmation from itel/Carlcare or an authorized service source that the package is intended for the exact model and variant.

Verify:
- Exact model: A662LM (or the exact model actually reported by the handset)
- Board/platform and hardware revision
- Regional SKU / software branch
- Current build and intended target build
- Package source and published checksum/signature
- Tool version and authorization requirement
- Data-loss impact and recovery route

Use the repository's read-only helper only to calculate and compare a checksum:

```powershell
.\tools\windows\firmware-package-audit.ps1 -PackagePath "C:\Firmware\authorized-package.zip" -ExpectedSha256 "PUBLISHER_HASH"
```

The hash must come from the trusted publisher. A matching hash proves integrity against that value; it does not prove model compatibility or authenticity by itself.

## 6. Restoration decision

Proceed only when all identity, authorization, package and backup checks are satisfied and an exact OEM-approved procedure is available.

If any detail is unknown, stop and refer the handset to Carlcare/itel authorized support. This case study does not provide low-level erase, format, loader replacement, partition-write or lock-bypass instructions.

## 7. Post-service verification checklist

After an authorized repair, test:

- [ ] Normal boot and restart
- [ ] Touchscreen and display
- [ ] Charging and battery behavior
- [ ] Wi-Fi and Bluetooth
- [ ] SIM detection, calls and mobile data
- [ ] Front and rear cameras
- [ ] Microphone and speakers
- [ ] Fingerprint / face unlock where fitted
- [ ] Sensors and physical buttons
- [ ] Android update status
- [ ] Owner completes account setup themselves

## 8. Case worksheet

| Field | Actual observation |
|---|---|
| Model from label / Settings | |
| ADB model property | |
| Product / device codename | |
| Board / chipset property | |
| Build fingerprint | |
| Android version / security patch | |
| Boot condition and symptom | |
| ADB detection state | |
| Authorized support confirmation | |
| Firmware package source / target | |
| Expected SHA-256 source | |
| Backup and consent status | |
| Final decision | |

## Practical exercise — no flashing

1. Use a phone you own or have permission to inspect.
2. Confirm the exact model in Settings or on the label.
3. When you have Windows access, run the read-only commands above.
4. Fill in the worksheet.
5. Compare the model and platform against manufacturer/authorized service information.
6. Stop after identification. Do not reset, unlock or flash during this exercise.

## Reference notes

- itel's official A60s page gives general product information; it does not publish a universal firmware package for every regional variant.
- The A662LM declaration confirms the model designation.
- Third-party chipset listings are useful clues only. The connected handset and authorized OEM service records take precedence.
