A Kimai plugin, which allows using barcodes for `punch-in` and `punch-out` time tracking with Kimai.
You can use it with a barcode scanner, with a web-camera, with a RFID reader or an NFC reader.    

It also supports a "freestyle" mode, which allows to enter any free configurable code (up to 120 characters), 
so you can also use other devices for starting/stopping:
- an electronic USB number-pad
- an RFID scanner that acts as keyboard 
- an Android device with [Web NFC support](https://developer.mozilla.org/en-US/docs/Web/API/NDEFReader) (only Chrome browser)

This bundle is the solution for you, if you want to use Kimai in a kiosk mode, where users register their
attendance time through punch-in (coming) and punch-out (leaving) mode.

It could be as simple as:
- Hand out NFC or RFID tokens to your employees 
- Mount a tablet to the wall in your entrance room
- Let your users check-in & check-out when entering the building by scanning their tokens

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

{% include plugins/kiosk.md %}

### Hardware

This is NOT a hardware recommendation, but more an idea for possible use-cases.

I tried the linked products and even though all scanner are rather cheap, they work without problems.

- [Raspberry PI](https://amzn.to/2Ye8LeK) setup with [touch screen](https://amzn.to/321jg6k) (eg. for wall mount)
- [RFID scanner](https://amzn.to/3aM5yby) by Neuftech (desktop version)
- [RFID scanner](https://amzn.to/3hfwDpK) by KKMoon (desktop version)
- [Barcode scanner](https://amzn.to/3g6HzEU) which can also scan codes from mobile phones (desktop version)
- [Barcode scanner](https://amzn.to/2Q9KWAy) classic hand-held version

Above are affiliate links for Amazon (Germany) where I bought them myself. 

## Licenses

The following libraries are used and shipped with this plugin: 

- Barcode scanning: https://github.com/ericblade/quagga2 (Version: 0.0.18, License: MIT)
- Barcode generation: https://github.com/metafloor/bwip-js (Version: 2.0.6, License: MIT)
