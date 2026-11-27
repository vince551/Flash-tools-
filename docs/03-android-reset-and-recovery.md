# Android Factory Reset and Recovery

A factory reset removes user data and returns the device to its initial setup state. It does **not** necessarily reinstall or repair the Android operating system.

## 1. Understand the different operations

| Operation | What it does | Typical data effect |
|---|---|---|
| Settings > System > Reset | Performs the manufacturer's reset workflow | Erases user data |
| Recovery menu > Wipe data/factory reset | Resets user data from recovery | Erases user data |
| `adb reboot recovery` | Requests reboot into recovery | Does not itself erase data |
| Stock firmware restoration | Reinstalls supported firmware images | Often erases data; model-dependent |
| Bootloader unlock | Changes bootloader security state | Commonly wipes data; not a reset shortcut |

## 2. Before any reset

- Confirm the owner has authorized the reset.
- Confirm that photos, files and other important data are backed up.
- Confirm the owner knows the Google account previously used on the device.
- Ensure the battery is adequately charged.
- Check manufacturer-specific reset instructions.
- Explain that Factory Reset Protection may require the previously synced Google account after reset.

A reset is not a method for removing FRP or proving ownership.

## 3. Safe ADB command: reboot to recovery

With an authorized, booted Android device:

```bat
adb devices
adb reboot recovery
```

This only requests entry into recovery. It does not select or execute a wipe. Use the device's physical buttons/menu and official instructions to navigate recovery.

## 4. Factory reset through the device UI

The preferred beginner method is the manufacturer's Settings reset flow, after backup and owner consent. Menu labels differ by Android version and manufacturer.

## 5. Recovery reset

Recovery menus vary. A common stock recovery menu includes a data-wipe option, but do not select it until the owner has approved data loss and the exact device instructions are confirmed.

## 6. What a factory reset cannot fix

A reset may not repair:
- Damaged or missing system firmware.
- Failed storage hardware.
- A corrupted bootloader.
- Hardware faults.
- Carrier/network hardware problems.

These require diagnosis. Firmware restoration is a separate procedure and must use an exact compatible package.

## 7. Verify after reset

- Device boots to setup.
- Touchscreen and buttons work.
- Wi-Fi and mobile network work.
- Cameras, speaker, microphone and charging work.
- Owner completes their own Google account verification.
