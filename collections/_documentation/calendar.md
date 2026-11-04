---
title: Calendar
description: Manage your timesheet records in a calendar view
canonical: /documentation/calendar.html
related:
  - timesheet
  - weekly-times
  - configurations
last_check: 2026-08-12
---

Kimai provides a calendar view, which allows management of your timesheet entries in a calendar format, where you 
can choose between a monthly, weekly and daily view.

{% include youtube-video.html id="timesheets" chapter="calendar" %}

## Views

- `Month` - one box per day, best suited for a quick overview of a longer period
- `Week` and `Day` - a time grid with one row per time slot, which shows the actual begin and end times of your records

The initial view can be changed by every user, see [user preferences]({% link _documentation/user-preferences.md %}).

Each entry is colored like everywhere else in Kimai: the color of the activity is used, with a fallback to the 
project color, the customer color and finally the system default color.

The content of the entry title can be configured system-wide, see `Configurations` below.

## Time slots

The week and day views split each hour into slots (the rows of the time grid). 
The height of one row is defined by the setting `Slot duration for week- and day view` 
(default: `00:30:00` = two slots per hour).

**15 minutes is the smallest unit that the calendar can display.**

### Why do my entries overlap?

The slot duration also defines how precise records can be rendered. 
If a slot is longer than the records inside it, there is not enough room to draw them one below the other 
while keeping the vertical time labels correct. In that case the calendar draws them overlapping (side by side).

An example: your calendar uses slots of 30 minutes (two slots between each hour label) and you have two 
consecutive records from `10:00 - 10:15` and `10:15 - 10:30`. Both of them live inside the same 30 minute slot, 
so they will be shown overlapping instead of one after another.

If you regularly track short entries, lower the `Slot duration` to `00:15:00` and the entries will be displayed 
one after another.

## Creating timesheets

There are a couple of ways you can create a new timesheet record in the calendar view:

- By clicking into the calendar you open a "create timesheet" form for a running entry with the correct day pre-selected (month, week and day view)
- When you click and drag the selection, you open a "create timesheet" form for a completed timesheet (week and day view)
- Drag & drop existing entries (like recent activities) from the left side into the calendar (month, week and day view)

## Editing timesheets

- By clicking an existing timesheet in the calendar, you open the "edit timesheet" form
- By selecting and then moving the entry on the calendar, you can shift the time of the entry. So you can easily change `begin` and `end`, without changing the `duration` (see `Drag & Drop`)
- By clicking the handle at the bottom of an existing record and then dragging it to another time (`end` and `duration` will be changed)  

## Context-menu

All calendar entries offer a context-menu with several options (like `Duplicate` or `Delete`), _right at your fingertip_. 

### Delete a timesheet

You can right-click every entry and delete it from the context-menu.

## Drag & Drop

The calendar allows managing entries by using drag & drop: 
- for creating entries (can be deactivated by System Admins) from your recent activities
- for moving entries across times and days 

Drag & Drop is globally deactivated if the time-tracking mode (see [System → Settings]({% link _documentation/configurations.md %})) 
does not allow to edit the start-time (e.g. punch in-out mode deactivates drag & drop).

The drag & drop box is also hidden if you are not allowed to create timesheets for the currently displayed user.

**Why doesn't drag & drop in the calendar copy all fields?**

When you drag and drop a timesheet entry in the calendar, only the **project** and **activity** are carried over — not custom fields or other details. This is intentional and differs from the **Restart** feature.

|                          | Drag & Drop                        | Restart Timesheet            |
|--------------------------|------------------------------------|------------------------------|
| **Use case**             | Start working on an activity again | Continue the exact same task |
| **Copies project**       | ✓                                  | ✓                            |
| **Copies activity**      | ✓                                  | ✓                            |
| **Copies custom fields** | ✗                                  | ✓                            |
| **Copies other fields**  | ✗                                  | ✓                            |
{: .table}

When to use each feature:

- **Use drag & drop** when you want to log time against a project and activity you've worked on before, but it's a fresh entry — for example, picking up a recurring task at the start of a new day.
- **Use Restart** when you're genuinely continuing the same piece of work and need all the original details (including custom fields) preserved exactly as they were.

{% alert info %}
Your system administrator can change this behavior, see `Configurations` below. 
{% endalert %}

## Switching user

You can switch the account whose data is displayed, if your user owns the permission `view_other_timesheet`.

If you are able to switch the account, if depends on the following permissions if you can manipulate records:
- edit existing records: `edit_other_timesheet`
- create new records: `create_other_timesheet`
- delete user records: `delete_other_timesheet`

The recent activities drag & drop is also switched to the account currently displayed.

If you cannot see the dropdown despite having the `view_other_timesheet` permission, it is likely that you cannot see any other users.
Whether or not you can see another user depends on your team assignments: you need to be the [team lead to see your team members]({% link _documentation/teams.md %}).

## Configurations

{% include documentation/configurations.md id="calendar" howto=true %}

### User preference

A user can change the initial view for the calendar, see [user preferences]({% link _documentation/user-preferences.md %}).
