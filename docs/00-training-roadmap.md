# Training Roadmap

This course focuses on practical phone software servicing through commands and official desktop tools.

## Phase 1 — Workstation and device connection
- Install Android SDK Platform-Tools on Windows.
- Understand CMD/PowerShell, drivers, USB modes and cable quality.
- Enable USB debugging only on a device you own or are authorized to service.
- Approve the computer's RSA fingerprint on the phone.
- Use `adb devices` to confirm the connection.

## Phase 2 — Read-only Android inspection
- Manufacturer, model, product name and build fingerprint.
- Android release, SDK level, ABI and board platform.
- Build properties, boot state and available partition metadata.
- Save an inspection report before any repair.

## Phase 3 — Android resets and recovery
- Distinguish Settings reset, recovery reset, ADB reboot-to-recovery and full firmware restoration.
- Use the Recovery Assistant to request a reboot without wiping data.
- Understand what data is erased.
- Learn when a reset cannot repair corrupted system firmware.
- Respect Factory Reset Protection and account verification.

## Phase 4 — Android firmware and chipset families
- Verify exact model, codename, region, hardware revision and build fingerprint.
- Identify chipset family without assuming chipset alone proves firmware compatibility.
- Verify official package metadata, signature/checksum and anti-rollback requirements.
- Identify package types: Samsung multi-file firmware, MediaTek scatter packages, Unisoc PAC packages and Qualcomm factory/service packages.
- Study MediaTek scatter metadata and package verification without writing partitions.
- Identify Unisoc / Spreadtrum devices and understand PAC package metadata and authorized Research Download / Upgrade Download service paths.
- Complete Lesson 28: Unisoc PAC fundamentals, read-only ADB checks and package hash auditing.
- Identify M-KOPA-supplied handsets by their actual OEM/model/chipset and follow authorized servicing routes; do not bypass financing or device-management controls.
- Learn official/vendor-supported restoration paths.
- Understand bootloader state, AVB, dynamic partitions, A/B slots and anti-rollback constraints.
- Perform flashing only on a known-compatible device with verified firmware and a recovery plan.

## Phase 5 — Manufacturer-specific servicing
- Samsung Galaxy: Smart Switch and authorized Download Mode service workflow.
- Xiaomi / Redmi / POCO: model codename, region, Recovery ROM versus Fastboot ROM, and official support checks.
- TECNO / Infinix / itel: Carlcare support and exact MediaTek/Unisoc model identification.
- Google Pixel: Android Flash Tool and factory-image workflow with wipe/bootloader warnings.
- Motorola / Lenovo: official Rescue and Smart Assistant support check.
- M-KOPA-supplied devices: actual OEM/chipset identification and authorized support route.

## Phase 6 — iPhone servicing
- Install Apple Devices for Windows.
- Back up using supported Apple workflows.
- Update versus restore.
- Recovery mode and DFU mode: purpose and differences.
- IPSW files, signing and restore eligibility.
- Read restore errors and perform supported troubleshooting.

## Phase 7 — Technician workflow
For every service job:
1. Confirm ownership/authorization.
2. Record exact model and current condition.
3. Ask about backup and data-loss consent.
4. Inspect without changing data.
5. Select the official procedure for that exact model.
6. Verify firmware/package integrity and compatibility.
7. Explain expected data loss and risk.
8. Perform the operation.
9. Verify boot, network, cameras, charging, sensors and account setup.
10. Record outcome and any error codes.

## Phase 8 — Tools, commands and service records
- Complete the itel A60s (A662LM) case study and compare the owner-reported device profile with read-only ADB output before any restoration.
- Use the official tool download directory and verify publisher/source.
- Practice read-only ADB/Fastboot commands before any service action.
- Check USB drivers and troubleshoot connection states.
- Audit firmware package hashes and archive contents before use.
- Complete a service job record and post-repair verification checklist.
- Test Windows utilities on a Windows PC; phone-only GitHub editing does not execute Windows scripts.

## Practical rule
Do not use a command simply because it exists. Know its target, effect, prerequisites and rollback plan first.
