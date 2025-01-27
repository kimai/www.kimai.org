
- Start/Stop work with
    - Barcode scanner (via device camera, only works via HTTPS)
    - Barcode scanner (via USB or Bluetooth)
    - RFID scanner (via USB or Bluetooth)
    - Web NFC ([see docs](https://developer.mozilla.org/en-US/docs/Web/API/NDEFReader))
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
- Many CSS classes to customize the look with [Custom CSS]({% link _documentation/plugin-custom-content.md %})

You need to configure **a non-global activity** for starting the record via this plugin.
This will be used for every recorded timesheet that is created using the kiosk mode.
