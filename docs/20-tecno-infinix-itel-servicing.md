# Lesson 20 — TECNO, Infinix and itel Servicing

## One service network, different phone variants

TECNO, Infinix and itel devices are commonly supported through Carlcare in many markets. Official support portal: https://www.carlcare.com/

The three brands do not share one universal firmware image or flashing procedure. Individual models may use MediaTek, Unisoc or other platforms, and the same retail family can have multiple hardware variants.

## First identify the phone

Record:
- Complete model code and product/codename
- Board/platform and hardware revision where documented
- Region and carrier variant
- Android build fingerprint and security patch
- Storage/RAM variant if relevant
- Symptom and boot condition

Read-only ADB inspection:

```bash
adb devices -l
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.product.device
adb shell getprop ro.build.fingerprint
adb shell getprop ro.board.platform
```

## Choose the service path

- Confirm warranty and service eligibility with Carlcare.
- Ask for the manufacturer-approved firmware recovery route for the exact model.
- If the handset is MediaTek-based, review Lesson 13 before proceeding.
- If it is Unisoc-based, review Lesson 14.
- Do not choose SP Flash Tool, Research Download or another utility based only on brand name.

## Safe restoration checklist

1. Confirm owner permission and backup.
2. Verify exact model, board and region.
3. Obtain firmware and tool from Carlcare/OEM-authorized source.
4. Confirm package compatibility and integrity.
5. Confirm whether authorization or a service account is required.
6. Record data-loss implications and recovery plan.
7. Follow the approved model-specific service instructions.
8. Run full post-repair tests.

## M-KOPA supplied devices

If the handset was supplied through M-KOPA, also follow Lesson 15. Financing, payment and device-management restrictions must be resolved through M-KOPA's authorized support route. Do not attempt to remove those controls by firmware modification.

## Practice

For an authorized itel A60s inspection, record the reported model code and verify it against the physical label and Settings. Do not assume the same firmware applies to every A60s variant.
