# Safety, Data Protection and Troubleshooting

## Non-negotiable safety rules

- Work only on devices you own or are explicitly authorized to service.
- Confirm the customer understands whether data will be erased.
- Back up before resets or firmware restoration.
- Never ask a customer to disclose their Apple Account or Google password.
- Do not bypass FRP, Activation Lock, passcodes, MDM or other anti-theft controls.
- Do not alter IMEI, serial numbers or device identity.
- Do not flash a package for a merely similar model.
- Never interrupt a firmware write unless the tool/vendor procedure says it is safe.
- Keep batteries charged and use a reliable cable/USB port.
- Keep customer data and service records private.

## Android connection troubleshooting

| Symptom | Checks |
|---|---|
| `adb` not recognized | Open CMD in Platform-Tools folder or configure PATH |
| Empty `adb devices` list | Cable supports data, USB port, USB debugging, OEM driver |
| `unauthorized` | Unlock phone and approve the RSA prompt |
| `offline` | Reconnect cable, restart ADB server, re-authorize if needed |
| Fastboot not detected | Confirm device supports Fastboot, install correct driver, inspect Device Manager |
| Permission denied reading a path | Android security restrictions may block access; do not root just to run a lesson command |

ADB server restart:

```bat
adb kill-server
adb start-server
adb devices
```

## iPhone restore troubleshooting

- Update Apple Devices and Windows.
- Use a known-good cable and direct USB port.
- Restart the computer and iPhone.
- Check available disk space and network connectivity.
- Record the exact Apple restore error code.
- Follow Apple's current troubleshooting instructions:
  https://support.apple.com/118107

## Service record template

Keep completed records private and do not publish personal identifiers.

```text
Job reference:
Date:
Owner authorization confirmed: Yes/No
Manufacturer:
Exact model / variant:
Reported fault:
Backup confirmed:
Tool and version:
Firmware/build:
Operation performed:
Data-loss consent:
Result:
Error code:
Post-service tests:
Technician notes:
```
