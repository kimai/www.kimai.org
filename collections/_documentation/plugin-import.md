---
title: Importer
description: Import CSV and JSON data into Kimai 
---

{% include plugins/importer.md %}

## Customer

Customers will not be updated, if you import the same file multiple-times, you will end up with several customers with the same name.
You will have to delete the imported customers if you plan to re-import a file.

Supported attributes (field names are case-insensitive):

| Customer attribute | Supported field names |  
|--------------------|-----------------------|
| Name               | customer, name        |
| Account            | account               |
| Company name       | company               |
| Description        | description           |
| E-Mail             | email                 |
| Country            | country               |
| Vat-ID             | tax                   |
| Address            | address               |
| Contact            | contact               |
| Currency           | currency              |
| Timezone           | timezone              |
| Phone              | phone                 |
| Mobile             | mobile                | 
| Fax                | fax                   |
| Homepage           | homepage              |
| Color              | color                 |
| Budget             | budget                |
| Time budget        | timebudget            |
| Budget type        | budgettype            |
| Visible            | visible               |
| Meta fields        | meta.xxx              |
{: .table }

### Example

A minimum CSV file (using semicolon as delimiter):
```csv
Name;Company
Acme,Acme university Ltd.
```

A multi column-example:

```csv
Name,Company,Account,Description,Phone,Timezone,Meta.XYZ
Acme,Acme university Ltd.,12367800,A longer comment to talk about the project,0011234567890,Europe/Berlin,hello foo 123
```

## Projects

Projects will not be updated, if you import the same file multiple-times, you will end up with several projects with the same name and customer.
You will have to delete the imported projects if you plan to re-import a file.

Supported attributes (field names are case-insensitive):

| Project attribute | Supported field names |  
|-------------------|-----------------------|
| Name              | project, name         |
| Customer name     | customer              |
| Description       | description           |
| End date          | enddate               |
| Start date        | startdate             |
| Order number      | ordernumber           | 
| Order date        | orderdate             |
| Color             | color                 |
| Budget            | budget                |
| Time budget       | timebudget            |
| Budget type       | budgettype            |
| Visible           | visible               |
| Meta fields       | meta.xxx              |
{: .table }

### Example

A minimum CSV example file (using semicolon as delimiter):
```csv
Name;Customer
Test project;Test customer
```

A multi column-example:

```csv
Name,Customer,Description,OrderNumber,OrderDate,Meta.XYZ
My great project,Acme university,A longer comment to talk about the project,1234567890,2019-08-29,hello foo 123
```

## Timesheets

This will import timesheets and create these elements on the fly:
- missing customer
- missing projects
- missing activities
- missing tags
- missing users

| Attribute    | Required | Supported field names | Description                                                                             |
|--------------|----------|-----------------------|-----------------------------------------------------------------------------------------|
| Date         | x        |                       | Date in the format: `YYYY-MM-DD`                                                        |
| From         | x        |                       | Start time in the format: `HH:MM:SS`                                                    |
| To           | x        |                       | End time in the format: `HH:MM:SS`                                                      |
| User         | x        |                       | Username                                                                                |
| Email        | x        |                       | User email                                                                              |
| Project      | x        |                       | Name of the project as string                                                           |
| Customer     | x        |                       | Name of the customer as string                                                          |
| Activity     | x        |                       | Name of the activity as string                                                          |
| Duration     |          |                       | Timesheet duration in seconds (if skipped, will be calculated from start and end times) |
| Tags         |          |                       | Comma separated list of tag-names                                                       |
| Exported     |          |                       | Whether the timesheet should be marked as exported or not (supported values: 1 or 0)    |
| Rate         |          |                       | The rate as a float without currency                                                    |
| HourlyRate   |          |                       | The hourly rate as a float without currency                                             |
| InternalRate |          |                       | The internal rate as a float without currency                                           |
| FixedRate    |          |                       | The fixed rate as a float without currency                                              |
| Billable     |          |                       | Whether the entry should be marked as billable or not (supported values: 1 or 0)        |
| Description  |          |                       | Description of the entry as string                                                      |
{: .table }

### User handling

If Kimai creates new users on the fly, make sure that you configured the default timezone for new users at [System > Settings]({% link _documentation/configurations.md %}) before the import.
The user timezone is used when importing the timesheets. 
If you import users from different timezones, you need to create the users upfront manually.

### Example

```csv
"Date","From","To","Duration","Rate","User","Email","Customer","Project","Activity","Description","Exported","Tags","Hourly rate","Fixed rate"
"2020-05-04","15:50:00","17:51:00","7260","231.92","John Smith","user@example.com","Customer LLC","My project", "Testing","some work has been done","0","foo,bar","115.00","0"
```

- Date: format `Y-m-d`
- From and To: should be given in 24h format
- Duration: in seconds
- Rate: A floating number of the rate without currency (optional, otherwise Kimai tries to calculate it) e.g. 123.50€ = "123.50"
- Hourly Rate: A floating number for the hourly rate (optional, otherwise Kimai tries to calculate it)
- Fixed Rate: A floating number for the fixed rate of this record (optional)
- Customer, Project and Activity: will be matched by name
- User: will be matched by username or email
- Exported: can be `0` or `1` (0 = new, 1 = exported)
- Tags: comma separated list of tag names

## Clockify (Timesheet)

Want to switch from Clockify to Kimai? Export the data in Clockify, open it in Excel and export it as CSV file.

The following CSV structure is expected. Import will not work if one of these columns is missing:

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

The following CSV structure is expected. Import will not work if one of these columns is missing:

| Field name    | Description                                                                                               |
|---------------|-----------------------------------------------------------------------------------------------------------|
| User          | Users name                                                                                                |
| Email         | Users email                                                                                               |
| Client        | Customer name                                                                                             |
| Project       | Project name                                                                                              |
| Task          | Activity name                                                                                             |
| Description   | Timesheet description                                                                                     |
| Billable      | Whether the timesheet is billable. Possible values: Yes/No                                                |
| Start date    | Start date of the timesheet, e.g. 2024-04-20                                                              |
| Start time    | Start time of the timesheet, e.g. 16:30:00                                                                |
| End date      | End date of the timesheet, e.g. 2022-07-27                                                                |
| End time      | End time of the timesheet, e.g. 21:00:00                                                                  |
| Duration      | The timesheet duration, e.g. 04:30:00                                                                     |
| Tags          | Comma separated list of tag-names                                                                         |
| Amount (XXX)  | Timesheet total rate. XXX = currency (which is not imported, but needs to be configured for the customer) |
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

| Permission Name | Description                                           |
|-----------------|-------------------------------------------------------|
| importer        | access the administration screen to import CSV files  |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include snippets/store-howto-permissions.md %}
