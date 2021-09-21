---
title: Reporting
description: Reporting feature of Kimai
toc: true
canonical: /documentation/reporting.html
---

Access to the reporting screens has every user with the `view_reporting` permission.
Each user can configure a personal default reporting screen (since Kimai 1.14) in their user preferences (default: `Weekly view for one user`).

Reports show the rounded data, which is used throughout Kimai (e.g. in invoice and exports as well). In previous versions, this was different.

The following [permissions]({% link _documentation/permissions.md %}) are generally relevant for all reporting views:

- `view_reporting` - to be able to see the report menu
- `view_other_timesheet` - for choosing users
- `view_other_reporting` - for seeing reports with other users
- `view_all_data` - see all user (otherwise team member)

If the current user owns the `view_other_timesheet` permission the displayed username will be replaced by a user select box.
The available users to choose from are either all (if the user owns the permission `view_all_data`) or all his team member (if he is a team leader).

{% include alert.html type="info" alert="Plugins can ship their own reports, the following list contains the reports shipped in default installations." %}

## Single user

### Weekly view for one user

Displays the working times for a week for one user.

You can change the displayed calendar week and (if the user owns the `view_other_timesheet` permissions) the user to display the report for.

- Required permission: `view_reporting`

### Monthly view for one user

Displays a full month of working times for one user.

You can change the displayed month and (if the user owns the `view_other_timesheet` permissions) the user to display the report for.

- Required permission: `view_reporting`

## List of users

### Weekly view for all users

Displays a full week of working times for all users (that you have access to, see "Permissions").

You can change the displayed week.

- Required permission: `view_reporting` and `view_other_timesheet` and `view_other_reporting`

### Monthly view for all users

Displays a full month of working times for all users (that you have access to, see "Permissions").

You can change the displayed month.

- Required permission: `view_reporting` and `view_other_timesheet` and `view_other_reporting`

### Yearly view for all users

Displays a full year of working times for all users (that you have access to, see "Permissions").

This report switches from calendar year to financial year, in case your company has configured a financial year.

You can change the displayed year.

- Required permission: `view_reporting` and `view_other_timesheet` and `view_other_reporting`

## Projects

### Project overview

Display a reporting of all projects (you have access to) which summed up times and money, budget and time-budget progress bars,
links to invoice and export screen.

You can change the customer to filter the project list and decide to include projects without budgets and projects without recorded times.

- Required permission: `view_reporting` and `budget_project`

### Project details

Shows all kind of reports for the selected project and sums up the times grouped by various characteristics.

### Monthly report

Display a summary of all projects that are (or were) visible and active for the selected month.

You can change the month which is used to filter the projects.

The displayed values are shown for the selected month:
- monthly budget shows the progressbar of logged time for the selected month
- projects with a regular (full-time) budget show the state for the end of the selected month (so you can see the budget history)
- working hours and revenue are shown for the selected month
- the billable percentage is calculated from the values of the selected month

- Required permission: `view_reporting` and `budget_project`

### Inactive projects

Display a reporting of all inactive projects, layout is the same as the `Project overview` report.

You can change the date that is used to filter inactive projects (date since last timesheet was recorded).

- Required permission: `view_reporting` and `budget_project`
