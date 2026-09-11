A small plugin that makes the "My times" page quicker to work with.

## Features

- **The description column is visible from the start.** Kimai ships that column hidden and every user has to switch it on themselves. The plugin turns it on for anyone who has never set their own columns, so a list of entries reads as what was actually done rather than as a list of project names. It sets a default and does not enforce it: once someone saves their own column layout, including switching the description off again, the plugin leaves them alone.
- **One project picker instead of customer plus project.** The project list is already grouped by customer, so the plugin drops the separate customer field and leaves a single grouped list. Picking a project becomes one step. This applies to your own entries; editing someone else's entry under "Timesheets" keeps the customer field.

## Requirements

Kimai 2.0 or newer. No database migration, no configuration, no dependencies.

## Uninstall

Remove the `var/plugins/WsTimesheetBundle` directory and reload Kimai. Column layouts created by the plugin stay, because they are ordinary Kimai settings, the same as if each person had ticked the box themselves. To clear them as well:

```sql
DELETE FROM kimai2_bookmarks WHERE type = 'columns' AND name = 'timesheet';
```
