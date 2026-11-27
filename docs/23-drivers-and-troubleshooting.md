# Lesson 23 — USB Drivers and Troubleshooting

## Start with the simple checks

1. Use a known data-capable cable, not a charge-only cable.
2. Connect directly to the PC, not through an unreliable hub.
3. Try another USB port.
4. Unlock the phone and select the appropriate USB mode if Android is running.
5. Confirm the phone asks to authorize USB debugging before using ADB.
6. Check Windows Device Manager for warning icons.
7. Install only the OEM driver from a trusted source.

## ADB connection states

| Output | Meaning | Safe next step |
|---|---|---|
| Device listed as `device` | ADB authorized | Run read-only inspection |
| `unauthorized` | Phone has not approved this PC | Unlock phone and approve the RSA prompt |
| `offline` | ADB transport is not ready | Reconnect, restart ADB server, check cable |
| No devices | PC cannot see an ADB endpoint | Check USB mode, driver, cable and debugging |
| Multiple devices | More than one target | Disconnect extras and identify the correct device |

ADB server restart commands:

```bash
adb kill-server
adb start-server
adb devices -l
```

## Fastboot connection issues

- Confirm the device is actually in its supported Fastboot mode.
- Check the USB cable and port.
- Check Device Manager for the correct OEM interface/driver.
- Use `fastboot devices` to test detection.
- Do not install random driver packs or force an unrelated driver.

## Common service symptoms

| Symptom | Initial diagnosis |
|---|---|
| Stuck at logo | Record exact model/build; check update history and recovery status |
| Boot loop after update | Check official recovery/update options; preserve data where possible |
| No ADB detection | Cable, USB mode, authorization, driver |
| Fastboot not detected | Mode support, driver, cable, USB port |
| Firmware package rejected | Wrong model/region/build, corrupt package, unsupported version or authorization |
| Restore stops midway | Record exact error; check cable, port, PC stability and official tool logs |
| No network after service | Stop repeated flashing; verify correct regional firmware and seek OEM support |

## Evidence collection

Record:
- Exact model and build
- Tool name and version
- Driver version/source
- Exact error code and full error text
- Step immediately before the failure
- Whether data was backed up
- Changes already attempted

Redact IMEI, serial, phone number, email, account names, tokens and private logs before sharing.

## Stop and escalate

Stop if the phone heats abnormally, battery is swollen, liquid damage is suspected, firmware identity is uncertain, a tool requests an unknown loader, or a protection/ownership lock appears. Software flashing cannot repair damaged hardware and can make the situation worse.
