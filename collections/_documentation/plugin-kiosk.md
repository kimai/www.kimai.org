---
title: Kiosk mode
description: Kiosk mode with support for Barcode, RFID, Web NFC
---

{% include plugins/kiosk.md %}  

## Configuration

You have to **configure the bundle before you can use it**. 
You reach the configuration via `System` → `Settings` → `Kiosk mode`.

The following configurations are available:

| Configuration                                  | Description                                                                                        |
|------------------------------------------------|----------------------------------------------------------------------------------------------------|
| `Login mode`                                   | Which login mode should be used                                                                    |
| `Allow Camera-switch`                          | Requires browser-access approval in the used device                                                |
| `Hide entered/scanned code `                   | The browsers password manager needs to be disabled                                                 |
| `Placeholder for input field`                  | Some text, which will be displayed in the login input field (e.g. for assisting your users)        |
| `Code format`                                  | Use `Freestyle` for everything except barcodes, for which you need to select the used barcode type |
| `Barcode includes readable code`               | Whether the barcode in the user profile will include the human readable code                       |
| `Activity`                                     | The non-global activity that will be used to track the times                                       |
| `Hide logo on confirmation page`               | Do not display the logo (Kimai/Your Company) on the login screens                                  |
| `Show "not logged in" users on login screen`   | Show all active users that do not have a running timesheet (hides System-Accounts)                 |
| `Show "logged in" users on login screen`       | Show all active users that have a running timesheet (hides System-Accounts)                        |
| `Save client IP for new timesheets`            | Stores the Client IP in a custom-field if activated                                                |
| `Duration of confirmation dialog`              | How long the start/stop screens will be shown after a successful scan (in seconds)                 |
| `Play a short sound for logins and logouts`    | On successful login and logout a short sound will be played                                        |
| `Prevent page reload in login process`         | If enabled, the reload of the submitted login page will be prevented                               |
| `Stop only kiosk activities when clocking out` | If enabled, all "non-kiosk activities" will not be stopped for the user when clocking out          |
{: .table }

## Login modes

- `Barcode via device camera`: 

### Keyboard input

A free "text" input field with no further interactive logic. 
The idea is to add a keyboard or num-pad and the users enters his code and then submits the form (via enter). 

Could be used in combination with any external reader that acts as "virtual keyboard" and is able to submit the code including the code for ENTER.

### External scanner

Uses the Web NFC Browser API (check if your browser supports it).

Modern mobile devices with up-to-date Chrome based browsers support Web NFC.
Also some Kiosk browsers have support, that needs to be enabled (see below).

### Barcode via USB scanner

Receives codes from an attached USB barcode reader.

A simple "text" input field, which relies in the scanner to send the code including ENTER. 

### Barcode via device camera

Tries to read the barcode via an attached camera and javascript. 
Needs the `Code format` to be configured correctly.

**THIS MODE IS DEPRECATED AND SHOULD NOT BE USED ANY LONGER.**

It has severe limitations and should ONLY be used for test purposes. Use a dedicated barcode scanner for production usage.

### FAQ

### NFC Scanning Differences

There are important differences between how NFC is handled in different environments:

- **Chrome/Web browsers with JavaScript NFC**: Scans and returns the NFC chip ID
- **Kiosk Browser**: Scans and returns the chip's stored value (the actual data written to the chip)

This difference is crucial when setting up your NFC tokens, as you need to ensure the stored value matches what your Kimai configuration expects.

## Kiosk apps for Android

Many Kiosk apps exists and we did not test all of them. 
Most important requirement is support for Web NFC, in case you use NFC tokens.

Those apps all work the same way: they restrict access to a configured URL, in our case to the "Kimai Kiosk Login page".

Usually you set-up a password to access the app settings and to exit the app and get back to your Tablet, e.g. for accessing the system settings. 

### Fully Kiosk Browser

Type: Paid  
Download: [Google Play](https://play.google.com/store/apps/details?id=de.ozerov.fully) 

**Required setup steps**

This app does not submit the scanned code automatically, but you can easily fix it by adding a bit of 
Javascript code (only available in paid "Plus" version).

**Inject Javascript**

```javascript 
setTimeout(function() {
    if (window.location.pathname.indexOf('/auth/kiosk/code') === -1) {
        return;
    }
    
    const field = document.getElementById('barcode_login_form_code');
    if (!field) {
        return;
    }
    
    let timer = null;
    
    field.addEventListener('input', function() {
        // stop running timer
        if (timer) {
            clearTimeout(timer);
        }
        
        // start a new timer, submit 800ms after the last char was typed
        timer = setTimeout(function() {
            if (field.value.length > 0) {
                var btn = document.querySelector('button[type="submit"]');
                if (btn) { btn.click(); }
            }
        }, 800);
    });
}, 1000);
```

### ALLNET Fullscreen Browser

Type: Free  
Download: [Google Play](https://play.google.com/store/apps/details?id=de.allnet.allnetfullscreenbrowser)

### Kiosk Browser 

Type: Paid  
This app also calls itself "Android Kiosk" sometimes.  

Download: [www.android-kiosk.com](https://www.android-kiosk.com/)

**Resolving NFC Scan Issues**

If you experience NFC scanning issues with Android-Kiosk, the following solutions can help:

***Screen Stay-On Configuration***

The "Screen on while device plugged in" setting can cause NFC scanning problems. This setting maps to the global `stay_on_while_plugged_in` setting (bitmask):

- `1` = AC power
- `2` = USB power
- `4` = Wireless charging
- Combine values to enable multiple power sources (e.g., `7` = AC+USB+Wireless)

**Check current setting:**
```bash
adb shell settings get global stay_on_while_plugged_in
```
- If it prints nothing or `0`, the feature is off
- Otherwise you'll see a number like `1`, `2`, `3`, `4`, or `7`

**Enable for all power sources (recommended):**
```bash
adb shell settings put global stay_on_while_plugged_in 7
```

**Verify the change:**
```bash
adb shell settings get global stay_on_while_plugged_in
```

**Refresh Configuration**

To avoid issues where "scanning NFC works, but not inputting in input field", configure Android-Kiosk to refresh on idle every 30 minutes. 
This helps maintain proper NFC input functionality over extended periods.

## Permissions

{% include documentation/permissions.md id="kiosk" howto=true super_admin=true %}

## Credits

The following libraries are used when using barcodes with the Kiosk mode:

- Barcode scanning: https://github.com/ericblade/quagga2 (Version: 0.0.18, License: MIT)
- Barcode generation: https://github.com/metafloor/bwip-js (Version: 2.0.6, License: MIT)
