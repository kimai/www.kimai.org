---
title: Importer
description: Import CSV and JSON data into Kimai 
---

{% include plugins/importer.md %}

### Importing from Kimai v1

There is a dedicated chapter about [migrating data from Kimai v1]({% link _documentation/migration-v1.md %}).

### Customer

Supported attributes (field names are case-insensitive):

| Customer attribute | Supported field names                                  |  
|--------------------|--------------------------------------------------------|
| Name               | project, projectname, project name, project-name, name |
| Account            | number, account, customer number, customer account     |
| Company name       | company, company name, company-name                    |
| Description        | description, comment                                   |
| E-Mail             | email, e-mail, e mail                                  |
| Country            | country                                                |
| Vat-ID             | vat, vat-id, vat id, tax-id, tax id                    |
| Address            | address                                                |
| Contact            | contact                                                |
| Currency           | currency                                               |
| Timezone           | timezone                                               |
| Phone              | phone                                                  |
| Mobile             | mobile                                                 | 
| Fax                | fax                                                    |
| Homepage           | homepage                                               |
| Color              | color                                                  |
| Budget             | budget                                                 |
| Time budget        | time budget, time-budget                               |
| Visible            | visible                                                |
| Meta fields        | meta.xxx                                               |

#### Example

A minimum CSV file (using semicolon as delimiter):
```csv
Name;Company
Acme,Acme university Ltd.
```

A multi column-example:

```csv
Name,Company,Number,Comment,Phone,Timezone,Meta.XYZ
Acme,Acme university Ltd.,12367800,A longer comment to talk about the project,0011234567890,Europe/Berlin,hello foo 123
```

### Projects

Supported attributes (field names are case-insensitive):

| Project attribute | Supported field names                                  |  
|-------------------|--------------------------------------------------------|
| Name              | project, projectname, project name, project-name, name |
| Customer name     | customer, customername, customer-name, customer name   |
| Description       | description, comment                                   |
| Order number      | ordernumber, order-number, order number                | 
| Order date        | orderdate, order-date, order date                      |
| Color             | color                                                  |
| Budget            | budget                                                 |
| Time budget       | time budget, time-budget                               |
| Visible           | visible                                                |
| Meta fields       | meta.xxx                                               |

#### Example

A minimum CSV example file (using semicolon as delimiter):
```csv
Name;Customer
Test project;Test customer
```

A multi column-example:

```csv
Name,Customer,Comment,OrderNumber,OrderDate,Meta.XYZ
My great project,Acme university,A longer comment to talk about the project,1234567890,2019-08-29,hello foo 123
```

### Timesheets

This will import timesheets and create these elements on the fly:
- missing customer
- missing projects
- missing activities

Users need to exist before (mainly because the user timezone setting will be used to import the timesheets).

#### Example

```csv
"Date","From","To","Duration","Rate","User","Customer","Project","Activity","Description","Exported","Tags","Hourly rate","Fixed rate"
"2020-05-04","15:50","17:51","7260","231.92","user@example.com","Customer LLC","My project", "Testing","some work has been done","0","foo,bar","115.00","0"
```

- Date: format `Y-m-d`
- From and To: should be given in 24h format
- Duration: in seconds
- Rate: A floating number of the records rate (optional, if you don't set the value it will be calculated)
- Hourly Rate: A floating number for the hourly rate (optional, if you don't set the value it will be calculated)
- Fixed Rate: A floating number for the fixed rate of this record (optional, you can skip this column)
- Customer, Project and Activity: will be matched by name
- User: will be matched by username or email
- Exported: can be `0` or `1` (0 = new, 1 = exported)
- Tags: comma separated list of tag names

### Customer from Grandtotal

There is a [plugin for Mac invoicing software Grandtotal]({% link _store/keleo-grandtotal-plugin-for-kimai.md %}), which adds support for Kimai.

In case your leading system for customers is Grandtotal, you can import customers from a Grandtotal CSV export into Kimai.
Grandtotal calls CSV exports `Numbers` in the export screen.

Attention: Grandtotal exports its data with column names in the UI language (just like Kimai).
Kimai only supports imports for GT exports from the languages english and german, so you might have to change it in `Settings / Languages / User interface`.
