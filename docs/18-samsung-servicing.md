# Lesson 18 — Samsung Galaxy Servicing

## Tool map

- **Smart Switch for Windows/Mac:** official backup, migration and supported update workflows: https://www.samsung.com/africa_en/support/smart-switch/
- **Odin / Download Mode:** used in some Samsung service and firmware workflows. It is not a general consumer utility with a universal official public download. Use authorized service sources.
- **Samsung USB drivers:** obtain through Samsung's official support/service channel for the relevant model and Windows version.

## Identify the handset

Record the full model code (for example, the complete SM-xxxxx variant), region/CSC where relevant, bootloader/binary revision, Android build and current condition. A Galaxy name such as “A-series” is not enough.

Read-only ADB commands:

```bash
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.bootloader
adb shell getprop ro.build.version.release
```

## Safe service workflow

1. Confirm owner authorization and data backup.
2. Record the complete model code and software build.
3. Try Samsung-supported Smart Switch update/recovery options where offered.
4. If a service-level firmware restoration is required, confirm the exact model, binary revision and region with Samsung/authorized service documentation.
5. Verify firmware source and package integrity.
6. Use only the documented service process for that exact model.
7. After service, verify boot, network, cameras, charging, biometrics and account setup.

## Important cautions

- Do not flash firmware for a similar model or different hardware variant.
- Do not downgrade across bootloader/binary revisions unless Samsung's supported process explicitly permits it.
- Do not select repartition or PIT options unless an authorized model-specific procedure requires them.
- Do not attempt FRP, MDM, Knox Guard, account or carrier-lock bypass.
- A firmware restoration may erase all user data.

## Practical exercise

Use a Samsung phone you are authorized to inspect. Record the full model code and build. Find the official Smart Switch page and determine whether its supported recovery/update workflow applies. Do not flash during this exercise.
