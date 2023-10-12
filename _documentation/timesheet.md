---
title: Timesheet
description: View and manage your time-tracking data in the timesheet view
canonical: /documentation/timesheet.html
related:
  - rates
  - calendar
  - weekly-times
redirect_from: 
  - /documentation/manual/timesheet.html
  - /documentation/timesheet/
  - /v1/timesheet.html
---

## Starting and stopping records

### Re-start timesheet records
- Click one of your **last activities** in the modal, opened through the upper toolbar - this will start a record for the same customer/project & activity "now"
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

#### Problem: cannot be stopped

Kimai has rules in place, to prevent excessive long timesheets from being accidentally created.

When a user tries to create such a timesheet, or tries to stop such a timesheet, a warning will be shown:

![Screenshot](/images/documentation/timesheet/timesheet-excessive-duration.jpg "How such a warning will look like"){:height="250px"}

You have several options to solve this problem. 
All of them involve that the user opens the timesheet listing and finds the record (usually the last one created):

- Edit the record and set a different start date
- Edit the record and set a different end date
- Edit the record and set a shorter duration
- Delete the record from the listing

An administrator can fix the problem by opening the `All times` view and filtering the user.

Administrators can also configure the duration for this check or deactivate it entirely at [System > Settings > Timesheet]({% link _documentation/configurations.md %}).

## Duration format

Please read the full documentation about accepted inputs for the [duration format]({% link _documentation/duration-format.md %}).

Important:
- using `0` or `00:00` as duration will also stop the entry with a duration of zero seconds
- to create a running entry the `end` and `duration` field needs to be empty

## Exported records

Exported records will be locked to prevent manipulation of cleared data.

The [permission]({% link _documentation/permissions.md %}) `edit_exported_timesheet` does allow editing and deletion of these
locked entries nevertheless, which by default is given to users with `ROLE_ADMIN` and `ROLE_SUPER_ADMIN`.

The export state can be set manually or via the [invoice]({% link _documentation/invoices.md %}) and [export]({% link _documentation/export.md %}) screens.

## Billable vs. not billable

Since version 1.14 you can define whether a timesheet record is billable or not.

Non-billable timesheets are excluded from [invoices]({% link _documentation/invoices.md %}) and budget calculations.

Please read the [billable documentation]({% link _documentation/billable.md %}) to understand the `billable` flag.

## Filter and search

The search supports filtering by the fields:
- `user` (only in team timesheets)
- `daterange`
- `customer`
- `project`
- `activity`
- `tags`
- `state` (running / stopped)

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `description`

{% include documentation/search-custom-field.md %}
