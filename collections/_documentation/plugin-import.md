---
title: Importer
description: Import CSV and JSON data into Kimai 
---

{% include plugins/importer.md %}

Attributes names are case-sensitive, and fields with a ✅ are mandatory.

Examples are included within the plugin and can be downloaded from the importer screen.

## Customer

Customers will not be updated, if you import the same file multiple-times, you will end up with several customers with the same name.
You will have to delete the imported customers if you plan to re-import a file.

| Attribute   | Description                                                                     |
|-------------|---------------------------------------------------------------------------------|
| Customer ✅  | Customer name (alternative attribute name: `Name`)                              |
| Account     | Account/Customer number  (alternative attribute name: `CustomerNumber`)         |
| Company     | Company name                                                                    |
| Description | Description                                                                     |
| Country     | Country                                                                         |
| Tax         | Vat-ID                                                                          |
| Address     | Address                                                                         |
| Email       | E-Mail                                                                          |
| Contact     | Contact                                                                         |
| Currency    | Currency                                                                        |
| Timezone    | Timezone                                                                        |
| Phone       | Phone                                                                           |
| Mobile      | Mobile                                                                          |
| Fax         | Fax                                                                             |
| Homepage    | Homepage                                                                        |
| Color       | Color                                                                           |
| Budget      | Budget                                                                          |
| TimeBudget  | Time budget                                                                     |
| BudgetType  | Budget type                                                                     |
| Visible     | Whether the customer is visible or not (supported values: `1` or `0`)           |
| meta.xxx    | Custom fields, e.g. `meta.foo` for a custom field with the internal name `foo`  |
{: .table }

## Projects

Projects will not be updated, if you import the same file multiple-times, you will end up with several projects with the same name and customer.
You will have to delete the imported projects if you plan to re-import a file.

| Attribute     | Description                                                                    |
|---------------|--------------------------------------------------------------------------------|
| Project ✅     | Project name (alternative attribute name: `Name`)                              |
| Customer ✅    | Customer name                                                                  |
| Description   | Description                                                                    |
| EndDate       | End date                                                                       |
| StartDate     | Start date                                                                     |
| OrderNumber   | Order number                                                                   |
| ProjectNumber | Project number                                                                 |
| OrderDate     | Order date                                                                     |
| Color         | Color                                                                          |
| Budget        | Budget                                                                         |
| TimeBudget    | Time budget                                                                    |
| BudgetType    | Budget type                                                                    |
| Visible       | Whether the project is visible or not (supported values: `1` or `0`)           |
| meta.xxx      | Custom fields, e.g. `meta.foo` for a custom field with the internal name `foo` |
{: .table }

## Timesheets

This will import timesheets and create these elements on the fly:
- missing customer
- missing projects
- missing activities
- missing tags
- missing users

| Attribute    | Description                                                                                                        |
|--------------|--------------------------------------------------------------------------------------------------------------------|
| Date ✅       | Date in the format: `YYYY-MM-DD` (e.g. `2020-05-04`)                                                               |
| From ✅       | Start time in the format: `HH:MM:SS` (24 hour format, e.g. `15:50:00`)                                             |
| To ✅         | End time in the format: `HH:MM:SS` (24 hour format, e.g. `17:21:44`)                                               |
| Email ✅      | User email (Kimai will try to match by email first)                                                                |
| User ✅       | User-Identifier (will be used if `Email` does not match                                                            |
| Project ✅    | Name of the project as string                                                                                      |
| Customer ✅   | Name of the customer as string                                                                                     |
| Activity ✅   | Name of the activity as string                                                                                     |
| Username     | Alias of the user                                                                                                  |
| Duration     | Timesheet duration in seconds (will be calculated from start and end time if not given)                            |
| Tags         | Comma separated list of tag-names                                                                                  |
| Exported     | Whether the timesheet should be marked as exported or not (supported values: `1` means exported and `0` means new) |
| Rate         | The rate as a float without currency (will be calculated if not given, e.g. `123.50€` = `123.50`)                  |
| HourlyRate   | The hourly rate as a float without currency (will be calculated if not given, e.g. `123.50€` = `123.50`)           |
| InternalRate | The internal rate as a float without currency (will be calculated if not given, e.g. `123.50€` = `123.50`)         |
| FixedRate    | The fixed rate as a float without currency                                                                         |
| Billable     | Whether the entry should be marked as billable or not (supported values: `1` or `0`)                               |
| Description  | Description of the entry as string                                                                                 |
| Break        | Duration of the pause in seconds                                                                                   |
| meta.xxx     | Custom fields, e.g. `meta.foo` for a custom field with the internal name `foo`                                     |
{: .table }

### User handling

If Kimai creates new users on the fly, make sure that you configured the default timezone for new users at [System → Settings]({% link _documentation/configurations.md %}) before the import.
The user timezone is used when importing the timesheets. 
If you import users from different timezones, you need to create the users upfront manually.

## Clockify (Timesheet)

Want to switch from Clockify to Kimai? Export the data in Clockify, open it in Excel and export it as CSV file.

The following CSV structure is expected, each column is ✅ mandatory. Import will not work if one of these columns is missing:

| Field name            | Description                                                                                                |
|-----------------------|------------------------------------------------------------------------------------------------------------|
| Project               | Project name                                                                                               |
| Client                | Customer name                                                                                              |
| Description           | Timesheet description                                                                                      |
| Task                  | Activity name                                                                                              |
| User                  | Users name                                                                                                 |
| Group                 | not yet supported                                                                                          |
| Email                 | Users email                                                                                                |
| Tags                  | Comma separated list of tag-names                                                                          |
| Billable              | Whether the timesheet is billable. Possible values: Yes/No                                                 |
| Start Date            | Start date of the timesheet, e.g. 7/27/22                                                                  |
| Start Time            | Start time of the timesheet, e.g. 1:00 PM                                                                  |
| End Date              | End date of the timesheet, e.g. 2022-07-27                                                                 |
| End Time              | End time of the timesheet, e.g. 21:00                                                                      |
| Duration (h)          | ignored: instead the field "Duration (decimal)" is used                                                    |
| Duration (decimal)    | The timesheet duration                                                                                     |
| Billable Rate (XXX)   | Timesheet hourly rate. XXX = currency (which is not imported, but needs to be configured for the customer) |
| Billable Amount (XXX) | Timesheet total rate. XXX = currency (which is not imported, but needs to be configured for the customer)  |
{: .table }

**BE AWARE** you have to choose the correct date-format in Clockify, otherwise you will see errors like:
```
Failed to parse time string (14/04/2023 9:00) at position 0 (1): Unexpected character
```

## toggl track (Timesheet)

Want to switch from Toggl Track to Kimai? Export the data in toggl as CSV file.

The following CSV structure is expected, each column is ✅ mandatory. Import will not work if one of these columns is missing:

| Field name   | Description                                                                                               |
|--------------|-----------------------------------------------------------------------------------------------------------|
| User         | Users name                                                                                                |
| Email        | Users email                                                                                               |
| Client       | Customer name                                                                                             |
| Project      | Project name                                                                                              |
| Task         | Activity name                                                                                             |
| Description  | Timesheet description                                                                                     |
| Billable     | Whether the timesheet is billable. Possible values: Yes/No                                                |
| Start date   | Start date of the timesheet, e.g. 2024-04-20                                                              |
| Start time   | Start time of the timesheet, e.g. 16:30:00                                                                |
| End date     | End date of the timesheet, e.g. 2022-07-27                                                                |
| End time     | End time of the timesheet, e.g. 21:00:00                                                                  |
| Duration     | The timesheet duration, e.g. 04:30:00                                                                     |
| Tags         | Comma separated list of tag-names                                                                         |
| Amount (XXX) | Timesheet total rate. XXX = currency (which is not imported, but needs to be configured for the customer) |
{: .table }

**BE AWARE** you have to choose the correct date-format in toggl, otherwise you will see errors like:
```
Failed to parse time string (14/04/2023 9:00) at position 0 (1): Unexpected character
```

{% include docs-image.html src="/images/documentation/toggl-export.webp" title="Exporting timesheet with toggl track" width="800px" %}

## Grandtotal (Customer)

There is a [plugin for Mac invoicing software Grandtotal]({% link _store/keleo-grandtotal-plugin-for-kimai.md %}), which adds support for Kimai.

In case your leading system for customers is Grandtotal, you can import customers from a Grandtotal CSV export into Kimai.
Grandtotal calls CSV exports `Numbers` in the export screen.

Attention: Grandtotal exports its data with column names in the UI language (just like Kimai).
Kimai only supports imports for GT exports from the languages english and german, so you might have to change it in `Settings / Languages / User interface`.

## Permissions

{% include documentation/permissions.md id="importer" howto=true super_admin=true %}
