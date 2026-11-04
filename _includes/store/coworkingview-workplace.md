CoworkingView Workplace adds a workplace to timesheets and projects, and a report of hours by workplace.

Use it when you record time from home, from a company office, or from a coworking space. Pick the workplace on the timesheet, or set a default on the project. The report uses the timesheet value, and the project value when the timesheet has none.

The plugin is free. It does not include prices. CoworkingView publishes a separate [Price Index](https://coworkingview.com/en/tools/price-index).

The code is in the `kimai-plugin/` directory of [coworkingview/flex-office-data](https://github.com/coworkingview/flex-office-data). A release tagged `kimai-v*` attaches `CoworkingViewBundle-<version>.zip`. The archive contains one directory, `CoworkingViewBundle/`, which you copy to `var/plugins/`. There is no database command.

## Features

- Workplace field on timesheets and projects: Home, Office, or Coworking
- The field is optional. It is shown on the forms, in the tables, in quick entry, and in exports
- Report "Hours by workplace" on the Reporting screen, for the date range you choose
- Uses Kimai's existing meta fields, so there is no extra table and no install command
- Respects the timesheets you can already see. The permission `view_other_timesheet` adds a user filter
