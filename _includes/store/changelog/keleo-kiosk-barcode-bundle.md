## Version 2.5.0

Compatibility: requires minimum Kimai 2.1.0

- Use annotation type for routes

## Version 2.4.1

Compatibility: requires minimum Kimai 2.0.35

- Adjusted internal API usage to prevent calls to deprecated code

## Version 2.4.0

Compatibility: requires minimum Kimai 2.0.33

- Fixed: possible pagination issues

## Version 2.3.1

Compatibility: requires minimum Kimai 2.0.29

- Fixed: upgraded quagga from 0.0.18 to 1.8.2
- Fixed: upgraded bwip from 2.0.6 to 3.0.1

## Version 2.3.0

Compatibility: requires minimum Kimai 2.0.29

- Added: use language of the current user to render the welcome screen
- Added: use timezone of the current user to display the time

## Version 2.2.1

Compatibility: requires minimum Kimai 2.0.20

- Fixed: compatibility with Kimai 2.0.20 and Tabler Beta 19

## Version 2.2.0

Compatibility: requires minimum Kimai 2.0

- Added: Support for [Web NFC](https://developer.mozilla.org/en-US/docs/Web/API/NDEFReader) in freestyle mode
- Added: upgrade item actions to use v2 API

## Version 2.1.0

Compatibility: requires minimum Kimai 2.0

- Added: detect HTTP and include hint in error message, that webcam can only be accessed via HTTPS
- Added: Allow to manually select camera by user
- Added: Configuration if user may select the camera
- Added: Store used device ID in cookie
- Added: Configuration for input field placeholder
- Changed: Added and changed HTML IDs for better "Custom CSS" experience
- Fixed: disappearing error message

## Version 2.0.2

Compatibility: requires minimum Kimai 2.0

- Fixed: Do not auto-calculate new Kiosk code, to allow removing the last code from a user

## Version 2.0.1

Compatibility: requires minimum Kimai 2.0

- Fixed: Menu-Subscriber priority (missing in "Favorites" menu)

## Version 2.0

Compatibility: requires minimum Kimai 2.0

- Fixed: compatibility with Kimai 2.0
- BC break: Changed API URLs:
    - `/api/kiosks/kiosks` to `/api/kiosk/codes`
    - `/api/kiosks/kiosks/{id}` to `/api/kiosk/codes/{id}`

### Version 1.12

Compatibility: requires minimum Kimai 1.15

- Added: missing translation for "Code"

### Version 1.11

Compatibility: requires minimum Kimai 1.15

- Added: support **multiple codes per user**
- Added: delete single code
- Added: edit code with activity

### Version 1.10

Compatibility: requires minimum Kimai 1.15

- Added: reload scanner page every 14 minutes to prevent CSRF token / session issues (PHP default session timeout is 14 minutes)
- Added: set an **activity per user and code**, which allows to overwrite the global configured code
- Added: new setting to prevent stopping of non-kiosk activities
- Added: edit existing codes

## Version 1.9

Compatibility: requires minimum Kimai 1.15

- Added: a new configuration to prevent page reloads after login (activated by default)

## Version 1.8

Compatibility: requires minimum Kimai 1.15

- Added: API functions to load available codes (list of all codes only available to user with permission `kiosk_admin`)
- Fixed: do not display codes for disabled users
- Fixed: definitions for new Kimai version

## Version 1.7

Compatibility: requires minimum Kimai 1.14

- Added: beep (login) and boop (logout) sounds (off by default)

## Version 1.6

Compatibility: requires minimum Kimai 1.11

- Added: allow CSS customization via event
- Added: the following CSS classes, for building selectors:
    - `kiosk-login`: the kiosk login screen with the code input/scanner
    - `kiosk-login-status`: status page (started and stopped)
    - `kiosk-started`: status page after record has been started (login)
    - `kiosk-stopped`: status page after record has been stopped (logout)
    - `kiosk-users`: list of active and inactive users with avatars (features must be activated)
    - Example: hide the logo on login and logout page via Custom CSS bundle:
    ```css
    .kiosk-login-status .login-logo { display:none; }
    .kiosk-login-status .login-box-body { margin-top: 50px; }
    ``` 
- Added: the following new configurations
    - `hide logo`: hide logo on status pages (login and logout)
    - `hide code`: turns the code input field into a password field
- Added: a new configuration to show active users in login screen
- Added: a new configuration to show inactive users in login screen

## Version 1.5

Compatibility: requires minimum Kimai 1.11

- Added: Configuration to activate IP address logging when starting a new entry
- Added: Simplify installation (assets will be installed automatically)
- Fixed: Composer 2 compatibility

## Version 1.4

Compatibility: requires minimum Kimai 1.10

- Added "Freestyle" code format, which can be used for example:
    - with a simple keyboard (eg. door-lock)
    - RFID reader which act as keyboard (like barcode scanners)
    - see Hardware section in [README.md](README.md)
- Added new `kiosk_admin` permission (by default assigned to Super-Admins)
- Added Kiosk Admin page showing all users with attached codes (needs `kiosk_admin` permission)
- Prevent invalid time configuration in user-preferences
- Show all configured codes on user screen (highlight active type)

## Version 1.3

- Added allowed start and end times for each user (new permissions `kiosk_own_profile` and `kiosk_other_profile`)

## Version 1.2

- Fixed timezone issue

## Version 1.1

- Fixed configuration problem, removed project setting

## Version 1.0

- Initial release
