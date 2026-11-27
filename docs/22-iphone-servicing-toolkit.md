# Lesson 22 — iPhone Servicing Toolkit

## Supported Windows starting point

Install **Apple Devices** from the Microsoft Store. Apple's guide: https://support.apple.com/guide/devices-windows/welcome/windows

Apple Devices can back up, update and restore supported iPhone/iPad devices. Restore erases information and settings; make a backup first.

## Core workflow

1. Confirm the owner and device authorization.
2. Check the exact iPhone model and current iOS version.
3. Back up using Apple Devices or iCloud, if possible.
4. Connect directly to a reliable USB port with a known-good cable.
5. Open Apple Devices and select the phone.
6. Try Update when the goal is to reinstall/update iOS while preserving data, if Apple offers it.
7. Choose Restore only when the owner has approved erasing the device.
8. Follow Apple's current Recovery Mode instructions if the device is not detected or cannot start normally.
9. Use DFU only when an Apple-supported troubleshooting path specifically calls for it; it is not a routine first step.
10. Complete setup with the owner present and verify normal operation.

## Official references

- Install Apple Devices: https://support.apple.com/en-lamr/guide/devices-windows/mchl5ded2763/windows
- Restore with Apple Devices: https://support.apple.com/en-ae/guide/devices-windows/mchl21d802fe/windows
- Apple restore troubleshooting: https://support.apple.com/118107

## IPSW and signing

An IPSW is an Apple firmware package. An IPSW download alone does not mean Apple will authorize installation. Restore eligibility depends on Apple's signing and the device/model. Use Apple Devices or Apple's current supported restore flow rather than unofficial tools that promise to downgrade or bypass Activation Lock.

## Do not attempt

- Activation Lock or passcode bypass
- MDM or supervision removal without the organization's authorization
- Baseband/IMEI modification
- Unofficial downgrade or unsigned firmware installation
- Data recovery promises that require unknown profiles or suspicious software

## Practical exercise

On a Windows PC, install Apple Devices and inspect its interface without restoring a device. Learn where backup, update and restore options appear. Do not connect or restore another person's phone without permission.
