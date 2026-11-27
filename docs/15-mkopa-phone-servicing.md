# M-KOPA Phones — Authorized Servicing and Firmware Guide

## Purpose and scope

This guide covers safe diagnosis and legitimate software servicing of M-KOPA-branded or M-KOPA-financed phones. It is written for technicians and learners who have the owner's permission to inspect the handset.

**Important:** M-KOPA devices may be subject to financing agreements, payment controls, device-management policies, or other ownership protections. This guide does not explain how to bypass payment locks, device-management controls, FRP, account verification, activation protections, or ownership restrictions. A firmware reinstall is not a legitimate way to remove a contractual or security restriction.

## 1. First identify what phone you actually have

M-KOPA is not one Android hardware platform. A phone supplied through M-KOPA may be manufactured by a separate OEM and may use MediaTek, Unisoc, Qualcomm or another platform. The correct service path depends on the exact handset.

Record:

- M-KOPA product/plan name, if shown (do not publish customer or account identifiers)
- Manufacturer printed on the phone or shown in Settings
- Exact model number and product/codename, where available
- Board/platform and hardware revision, if documented
- Android version, build number and security patch
- Current symptom and whether the phone boots
- Whether the device is personally owned, still under financing, or managed by an organization

Do not share IMEI, serial number, customer number, phone number, payment details or account screenshots in a public GitHub issue.

## 2. Safe first-line diagnosis

Start with non-destructive checks:

1. Ask the owner to describe the fault and when it began.
2. Check the charger, cable, charging port and battery symptoms.
3. Restart the phone normally.
4. Check available storage and Android update status.
5. Record exact error messages.
6. Back up important data using the owner's approved method.
7. Use read-only ADB inspection only if USB debugging was already enabled and the owner authorizes the computer.

Read-only identity commands (on a Windows computer with Android Platform-Tools):

```bash
adb devices
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.build.version.release
adb shell getprop ro.board.platform
```

These properties may be blank or vendor-specific. Confirm the exact model from the device label, Settings, OEM documentation or an authorized service record. Never guess from the M-KOPA branding alone.

## 3. Which flashing tool does an M-KOPA phone use?

There is no single universal M-KOPA flashing tool. The service utility is determined by the phone's actual OEM, chipset, model and authorized service channel.

| Verified platform / manufacturer | Service ecosystem to research | Key caution |
|---|---|---|
| MediaTek-based handset | OEM-authorized service package; SP Flash Tool concepts may apply to some models | A scatter file or matching chipset does not prove compatibility; loaders and authorization may be required |
| Unisoc / Spreadtrum handset | OEM-authorized Research Download / Upgrade Download workflow may apply | PAC packages are model/board-specific |
| Qualcomm-based handset | OEM-authorized factory/service workflow; QFIL is relevant only to supported service packages | EDL access and programmer files are restricted/model-specific |
| Samsung handset | Samsung-supported update/recovery process; Odin is used in certain authorized service contexts | Exact model, binary revision and region matter |
| Other OEM/platform | Manufacturer's own supported service procedure | Do not substitute another brand's tool |

This table is a way to identify the correct ecosystem, not a list of guaranteed M-KOPA-supported tools. Do not download a tool or firmware until the exact handset model and authorized service procedure are confirmed.

## 4. Firmware selection rules

Before any restoration, all of the following must be true:

- Exact manufacturer model and hardware variant are confirmed.
- Board/platform and regional SKU match the package.
- Firmware comes from the OEM or an authorized service provider.
- Package integrity and signature/hash are verified according to the source's instructions.
- Version, bootloader/binary revision and anti-rollback requirements are compatible.
- The owner understands that restoration can erase all user data.
- A legitimate recovery path exists if the process fails.
- Any M-KOPA financing, device-management or ownership restriction is handled through M-KOPA's authorized support process—not through firmware modification.

A package described as “for M-KOPA” or “for the same chipset” is not sufficient evidence of compatibility.

## 5. If the phone shows a payment or device restriction

Do not attempt to remove or defeat the restriction with flashing, rooting, modified firmware, ADB commands, factory reset, engineering menus or third-party unlock utilities.

Instead:

1. Ask the device owner to check their agreement and account status.
2. Have the owner contact M-KOPA through the official app, website or customer-support channel shown on their agreement.
3. If the handset is faulty, ask M-KOPA or the OEM for the approved repair route and written confirmation of any service authorization.
4. Keep proof of authorization with the repair record.

A technician should not request or publish the customer's PIN, password, payment credentials or account recovery codes.

## 6. Windows tools for legitimate inspection

For general Android inspection, use the official Android SDK Platform-Tools:

- Android Platform-Tools: https://developer.android.com/tools/releases/platform-tools
- ADB documentation: https://developer.android.com/tools/adb

The repository's read-only inspector is at `tools/windows/flash-tools-inspector.ps1`. It collects basic device properties and redacts the serial in its report. It does not unlock, root, reset or flash.

Do not use an unofficial “M-KOPA unlocker”, cracked service tool, unknown loader, or tool that promises to remove payment controls. Such downloads can contain malware, damage the phone, or compromise customer data.

## 7. Service record template

| Field | Record |
|---|---|
| Customer authorization confirmed | |
| Exact OEM / model | |
| Board / platform / region | |
| Android build | |
| Fault reported | |
| Diagnostic checks | |
| Financing / management restriction present? | |
| Authorized support case / approval reference (store privately) | |
| Backup and data-loss consent | |
| Approved tool and package source | |
| Work performed | |
| Final tests and result | |

Keep customer-identifying details in the shop's protected service system, not in this public learning repository.

## 8. Post-repair verification

After an authorized repair, verify:

- Normal boot and stable restart
- Touchscreen and display
- Charging and battery behavior
- Wi-Fi, Bluetooth and mobile network
- Cameras, microphone and speakers
- Sensors and buttons
- Android update status
- Owner's normal account setup and any legitimate device-management enrollment

Do not ask the customer to disclose passwords. Let the owner complete account sign-in themselves.

## Knowledge check

1. Why is there no universal M-KOPA flasher?
2. Which exact details are needed before selecting a firmware package?
3. What is the correct route for a financing or payment restriction?
4. Why should customer identifiers never be committed to GitHub?

**Practical exercise:** inspect an M-KOPA handset only with the owner's permission. Record its manufacturer, exact model and Android build, then classify its likely chipset family using reliable documentation. Do not attempt a reset, unlock or firmware write as part of this exercise.
