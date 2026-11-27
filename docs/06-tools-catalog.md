# Mobile Servicing Tools Catalog

Use official sources whenever possible. Some manufacturer service tools are restricted to authorized service providers.

## Core workstation tools

| Tool | Platform | Purpose | Official source |
|---|---|---|---|
| Android SDK Platform-Tools | Android | ADB and Fastboot | https://developer.android.com/tools/releases/platform-tools |
| Android USB/OEM drivers | Android | Windows device detection | https://developer.android.com/studio/run/win-usb |
| Apple Devices | iPhone | Windows backup, update and restore | https://support.apple.com/guide/devices-windows/welcome/windows |
| Windows Device Manager | Windows | Inspect USB/COM device driver state | Built into Windows |
| 7-Zip | Windows | Inspect/extract supported archives | https://www.7-zip.org/ |

## Android vendor/chipset tools to study

| Family | Tool / workflow | Notes |
|---|---|---|
| Google Pixel | Android Flash Tool / factory images | https://flash.android.com/ and https://developers.google.com/android/images |
| Samsung | Odin / Download Mode | Obtain firmware and instructions from Samsung or authorized service channels |
| MediaTek | SP Flash Tool ecosystem | Use only model-compatible, authorized packages and procedures |
| Unisoc | Research Download / Upgrade Download | PAC packages; compatibility is board-specific |
| Qualcomm | QFIL / QPST ecosystem | EDL and programmer access are model-specific and may require authorization |

This list is a study map, not an endorsement of third-party downloads. Avoid unofficial “all-in-one unlock/flash” packages, cracked tools and unknown executables.

## Tool selection rules

1. Identify the manufacturer, exact model and chipset.
2. Check the manufacturer's support instructions.
3. Determine whether the phone supports the proposed service mode.
4. Confirm tool compatibility and authorization requirements.
5. Confirm the firmware package is correct.
6. Back up data and obtain consent before destructive actions.

## iPhone notes

Apple Devices is the supported Windows starting point for general iPhone backup, update and restore. Apple Configurator is primarily a macOS tool, not a Windows replacement. Do not assume Android tools can service iOS.
