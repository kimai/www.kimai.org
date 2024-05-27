---
title: Kiosk mode
description: Kiosk mode with support for Barcode, RFID, Web NFC
---
 
{% include plugins/kiosk.md %}  

## Configuration

You have to **configure the bundle before you can use it** - you reach the configuration via:
- the `Plugin` screen (`Preferences` in action dropdown behind the plugin)
- the Kiosk administration (cogs icon in the upper right)
- the System configuration (`Kiosk & Barcode` section)

The following configurations are available:

| Configuration                                          | Description                                                                  |
|--------------------------------------------------------|------------------------------------------------------------------------------|
| `Login mode`                                           | whether to use camera or usb mode                                            |
| `Code format`                                          | you have to decide which code format you want to use                         |
| `Barcode includes readable code`                       | whether the barcode in the user profile will include the human readable code |
| `Duration to display confirmation dialog (in seconds)` | how long the start/stop screens will be shown after a successful scan        |
| `Activity`                                             | the non-global activity that will be used to track the times                 |
{: .table }

## Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name         | Description                                                                                  |
|-------------------------|----------------------------------------------------------------------------------------------|
| `kiosk_admin`           | whether the current user can see the Kiosk administration and assign codes                   |
| `kiosk_own_profile`     | configure codes and user specific kiosk settings (eg. start and end time) for own account    |
| `kiosk_other_profile`   | configure codes and user specific kiosk settings (eg. start and end time) for other accounts |
{: .table }

By default, these are granted to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
