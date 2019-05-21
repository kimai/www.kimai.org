---
title: Calendar
description: Manage your timesheet records in a calendar view
toc: true
---

Kimai 2 provides a calendar view, which displays your timesheet entries in a easy readable format.
You can choose between a monthly, weekly and daily view.

The calendar view look and feel is configured with the config keys below `kimai.calendar` in `kimai.yaml` 
(see [configurations]({% link _documentation/configurations.md %})) or in the system configurations screen:  

```yaml
kimai:
    calendar:
        week_numbers: true
        weekends: true
        day_limit: 4
        businessHours:
            days: [1, 2, 3, 4, 5]
            begin: '08:00'
            end: '18:00'
        visibleHours:
            begin: '00:00'
            end: '24:00'
```

- `week_numbers` - whether week numbers should be displayed in the monthly view (default: true)
- `weekends` - whether weekends should be displayed (default: true)
- `day_limit` - defined the max amount of items to be displayed for one day in the monthly view (default: 4)
- `businessHours.days` - defines your working days, which will be highlighted in the weekly and daily view. counting starts with sunday and the index 0, so 1 = monday, ..., 6 = saturday. (default: 1-5 / monday to friday) 
- `businessHours.begin` - the start time of your working day, which will be highlighted in the weekly and daily view (default: 08:00)
- `businessHours.end` - the end time of your working day, which will be highlighted in the weekly and daily view (default: 18:00)
- `visibleHours.begin` - the start time of the calendars week and day view (default: 00:00)
- `visibleHours.end` - the end time of the calendars week and day view (default: 24:00)

## Initial view

The initial view for the calendar is `month`.
It is a user specific setting and each user can configure it in his _User profile_ at _Preferences_.  

Available options are: `month`, `agendaWeek`, `agendaDay` (these might be called different if a translation is available)

## Initial view after login

If a user configured the preference `login.initial_view` to `calendar`, the timesheet icon in the top navigation bar 
will be replaced by a link to the calendar.  

## Integrating google calender

If you want to embed Google calendars e.g. to display regional holidays or company events you can import (multiple) Google calendars.

- read how to obtain your [Google API key and find the Calender ID](https://fullcalendar.io/docs/google-calendar)
- add the optional `kimai.calendar.google` configuration
- you can add any number of sources under the `kimai.calendar.google.sources` node, each must have its own name (like `holidays` and `company` in this example)

```yaml
kimai:
    calendar:
        google:
            api_key: 'your-restricted-google-api-key'
            sources:
                holidays:
                    id: 'de.german#holiday@group.v.calendar.google.com'
                    color: '#ccc'
                company:
                    id: 'de.german#holiday@group.v.calendar.google.com'
                    color: '#cc0000'
```
