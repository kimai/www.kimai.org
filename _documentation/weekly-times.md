---
title: Weekly times
description: Manage your time records in quick and easy weekly spreadsheet-like view.
toc: true
related:
  - timesheet
  - calendar
since_version: 1.16
---

The "weekly times" view shows one week in a simple table structure, which mimics a classical spreadsheet.

Rows represent a customer/project and activity, where you can book one time for each date.
If you have multiple entries for the same day, there will be multiple rows for the same project/activity combination.

New users, without any previous timesheet, will see 3 empty rows.

Existing users will have up to 5 rows wit the last recent activities pre-filled.

If the existing rows are not sufficient, you can `+ Add` new ones at any time.

## Creating records

The start time of each new record is configured through `Default start-time` from [System > Settings]({% link _documentation/configurations.md %}).

## Deleting records

You can delete records from the view, by emptying the duration field. The record will be removed after saving the week data.

## Permissions

The view is protected by the permission `weekly_own_timesheet`. 
You can turn this feature entirely off, by toggling the permission to `OFF`.

The feature is also only available to users with the permissions `view_own_timesheet` and `edit_own_timesheet`.

The last check is if the current time-tracking mode (see [System > Settings]({% link _documentation/configurations.md %})) 
allows `editing the duration` or `editing the end` (which is not true for the punch-mode).

