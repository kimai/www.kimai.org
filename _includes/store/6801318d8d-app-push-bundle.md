AppPushBundle tells phone apps at once when your timesheets change: start a timer on the computer, and the app on your phone knows within a second or two; stop it in the app, and your other devices hear about it too. Without the plugin, an app only sees changes made elsewhere when it asks Kimai again.

It was made for the [Kimai Timer]({% link _store/{{ page.lang }}/6801318d8d-kimai-timer.md %}) Android app, which shows the running timer on the lock screen, but any app with an API token can use it.

## How it works

Whenever a timesheet is created, changed, stopped, duplicated, restarted or deleted (web pages, API, apps, console), the plugin tells the user's apps once the data is saved, in two ways:

- **UnifiedPush**: the app registers the endpoint its [UnifiedPush](https://unifiedpush.org) distributor gave it (ntfy, NextPush, Sunup, ...), and Kimai posts a small message there. The message only says that something changed: the app reads what from the API with its own token, so no timesheet data leaves Kimai through the push server.
- **Event stream**: for phones without a distributor, the app keeps an event stream open (Server-Sent Events, with the API token) and hears about each change within a second.

## API

All routes act on the user of the API token: `POST`, `DELETE` and `GET /api/app-push/endpoints` to register, remove and list UnifiedPush endpoints, `POST /api/app-push/test` to send a test message, `GET /api/app-push/events` for the event stream.

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/AppPushBundle/releases) into `var/plugins/AppPushBundle` and run `bin/console kimai:reload --env=prod`. Nothing stored in the database. Optionally, the environment variable `UNIFIEDPUSH_SERVERS` limits the accepted push servers and can route one to an internal address. Each open event stream holds one web server process: fine for a personal or small-team Kimai. See the [README](https://github.com/6801318d8d/AppPushBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/AppPushBundle/issues).
