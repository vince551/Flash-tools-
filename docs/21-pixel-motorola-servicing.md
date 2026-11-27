# Lesson 21 — Google Pixel and Motorola / Lenovo Servicing

## Google Pixel

Official resources:
- Android Flash Tool: https://flash.android.com/
- Factory images and build information: https://developers.google.com/android/images
- Pixel support: https://support.google.com/pixelphone/

Google's Android Flash Tool supports eligible Pixel devices and guides the user through a browser-based workflow. Factory-image installation can erase data; bootloader unlocking changes the device's security posture. Read the current device-specific instructions before proceeding.

Read-only identity:

```bash
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.boot.slot_suffix
fastboot getvar product
fastboot getvar current-slot
```

Safe workflow:
1. Verify the exact Pixel device codename and build.
2. Back up the device.
3. Read the current official instructions and warnings.
4. Confirm the image is for the exact device and intended release.
5. Understand unlock, wipe and anti-rollback implications.
6. Use the official guided process where supported.
7. Verify both boot and core hardware after restoration.

## Motorola / Lenovo

Official Rescue and Smart Assistant information: https://www.motorola.in/rescue-and-smart-assistant/p

Motorola describes Rescue and Smart Assistant as a Windows utility for supported Motorola/Lenovo device diagnosis, software rescue and backup/restore. Confirm device support inside the official utility before use.

Safe workflow:
1. Confirm the exact model and region.
2. Install the utility only from Motorola's official page.
3. Check that the handset is supported.
4. Back up data where possible.
5. Follow the tool's on-screen supported rescue instructions.
6. Verify boot, radio, cameras, sensors and charging.

Do not use a Pixel image on a Motorola device or vice versa. Never use an unofficial rescue package or an account-lock bypass.

## Practice

Compare the model/codename of one authorized Pixel or Motorola phone with the official support page. Record the available supported recovery method without initiating a wipe or restore.
