TimerNotesBundle lets you write the details of what you are doing while the timer runs, not only when you start it.

Next to the stop button of the running timer, in the toolbar of every page, there is a pen button. It opens a small box with the description of the running entry and a new line that already starts with the current time:

```
Homepage layout
10:12 hero section, two variants
10:47 feedback from Anna: smaller logo
11:05 footer: newsletter form
```

- **Enter** appends the note to the description, and the timer keeps running
- **Shift+Enter** starts another line, **Esc** closes the box without saving
- the time alone, with nothing typed after it, is not saved
- the whole description can be edited in the box, e.g. to fix a typo in an earlier note
- the lists reload after saving, with one note per line

Without the plugin, the description of a running entry can only be changed in the full edit dialog.

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/TimerNotesBundle/releases) into `var/plugins/TimerNotesBundle` and run `bin/console kimai:reload --env=prod`. Nothing to configure, nothing stored in the database. See the [README](https://github.com/6801318d8d/TimerNotesBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/TimerNotesBundle/issues).
