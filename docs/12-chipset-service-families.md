# Module 4 — Chipset and Manufacturer Service Families

This module explains how technicians classify Android service workflows. It is a recognition guide, not a universal flashing recipe.

## Why chipset identification is not enough

A chipset family can suggest which service ecosystem a phone may use, but it does not prove that a particular tool, driver, programmer or firmware image is compatible. OEM security, board design, storage layout, bootloader state and package signing all matter.

## Family overview

### MediaTek (MTK)
- Some service packages use scatter-format descriptions.
- Service procedures may involve Download Agent (DA) components and authenticated access.
- Preloader and partition-layout mismatches can cause severe boot failures.
- Never experiment with preloader, NVRAM/NVDATA or raw partition writes.

### Unisoc / Spreadtrum
- Some official or authorized workflows use PAC firmware packages and Research Download / Upgrade Download utilities.
- Exact board identity and package target must match.
- Do not load a PAC file merely because the phone brand or chipset family looks similar.

### Qualcomm
- Some supported devices have an Emergency Download (EDL) service path.
- EDL commonly requires a device-specific programmer and authorized service package.
- A Qualcomm chipset does not mean a phone can be safely or legitimately serviced with a generic QFIL package.

### Samsung
- Samsung service firmware commonly identifies the exact model code and CSC/region.
- Download Mode is a manufacturer-specific service environment, not generic Android Fastboot.
- Binary revision and region compatibility matter; do not cross-flash model variants.

### Google Pixel and other OEMs
- Use the manufacturer's official factory image, OTA or recovery instructions.
- Verify the exact device codename and build.
- Follow the manufacturer's documented bootloader and data-preservation warnings.

## Recognition exercise

For each phone, record:
1. Manufacturer and full model code.
2. Product/device codename.
3. Board platform/chipset property if available.
4. Region/SKU/CSC.
5. Supported service mode confirmed by the manufacturer.
6. Official firmware source.

Do not infer a flash method from the processor name alone.

## Safe training boundary

This course will first teach identification, package verification, backup and recovery planning. Actual flashing lessons will be specific to a confirmed model and official firmware. We will not cover FRP, Activation Lock, passcode, MDM or account-security bypass.
