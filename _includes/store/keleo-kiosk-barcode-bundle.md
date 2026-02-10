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

You can test it in the ["Plugins" demo]({% link _pages/demo.md %}).

## Features

{% include plugins/kiosk.md %}

## Hardware

The Kiosk does not come specialized hardware. Instead, it follows the Open-Source philosophy and lets you choose what works best for you.

We have tried various ways and all of them work.
Our own use-case could be best solved with a NFC tablet, so this is what we would recommend in most cases.  

### Meeting-Room Tablet

Tablet which can be wall- and VESA mounted, has WLAN and only needs a tiny AC adapter. The NFC reader is on the front, so users can easily scan their tokens.

Can be purchased at [AllNet DE](https://shop.allnet.de/detail/index/sarticle/338037) [AllNet AT](https://shop.allnet.de/displaysdigital-signage/stationaere-displays-mit-android-od.-linux/rockchip-rk3288/323023/allnet-meetingraum-rgb-led-tablet-10-zoll-rk3288-android-10-und-nfc) (this only works if you switch to the AT Shop through the dropdown in the header of the Shop).

### Landi 15.6" Display System

PoE, WiFi, IP55-rated for dust and water resistance, Bluetooth, 4GB/32GB, SD Card, USB-TypeC, USB-A, RS232/RJ22, RJ45, Android 13.0  

Can be purchased at [Etiden](https://www.etiden.com/DE/86305-00-landi.html). 

### Kiosk application

The Android tablets need a Kiosk application, which makes sure that users always see the login screen:

- Kiosk application: [Android Kiosk](https://www.android-kiosk.com/)

### NFC Toke

And you need a bunch of NFC tokens:

- NFC tags: [NFC Tag Shop](https://www.nfc-tag-shop.de/NFC-Anhaenger-ABS-40-x-32-mm-NTAG213-180-Byte-blau/68199) 

### Self-built setups

This is NOT a hardware recommendation, but more an idea for possible use-cases.

I tried the linked products and even though all scanner are rather cheap, they work without problems.

- [Raspberry PI](https://amzn.to/2Ye8LeK) setup with [touch screen](https://amzn.to/321jg6k) (eg. for wall mount)
- [RFID scanner](https://amzn.to/3aM5yby) by Neuftech (desktop version)
- [RFID scanner](https://amzn.to/3hfwDpK) by KKMoon (desktop version)
- [Barcode scanner](https://amzn.to/3g6HzEU) which can also scan codes from mobile phones (desktop version)
- [Barcode scanner](https://amzn.to/2Q9KWAy) classic hand-held version

Above are affiliate links for Amazon (Germany) where I bought them myself. 
