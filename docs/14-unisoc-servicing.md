# Lesson 14 — Unisoc / Spreadtrum Servicing

## Learning objectives

By the end of this lesson, you should be able to recognize a Unisoc-based device, understand what a PAC firmware package is, explain the role of Research Download / Upgrade Download utilities, and decide when a device is **not ready** for restoration.

This is an identification and preparation lesson. It does not provide a generic flashing recipe: supported operations and authorization differ by manufacturer and model.

## 1. Identify the exact device first

Record all available identity fields before searching for firmware:

- Manufacturer and retail model number
- Internal product name / codename, if documented
- Board or platform identifier
- Hardware revision and regional SKU
- Android build number and full build fingerprint
- Current firmware version and security patch level
- Whether the phone boots normally, enters recovery, or is detected by ADB

If the phone boots and USB debugging is already authorized, use the read-only commands from Lesson 1:

```bash
adb devices
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.build.version.release
adb shell getprop ro.board.platform
```

Property names and availability vary. An empty property is not proof that a device is not Unisoc. Confirm the platform using reliable manufacturer documentation or a verified service record.

## 2. Understand the Unisoc ecosystem

Unisoc (formerly Spreadtrum) is a mobile chipset/platform family used in devices from multiple manufacturers. A chipset family match is not enough to select firmware. Different products can use different boards, displays, storage layouts, radio configurations, partition maps and signed packages.

Do not infer a device's exact platform from its appearance, retail name alone, or a third-party app's single chipset label.

## 3. What is a PAC package?

A PAC file is a firmware container used in some Unisoc service workflows. Depending on the device and package, it can contain:

- Target platform and product metadata
- Partition/image records
- Download configuration and options
- Firmware components and version information

A PAC file is not interchangeable across every Unisoc phone. The same chipset does not guarantee compatible partition layout or signed images.

Before a package is considered for use, verify:

1. It comes from the manufacturer or an authorized service source.
2. Its target model, board and regional variant match the handset.
3. Its version is appropriate for the installed build and rollback policy.
4. Its integrity can be checked using the source's published hash/signature process.
5. The service procedure is approved for that exact model.

If any of these cannot be established, stop and obtain an authorized package.

## 4. Research Download and Upgrade Download

Research Download and Upgrade Download are names associated with Unisoc service utilities. Availability, supported devices, required authorization and supported package formats vary by OEM and service channel.

Treat these as model-specific service tools, not universal phone repair applications. Obtain installers and instructions only from the device manufacturer or an authorized repair channel. Do not use random repacks, modified loaders, unknown download agents or packages from file-sharing sites.

This lesson deliberately does not provide instructions to force a device into a low-level download mode, erase partitions, bypass authorization, or write firmware.

## 5. Safe preparation checklist

- [ ] Owner authorization and data-loss consent recorded
- [ ] Exact model and board identity confirmed
- [ ] Device condition and current build recorded
- [ ] User data backed up where possible
- [ ] Battery and USB connection are stable
- [ ] Correct OEM service tool and driver source confirmed
- [ ] Firmware package target and integrity verified
- [ ] Service procedure and recovery path documented
- [ ] No account, financing, MDM or ownership lock bypass is involved

## 6. Stop conditions

Stop and refer the device to an authorized service provider if:

- Model, board or hardware revision is uncertain.
- The PAC package source or target cannot be verified.
- The utility requests an unknown loader or authorization file.
- The phone is subject to a financing, enterprise-management or ownership restriction.
- The device contains important data with no backup and the proposed action may erase it.
- The tool reports an unexpected platform, partition map or security error.

## 7. Technician worksheet

| Field | Record |
|---|---|
| Manufacturer / model | |
| Board / platform | |
| Hardware revision / region | |
| Build fingerprint | |
| Current symptom | |
| Package source | |
| PAC target identity | |
| Integrity verification | |
| Authorized service procedure | |
| Backup / consent status | |
| Decision | Proceed only if all checks pass |

## Knowledge check

1. Why is a matching chipset not sufficient to prove firmware compatibility?
2. What information can a PAC container hold?
3. Why should Research Download / Upgrade Download be obtained only from an authorized source?
4. Name three conditions that require you to stop before restoration.

**Practical exercise:** choose a Unisoc phone you own or have permission to inspect. Complete the identity worksheet using visible Settings information and read-only ADB properties where available. Do not download or write firmware during this exercise.
