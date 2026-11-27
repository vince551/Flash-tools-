# Lesson 19 — Xiaomi, Redmi and POCO Servicing

## Identify the exact variant

Record the full model number, codename, region, chipset, current MIUI/HyperOS build, Android version and bootloader state. Redmi and POCO retail names can cover multiple hardware variants.

Read-only commands when ADB is already authorized:

```bash
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.boot.slot_suffix
```

## Official support first

- Xiaomi Global support: https://www.mi.com/global/support/
- Xiaomi regional support and service locations: use the official regional Xiaomi site.
- Do not download Mi Flash from random mirrors. Confirm current availability, supported models and procedure through Xiaomi's official service channel.

## Firmware package types

- Recovery ROM: intended for supported in-system/recovery update paths.
- Fastboot ROM: package for supported Fastboot service workflows.
- OTA package: update package with specific source-build and signing requirements.

These package types are not interchangeable. Match codename, region/branch, version and device variant.

## Safe workflow

1. Confirm model and codename from reliable device/OEM information.
2. Confirm region and currently installed build.
3. Read Xiaomi's current official instructions for that exact model.
4. Confirm bootloader and authorization requirements.
5. Verify the package source, target and integrity.
6. Back up data and explain possible data loss.
7. Follow only the documented model-specific service route.
8. Verify boot, network, cameras, sensors and update status.

## Stop conditions

Stop if the codename is uncertain, the package branch is wrong, authorization is missing, the package source is untrusted, or the proposed process requires an account/ownership/anti-theft bypass.

## Practice

Identify one Xiaomi/Redmi/POCO handset and write down its full model, codename and region. Compare those values against official support information before considering any package.
