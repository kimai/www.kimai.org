---
title: Weekly working hours
description: Manage your time records in quick and easy weekly spreadsheet-like view.
toc: true
related:
  - timesheet
  - calendar
since_version: 1.16
---

The "weekly times" view shows one week in a simple table structure, which mimics a classical spreadsheet.

Rows represent a customer/project and activity and a duration for each date.
If you have multiple entries for the same day, there will be multiple rows for the same project/activity combination.

The nature of this form is simple and fast "duration tracking". That means start and end time do not matter and therefor 
all entries start at the same time. 

## Managing records 

New users, without any previous timesheet, will see 3 empty rows. 
Existing users will have up to 5 rows with the last recent activities pre-filled.

The amount of `recent activities` can be configured since 1.16.10 as a global configuration, see the `Weekly working hours` 
section in [System > Settings]({% link _documentation/configurations.md %}).

### Create further rows

If the existing rows are not sufficient, you can `+ Add` new ones at any time.

### Creating records

If you add multiple times for one day, they will start at the same time (configured through the above mentioned configuration) . 
There is no way to detect the correct order of times, so instead of guessing start times by sequencing one after another, 
they all intentionally start at the same time.

### Deleting records

You can delete records from the view, by emptying the duration field. The record will be removed after saving the week data.

## Configuration

The start time of each new record is configured by the `Default start-time` from [System > Settings]({% link _documentation/configurations.md %}).

## Permissions

The view is only available to users with the permission `weekly_own_timesheet`. 
You can disable this feature by toggling the [System > Role permission]({% link _documentation/permissions.md %}) to `OFF`.

Users require additionally the permissions `view_own_timesheet` and `edit_own_timesheet`.

The last check is if the current time-tracking mode (see [System > Settings]({% link _documentation/configurations.md %})) 
allows `editing the duration` or `editing the end` (which is not true for the punch-mode).

