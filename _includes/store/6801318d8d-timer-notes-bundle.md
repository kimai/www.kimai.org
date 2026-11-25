TimerNotesBundle lets you write the details of what you are doing while the timer runs, not only when you start it, and move on to the next task in one step. Next to the stop button of the running timer, in the toolbar of every page, it adds a note button, an edit button and a next button; the running time gets an element of its own, so a click on it no longer stops the timer.

## Notes

The note button (speech bubble) opens a small box with the description of the running entry and a new line that already starts with the current time:

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

## Edit

The edit button opens Kimai's full edit dialog of the running entry (begin, customer, project, activity, description, tags...), the same as *Edit* on its row in *My times*. Saved with an empty end, the timer keeps running.

Without the plugin, a running entry can only be edited from its row in *My times*: the toolbar has the stop button only.

## Next

The next button (step forward) stops the timer and starts a new entry in one step: it opens Kimai's form for a new entry while the timer runs, and saving it starts the new timer and stops the running one. The stopped entry ends exactly when the new one begins, so the two never overlap (Kimai alone stops it at the moment you save). It sits next to Kimai's *Recent activities* button, which restarts a recent entry in the same way. It needs Kimai's default of one running entry per user.

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/TimerNotesBundle/releases) into `var/plugins/TimerNotesBundle` and run `bin/console kimai:reload --env=prod`. Nothing to configure, nothing stored in the database. See the [README](https://github.com/6801318d8d/TimerNotesBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/TimerNotesBundle/issues).
