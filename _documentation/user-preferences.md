---
title: User preferences
description: Settings that change the users personal Kimai experience
toc: true
related:
  - users
---

The user preferences can be accessed via any user profile (eg. in the upper right corner for your own user) and from `System > Users` (needs `view_user` permission) for every user.

These settings can be edited by:
- the user itself, when owning the `preferences_own_profile` permission 
- every users owning the `preferences_other_profile` [permission]({% link _documentation/permissions.md %})

## Hourly rate

A fallback for records without any customer/project/activity specific [rate]({% link _documentation/rates.md %}).

Needs `hourly-rate_own_profile` / `hourly-rate_other_profile` permission to see and edit.

## Internal rate

A fallback for records without any customer/project/activity specific internal [rate]({% link _documentation/rates.md %}).

Needs `hourly-rate_own_profile` / `hourly-rate_other_profile` permission to see and edit.

## Timezone

The user-specific timezone is used when recording users timesheet entries. 

By default, this is the server timezone (php.ini: date.timezone), which is often wrong or not matching the users real timezone (for technical reasons like shared hosting, docker, UTC).
If you experience wrong times when starting a record, please check this setting first and tell your users to do the same.

Kimai can handle arbitrary timezones, so it is no problem to record the work of your global distributed team.
Each timesheet record will use the timezone, which was active when the record was started. 
If you change the timezone while a record is running, it will only influence the next started record.

Kimai saves times in UTC, including the timezone information, so it can calculate the correct time to display it in the frontend. 

## Language

Which language should be used as primary source for translations (if a specific translation is missing for your language, the fallback will always be english).

## First day of the week

While many countries in the world use `Monday` as start of the week, a lot of other countries use `Sunday`.
This is the place to change between these two days.

## Display: colors

A Kimai theme is mainly a set of colors for the top bar and side navigation.
This setting can be changed by the user to match the personal style.

## Display: layout

The layout for your Kimai installation:

- `fixed` - full screen layout  
- `boxed` - max. 1250px width, goes very well with `Minimized sidebar`

## Minimize the left sidebar

This setting changes the behaviour of the left sidebar after a page (re-)load.

If activated, the sidebar is collapsed and only shown:
- on hover (on desktops)
- on clicks (tablets)
- when the burger icon is clicked

This setting is useful for smaller screens (like tablets and laptops), which need more space.

Small screens like mobile phones will not see the sidebar, they always have to use the burger menu.

## Update browser title

If activated, the duration of running records will be displayed in the browsers title (tab). 
This can be a benefit, as you can see the duration while working in other browser tabs. 
 
## Initial calendar view

A user can decide which calendar view is most useful for personal work style:

- `month` (default view)
- `week`
- `day`

If no translations are available for your language, the options might be called: `month`, `agendaWeek`, `agendaDay`.

## Initial report 

Which report should be shown, when the `Administration > Reports` menu is clicked.

## Initial view after login

This setting changes the target page for:

- redirect after login
- click on the header (both mobile and desktop) 

If a user configured the preference `login.initial_view` to `calendar`, the timesheet icon in the top navigation bar 
on mobile devices will be replaced by a link to the calendar.  

## Show daily statistics in timesheet

If activated, the personal timesheet visually groups and shows statistics for all records within one day.

# Use decimal duration in export

If activated, the export templates render durations as decimal number instead of the human-readable clock format (e.g. `1.5` instead of `01:30 h`).
