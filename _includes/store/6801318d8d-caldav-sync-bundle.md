CalDavSyncBundle copies your tracked time into a calendar: every finished timesheet becomes an event in a CalDAV calendar as soon as it is saved, so the time you tracked shows up next to your appointments in any calendar app. It works with any CalDAV server: Nextcloud, Radicale, Baïkal, SOGo, Fastmail and the like.

The copy goes one way, from Kimai to the calendar:

- stop the timer, or add an entry with begin and end (form, duplicate, API, mobile app): the event appears at once
- edit or delete a finished entry, also several at a time: the event changes or disappears
- a running timer reaches the calendar when you stop it

Each event has the title `Customer › Project · Activity`, the entry's begin, end and description, customer, project and tags as categories, the activity's colour and a link back to the entry in Kimai. Events are marked as free time, so tracked time does not block scheduling tools. The plugin only touches the events it created, and creates the calendar if it does not exist.

Saving in Kimai never fails because of the calendar: entries that could not be copied are retried with the next change, and `bin/console caldav-sync:sync` brings the whole calendar in line at any time (it also copies the entries you already have). Failures can be reported to [ntfy](https://ntfy.sh).

## Configuration

Environment variables of the Kimai process (for Docker, the `environment` of the Kimai service):

- `CALDAV_SYNC_URL` - address of the calendar collection, e.g. `https://cloud.example.com/remote.php/dav/calendars/alice/kimai/` (required)
- `CALDAV_SYNC_USERNAME`, `CALDAV_SYNC_PASSWORD` - HTTP basic authentication (an app password where the server has them)
- `CALDAV_SYNC_KIMAI_URL` - public address of your Kimai, for the link in each event (optional)
- `CALDAV_SYNC_USERS` - Kimai user names whose entries are copied (default: everybody's)

More options (calendar name and colour, timeout, ntfy) are in the [README](https://github.com/6801318d8d/CalDavSyncBundle#readme).

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/CalDavSyncBundle/releases) into `var/plugins/CalDavSyncBundle`, set the variables above, run `bin/console kimai:reload --env=prod` and then `bin/console caldav-sync:sync --env=prod` for the entries you already have. Nothing is stored in the database. See the [README](https://github.com/6801318d8d/CalDavSyncBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/CalDavSyncBundle/issues).
