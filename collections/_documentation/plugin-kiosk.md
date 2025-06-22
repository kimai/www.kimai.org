---
title: Kiosk mode
description: Kiosk mode with support for Barcode, RFID, Web NFC
---
 
{% include plugins/kiosk.md %}  

## Configuration

You have to **configure the bundle before you can use it**. 
You reach the configuration via `System` > `Settings` > `Kiosk mode`.

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

### Free Input (e.g. keyboard)

A free text input field where a user can manually enter a code, like a personal code. 

Also used in combination with Web NFC or similar tokens.

### Web NFC

Uses the Web NFC Browser API, which as of writing these docs does not work in all browsers.

Modern mobile devices with up-to-date Chrome based browsers support it.
Also some Kiosk browsers have support, that needs to be enabled.

### Barcode via USB scanner

A text input field, which will submit the scanned barcode. 

### Barcode via device camera

Opens a camera screen on the website and then a javascript tool tries to find a barcode on the scanned area.

Needs the `Code format` to be configured correctly.

This mode has limitations and should ONLY be used for test purposes. Use a dedicated barcode scanner for production usage. 

## Permissions

{% include documentation/permissions.md id="kiosk" howto=true super_admin=true %}
