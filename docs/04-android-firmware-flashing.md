# Android Firmware Flashing — Manufacturer and Chipset Reference

Firmware flashing is model-specific. There is no single safe command or tool that flashes every Android phone.

## 1. Identify before choosing a tool

Collect:
- Exact model number and regional suffix.
- Product/device codename.
- Hardware revision where available.
- Current build fingerprint and Android version.
- Chipset family.
- Bootloader state and supported service mode.
- Exact firmware package intended for that model/region.

Never select firmware based only on the marketing name (for example, “Galaxy A” or “itel A60”).

## 2. Common platform families

| Platform / vendor | Common service path or package | Important note |
|---|---|---|
| Google Pixel | Official factory images / Android Flash Tool where supported | Follow Google's model-specific instructions |
| Samsung | Download Mode + Odin-compatible firmware package | Use exact model/CSC package; do not cross-flash variants |
| MediaTek | Vendor/service-authorized tools; scatter-format packages are common | Wrong preloader/partition can hard-brick a device |
| Unisoc / Spreadtrum | Vendor/service-authorized Research Download or Upgrade Download; PAC packages are common | Exact board and PAC compatibility are essential |
| Qualcomm | Manufacturer service tools; EDL/QFIL concepts on supported devices | EDL access and signed programmer files are device-specific |
| Other vendors | Manufacturer-specific update/recovery process | Do not assume a chipset tool is universal |

Tool availability, authorization and supported procedures vary. Download tools only from the device manufacturer or a trusted official source. Avoid repackaged binaries and unknown driver bundles.

## 3. Firmware verification checklist

Before any flash:
1. Confirm exact model and variant.
2. Confirm package is intended for that model and region.
3. Obtain firmware from an official or trusted manufacturer source.
4. Verify the package checksum/signature if provided.
5. Read release notes and anti-rollback restrictions.
6. Confirm battery level and stable USB connection.
7. Back up user data.
8. Understand whether the procedure wipes data.
9. Have a manufacturer-approved recovery path.
10. Stop if any identifier or package detail conflicts.

## 4. Important Android concepts

- **Bootloader:** starts and verifies the operating system.
- **Recovery:** separate environment for update/reset tasks.
- **Boot image:** typically contains kernel and ramdisk components.
- **System/vendor/product:** operating-system partitions or logical partition groups.
- **A/B slots:** alternate bootable system slots on supported devices.
- **Dynamic partitions:** logical partitions managed within a super partition.
- **AVB:** Android Verified Boot checks.
- **Anti-rollback:** firmware version protections that may prevent downgrades.

## 5. Safe Fastboot inspection

Only on a device that supports Fastboot:

```bat
fastboot devices
fastboot getvar product
fastboot getvar current-slot
fastboot getvar unlocked
```

A variable may be unsupported. Read-only inspection is not proof that a firmware package is compatible.

## 6. Training order

We will study each family separately and only perform a real flash after a specific device model, official firmware and recovery plan are confirmed.

Do not use erase, format, unlock, partition-write or raw flashing commands as experiments.
