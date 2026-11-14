Edit your own records on **My times** and **All times** right in the list, without opening
the edit dialog. Click a record, Tab between its fields, and press Enter to save; Escape
cancels.

- Date, start, end, duration, break, project, activity, description, tags and billable can
  be changed, as far as Kimai's tracking mode and permissions allow.
- Times and durations accept short forms such as `945` for 9:45.
- A **+** next to the project and activity pickers creates a project or activity from just
  its name.
- Every change goes through Kimai's own services, so validation, rounding and rates apply.

Each user can turn this off with **Edit records directly in the list** in their preferences.

### Permissions

The plugin adds no permissions of its own. Only finished records the user owns and may edit
are offered. Billable needs `edit_billable`, new tags need `create_tag`, and new projects and
activities need `create_project` and `create_activity`.

### Support

Report problems and ideas in the plugin's
[issues](https://github.com/FaliseDotCom/kimai-inline-timesheet-edit-bundle/issues). The full documentation is in its [README](https://github.com/FaliseDotCom/kimai-inline-timesheet-edit-bundle#readme).

### Works well with

This plugin is one of five made to work together; each also works on its own:

- [Quick start bar]({% link _store/{{ page.lang }}/falisedotcom-quick-timer-bar-bundle.md %}): start and stop time recording from one bar below the top bar of every page.
- [Reporting extras]({% link _store/{{ page.lang }}/falisedotcom-reporting-graphs-bundle.md %}): quarterly reports, charts on the user reports, a summary report and dashboard widgets.
- [Short time entries]({% link _store/{{ page.lang }}/falisedotcom-short-time-entries-bundle.md %}): type 945 for 9:45 or 10 for ten minutes in Kimai's time and duration fields.
- [Timesheet extras]({% link _store/{{ page.lang }}/falisedotcom-timesheet-extras-bundle.md %}): collapsible days in the record list and closable search filters.
