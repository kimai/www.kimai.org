This is a Kimai plugin that extends the WorkContract plugin (https://www.kimai.org/de/store/keleo-controlling.html) by Kevin Papst
with additional features that are not (yet) implemented in the main plugin.

## Features

- **Absence all view** - Lists absences for **all** users in the system in one place
  - Filters for user(s), year, month and absence type (sickness, holiday etc.)
  - Export for the selected filters as Excel file
- **Absence report command** - With the new `workcontract-addons:absence-report` command you can set up a cronjob to regularly create and send absence reports via mail (recipients are configurable in the module settings)

## Requirements

This plugin **requires** the WorkContract plugin (https://www.kimai.org/de/store/keleo-controlling.html) in at least version 1.14.0

Currently, this plugin is tested with WorkContract version `1.14.0` only, so later versions may break this plugin.
Nonetheless, we intend to update it according to changes in the WorkContract plugin.

Should features of this plugin be implemented in the main plugin in the future, we will remove them from this plugin.

## Usage

### Abesence (all) view

Users with the `view_all_absence_addon` permission now have a new menu entry **"Absences (all)"** under "Employment contract".

### Command for absence reports

The `workcontract-addons:absence-report` command allows you to set up a cronjob to regularly create and send absence reports via mail.

For a list of options execute `bin/console workcontract-addons:absence-report --help`.

By default, a report for the last month is created (Excel file) and sent to all recipients via email.

**Recipients** can be configured in the module settings under `System -> Settings -> Employment contract - Addons -> Recpipient monthly absence report email`.

## Support

If you require support for the usage or setup of this plugin or find any bugs please contact support@pcsg.de!
