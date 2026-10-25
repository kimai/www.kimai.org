Start and stop time recording from one bar, without opening a form. The bar replaces
Kimai's own start button and sits on its own row directly below the top bar of every page.

- Type what you are working on, pick a project and activity, optionally add tags and mark the
  record billable, and press start. Recent descriptions are suggested as you type, and picking
  one fills in the project and activity it was last booked on.
- Switch to manual mode to enter a date, start and end time for something you already did.
- While a record runs, the bar shows it with a live clock and a stop button, and everything
  about it, including its start time, can be changed right there.
- Every record on **My times** gets a play button that starts the same work again.
- The running record stands out in the record lists, and records started or stopped in
  another tab show up in the bar too.
- Times accept short forms such as `915` or `945p`.
- A **+** next to the project and activity pickers creates a project or activity from just
  its name.

Each user can turn the bar off with **Show quick start bar** in their preferences.

### Permissions

The plugin adds no permissions of its own; it follows Kimai's. The bar is shown to users with
`create_own_timesheet`. Changing and stopping the running record follow Kimai's edit and stop
rules, the billable toggle needs `edit_billable_own_timesheet`, new tags need `create_tag`, and
new projects and activities need `create_project` and `create_activity`.

### Support

Report problems and ideas in the plugin's
[issues](https://github.com/FaliseDotCom/kimai-quick-timer-bar-bundle/issues). The full documentation is in its [README](https://github.com/FaliseDotCom/kimai-quick-timer-bar-bundle#readme).

### Works well with

This plugin is one of five made to work together; each also works on its own:

- [Reporting extras]({% link _store/{{ page.lang }}/falisedotcom-reporting-graphs-bundle.md %}): quarterly reports, charts on the user reports, a summary report and dashboard widgets.
- [Short time entries]({% link _store/{{ page.lang }}/falisedotcom-short-time-entries-bundle.md %}): type 945 for 9:45 or 10 for ten minutes in Kimai's time and duration fields.
- [Inline timesheet editing]({% link _store/{{ page.lang }}/falisedotcom-inline-timesheet-edit-bundle.md %}): edit your own records right in the record list.
- [Timesheet extras]({% link _store/{{ page.lang }}/falisedotcom-timesheet-extras-bundle.md %}): collapsible days in the record list and closable search filters.
