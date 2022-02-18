---
title: Settings
description: Kimai system configurations
toc: true
related: 
  - user-preferences
  - local-yaml
redirect_from: /documentation/branding.html
---

Many features of your Kimai installation can be changed by editing the `System > Settings`. This screen is only visible to 
users with the permission `system_configuration` (by default [ROLE_SUPER_ADMIN]({% link _documentation/permissions.md %})).

## Timesheet

- `Time-tracking mode` - see below
- `Default start-time` - not used in all time-tracking modes, read more about the accepted formats [here](https://www.php.net/manual/en/datetime.formats.php) and [here](https://www.php.net/manual/en/datetime.formats.time.php)
- `Allow time entries in the future` - Whether future booking of timesheet records are possible or not (eg. pre-book meetings for next week)
- `Allow overlapping time entries` - If not checked, you cannot have entries at the same time (even one minute overlap will be prevented)
- `Allow overbooking of stored budgets` - 
- `Permitted number of simultaneously running time entries` - by default it is `1`, which will automatically stop the currently running record when a new one is started. 
  If it is greater than 1 and as soon as the limit is reached, the user has to manually stop at least one active entry (an error message will be shown) and the 
  global tick-tack clock will be replaced with a dropdown.
- `Minute selection for From & To` - 
- `Minute selection for Duration` - 
- `Maximum duration of a timesheet record in minutes before saving is rejected` - maximum duration of a timesheet record (0 = deactivated)

### Time-tracking modes

#### Default mode

The default tracking mode is not limiting the user is any way. Every user can edit the `begin` and `end` time and the `duration`.

#### Time-clock mode

The time-clock mode is primarily for companies, who don't want their users to add arbitrary records.
It removes the `begin` and `end` fields for the default timesheet forms. 

The `Admin > Timesheets` screen still include these fields, as you might have to correct wrong/add forgotten entries on behalf of the user.

#### Duration (no end time)

Removes the `end` fields from the timesheet form, while the `duration` can be edited.
All timesheet tables will only display the `date` and `duration` for all records, `start` and `end` time columns are hidden.

Users with the `edit_other_timesheet` [permission]({% link _documentation/permissions.md %}) can still see the 
`start` and `end` time in the `Admin > Timesheets` screen. If your country has work regulations that should limit access to this data, 
make sure to remove this permission for persons without special access regulations (e.g. your HR department).

This mode does not use the `Default start-time` but always displays the current time as start for new entries.

#### Duration (fixed start time)

The `begin` and `end` fields will be removed, only the `duration` can be edited. 
As `start` time the `Default start-time` configuration is used (which is configured to `now` by default).

Users with the `edit_other_timesheet` [permission]({% link _documentation/permissions.md %}) can still see the
`start` and `end` time in the `Admin > Timesheets` screen. If your country has work regulations that should limit access to this data,
make sure to remove this permission for persons without special access regulations (e.g. your HR department).

## Weekly working hours

- `Number of entries taken over from previous weeks` - defines the maximum number of "recent activity" rows that will be pre-filled in new weeks.
You can deactivate that feature by setting the value to 0. 

## Lockdown period

- `Lockdown period start` - a PHP date-format string `relative to now` and you will likely want to configure a start of a month like `first day of last month 00:00:00` or `first day of -2 month 00:00:00`
- `Lockdown period end` - a PHP date-format string `relative to now` and you will likely want to configure the end of a month like `last day of last month 23:59:59`, `last day of -2 month 23:59:59` or `first day of this month 00:00:00`
- `Time zone` - the timezone will be used to calculate the dates (might be important if you have users across multiple timezones, if empty the timezone of the current user is used
- `Lockdown grace period end (PHP relative date to lockdown period end)` - relative to the lockdown end (the end date will always be appended, but it could still be overwritten by using the `of` modifier), most users will likely want to use a relative period like `+12 hours`, `+10 days` or `+3 weeks`

The lockdown period (if activated) will prevent your users from changing timesheet records in the past.

It consists of a `start` and `end` date and a `grace` period.
The lockdown feature will only be activated if all of these fields are configured with a [relative date format](https://www.php.net/manual/en/datetime.formats.relative.php).

These rules apply:
- If the start date of a timesheet record is earlier than the lockdown start, it is not possible to edit it any longer
- If the start date of a timesheet record is between the lockdown start and end, it can only be edited if "now" is within the grace period
- If a user has the permission `lockdown_grace_timesheet` all records in the last lockdown period can be edited, even after the grace period ended
- If a user has the permission `lockdown_override_timesheet` none of the lockdown rules apply

### Examples

We want to achieve that the last month goes into lockdown with the start of the current month, but we want to allow that
users can edit their records until the fifth day of the month (because invoices will be written on the seventh day of the month).

Configuration:

- Lockdown start: `first day of last month 00:00:00`
- Lockdown end: `last day of last month 23:59:59` (could also be written as `first day of this month 00:00:00`)
- Grace period: `+5 days`

More examples:
- `first day of -3 month 00:00:00 +216 hours` executed in July 2020 will result in `2020-04-10 00:00:00`
- only allow editing for yesterday and today: start = `yesterday 00:00:00`, end = `today 23:59:59`, grace = `+1 days`

## Time rounding

- `Rounding mode` - see below
- `Rounding of the start time` - in minutes, zero (0) deactivates this config 
- `Rounding of the end time` - in minutes, zero (0) deactivates this config
- `Rounding of the duration` - in minutes, zero (0) deactivates this config
- `Days of the week when rounding will be applied` - on all other days, the real recorded values will be used

Rounding rules are used to round the `begin` and `end` times and the `duration` for timesheet records:

- The `end` date of timesheet records will be used to match the day (think of overnight entries)
- If you set one of `begin`, `end`, `duration` to 0 no rounding will be applied for that field, the exact time (including seconds) is used for calculation
- The values of the rules are minutes (not the minute of an hour), so 5 for "begin" means we round down to the previous multiple of five
- Rounding rules will be applied on stopped timesheet records only, so you might see an un-rounded value for the start time and duration until you stop the record

These are the existing rounding modes:
- `default` - "begin" will always be rounded to the floor (down) and "end" & "duration" to the ceiling (up)
- `closest` - "begin", "end" and "duration" will be rounded in a mathematical way, always to the nearest value
- `floor` - "begin", "end" and "duration" will always be rounded down to the nearest value
- `ceil` - "begin", "end" and "duration" will always be rounded up to the nearest value

## Invoices

- `Invoice number format` - read more at [invoices]({% link _documentation/invoices.md %})
- `Simple search` - displays a shorter search form, removing some fields which are used less often

## Authentication

- `User registration` - de-/activates the self-registration. Do NOT activate this, if your Kimai instance is public accessible.
- `Forgot password` - de-/activates the password reset function, that sends an email with a "reset my password" link 
- `Forgotten password - seconds before a user can request the next e-mail` - if a password-reset email was sent, you should not allow to request another one too soon (for security reasons) 
- `Forgotten password - seconds before a reset link expires` - how long a user can use the password reset link, it is recommended to keep this value below 1 day

## Create customer—default values

- `Timezone` - default value for the "create customer" form
- `Country` - default value for the "create customer" form
- `Currency` - default value for the "create customer" form

## User—default values

- `Timezone` - default value for the "create user" form
- `Country` - default value for the "create user" form
- `Currency` - ONLY used to display the users hourly rate

## Theme

- `Minimum number of letters to start auto-completion` - 
- `Allow markdown-formattings in descriptions and comments` - if activated, contents will be rendered with a markdown engine 
  supporting simple lists and other HTML content. It will only be rendered in `My times` and not in `Admin > Timesheet` as
  [security measure](https://github.com/erusev/parsedown/blob/master/README.md#security).  
- `Tags: use auto-complete search and allow tag creation` - 
- `Limit color choices` - whether you want to use a dropdown list of pre-defined colors or the native color chooser with unlimited colors
- `Allowed colors` - if `Limit color choices` is active, these are the colors that can be chosen 
- `Allow the use of URLs for avatar images` - you can allow using URLs for user avatars (not recommended) 
- `Use random colors for objects without assigned color` - objects without an assigned color (projects, user ...) show a grey dot by default, but if this option is active a color is randomly chosen (the use of this random color is limited for now)

## Calendar 

- `week_numbers` - whether week numbers should be displayed in the monthly view (default: true)
- `weekends` - whether weekends should be displayed (default: true)
- `day_limit` - defined the max amount of items to be displayed for one day in the monthly view (default: 4)
- `slot_duration` - defines the duration for each calendar slot (row) in the week and day views (default: 00:30:00 = 30 minutes)
- `businessHours.days` - defines your working days, which will be highlighted in the weekly and daily view. counting starts with sunday and the index 0, so 1 = monday, ..., 6 = saturday. (default: 1-5 / monday to friday)
- `businessHours.begin` - the start time of your working day, which will be highlighted in the weekly and daily view (default: 08:00)
- `businessHours.end` - the end time of your working day, which will be highlighted in the weekly and daily view (default: 18:00)
- `visibleHours.begin` - the start time of the calendars week and day view (default: 00:00)
- `visibleHours.end` - the end time of the calendars week and day view (default: 24:00)

## My company

Kimai offers some configuration settings to adapt the branding to your company:

- `Logo URL` - an absolute URL to an image, which  replaces the company name in login screen
- `Company name` - replace the application name with your `company` name (approx. 15-20 character)
- `Mini Logo` - replace the mini version "KTT" with an abbreviation for your company name (3 chars max)
- `Browser Title` - the browser title which by default shows the full application title 
- `Financial year` - starts on **first of January** by default 

If you don't set a `logo` but use a value in `company`, this will be used in the login screen.
The settings for `company` and `mini` name can contain the HTML tags `<b><i><u><strong><em><img><svg>` for formatting.
