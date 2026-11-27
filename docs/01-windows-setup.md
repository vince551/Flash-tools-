# Windows Workstation Setup

## A. Install Android Platform-Tools

1. Open the official page: https://developer.android.com/tools/releases/platform-tools
2. Download **SDK Platform-Tools for Windows**.
3. Extract the ZIP archive to a stable folder, for example:
   `C:\Android\platform-tools`
4. Open that folder in File Explorer.
5. Click the address bar, type `cmd`, and press Enter.

Check ADB and Fastboot:

```bat
adb version
fastboot --version
```

If Windows says the command is not recognized, confirm CMD is open in the extracted Platform-Tools folder. Do not download random ADB bundles from unofficial sites.

## B. Connect an Android phone

1. Use a known-good USB data cable.
2. Unlock the phone.
3. Enable Developer options (usually tap Build number seven times; menus vary by brand).
4. Enable USB debugging.
5. Connect the phone.
6. Approve the USB debugging RSA prompt only on your own trusted computer.
7. Run:

```bat
adb devices
```

Expected state: a serial number followed by `device`.

Common states:
- `device`: authorized and connected.
- `unauthorized`: unlock the phone and approve the prompt.
- No device listed: check cable, USB port, USB mode, driver and Device Manager.

Windows may require an OEM USB driver. Use the phone manufacturer's official support page. Google's driver instructions: https://developer.android.com/studio/run/win-usb

## C. Install Apple Devices

For iPhone work on Windows, install **Apple Devices** from the Microsoft Store or use Apple's official guidance:
https://support.apple.com/guide/devices-windows/welcome/windows

Use Apple Devices for supported backup, update and restore workflows. Keep Windows and Apple Devices updated.

## D. Useful Windows commands

```bat
cd /d C:\Android\platform-tools
adb version
fastboot --version
where adb
where fastboot
```

## E. Folder layout for technician records

Keep private customer information out of public GitHub repositories.

```text
Flash-Tools-Work/
  device-reports/
  firmware-checks/
  restore-logs/
  driver-notes/
```

Never upload customer backups, personal photos, serial numbers, IMEI values, passcodes, Apple IDs, Google account details or authentication tokens to this repository.
