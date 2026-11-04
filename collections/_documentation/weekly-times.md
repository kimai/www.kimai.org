---
title: Weekly hours
description: Manage your time records in a quick and easy weekly spreadsheet-like view.
related:
    - timesheet
    - calendar
---

The "Weekly hours" view displays a single week in a simple table layout that mimics a classical spreadsheet.

Each row represents a combination of customer/project and activity, with a duration column for each day of the week.
If you have multiple entries for the same project/activity on a given day, each entry appears as a separate row.

This view is designed for simple and fast **duration tracking** — start and end times are not relevant, so all entries for a day share the same start time.

{% include youtube-video.html id="timesheets" chapter="weekly_hours" %}

## Managing records

New users without any previous timesheet entries will see 3 empty rows.
Existing users will see up to 5 rows, pre-filled with their most recent activities.

The number of pre-filled `recent activities` can be configured as a global setting.
See the `Weekly working hours` section in [System → Settings]({% link _documentation/configurations.md %}).

### Adding rows

If the existing rows are not sufficient, click `+ Add` to create new ones at any time.

### Creating records

Enter a duration in any day column to create a record. If you add multiple durations for the same day, they will all share the same start time (configured via the setting mentioned above). There is no way to determine the correct chronological order, so rather than guessing start times by sequencing entries one after another, they all intentionally use the same start time.

### Deleting records

To delete a record, clear its duration field. The record will be removed when you save the week.

## Configuration

The start time assigned to each new record is determined by the `Default start-time` setting in [System → Settings]({% link _documentation/configurations.md %}).

## Permissions

To access the Weekly hours screen, a user needs all of the following:

- `view_own_timesheet` and `edit_own_timesheet`
- `weekly_own_timesheet`
- The current time-tracking mode (see [System → Settings]({% link _documentation/configurations.md %})) must allow `editing the duration` or `editing the end` — this is **not** the case in punch mode.

If you have the `view_other_timesheet` permission, you can switch to view and edit another user's weekly hours.

## Disabling Weekly hours

Companies that need to record exact start and end times may want to deactivate this screen, since it only tracks durations.

You can disable it by setting the [System → Role permission]({% link _documentation/permissions.md %}) `weekly_own_timesheet` to `OFF`.
