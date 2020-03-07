---
title: Kiosk & barcode plugin for Kimai 2
name: Kiosk plugin
intro: "Start and stop timesheets with a barcode scanner for attendance time-tracking"
developer: keleo
date: "2020-03-06 16:00:00 +0200"
icon: fas fa-barcode
demo: true 
price: "199€"
screenshot: 
  - /images/marketplace/kiosk-plugins.png
  - /images/marketplace/kiosk-preferences.png
  - /images/marketplace/kiosk-user-listing.png
  - /images/marketplace/kiosk-user-profile.png
  - /images/marketplace/kiosk-scanner.png
  - /images/marketplace/kiosk-webcam.png
  - /images/marketplace/kiosk-login.png
  - /images/marketplace/kiosk-logout.png
gumroad: kimai2-kiosk
featured: "Attendance time-tracking in an environment, where the user has no access to Kimai (eg. in a warehouse) by using a barcode scanner to start and stop timesheets." 
new: true
toc: true
tags:
  - plugin
---

A Kimai 2 plugin, which allows to use barcodes for `punch-in` and `punch-out` time tracking with Kimai.
You can use it with an attached barcode scanner or you run Kimai on a device (eg. tablet) with a built-in camera.   

If you want to use Kimai in a kiosk mode, where your users should only register their attendance time through  
punch-in and punch-out mode when entering/leaving the building, then this bundle is the solution for you.

It could be as simple as:
- Print the barcodes on your employee cards 
- Mount a tablet to the wall in your entrance room
- Let your users check-in & check-out when entering the building by scanning the barcode from the emplyoee card

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

- Start/Stop work with device camera or a hardware barcode scanner (eg. via USB)
- Upon starting/stopping a record via this plugin, the user will see a short overview screen with the entries of the current week, including some statistics
- The following 1D barcodes are currently supported:
  - `Code 128`
  - `Code 39`
  - `UPC-A` (scanner needs to transmit check digit)
  - `Code 2 of 5`
  - `Code 2 of 5 interleaved`
  - `Codabar` (scanner needs to transmit start & stop digits)
- New user profile screen for the "barcode"
  - Display current barcode (randomly generated if empty)
  - Regenerate random barcode
  - Re-use existing barcode for user

You need to configure a non-global activity for starting the record via this plugin. 
This will be used for every recorded timesheet that is created using the kiosk mode.

## Purchase

{% include store-gumroad-and-support.html %}

### Compatibility

This plugin is compatible with the following Kimai releases:

| Bundle version    | Kimai 2 version           |
| ---               |---                        |
| 1.0, 1.1          | 1.8                       |
{: .table }

## Installation

{% include store-plugin-installation.md plugin="KioskBundle" %}

### Install the bundle database and assets

Run the following command:

```bash
bin/console kimai:bundle:kiosk:install
bin/console assets:install
```

This will install all required databases and javascript libraries.

## Configure the plugin

You have to configure the bundle before you can use it via the `Plugin` screen. 
Click the actions dropdown and select `Preferences` (see screenshot).

The following configurations are available:

- `Login mode` - whether to use camera or usb mode
- `Barcode format` - you have to decide which code format you want to use
- `Barcode includes readable code` - whether the barcode in the user profile will include the human readable code
- `Duration to display confirmation dialog (in seconds)` - how long the start/stop screens will be shown after a successful scan
- `Activity` - the non-global activity that will be used to track the times 

## Permissions

This bundle ships a new permission, which limit access to certain functions:

- `barcode_own_profile` - allows to see and administrate barcode for the own user profile
- `barcode_other_profile` - allows to see and administrate barcode for all user profiles

By default, it is assigned to each user with the role `ROLE_SUPER_ADMIN`.

**Please adjust all permission settings in your administration.** 

## Updating the plugin

Updating the bundle works the same way as the installation does. 

- Delete the directory `var/plugins/KioskBundle/` (to remove deleted files)
- Execute all installation steps again:
  - Copy files
  - Clear cache
  - Update database with `bin/console kimai:bundle:kiosk:install` 
  - Update assets with `bin/console assets:install` 

## Screenshots

When logged in as `SUPER_ADMIN`, change to the `Plugins` menu: 

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-plugins.png)

Open the plugins preferences, which you need to save once before you can use the plugin:

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-preferences.png)

After updating the settings, change to the user menu. You will see a new entry in the action menu for every user:

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-user-listing.png)

Choose `Barcode` to open the users barcode:  

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-user-profile.png)

This new barcode can now be printed and handed out to the user.

The `Barcode with USB scanner` login mode show a screen like this, the input field is pre-selected and the scanner will submit it after finding a code:

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-scanner.png)

The `Barcode with device cam` login mode will show the camera video and scan constantly for barcodes:

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-webcam.png)

When scanning an existing barcode and the user does not have a running record a new one will be started:

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-login.png)

Or when a record is running, it will be stopped:

![Screenshot](https://www.kimai.org/images/marketplace/kiosk-logout.png)
