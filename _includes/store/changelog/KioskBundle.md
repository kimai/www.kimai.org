**Version 2.13.0**

Compatibility: requires minimum Kimai 2.30.0

- Use non-deprecated API to fetch timesheets
- Add "#kiosk-auth" to login screen for easier custom CSS rules
- Order users by Alias

**Version 2.12.0**

Compatibility: requires minimum Kimai 2.25.0

- Use translations from Kimai core
- Internal refactoring: PHPStan v2 with strict and deprecation rules
- Rename migration config for compatibility with new plugin installer

**Version 2.11.1**

Compatibility: requires minimum Kimai 2.21.0

- Use MapEntity for routes to fix deprecations

**Version 2.11.0**

Compatibility: requires minimum Kimai 2.21.0

- Removed duplicate "Barcode" link in user-profile

**Version 2.10.0**

Compatibility: requires minimum Kimai 2.21.0

- Refactoring: use new query and repository methods

**Version 2.9.0**

Compatibility: requires minimum Kimai 2.11.0

- Compatibility with composer installation
- Inline Nelmio API Doc configuration
- Inline JMS Serializer configuration

**Version 2.8.2**

Compatibility: requires minimum Kimai 2.11.0

- Added support for NFC with Android-Kiosk: www.android-kiosk.com

**Version 2.8.1**

Compatibility: requires minimum Kimai 2.11.0

Changed: link to new documentation page

**Version 2.8.0**

Compatibility: requires minimum Kimai 2.11.0

- Added: system configuration `kiosk.enabled` to disable Kiosk via local.yaml
- Added: allow to set NFC code in edit screen via WebNFC
- Changed: support attribute caching in Voter
- Changed: simplified buttons in users kiosk profile

**Version 2.7.0**

Compatibility: requires minimum Kimai 2.11.0

- Added: show kiosk codes as user profile tab
- Added: permission `kiosk_enabled` to allow disabling Kiosk for entire user roles
- Added: print barcode on click to the image
- Changed: removed `barcode_own_profile` and `barcode_other_profile` permissions, replaced by `kiosk_own_profile` and `kiosk_other_profile`

**Version 2.6.0**

Compatibility: requires minimum Kimai 2.11.0

- Changed: CSS files and language handling, required for Kimai 2.11.0
- Changed: Replaced deprecated RestRoute attribute with SF native one

**Version 2.5.0**

Compatibility: requires minimum Kimai 2.1.0

Use annotation type for routes

**Version 2.4.0**

Compatibility: requires minimum Kimai 2.0.33

Fixed: possible pagination issues

**Version 2.3.1**

Compatibility: requires minimum Kimai 2.0.29

- Fixed: upgraded quagga from 0.0.18 to 1.8.2
- Fixed: upgraded bwip from 2.0.6 to 3.0.1

