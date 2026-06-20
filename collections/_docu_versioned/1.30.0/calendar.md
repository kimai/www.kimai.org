---
title: Calendar
description: Manage your timesheet records in a calendar view
canonical: /documentation/calendar.html
related:
  - timesheet
  - weekly-times
---

Kimai provides a calendar view, which allows management of your timesheet entries in a calendar format, where you 
can choose between a monthly, weekly and daily view.

## Editing timesheets

- By clicking an existing timesheet in the calendar, you open the "edit timesheet" form
- By selecting and then moving the entry on the calendar, you can shift the time of the entry. So you can easily change `begin` and `end`, without changing the `duration` (see `Drag & Drop`)
- By clicking the handle at the bottom of an existing record and then dragging it to another time (`end` and `duration` will be changed)  

## Creating timesheets

There are a couple of ways you can create a new timesheet record in the calendar view:

- By clicking into the calendar you open a "create timesheet" form for a running entry with the correct day pre-selected (month, week and day view)
- When you click and drag the selection, you open a "create timesheet" form for a completed timesheet (week and day view)
- Drag & drop existing entries (like recent activities) from the left side into the calendar (month, week and day view)

## Delete a timesheet

You can remove every timesheet record by drag & drop onto the "Delete" button:

{% include docs-image.html src="/images/documentation/calendar-delete.webp" title="Delete a record by dropping it on the trash bin" width="300px" %}

## Switching user

You can switch the account whose data is displayed, if your user owns the permission `view_other_timesheet`.

If you are able to switch the account, if depends on the following permissions if you can manipulate records:
- edit existing records: `edit_other_timesheet`
- create new records: `create_other_timesheet`
- delete user records: `delete_other_timesheet`

The recent activities drag & drop is also switched to the account currently displayed.

## Calendar configurations

The look and feel of the calendar can be customized via [System → Settings]({% link _documentation/configurations.md %}).

## User preferences

A user can change the initial view for the calendar, see [user preferences]({% link _documentation/user-preferences.md %}).
