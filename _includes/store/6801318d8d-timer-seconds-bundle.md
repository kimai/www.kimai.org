TimerSecondsBundle shows times and durations with seconds:

- the running timer as `HH:MM:SS` (`00:05:23` instead of `0:05`), refreshed every second: the stop button in the toolbar, the browser title and the rows of running entries in the lists
- the begin and end of entries as `17:13:27` instead of `17:13` (`5:13:27 PM` in 12-hour locales), in lists, reports and HTML/PDF exports
- durations as `00:59:00` instead of `0:59` wherever Kimai renders them on the server: lists, totals, reports, dashboard widgets and exports (decimal durations are unchanged)
- the seconds of a new entry that begins in the current minute, e.g. a timer started from the "Start" form

Times are still typed as `HH:mm` in the forms.

## Store the seconds

By default Kimai rounds begin and end of every entry to 1 minute, so all entries are stored at `:00`. To store the seconds, set the rounding of begin and end to `0` in *System → Settings → Rounding*. The plugin does not change this setting.

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/TimerSecondsBundle/releases) into `var/plugins/TimerSecondsBundle` and run `bin/console kimai:reload --env=prod`. Nothing to configure, nothing stored in the database. See the [README](https://github.com/6801318d8d/TimerSecondsBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/TimerSecondsBundle/issues).
