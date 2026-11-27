# iPhone Servicing — Windows, Recovery, DFU and IPSW

iPhones do not use Android ADB or Fastboot. The supported general-purpose Windows workflow uses Apple's device software and Apple's signed restore process.

## 1. Install Apple Devices

Official guide: https://support.apple.com/guide/devices-windows/welcome/windows

Install Apple Devices from Microsoft Store or follow Apple's current Windows instructions. Connect the iPhone with a reliable data cable, unlock it where possible, and trust the computer when prompted.

## 2. Backup before service

Use Apple Devices or Apple's supported backup workflow. Confirm the backup completes. Encrypted backups preserve more sensitive categories of data, but the backup password must be kept safe.

Do not copy customer backups, Apple Account credentials or recovery keys into a public repository.

## 3. Update versus restore

- **Update:** attempts to install a newer compatible iOS version while preserving user data.
- **Restore:** erases the iPhone and reinstalls iOS using Apple's supported restore workflow.

A restore is destructive. Confirm owner authorization and backup status first.

## 4. Recovery mode

Recovery mode is used when the iPhone needs to be updated or restored through a computer. Button sequences vary by iPhone generation.

Official Apple instructions:
https://support.apple.com/118106

Connect the iPhone to Windows, open Apple Devices, enter recovery mode using the Apple instructions for that model, then follow the on-screen Update or Restore choices.

Try Update first when appropriate and when preserving data is the priority. Restore erases the device.

## 5. DFU mode

DFU (Device Firmware Update) is a lower-level device state used in certain recovery situations. Entry sequences vary by model. Use Apple's model-specific guidance or an authorized service procedure. Do not repeatedly attempt button sequences without identifying the exact iPhone model.

DFU is not an Activation Lock bypass and does not remove ownership protections.

## 6. IPSW firmware

IPSW is Apple's iPhone/iPad software restore package format. Apple's restore process verifies and installs firmware that Apple currently signs for the device. A downloaded IPSW cannot be assumed installable simply because it matches the product family.

Do not use modified firmware or unofficial tools claiming to remove Activation Lock, passcodes, MDM or account protections.

## 7. After restore

- Confirm iOS setup starts.
- Let the owner complete Apple Account and Activation Lock verification.
- Test charging, buttons, cameras, speakers, microphone, Wi-Fi and cellular service.
- Record any restore error code for diagnosis.

## Official references
- Apple Devices for Windows: https://support.apple.com/guide/devices-windows/welcome/windows
- If you can't update or restore your iPhone: https://support.apple.com/118107
- Recovery mode: https://support.apple.com/118106
