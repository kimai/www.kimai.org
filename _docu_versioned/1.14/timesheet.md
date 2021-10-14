---
title: Timesheet
description: View and manage your time-tracking data in the timesheet view
toc: true
canonical: /documentation/timesheet.html
---

# Timesheet

User manual on the timesheet tables, actions and configuration.

Kimai provides also a [calendar view]({% link _documentation/calendar.md %}), which displays your timesheet entries in an easy readable format.

## Starting and stopping records

### Re-start timesheet records
- Click one of your **last activities** in the dropdown in the upper toolbar - this will start a record for the same customer/project & activity "now" 
- Click the **restart** action from one of the records in your timesheet - this will start a record for the same customer/project & activity "now" and copy description and tags

### Start new records
- Clicking the big **play** button in the toolbar (if no record is active right now)
- Click the "+" action is the upper right page actions to open the "edit new record" modal
- Select a time-range in the calendar (deactivated if the timeclock-mode is active)
- Click a day in the calendar (deactivated if the timeclock-mode is active)

### Stop records
- Click the **stop** button in the "active records" dropdown in the upper toolbar
- Click the **stop** action in the running record in your timesheet
- Save a running record after setting an end date (deactivated if the timeclock-mode is active)

## Lockdown period

Since version 1.10 you can configure a lockdown period, which will prevent your users from changing timesheet records in the past.

The lockdown period consists of a `start` and `end` date and a `grace` period. The lockdown feature will only work if all of these fields are configured.
These fields can be found in the [System configuration screen]({% link _documentation/configurations.md %}) and take a [relative date format](https://www.php.net/manual/en/datetime.formats.relative.php) as input.  

These rules apply: 
- If the start date of a timesheet record is earlier than the lockdown start, it is not possible to edit it any longer
- If the start date of a timesheet record is between the lockdown start and end, it can only be edited if "now" is within the grace period
- If a user has the permission `lockdown_grace_timesheet` all records in the last lockdown period can be edited, even after the grace period ended
- If a user has the permission `lockdown_override_timesheet` none of the lockdown rules apply

_Configuration:_
- The start is `relative to now` and you will likely want to configure a start of a month like `first day of last month 00:00:00` or `first day of -2 month 00:00:00`
- The end is `relative to now` and you will likely want to configure the end of a month like `last day of last month 23:59:59`, `last day of -2 month 23:59:59` or `first day of this month 00:00:00`
- The grace period is relative to the lockdown end (the end date will always be appended, but it could still be overwritten by using the `of` modifier). In 99% you will want to use a relative period like `+12 hours`, `+10 days` or `+3 weeks`  

**Example 1**

We want to achieve that the last month goes into lockdown with the start of the current month, but we want to allow that 
users can edit their records until the fifth day of the month (because invoices will be written on the seventh day of the month).

_Configuration:_

- Lockdown start: `first day of last month 00:00:00`  
- Lockdown end: `last day of last month 23:59:59` (could also be written as `first day of this month 00:00:00`)
- Grace period: `+5 days`

Please read the [PHP documentation about relative date formats](https://www.php.net/manual/en/datetime.formats.relative.php).

Some more examples:
- `first day of -3 month 00:00:00 +216 hours` executed in July 2020 will result in `2020-04-10 00:00:00` 
- only allow editing for yesterday and today: start = `yesterday 00:00:00`, end = `today 23:59:59`, grace = `+1 days`

## Tracking modes

Kimai supports multiple time-tracking modes, which can be changed via configuration setting.
This mode is not user specific, but applies for all users.

The different modes are changing the way how start and end times are recorded_

- Default: `begin` and `end` time can be edited
- Time-clock: `begin` and `end` cannot be edited by regular users
- Duration only: `begin` and `duration` can be edited (start and end times are hidden in the UI)

### Default mode

The default tracking mode is not limiting the user is any way, a user can especially edit  
the start and stop times completely on his side.

### Time-clock mode

The time-clock mode is primarily for companies, who don't want their users to add arbitrary records.
It removes the ability to choose `begin` and `end` for the regular user / in the users timesheet screens.

Be aware: the admin/team timesheets screens still include these fields, as you might have to correct wrong or add 
forgotten entries on behalf of the user.
You can limit access to these screens with the `edit_other_timesheet` [permission]({% link _documentation/permissions.md %}).

### Duration only mode

When the `duration_only` mode is active, all timesheet tables will only display the `date` and `duration` for all records.
In addition, the "edit timesheet" forms will be changed and instead of displaying the `end` date you will see a field for `duration`.

You can activate the `duration_only` mode by switching the configuration key `kimai.timesheet.mode` to `duration_only` in 
your `local.yaml` or directly from within the [System-configuration screen]({% link _documentation/configurations.md %}):

```yaml
kimai:
    timesheet:
        mode: duration_only
```

Be aware: users with the [permission]({% link _documentation/permissions.md %}) `edit_other_timesheet` can still see the 
start time and by a simple calculation the end time, if they open each entry manually. If your country has work regulations 
that should limit access to this data, make sure to remove this permission for persons without special access regulations (e.g. your HR department).

### Duration with fixed start time

The `duration_fixed_start` mode removes the begin and end datetime fields and uses a default start time  (see it as a partial anonymization).
The user is not limited in defining the entries duration. 

All logged entries for one day will start at the same time, which can be configured like this:
```yaml
kimai:
    timesheet:
        default_begin: 07:30
```
By default this is configured to `now` which is most likely not what you want.
 
You can read more about the accepted formats [here](https://www.php.net/manual/en/datetime.formats.php) and especially in 
the [time formats](https://www.php.net/manual/en/datetime.formats.time.php) chapter.

## Duration format

{% include duration_format.md %}

Please note: 
- using `0` or `00:00` as duration will also stop the entry with a duration of zero seconds
- to create a running entry the `end` and `duration` field needs to be empty

## Limit active entries

To limit the amount of active entries each user can have, the configuration `active_entries` can be changed:

```yaml
kimai:
    timesheet:
        active_entries:
            soft_limit: 1
            hard_limit: 1
```

The `soft_limit` is used as theme setting (formerly "kimai.theme.active_warning") to display a warning if the user has at least X active recordings.

The `hard_limit` is used to detect how many active records are allowed per user. 
If `hard_limit` is 1, the active record is automatically stopped when a new one is started.
When `hard_limit` is greater than 1 and as soon as the limit is reached, the user has to manually stop at least one active 
entry (an error message is shown, indicating why it is not possible to start another one).

## 12-hour am/pm format

Want to use the 12 hour format? Read the [i18n docu]({% link _documentation/translations.md %}).

## Descriptions with Markdown

The description for every timesheet entry can be formatted in two different ways, configured with the `markdown_content` setting.

- `false` - simple newlines in the description box will be displayed in the frontend as well (default)
- `true` - description will be rendered with a markdown engine, supporting simple lists and other HTML content

Allowing Markdown in timesheet descriptions is beautiful, but also could be a [security risk](https://github.com/erusev/parsedown/blob/master/README.md#security).
Kimai will only apply the markdown in the user timesheet and not in the admin section as additional security measure.   

## Rounding of begin, end and duration

Rounding rules are used to round the begin & end dates, and the duration for timesheet records.

1. You can define as many rules as you want ("default" is only an example)
2. Every matching rule will be applied, so be careful with overlapping rules
3. The end_date of timesheet records will be used to match the day (think about entries which are recorded overnight)
4. If you set one of "begin", "end", "duration" to 0 no rounding will be applied for that field and the exact time (including seconds) is used for calculation
5. The values of the rules are minutes (not the minute of an hour), so 5 for "begin" means we round down to the previous multiple of five
6. You can define different rules for different days of the week
7. Rounding rules will be applied on stopped timesheet records only, so you might see an un-rounded value for the start time and duration until you stop the record

You can configure your `rounding` rules by changing the configuration file [local.yaml]({% link _documentation/local-yaml.md %}).

These are the existing rounding modes:
- `default`: "begin" will always be rounded to the floor (down) and "end" & "duration" to the ceiling (up)
- `closest`: "begin", "end" and "duration" will be rounded in a mathematical way, always to the nearest value
- `floor`: "begin", "end" and "duration" will always be rounded down to the nearest value
- `ceil`: "begin", "end" and "duration" will always be rounded up to the nearest value

### Examples

A simple example to always charge at least 1 hour for weekend work (even if you only worked for 5 minutes) could look like this:

```yaml
kimai:
    timesheet:
        rounding:
            weekend:
                days: ['saturday','sunday']
                begin: 1
                end: 1
                duration: 60
                mode: closest
```

A rule which is often used is to round up to a mulitple of 10: 

```yaml
kimai:
    timesheet:
        rounding:
            workdays:
                days: ['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
                begin: 10
                end: 10
                duration: 0
                mode: default
```

## Rate calculation

You can find the [documentation how rates are calculated here]({% link _documentation/rates.md %}). 

## Exported records

Exported records will be locked to prevent manipulation of cleared data.
 
The [permission]({% link _documentation/permissions.md %}) `edit_exported_timesheet` does allow editing and deletion of these 
locked entries nevertheless, which by default is given to users with `ROLE_ADMIN` and `ROLE_SUPER_ADMIN`. 

The export state can be set manually or via the [invoice]({% link _documentation/invoices.md %}) and [export]({% link _documentation/export.md %}) screens.

## Billable vs. not billable

Since version 1.14 you can define whether a timesheet record is billable or not.

None-billable timesheets are excluded from [invoices]({% link _documentation/invoices.md %}) and budget calculations.

## Filter and search 

The search drop-down supports filtering by the fields:
- `user` (only in team timesheets)
- `daterange`
- `customer`
- `project`
- `activity`
- `tags`
- `state` (running / stopped)

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `description`

Additionally, you can filter for [custom fields]({% link _documentation/meta-fields.md %}) by using a search phrase like `location:homeoffice`.
This would find all timesheets with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office` 
- `This office is beautiful`
- `Our offices are very noisy`

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice hello world` - find all timesheets matching the search term `hello world` with the custom field `location` matching the term `homeoffice` 
- `location:homeoffice contract:foo foo` - find all timesheets matching the search term `foo` with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo` 
- `location:homeoffice contract:foo` - find all timesheets with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`
