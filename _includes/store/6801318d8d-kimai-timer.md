Kimai Timer is an Android app for your own Kimai in two parts:

- **Kimai itself**: the app opens your Kimai's web interface, with its login, your plugins and everything else, so it replaces Kimai's web app installed from the browser. Links to other sites open in the browser, exports go to Downloads, file fields open the file picker.
- **The running timer in a notification, also on the lock screen**: a clock ticking in HH:MM:SS, with project, activity, customer and description, and a Stop button. After a stop from the notification, the card offers Restart for a few minutes. Tapping it opens Kimai in the app.

## Changes made elsewhere

With the [App push]({% link _store/{{ page.lang }}/6801318d8d-app-push-bundle.md %}) plugin installed in Kimai, a timer started or stopped anywhere else (the web pages, another app, the API) shows up on the phone within a second or two:

- through a [UnifiedPush](https://unifiedpush.org) distributor app (ntfy, NextPush, Sunup, ...), the lightest on the battery;
- or, without a distributor, through a direct connection to Kimai kept open by the app (its notification then stays on screen, showing the latest entry with Restart when no timer runs).

Without the plugin, the app checks every 15 minutes.

## Without the network, or with Kimai down

The timer keeps working. Stop and Restart on the notification take effect at once and wait in a queue, and Kimai gets them when it is reachable again, **with the times of the taps**: a timer stopped at 18:00 ends at 18:00 even if Kimai hears of it at 19:30. The notification says how many changes are waiting.

While Kimai cannot be reached, the app shows its own timer screen instead of Kimai's pages: the running timer, a form to start one (with the projects and activities saved at the last connection) and the latest entries.

If another device changed things meanwhile, the timer started later wins and the earlier of two stops counts. A change Kimai refuses, for example for an activity hidden in the meantime, is shown in a notification with its times, to enter by hand.

## Setup Requirements

- A Kimai 2 installation and a personal API token (your profile → API access)
- An Android phone with Android 12 or newer

## Installation

Download the APK from the [GitHub releases](https://github.com/6801318d8d/kimai-timer/releases), enter your Kimai address and the API token, and allow notifications. Free and open source (MIT), no tracking: the app only talks to your Kimai.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/kimai-timer/issues).
