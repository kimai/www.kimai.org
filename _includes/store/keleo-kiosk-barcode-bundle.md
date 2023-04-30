A Kimai plugin, which allows using barcodes for `punch-in` and `punch-out` time tracking with Kimai.
You can use it with an attached barcode scanner, or you run Kimai on a device (e.g. tablet) with a built-in camera.   

It also supports a "freestyle" mode, which allows to enter any free configurable code (up to 120 characters), 
so you can also use other devices for starting/stopping:
- an electronic USB number-pad
- an RFID scanner that acts as keyboard 

If you want to use Kimai in a kiosk mode, where your users should only register their attendance time through  
punch-in and punch-out mode when entering/leaving the building, then this bundle is the solution for you.

It could be as simple as:
- Print the barcodes on your employee cards 
- Mount a tablet to the wall in your entrance room
- Let your users check-in & check-out when entering the building by scanning the barcode of their employee card

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

- Start/Stop work with 
  - barcode scanner (via device camera, only works via HTTPS)
  - barcode scanner (via USB or Bluetooth)
  - RFID scanner (via USB or Bluetooth) 
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
