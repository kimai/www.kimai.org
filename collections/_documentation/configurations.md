---
title: Settings
description: Kimai system configurations
related: 
  - user-preferences
  - local-yaml
---

Many features of your Kimai installation can be changed by editing the `System > Settings`. This screen is only visible to 
users with the permission `system_configuration` (by default [ROLE_SUPER_ADMIN]({% link _documentation/permissions.md %})).

## Timesheet

- `Time-tracking mode` - see below
- `Default start-time` - not used in all time-tracking modes, read more about the accepted formats [here](https://www.php.net/manual/en/datetime.formats.php) and [here](https://www.php.net/manual/en/datetime.formats.time.php)
- `Allow time entries in the future` - Whether future booking of timesheet records are possible or not (eg. pre-book meetings for next week)
- `Allow time entries with an empty duration` - Whether timesheet records are allowed to have a duration of zero seconds
- `Allow overlapping time entries` - If not checked, you cannot have entries at the same time (even one minute overlap will be prevented)
- `Allow overbooking of stored budgets` - Whether users can book more work than allowed via the customer/project/activity budget
- `Permitted number of simultaneously running time entries` - by default it is `1`, which will automatically stop the currently running record when a new one is started. 
  If it is greater than 1 and as soon as the limit is reached, the user has to manually stop at least one active entry (an error message will be shown) and the 
  global tick-tack clock will be replaced with a dropdown.
- `Minute selection for From & To` - steps counter for the "begin time" and "end time" dropdown-menu in the timesheet forms
- `Minute selection for Duration` - steps counter for the "duration" dropdown-menu in the timesheet forms
- `Maximum duration of a timesheet record` - maximum duration of a timesheet record in minutes, before update/stop is rejected (eg. to prevent users from booking a whole day). Can be deactivated by setting it to 0.

### Time-tracking modes

#### Default

The default tracking mode is not limiting the user is any way. Every user can edit the `date`, the `begin` and `end` times and the `duration`.

#### Time-clock

The time-clock mode is primarily for companies, who don't want their users to add arbitrary records.
It removes the `date`, `begin`, `end` and `duration` fields from the timesheet forms. 

The `Admin > Timesheets` screen still include these fields, as you might have to correct wrong/add forgotten entries on behalf of the user.

#### Duration

The `date`, `begin` and `end` fields will be removed, only the `duration` can be edited. 
As `start` time the `Default start-time` configuration is used (which is configured to `now` by default).

Users with the `edit_other_timesheet` [permission]({% link _documentation/permissions.md %}) can still see the
`start` and `end` time in the `Admin > Timesheets` screen. If your country has work regulations that should limit access to this data,
make sure to remove this permission for persons without special access regulations (e.g. your HR department).

The `Admin > Timesheets` screen still include these fields, as you might have to correct wrong/add forgotten entries on behalf of the user.

## Weekly hours

- `Number of entries taken over from previous weeks` - defines the maximum number of "recent activity" rows that will be pre-filled in new weeks.
You can deactivate that feature by setting the value to 0. 
- `Take over entries from the last X weeks` - the amount of weeks to go back in time to calculate  (empty or 0 for all time)
- `Minimum number of rows` - how many rows should be displayed by default

## Lockdown period

- `Lockdown period start` - a PHP date-format string `relative to now` and you will likely want to configure a start of a month like `first day of last month 00:00:00` or `first day of -2 month 00:00:00`
- `Lockdown period end` - a PHP date-format string `relative to now` and you will likely want to configure the end of a month like `last day of last month 23:59:59`, `last day of -2 month 23:59:59` or `first day of this month 00:00:00`
- `Time zone` - the timezone will be used to calculate the dates (might be important if you have users across multiple timezones, if empty the timezone of the current user is used
- `Lockdown grace period end (PHP relative date to lockdown period end)` - relative to the lockdown end (the end date will always be appended, but it could still be overwritten by using the `of` modifier), most users will likely want to use a relative period like `+12 hours`, `+10 days` or `+3 weeks`

The lockdown period (if activated) will prevent your users from changing timesheet records in the past.

It consists of a `start` and `end` date and a `grace` period.
The lockdown feature will only be activated if both `start` and `end` fields are configured with a [relative date format](https://www.php.net/manual/en/datetime.formats.php#datetime.formats.relative).

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

- `Login form` - de-/activates the login form. This setting is only available if [SAML]({% link _documentation/saml.md %}) is activated.
- `User registration` - de-/activates the self-registration. Do NOT activate this, if your Kimai instance is public accessible.
- `Forgot password` - de-/activates the password reset function, that sends an email with a "reset my password" link 
- `Forgotten password - seconds before a user can request the next e-mail` - if a password-reset email was sent, you should not allow to request another one too soon (for security reasons) 
- `Forgotten password - seconds before a reset link expires` - how long a user can use the password reset link, it is recommended to keep this value below 1 day

## Customer

- `Timezone` - default value for the "create customer" form
- `Country` - default value for the "create customer" form
- `Currency` - default value for the "create customer" form
- `Display of entries in selection lists` - the display of a customer in dropdown fields
- `Customer number format` - format for automatically generated project numbers, allowed replacers are `{cc}`, `{Y}`, `{y}`, `{M}`, `{m}`, `{D}`, `{d}`, `{YY}`, `{yy}`, `{MM}`, `{DD}`
- `Allow multiple usages of the same number` - whether the same number can be used on multiple customers

| Replacer | Description                                                     | Example  |
|----------|-----------------------------------------------------------------|----------|
| `{Y}`    | Year 4 digits                                                   | 2025     |
| `{y}`    | Year 2 digits                                                   | 25       |
| `{M}`    | Month with leading zero                                         | 04 or 10 |
| `{m}`    | Month 1 or 2 digits                                             | 4 or 10  |
| `{D}`    | Day with leading zero                                           | 04 or 23 |
| `{d}`    | Day 1 or 2 digits                                               | 4 or 23  |
| `{YY}`   | Like {y}, but incrementing until an unused number will be found | 2027     |
| `{yy}`   | Like {y}, but incrementing until an unused number will be found | 27       |
| `{MM}`   | Like {y}, but incrementing until an unused number will be found | 07       |
| `{DD}`   | Like {y}, but incrementing until an unused number will be found | 27       |
{: .table }

The same rules as [Invoice number format]({% link _documentation/invoices.md %}) apply here:  
You can use increment (for configuring a start value)) and decrement (for adjusting the calculated value) and length formatter.

## Project

- `Display of entries in selection lists` - the display of a project in dropdown fields
- `Take over teams from the logged-in user when creating new entries` - if this is active, all teams of the currently logged-in users will be copied over to new created project, therefor extending the visibility of the current user (and all his teams) to the new project
- `Project number format` - format for automatically generated project numbers, allowed replacers are `{pc}`, `{Y}`, `{y}`, `{M}`, `{m}`, `{D}`, `{d}`, `{YY}`, `{yy}`, `{MM}`, `{DD}` (see above at `Customer`)
- `Allow multiple usages of the same number` - whether the same number can be used on multiple projects

## Activity

- `Display of entries in selection lists` - the display of an activity in dropdown fields
- `Activity number format` - format for automatically generated activity numbers, allowed replacers are `{ac}`, `{Y}`, `{y}`, `{M}`, `{m}`, `{D}`, `{d}`, `{YY}`, `{yy}`, `{MM}`, `{DD}` (see above at `Customer`)
- `Allow multiple usages of the same number` - whether the same number can be used on multiple activities

## User

- `Timezone` - default value for the "create user" form
- `Country` - default value for the "create user" form
- `Currency` - ONLY used to display the users hourly rate

## Theme

- `Allow markdown-formattings in descriptions and comments` - if activated, contents will be rendered with a markdown engine 
  supporting simple lists and other HTML content. It will only be rendered in `My times` and not in `Admin > Timesheet` as [security](https://github.com/erusev/parsedown/blob/master/README.md#security) measure.  
- `Allowed colors` - Comma-separated list of HTML color-codes. Color names can be set by prefixing the color code with a name and the "|" delimiter, e.g: `White|#ffffff,Black|#000000`.

The default color palette is: 
```
#c0c0c0,Gray|#808080,Black|#000000,Maroon|#800000,Brown|#a52a2a,Red|#ff0000,Orange|#ffa500,Gold|#ffd700,Yellow|#ffff00,Peach|#ffdab9,Khaki|#f0e68c,Olive|#808000,Lime|#00ff00,Jelly|#9acd32,Green|#008000,Teal|#008080,Aqua|#00ffff,LightBlue|#add8e6,DeepSky|#00bfff,Dodger|#1e90ff,Blue|#0000ff,Navy|#000080,Purple|#800080,Fuchsia|#ff00ff,Violet|#ee82ee,Rose|#ffe4e1,Lavender|#E6E6FA
```

## Calendar 

- `Display week numbers` - whether week numbers should be displayed in the monthly view (default: true)
- `Display weekends` - whether weekends should be displayed (default: true)
- `Start of normal business hours` - the start time of your working day, which will be highlighted in the weekly and daily view (default: 08:00)
- `End of normal business hours` - the end time of your working day, which will be highlighted in the weekly and daily view (default: 18:00)
- `Start of visible time range` - the start time of the calendars week and day view (default: 00:00)
- `End of visible time range` - the end time of the calendars week and day view (default: 24:00)
- `Slot duration for week- and day view` - defines the duration for each calendar slot (row) in the week and day views, format: hh:mm:ss (default: 00:30:00 = 30 minutes)
- `Amount of entries for drag&drop` - amount of rows per drag & drop box (0 = deactivated) 
- `Display of the titles of calendar entries` - which data should be displayed in the title of each calendar entry

Not editable right now:

- `day_limit` - defined the max amount of items to be displayed for one day in the monthly view (default: 4) 
- `businessHours.days` - defines your working days, which will be highlighted in the weekly and daily view. counting starts with sunday and the index 0, so 1 = monday, ..., 6 = saturday. (default: 1-5 / monday to friday)

## My company

Kimai offers some configuration settings to adapt the branding to your company:

- `Logo URL` - an absolute URL to an image, which  replaces the company name in login screen
- `Company name` - replace the application name with your `company` name (approx. 15-20 character)
- `Financial year` - starts on **first of January** by default 

If you don't set a `Logo URL` but use a value in `Company name`, this will be used in the login screen.
