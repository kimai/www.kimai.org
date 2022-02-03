---
title: Kiosk plugin for Kimai with Barcode and RFID support
name: Kiosk plugin
intro: "Start and stop timesheets with a barcode or RFID scanner for attendance time-tracking"
slug: kiosk-barcode-bundle
developer: kevinpapst
date: "2020-03-06 16:00:00 +0200"
icon: fas fa-barcode
demo: true 
price: "199€"
gumroad: kimai2-kiosk
featured: "Attendance time-tracking in an environment, where the user has no access to Kimai (eg. in a warehouse) by using a barcode or RFID scanner to start and stop timesheets." 
new: false
type: featured
tags:
  - plugin
bundle:
  name: "KioskBundle"
  command: "kimai:bundle:kiosk:install"
  purchase: true
  assets: true
  versions:
    - ["1.8", "1.15"]
    - ["1.7", "1.14"]
    - ["1.5 - 1.6", "1.11"]
    - ["1.4", "1.10"]
    - ["1.0 - 1.3", "1.8"]
screenshots:
  - 
    src: "/images/marketplace/kiosk-listing.png"
    title: "User listing"
    description: "Displays the list of all users with their configured login code types"
  - 
    src: "/images/marketplace/kiosk-preferences.png"
    title: "Configuration"
    description: "Configure your Kiosk plugin to your needs, login mode and code format depend on each other"
  - 
    src: "/images/marketplace/kiosk-user-profile.png"
    title: "User codes"
    description: "This new barcode can now be printed and handed out to the user"
  - 
    src: "/images/marketplace/kiosk-scanner.png"
    title: "USB scanner"
    description: "The 'Barcode with USB scanner' login mode show a screen like this, the input field is pre-selected and the scanner will submit it after finding a code"
  - 
    src: "/images/marketplace/kiosk-scanner-users.png"
    title: "Login screen"
    description: "The login screen with the optional user list being activated"
  - 
    src: "/images/marketplace/kiosk-webcam.png"
    title: "Webcam scanner"
    description: "The 'Barcode with device cam' login mode will show the camera video and scan constantly for barcodes"
  - 
    src: "/images/marketplace/kiosk-login.png"
    title: "Login"
    description: "Scanning an existing code for a user starts a new timesheet"
  - 
    src: "/images/marketplace/kiosk-logout.png"
    title: "Logout"
    description: "Or when a timesheet is already running it will be stopped"
---

A Kimai plugin, which allows using barcodes for `punch-in` and `punch-out` time tracking with Kimai.
You can use it with an attached barcode scanner, or you run Kimai on a device (eg. tablet) with a built-in camera.   

It also supports a "freestyle" mode, which allows to enter any free configurable code (up to 120 characters), 
so you can also use other devices for starting/stopping:
- an electronic USB numpad (like door-locks)
- an RFID scanner that acts as keyboard 

If you want to use Kimai in a kiosk mode, where your users should only register their attendance time through  
punch-in and punch-out mode when entering/leaving the building, then this bundle is the solution for you.

It could be as simple as:
- Print the barcodes on your employee cards 
- Mount a tablet to the wall in your entrance room
- Let your users check-in & check-out when entering the building by scanning the barcode of their employee card

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

- Start/Stop work with barcode scanner (eg. via USB), RFIS scanner (via USB) or a device camera (to scan barcode) 
- Upon starting/stopping a record via this plugin, the user will see a short overview screen with the entries of the current week (including some statistics)
- New user profile screen for the "codes"
  - Display all codes for user
  - Generate a random code (automatically done if none is existing yet for the active code-type)
  - Re-use existing code for user by entering (or scanning) it manually
- User specific settings to configured allowed start and end working time (user can only clock in between these times)
- Supports the following 1D barcodes:
  - `Code 128`
  - `Code 39`
  - `UPC-A` (scanner needs to transmit check digit)
  - `Code 2 of 5`
  - `Code 2 of 5 interleaved`
  - `Codabar` (scanner needs to transmit start & stop digits)
- Optional: show active / inactive users in login screen
- Many CSS classes to customize the look with [Custom CSS Bundle]({% link _store/keleo-css-custom-bundle.md %})

You need to configure **a non-global activity** for starting the record via this plugin. 
This will be used for every recorded timesheet that is created using the kiosk mode.

### Hardware

This is NOT a hardware recommendation, but more an idea for possible use-cases.

I tried the linked products and even though all scanner are rather cheap, they work without problems.

- [Raspberry PI](https://amzn.to/2Ye8LeK) setup with [touch screen](https://amzn.to/321jg6k) (eg. for wall mount)
- [RFID scanner](https://amzn.to/3aM5yby) by Neuftech (desktop version)
- [RFID scanner](https://amzn.to/3hfwDpK) by KKMoon (desktop version)
- [Barcode scanner](https://amzn.to/3g6HzEU) which can also scan codes from mobile phones (desktop version)
- [Barcode scanner](https://amzn.to/2Q9KWAy) classic hand-held version

The above are affiliate links for Amazon (germany) where I bought them myself. 

## Configuration


You have to configure the bundle before you can use it - you reach the configuration via 
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

### Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name          | Description                                                                                        |
|--------------------------|----------------------------------------------------------------------------------------------------|
| `barcode_own_profile`    | allows to see and administrate barcode for the own user profile                                    |
| `barcode_other_profile`  | allows to see and administrate barcode for all user profiles                                       |
| `kiosk_own_profile`      | allows to configure user specific kiosk settings (eg. start and end time) for the own user profile |
| `kiosk_other_profile`    | allows to configure user specific kiosk settings (eg. start and end time) for all user profiles    |
{: .table }

By default, these are granted to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
