---
title: Timesheet
description: View and manage your time-tracking data in the timesheet view
toc: true
---

# Timesheet

User manual on the timesheet tables, actions and configuration.

Kimai 2 provides also a [calendar view]({% link _documentation/calendar.md %}), which displays your timesheet entries in an easy readable format.

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
{% include new_since.html version="1.0" %}

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
- if time rounding is activated (which is the default behaviour), then your entered seconds might be removed after submitting the form.
- using `0` or `00:00` as duration will also stop the entry with a duration of zero seconds
- to create a running entry the `duration` field needs to be empty

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

Rounding rules are used to round the begin & end dates and the duration for timesheet records.

1. You can define as many rules as you want ("default" is only an example)
2. Every matching rule will be applied, so be careful with overlapping rules
3. The end_date of timesheet records will be used to match the day (think about entries which are recorded overnight)
4. If you set one of "begin", "end", "duration" to 0 no rounding will be applied for that field and the exact time (including seconds) is used for calculation
5. The values of the rules are minutes (not the minute of an hour), so 5 for "begin" means we round down to the previous multiple of five
6. You can define different rules for different days of the week
7. Rounding rules will be applied on stopped timesheet records only, so you might see an un-rounded value for the start time and duration until you stop the record

You can configure your `rounding` rules by changing the configuration file [local.yaml]({% link _documentation/configurations.md %}).

There are two different rounding modes:
- `default`: `"begin" will always be rounded to the floor (down) and "end" & "duration" to the ceiling (up)
- `closest`: `"begin", "end" and "duration" will be rounded in a mathematical way, always to the nearest value
- `floor`: `"begin", "end" and "duration" will be always rounded down to nearest value
- `ceil`: `"begin", "end" and "duration" will be always rounded up to nearest value

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

There are two rate types:

- __Fixed rate__: the value will be used to set the records rate, no matter how long the duration is
- __Hourly rate__: will be used to calculate the records rate by multiplying it with the duration (see below)

If any of the above is set to 0, the records rate will be set to 0.

While calculating the rate of a timesheet entry, the first setting that is found will be used (in order of appearance):

- Timesheet fixed rate
- Activity fixed rate
- Project fixed rate
- Customer fixed rate
- Timesheet hourly rate
- Activity hourly rate
- Project hourly rate
- Customer hourly rate
- Users hourly rate

If neither a fixed nor a hourly rate can be found, the users rate will be used to calculate the records rate.
If that is the case and if the users rate is not set or equals 0, the records rate will be set to 0.

The calculation is based on the following formula:

- __Fixed rate__: `$fixedRate`
- __Hourly rate__: `$hourlyRate * ($durationInSeconds / 3600) * $factor`

Please see below to see how you can apply configurable multiplying factors based on day and time.

### Rate multiplier for specific weekdays

If you want to apply different hourly rates multiplication `factor` for specific weekdays, you can use this `rates` configuration.

1. You can define as many rules as you want ("workdays" and "weekend" are only examples)
2. Every matching rule will be applied, so be careful with overlapping rules
3. The end_date of timesheet records will be used to match the day (think about entries which are recorded overnight)
4. "days" is an array of weekdays, where the days need to be written in english and in lowercase
5. "factor" will be used as multiplier for the applied hourly rate
6. Rate rules will be applied on stopped timesheet records only, as it can't be calculated before
7. There is no default rule active, by default the users hourly-rate is used for calculation

You can configure the `hourly_rate` rules by changing the configuration file [local.yaml]({% link _documentation/configurations.md %}).

#### Examples

1. The "workdays" rule will use the default "hourly rate" for each timesheet entry recorded between "monday" to "friday" as a multiplication with 1 will not change the result
2. The "weekend" rule will add 50% to each timesheet entry that will be recorded on "saturdays" or "sundays"

```yaml
kimai:
    timesheet:
        rates:
            workdays:
                days: ['monday','tuesday','wednesday','thursday','friday']
                factor: 1
            weekend:
                days: ['saturday','sunday']
                factor: 1.5
```

## Exported records
{% include new_since.html version="1.0" %}

Exported records will be locked to prevent manipulation of cleared data.
 
There is the permission `edit_exported_timesheet` which allows to edit and delete these locked entries nevertheless, 
which by default is given to users with `ROLE_ADMIN` and `ROLE_SUPER_ADMIN`. 
