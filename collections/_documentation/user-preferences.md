---
title: User preferences
description: Settings that change the users personal Kimai experience
related:
  - users
---

The user preferences can be accessed via any user profile (e.g. in the upper right corner for your own user) and from `System > Users` (needs `view_user` permission) for every user.

## Preferences

### Hourly rate

A fallback for records without any customer/project/activity specific [price]({% link _documentation/rates.md %}).

Needs `hourly-rate_own_profile` / `hourly-rate_other_profile` permission to see and edit.

### Internal rate

A fallback for records without any customer/project/activity specific internal [price]({% link _documentation/rates.md %}).

Needs `hourly-rate_own_profile` / `hourly-rate_other_profile` permission to see and edit.

### Timezone

The user specific time zone is used when recording user timesheet entries. 

By default, this is the server timezone (php.ini: date.timezone), which is often wrong or not matching the users real timezone (for technical reasons like shared hosting, docker, UTC).
If you experience wrong times when starting a record, please check this setting first and tell your users to do the same.

Kimai can handle arbitrary timezones, so it is no problem to record the work of your global distributed team.
Each timesheet record will use the timezone, which was active when the record was started. 
If you change the timezone while a record is running, it will only influence the next started record.

Kimai saves times in UTC, including the timezone information, so it can calculate the correct time to display it in the frontend. 

### Language

Which language should be used as the primary source for translations (if a specific translation for your language is missing, the fallback will always be English).

### Time, date and currency format

The format that is used to render dates, time, money, numbers and currencies.

### First day of the week

While many countries in the world use `Monday` as start of the week, a lot of other countries use `Sunday`.
This is the place to change between these two days.

### Design

Allows you to change the theme used for Kimai; switching to dark can reduce eye strain in the evening hours.

- Bright: Default bright background and dark menu background
- Dark: Dark background and dark menu background
- Automatic: 

### Update browser title

If activated, the duration of running records will be displayed in the browsers title (tab).

- Pro: You can see the duration while working in other browser tabs.
- Contra: Some browser highlight active tabs, which might be disturbing. 

### Initial calendar view

A user can decide which calendar view is most useful for personal work style:

- `month` (default view)
- `week`
- `day`

If no translations are available for your language, the options might be called: `month`, `agendaWeek`, `agendaDay`.

### Initial view after login

This setting changes the target page for:

- redirect after login
- click on the header (both mobile and desktop) 

If a user configured the preference `login.initial_view` to `calendar`, the timesheet icon in the top navigation bar 
on mobile devices will be replaced by a link to the calendar.  

### Favorites

Allows to store preferred menus as favorites, which then can be quickly accessed from the dropdown in the top-bar (opened with the bookmark button). 

### Show daily statistics in timesheet

If activated, the personal timesheet visually groups and shows statistics for all records within one day.

## Permissions

The user preferences can be edited by:
- the user itself, when owning the `preferences_own_profile` permission
- every user owning the `preferences_other_profile` [permission]({% link _documentation/permissions.md %})
