# Lesson 17 — Android Command Reference

Commands below are grouped by risk. Start with read-only commands. Run commands only on a device you own or are explicitly authorized to service.

## A. Connection and device listing (read-only)

```bash
adb version
adb devices -l
fastboot --version
fastboot devices
```

- `adb devices -l` lists Android devices available to ADB.
- `fastboot devices` lists devices already in Fastboot mode.
- An empty list usually means cable, driver, mode, authorization or port troubleshooting is needed.

## B. Read-only device identity

```bash
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.build.version.release
adb shell getprop ro.build.version.sdk
adb shell getprop ro.board.platform
adb shell getprop ro.boot.hardware
adb shell getprop ro.boot.slot_suffix
```

Some properties are unavailable or vendor-specific. Never infer exact firmware compatibility from one property.

## C. Read-only diagnostics

```bash
adb shell df -h
adb shell uptime
adb shell getprop sys.boot_completed
adb shell dumpsys battery
adb shell dumpsys window
adb logcat -d -t 300
```

Logs can contain personal information. Review and redact before sharing them.

## D. File transfer (requires owner permission)

```bash
adb pull /sdcard/Download ./phone-downloads
adb push ./approved-file.txt /sdcard/Download/
```

Do not pull private files without consent. Do not upload customer data to public repositories.

## E. Non-destructive reboot requests

```bash
adb reboot
adb reboot recovery
adb reboot bootloader
```

The last two work only on devices that expose those modes and may not be supported by every manufacturer. Rebooting does not itself flash firmware.

## F. Fastboot read-only queries

```bash
fastboot devices
fastboot getvar product
fastboot getvar current-slot
fastboot getvar unlocked
```

Not all devices expose all variables. Treat errors as unsupported/unknown, not proof of a particular state.

## G. Commands intentionally not presented as universal recipes

Partition erase, format, unlock, relock, raw write and generic `fastboot flash` commands can make a phone unbootable or erase data. Their correct use depends on the exact device, partition layout, signed images, bootloader state and OEM instructions. Use the model-specific guide and official procedure; do not copy a command from another model.

## H. Windows PowerShell quick checks

```powershell
Get-Command adb
Get-Command fastboot
Get-PnpDevice -PresentOnly | Where-Object {$_.Class -in @("USB","Ports")}
```

These are Windows commands, not Android/Termux commands. On your phone, use GitHub to read the guide; run Windows commands only when you borrow a PC.

## Practice task

Connect an authorized test phone, run sections A and B, and write down the exact output. Do not run a reset, unlock or flash command during this exercise.
