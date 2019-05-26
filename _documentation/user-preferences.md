---
title: User preferences
description: Settings that change the users personal Kimai experience
toc: true
---

A user has several preferences, which changes the behaviour how he interacts with Kimai.

These settings can be edited by the user or by another user owning the `preferences_other_profile` [permission]({% link _documentation/permissions.md %}).
The user preferences can be access via the users menu in the upper-right, or via the user administration (needs `view_user` permission). 

## Hourly rate

A fallback for records without any customer/project/activity specific rate (see [rate calculation]({% link _documentation/timesheet.md %})).

Needs `hourly-rate_own_profile` / `hourly-rate_other_profile` permission to see and edit.

## Timezone

The user-specific timezone is used when recording users timesheet entries. 

By default, this is the servers timezone (php.ini: date.timezone), which is often wrong or not matching the users real timezone (for technical reasons like shared hosting, docker, UTC).
If you experience wrong times when starting a record, please check this setting first and tell your users to do the same.

Kimai can handle arbitrary timezones, so it is no problem to record the work of your global distributed team.
Each timesheet record will use the timezone, which was active when the record was started. 
If you change the timezone while a record is running, it will only influence the next started record.

Kimai saves times in UTC, including the timezone information, so it can calculate the correct time to display it in the frontend. 

## Kimai Theme

A Kimai theme is mainly a set of colors for the top bar and side navigation.
This setting can be changed by the user to match the personal style.

## Minimize sidebar

This setting changes the behaviour of the left sidebar after a page (re-)load.

If activated, the sidebar is collapsed and only shown:
- on hover (on desktops)
- on clicks (tablets)
- when the burger icon is clicked

This setting is useful for smaller screens (like tablets and laptops), which need more space.

Small sreens like mobile phones will not see the sidebar, they always have to use the burger menu.
 
## Initial calendar view

A user can decide which calendar view is most useful for personal work style:

- `month`
- `week`
- `day`

The initial view for the calendar is `month`.  

If no translations are available for your language, the options might be called: `month`, `agendaWeek`, `agendaDay`.

## Initial view after login

This setting changes the target page for:

- redirect after login
- click on the header (both mobile and desktop) 

If a user configured the preference `login.initial_view` to `calendar`, the timesheet icon in the top navigation bar 
on mobile devices will be replaced by a link to the calendar.  

## Show daily statistics in timesheet

If activated, the personal timesheet visually groups and shows statistics for all records within one day.
