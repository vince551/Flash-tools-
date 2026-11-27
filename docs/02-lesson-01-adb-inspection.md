# Lesson 1 — ADB Connection and Read-Only Inspection

**Objective:** connect an authorized Android phone to Windows and collect basic device information without changing data.

## 1. Confirm ADB sees the phone

Open CMD inside the Platform-Tools folder:

```bat
adb version
adb devices
```

If more than one device is connected, identify the correct serial and use `-s SERIAL` with later commands.

## 2. Read device properties

Run one command at a time:

```bat
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.brand
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.version.release
adb shell getprop ro.build.version.sdk
adb shell getprop ro.build.display.id
adb shell getprop ro.build.fingerprint
adb shell getprop ro.board.platform
adb shell getprop ro.product.cpu.abi
```

These values help identify the device. They are not by themselves sufficient to select firmware. Verify the exact regional/model variant and hardware revision with the manufacturer.

## 3. Read additional status

```bat
adb shell getprop ro.boot.verifiedbootstate
adb shell getprop ro.boot.flash.locked
adb shell getprop ro.boot.slot_suffix
adb shell uname -a
adb shell cat /proc/cpuinfo
```

Some properties may be blank, unavailable or restricted. That is not automatically a fault.

## 4. Capture a basic report

```bat
adb shell getprop > android-properties.txt
adb shell df -h > android-storage.txt
adb shell cat /proc/mounts > android-mounts.txt
```

These commands write report files on the Windows computer because the output is redirected by CMD. Review and redact identifiers before sharing a report.

## 5. Check whether Fastboot is available

This only reboots to the bootloader; it does not unlock it or flash anything:

```bat
adb reboot bootloader
fastboot devices
fastboot getvar product
fastboot getvar unlocked
```

Not every Android device supports standard Fastboot. Some manufacturers use other download or service modes. If Fastboot does not detect the phone, do not assume the phone is damaged.

To return to Android, use the phone's normal reboot option or, if supported:

```bat
fastboot reboot
```

## 6. Lesson checklist

- [ ] Platform-Tools installed from Google
- [ ] USB debugging enabled
- [ ] RSA authorization approved on trusted PC
- [ ] `adb devices` shows `device`
- [ ] Manufacturer and model collected
- [ ] Android version and build fingerprint collected
- [ ] Board platform and CPU ABI collected
- [ ] Report saved locally and sensitive data redacted

## Submit these results to your instructor
- Output of `adb devices` (hide most of the serial number).
- Model and manufacturer.
- Android release.
- Board platform.
- CPU ABI.
- Any error text.

**Do not post full serial numbers, IMEI, phone numbers or account details publicly.**
