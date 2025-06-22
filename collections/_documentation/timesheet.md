---
title: Timesheet
description: View and manage your time-tracking data in the timesheet view
canonical: /documentation/timesheet.html
related:
  - rates
  - calendar
  - weekly-times
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

Kimai has a few rules in place, which could prevent to stop a running timesheet, e.g.:

- prevent excessive long timesheets from being accidentally created
- prevent a timesheet to be stopped before it was started, which can happen if you create a running timesheet with a start date in the future

When a user tries to stop such a timesheet, a warning like one of the following will be shown:

- `End date must not be earlier then start date`
- `An empty duration is not allowed`
- `Maximum 08:00 hours allowed`

{% include docs-image.html src="/images/documentation/timesheet/timesheet-excessive-duration.webp" title="How such a warning will look like" width="350px" %}

You have several options to solve this problem. 
All of them involve that you switch to `My times` and find the record (usually the last one created):

- Edit the record and set a different start date
- Edit the record and set a different end date
- Edit the record and set a shorter duration
- Delete the record from the listing

An administrator can fix the problem by opening the `All times` view and filtering the user.

Administrators can also configure the duration for this check or deactivate it entirely at [System > Settings > Timesheet]({% link _documentation/configurations.md %}).

## Batch update

You can change many timesheets at once, by using the "Batch update mode". 
First use the search to filter the correct results (tip: increase page size to see everything on one page).

Now click the checkbox in the top left corner of the results list to select all records (or select individual records if you only want to change a few).
Scroll down to the bottom of the table where the new "Batch Mode" buttons appeared. 
Click "Edit" and confirm that you want to edit all the selected records.

You will see a new "Batch Update" page with various options to update all the selected timesheets.

## Time input

The `begin` and `end` time input fields accept various formats, to allow correct and also speed typing.

- Leave the `end` field empty, if you want to record a duration greater than 24:00 hours
- Conversion between 12 and 24 hour format happens automatically when leaving the field

Here are some examples of valid user inputs and how Kimai will interpret them:

| User Input | Result 12-hour       | Result 24-hour |
|------------|----------------------|----------------|
| 0          | 12:00 AM             | 0:00           |
| 7          | 7:00 AM              | 7:00           |
| 12         | 12:00 PM             | 12:00          |
| 17         | 5:00 PM              | 17:00          |
| 545        | 5:45 AM              | 5:45           |
| 1645       | 4:45 PM              | 16:45          |
| 845am      | 8:45 AM              | 8:45           |
| 1245pm     | 12:45 PM             | 12:45          |
| 1245 pm    | 12:45 PM             | 12:45          |
| 12:45 pm   | 12:45 PM             | 12:45          |
| 13:45 PM   | 1:45 PM              | 1:45           |
| 13:45 AM   | 1:45 PM              | 13:45          |
| 1045       | 10:45 AM             | 10:45          |
| 2:15       | 2:15 AM              | 2:15           |
| 13:15      | 1:15 PM              | 13:15          |
| 2:15 PM    | 2:15 PM              | 14:15          |
| 2:15 AM    | 2:15 PM              | 2:15           |
| :          | 12:00 AM             | 0:00           |
| :1         | 12:01 AM             | 0:01           |
| 1:1        | 1:01 AM              | 1:01           |
| 19:1       | 7:01 PM              | 19:01          |
| :1 PM      | 12:01 PM             | 12:01          |
| 0:1pm      | 12:01 PM             | 12:01          |
{: .table }

## Duration

The `duration` field provides several easy ways to change its value, the most obvious one being the dropdown next to it. 

**Important**

- Using `0` or `00:00` as duration will stop the entry with a duration of zero seconds
- To create a running entry the `end` and `duration` field needs to be empty

**Change the duration**

The `duration` field can be changed by using your keyboard:

- `ArrowUp` key to increase the duration either 5 minutes or 1 hour, depending on the cursor position
- `ArrowDown` key to decrease the duration either 5 minutes or 1 hour, depending on the cursor position
- `PageUp` key to increase the duration by 1 hour
- `PageDown` key to decrease the duration by 1 hour
- `Home` key to set the duration to 00:00
- `End` key to set the duration to 08:00

**Input format** 

Please read the full documentation about accepted inputs for the [duration format]({% link _documentation/duration-format.md %}).

Short version: 
- The main format is `time span`, as example `2:30`
- The other option is `decimal input` where a value like `2.5` will be converted to `2:30`
- You can also use `time periods` format, where `2h30m`  will be converted to `2:30` 

## Exported records

Exported records will be locked to prevent manipulation of cleared data.

The [permission]({% link _documentation/permissions.md %}) `edit_exported_timesheet` does allow editing and deletion of these
locked entries nevertheless, which by default is given to users with `ROLE_ADMIN` and `ROLE_SUPER_ADMIN`.

The export state can be set manually or via the [invoice]({% link _documentation/invoices.md %}) and [export]({% link _documentation/export.md %}) screens.

## Billable vs. not billable

You can define whether a timesheet record is billable or not.

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

{% include snippets/search-custom-field.md %}

## Permissions

{% include documentation/permissions.md id="timesheet" title=true %}
{% include documentation/permissions.md id="timesheet_own" title=true %}
{% include documentation/permissions.md id="timesheet_other" title=true howto=true %}
