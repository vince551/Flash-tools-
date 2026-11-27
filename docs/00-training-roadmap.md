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
- Understand what data is erased.
- Learn when a reset cannot repair corrupted system firmware.
- Respect Factory Reset Protection and account verification.

## Phase 4 — Android firmware and chipset families
- Verify exact model, region, hardware revision and build.
- Identify package types: Samsung multi-file firmware, MediaTek scatter packages, Unisoc PAC packages and Qualcomm factory/service packages.
- Learn official/vendor-supported restoration paths.
- Understand bootloader state, AVB, dynamic partitions, A/B slots and anti-rollback constraints.
- Perform flashing only on a known-compatible device with verified firmware and a recovery plan.

## Phase 5 — iPhone servicing
- Install Apple Devices for Windows.
- Back up using supported Apple workflows.
- Update versus restore.
- Recovery mode and DFU mode: purpose and differences.
- IPSW files, signing and restore eligibility.
- Read restore errors and perform supported troubleshooting.

## Phase 6 — Technician workflow
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

## Practical rule
Do not use a command simply because it exists. Know its target, effect, prerequisites and rollback plan first.
