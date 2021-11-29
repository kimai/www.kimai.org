---
title: Timesheet
description: View and manage your time-tracking data in the timesheet view
toc: true
canonical: /documentation/timesheet.html
related:
  - rates
  - calendar
  - weekly-times
redirect_from: 
  - /documentation/manual/timesheet.html
  - /documentation/timesheet/
---

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

## Duration format

{% include duration_format.md %}

Please note:
- using `0` or `00:00` as duration will also stop the entry with a duration of zero seconds
- to create a running entry the `end` and `duration` field needs to be empty

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
