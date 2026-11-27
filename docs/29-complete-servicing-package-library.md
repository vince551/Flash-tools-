# Complete Mobile Servicing Package Library

A curated index of the software, drivers, firmware portals, recovery utilities and reference material used in legitimate Android and iPhone servicing. This is a **download directory and compatibility guide**, not a bundle of copied installers or firmware images.

> **Important:** Firmware and service packages are model-, region-, board- and build-specific. A filename match is not proof of compatibility. Prefer the device manufacturer or its authorized service network. Do not flash a package simply because it downloads successfully.

## 1. Core workstation packages

| Package | Official source | Use |
|---|---|---|
| Android SDK Platform-Tools | https://developer.android.com/tools/releases/platform-tools | ADB and Fastboot command-line tools |
| Google USB driver | https://developer.android.com/studio/run/win-usb | Windows driver for supported Google devices |
| OEM USB driver guidance | https://developer.android.com/studio/run/oem-usb | Manufacturer driver directory |
| Apple Devices for Windows | https://apps.microsoft.com/detail/9np83lwlpz9k | iPhone backup, update and restore on Windows |
| Apple Devices user guide | https://support.apple.com/guide/devices-windows/welcome/windows | Supported iPhone workflows |
| 7-Zip | https://www.7-zip.org/ | Inspect supported archives |
| Windows Security | Built into Windows | Scan downloaded files |
| PowerShell | Built into supported Windows versions | Run the repository's read-only inspection/audit scripts |

## 2. Android manufacturer firmware and support portals

| Manufacturer | Primary support / software source | Notes |
|---|---|---|
| Google Pixel | https://developers.google.com/android/images | Factory images; read device-specific unlock and flashing notes |
| Google Pixel OTA | https://developers.google.com/android/ota | Official full OTA packages |
| Samsung | https://www.samsung.com/africa_en/support/ | Smart Switch, device support and authorized service pathways |
| Samsung Smart Switch | https://www.samsung.com/africa_en/support/smart-switch/ | Backup, migration and supported updates; not a universal manual firmware flasher |
| Xiaomi / Redmi / POCO | https://www.mi.com/global/support/ | Check exact model/region and official service instructions |
| Motorola / Lenovo | https://en-us.support.motorola.com/ | Device support and software recovery |
| Motorola Rescue and Smart Assistant | https://www.motorola.com/us/rescue-and-smart-assistant/p | Supported Motorola rescue workflow; availability varies by region/device |
| TECNO / Infinix / itel | https://www.carlcare.com/ | Official after-sales support network; request exact model/build firmware through authorized service |
| HMD / Nokia phones | https://www.hmd.com/support | Device support and repair guidance |
| Sony Xperia | https://www.sony.com/electronics/support/mobile-phones-tablets | Support and Xperia Companion information |
| Huawei | https://consumer.huawei.com/en/support/ | HiSuite and official support; exact service availability varies |
| OnePlus | https://www.oneplus.com/support | Device support and official update information |
| OPPO | https://support.oppo.com/ | Official regional support and service |
| realme | https://www.realme.com/global/support | Official regional support and service |

**Firmware availability note:** Many manufacturers do not publish complete factory/service firmware for every model. Some packages are restricted to authorized repair partners. If no official public package exists, use the manufacturer's service center rather than a random mirror.

## 3. Chipset service ecosystems

| Chipset family | Package / tool ecosystem | What to learn | Access note |
|---|---|---|---|
| MediaTek | Scatter firmware; SP Flash Tool ecosystem | Scatter metadata, image inventory, exact platform matching | Tool/package provenance and authorization must be checked; avoid unofficial repacks |
| Unisoc / Spreadtrum | PAC firmware; Research Download / Upgrade Download | PAC metadata, FDL terminology, board/build compatibility | Service applications and loaders may be restricted; use OEM-authorized sources |
| Qualcomm | QPST / QFIL ecosystem; programmer packages; EDL | Qualcomm platform identification and service-mode concepts | Programmer files and EDL access are device-specific and may require authorization |
| Samsung Exynos | Samsung firmware components and Download Mode workflow | AP, BL, CP, CSC and HOME_CSC concepts | Use Samsung-supported/authorized sources; do not use random patched tools |
| Apple silicon / iPhone | IPSW restore packages; Apple Devices | Signed restore, update vs restore, recovery and DFU | Apple controls signing; use Apple software and current signed builds |

This section is a learning map. It intentionally does not link to cracked, repacked or unknown service-tool executables.

## 4. iPhone servicing packages

| Resource | Official source | Use |
|---|---|---|
| Apple Devices for Windows | https://apps.microsoft.com/detail/9np83lwlpz9k | Backup, update and restore |
| Restore an iPhone using a computer | https://support.apple.com/118107 | Apple restore instructions |
| If you can't update or restore | https://support.apple.com/ Apple Support search: “If you can't update or restore your iPhone” | Troubleshooting supported restore failures |
| Apple security releases | https://support.apple.com/en-us/100100 | Verify current iOS releases and security updates |
| Apple Configurator | https://support.apple.com/apple-configurator | Apple Configurator is for macOS; it is not a Windows replacement |
| IPSW package index | https://ipsw.me/ | Third-party catalogue that links to Apple-hosted firmware where available; verify device identifier and signing status, then restore using Apple software |

**iPhone rules:** Never use Android ADB/Fastboot tools to flash iOS. A restore can erase data. Activation Lock is an account-security feature and is not removed by reinstalling iOS.

## 5. Firmware file-format reference

| Extension / name | Common ecosystem | Meaning / caution |
|---|---|---|
| `.pac` | Unisoc | Firmware package container; exact layout and compatibility vary |
| `.zip` / OTA ZIP | Android | May contain an update package; not every ZIP is flashable |
| `payload.bin` | Android A/B OTA | Contains partition payload data within certain OTA packages |
| `.img` | Android | Partition image; the partition name and device layout matter |
| Scatter text + images | MediaTek | Describes a platform's partition/image mapping; never reuse across models |
| `.ofp` | Some OPPO/realme devices | Vendor firmware container; extraction/decryption procedures may be restricted |
| `.kdz` / `.tot` | Some LG devices | Historical LG firmware package formats; support and availability vary |
| `AP / BL / CP / CSC` | Samsung | Firmware component groups; package selection is model/region specific |
| `.ipsw` | Apple | iPhone/iPad software restore package; Apple signing determines restore eligibility |

## 6. Driver and connection package checklist

Before installing a driver:
1. Identify the exact phone model and Windows version.
2. Prefer Windows Update, the OEM support portal or an authorized service provider.
3. Check publisher and digital signature in Windows.
4. Create a restore point if installing a low-level driver.
5. Install only the driver needed for the task.
6. Reconnect the phone and inspect Device Manager.
7. Do not disable Windows driver-signature enforcement to install an unknown package.

Connection modes are not interchangeable:
- **ADB:** Android debugging after Android boots and USB debugging is authorized.
- **Fastboot:** bootloader interface on supported Android devices.
- **Download Mode:** Samsung service/update interface.
- **Preloader / BROM:** MediaTek boot-stage interfaces.
- **Unisoc download interface:** device-specific service connection.
- **EDL:** Qualcomm emergency download interface; access is restricted on many models.
- **Recovery / DFU:** Apple recovery and device firmware update modes.

## 7. Download verification record

Record these fields for every installer or firmware archive before use:

| Field | Record |
|---|---|
| File name | Exact downloaded name |
| Publisher / source | Official OEM, authorized service center, or third-party |
| Download page | Full page URL |
| Target manufacturer/model | Exact model and variant |
| Region / carrier | As applicable |
| Build / version | Exact firmware build |
| File size | Bytes or MB/GB |
| SHA-256 | Locally calculated value |
| Publisher hash available? | Yes / No |
| Digital signature | Valid / Not applicable / Failed |
| Intended tool and version | Exact name/version |
| Compatibility confirmed by | OEM / authorized technician / not confirmed |
| Decision | Hold / approved for supervised use / reject |

A locally calculated SHA-256 identifies the downloaded bytes. It proves authenticity only when compared with a trusted hash supplied by the publisher through a trusted channel. A valid archive listing does not prove that firmware is compatible.

## 8. Repository audit utility

Use the existing read-only audit script on a Windows PC:

```powershell
.\tools\windows\firmware-package-audit.ps1 -PackagePath "C:\Firmware\package.zip"
```

If the publisher provides a trusted SHA-256:

```powershell
.\tools\windows\firmware-package-audit.ps1 -PackagePath "C:\Firmware\package.zip" -ExpectedSha256 "PUBLISHER_SHA256"
```

This script calculates a hash and lists ZIP entries. It does not authenticate vendor signatures, unpack firmware, alter partitions or flash a device.

## 9. Practice-device note — itel A60s (A662LM)

The recorded practice-device build is:

`A662LM-SR370ABCDEFGIJ-SGo-GL-250401V596`

The device is reported as Unisoc SC9863A / Android 12. The exact build string is a useful search/identification key, **not permission to install any similarly named archive**. Request the matching package from Carlcare/itel and have an authorized technician verify the package and service-tool compatibility. Do not download a multi-gigabyte third-party archive merely for the theory exercise.

Official support: https://www.carlcare.com/  
Kenya contact page: https://www.carlcare.com/ke/contact/

## 10. Safety and legal boundaries

This repository is for lawful repair, owner-authorized diagnostics and learning. It does not provide instructions to bypass FRP, Activation Lock, passcodes, MDM, carrier/financing locks or account security; alter IMEI/device identity; or access a device without permission.

Never flash, erase, format, repartition or write an image until the exact target, package provenance, compatibility, backup and owner consent have been confirmed. If any of those are unknown, stop and use an authorized service center.

## 11. Next learning sequence

1. Learn ADB and Fastboot inspection.
2. Learn how to identify exact model, codename, region and build.
3. Learn Android package formats and chipset families.
4. Audit a trusted archive without installing it.
5. Study each manufacturer's supported recovery method.
6. Practise iPhone backup/update/restore using a test device with the owner's consent.
7. Perform any actual firmware restoration only with an authorized technician and verified device-specific instructions.
