# Device Profile — itel A60s (A662LM)

> This profile records details supplied by the device owner. It is an inspection baseline, not proof that a particular firmware package is compatible.

## 1. Reported device information

| Field | Reported value |
|---|---|
| Manufacturer / brand | itel |
| Model | A662LM |
| Marketing name | itel A60s |
| Android version | 12 |
| Build number (as reported) | `A662LM-SR370ABCDEFGIJ-SGo-GL-250401V596` |
| UI version | itelV8.6.0 (OS8.6-S-P202-230606) |
| Android security patch | 2025-03-05 |
| Google Play system update | 2026-10-01 |
| Baseband | `4G_MODEM_22A_W23.42.4_P1|sc9863A_modem` (reported twice) |
| Kernel | `5.4.274-android12-9-660275-g403759fbe504-ab564 #1 Tue Apr 1 22:22:53 CST 2025` |
| Chipset | Unisoc SC9863A (reported in Settings) |
| CPU | Octa-core |
| Physical RAM | 4 GB |
| Extended / virtual RAM | +4 GB (reported; not equivalent to physical RAM) |
| Internal storage | 128 GB |
| Battery capacity | 5000 mAh (manufacturer specification) |
| Display | 720 × 1612 |
| Front camera | 5 MP |
| Rear camera | 8 MP dual-camera system |
| Device name | Vince |

Do not publish or add IMEI, serial number, phone number, account details, or other unique identifiers to a public service report.

## 2. Important build-string discrepancy

The owner-reported build contains:

`A662LM-SR370**ABCDEFGIJ**-SGo-GL-250401V596`

Some third-party firmware indexes show a very similar string with a different middle sequence:

`A662LM-SR370**ABCDEFGIJ**-SGo-GL-250401V596`

These strings are not identical. Do not silently normalize the string, assume it is a typo, or download/flash a package based on the similar name. Confirm the exact value directly from Android properties and, if needed, with Carlcare/itel support. A matching model name and version suffix alone are not sufficient evidence of compatibility.

## 3. Read-only verification on a Windows PC

When a Windows computer is available:

1. Install Android SDK Platform-Tools from the official Android developer site.
2. Enable USB debugging only for this authorized inspection.
3. Connect the unlocked phone and approve the computer's RSA prompt.
4. Run the commands below. They only read device information.

```powershell
adb version
adb devices -l
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.product.name
adb shell getprop ro.build.display.id
adb shell getprop ro.build.fingerprint
adb shell getprop ro.build.version.release
adb shell getprop ro.build.version.sdk
adb shell getprop ro.build.version.security_patch
adb shell getprop ro.board.platform
adb shell getprop ro.boot.hardware
adb shell getprop ro.boot.slot_suffix
adb shell getprop gsm.version.baseband
adb shell getprop sys.boot_completed
adb shell dumpsys battery
adb shell df -h
adb shell uptime
```

Save the output in a private service record. Redact serial numbers and other unique identifiers before sharing.

## 4. What this tells us

- The model identifier to start from is **A662LM**.
- The reported platform is **Unisoc SC9863A**, so the Unisoc learning module is the relevant chipset track.
- The reported Android release is **Android 12**.
- The baseband string includes `sc9863A_modem`, which is consistent with the reported platform, but it does not establish firmware compatibility by itself.
- The device currently boots to Android, so there is no reason to flash firmware as a learning exercise.

## 5. Firmware safety gate

Before any future firmware restoration, require all of the following:

- Exact model and product/device identifiers verified from the phone.
- Exact full build string reconciled, including the middle sequence.
- Correct hardware/region variant confirmed by an authoritative itel/Carlcare source.
- Package provenance established; do not treat a third-party mirror's “official” label as proof.
- Package hash obtained from a trusted publisher and independently checked.
- Package format and service tool confirmed for this exact device.
- Owner backup and explicit data-loss consent recorded.
- Stable Windows PC, reliable cable, sufficient battery and a documented recovery plan.

Do not use generic PAC flashing instructions as a substitute for exact package verification. Do not erase, format, repartition, or write individual partitions as an experiment.

## 6. Next practical exercise

**Exercise A — phone-only, no changes:** The owner has confirmed that the middle sequence is `ABCDEFGIJ` (without H). Use this as the corrected Settings transcription.

**Exercise B — when a Windows PC is available:** Run the read-only ADB commands in Section 3 and compare `ro.build.display.id`, `ro.build.fingerprint`, `ro.board.platform`, and `gsm.version.baseband` with the Settings values.

## 7. References

- itel official A60s product page: https://www.itel-life.com/products/phone/a-series/a60s
- itel official A60s specifications: https://www.itel-life.com/products/phone/a-series/a60s/spec
- itel declaration of conformity identifying model A662LM: https://www.itel-life.com/fileadmin/assets/img/support/EU_FILE/A662LM_E__Declaration_of_conformity.pdf
- Carlcare official support: https://www.carlcare.com/
- Android SDK Platform-Tools: https://developer.android.com/tools/releases/platform-tools

Third-party firmware listings can be useful as research leads for identifying naming patterns, but they are not authoritative compatibility or download sources.
