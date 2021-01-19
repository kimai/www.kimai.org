---
title: Importing data
description: Importing data into Kimai, migrating from another system
toc: true
since_version: 1.6
---

## Importing from Kimai v1

There is a dedicated chapter about [migrating data from Kimai v1]({% link _documentation/migration-v1.md %}).

## Importing customer

The `kimai:import:customer` command will import customer.

```bash
bin/console kimai:import:customer customer.csv
```

Supported attributes (field names are case-insensitive):

| Customer attribute | Supported field names                                     |  
| -----------------  | --------------------------------------------------------- |
| Name               | project, projectname, project name, project-name, name    |
| Account            | number, account, customer number, customer account        |
| Company name       | company, company name, company-name                       |
| Description        | description, comment                                      |
| E-Mail             | email, e-mail, e mail                                     |
| Country            | country                                                   |
| Vat-ID             | vat, vat-id, vat id, tax-id, tax id                       |
| Address            | address                                                   |
| Contact            | contact                                                   |
| Currency           | currency                                                  |
| Timezone           | timezone                                                  |
| Phone              | phone                                                     |
| Mobile             | mobile                                                    | 
| Fax                | fax                                                       |
| Homepage           | homepage                                                  |
| Color              | color                                                     |
| Budget             | budget                                                    |
| Time budget        | time budget, time-budget                                  |
| Visible            | visible                                                   |
| Meta fields        | meta.xxx                                                  |

### Options

Possible options:
- `--importer=default` - the importer to use (supported: default, grandtotal) - default: default
- `--reader=csv` - the reader to use (supported: csv, csv-semicolon) - default: csv
- `--no-update` - if you want to create new customer, but not update existing ones

You can see all option by calling `bin/console kimai:import:customer --help`.

### Example 

Import a minimum CSV example file (using semicolon as delimiter) with: 
```bash
bin/console kimai:import:customer customer.csv --reader=csv-semicolon
```

The `customer.csv` file:
```
Name;Company
Acme,Acme university Ltd.
```

A multi column-example, which will leave existing customers alone during import:

```bash
bin/console kimai:import:customer customer.csv --reader=csv --no-update
```

The `customer.csv` file:
```
Name,Company,Number,Comment,Phone,Timezone,Meta.XYZ
Acme,Acme university Ltd.,12367800,A longer comment to talk about the project,0011234567890,Europe/Berlin,hello foo 123
```

### Via Grandtotal

There is a [plugin for Mac invoicing software Grandtotal]({% link _store/keleo-grandtotal-plugin-for-kimai.md %}), which adds support for Kimai.

In case your leading system for customers is Grandtotal, you can import customers from a Grandtotal CSV export into Kimai.
Grandtotal calls CSV exports `Numbers` in the export screen. 

```bash
bin/console kimai:import:customer grandtotal.csv --reader=csv-semicolon --importer=grandtotal
```

Attention: Grandtotal exports its data with column names in the UI language (just like Kimai). 
Kimai only supports imports for GT exports from the languages english and german, so you might have to change it in `Settings / Languages / User interface`.

## Importing projects

The `kimai:import:project` command will import projects and create missing customers on the fly.

An empty team (with the projects name) can be created for each project, in which case the `teamlead` options needs to be set.

```bash
bin/console kimai:import:project project.csv
```

Supported attributes (field names are case-insensitive):

| Project attribute | Supported field names                                     |  
| ----------------- | --------------------------------------------------------- |
| Name              | project, projectname, project name, project-name, name    |
| Customer name     | customer, customername, customer-name, customer name      |
| Description        | description, comment                                      |
| Order number      | ordernumber, order-number, order number                   | 
| Order date        | orderdate, order-date, order date                         |
| Color             | color                                                     |
| Budget            | budget                                                    |
| Time budget       | time budget, time-budget                                  |
| Visible           | visible                                                   |
| Meta fields       | meta.xxx                                                  |

### Options

Possible options:
- `--importer=default` -  the importer to use (supported: default) - default: default
- `--reader=csv` - the reader to use (supported: csv, csv-semicolon) - default: csv
- `--teamlead=USERNAME` - if you want to create empty teams for each project pass an existing username for the new teamlead (teams will be assigned to the projects, but not to the customers)
- `--no-update` - if you want to create new projects, but not update existing ones

You can see all option by calling `bin/console kimai:import:project --help`.

### Example

Import a minimum CSV example file (using semicolon as delimiter) with: 
```bash
bin/console kimai:import:project project.csv --reader=csv-semicolon
```

The `project.csv` file:
```
Name;Customer
Test project;Test customer
```

A multi column-example, creating teams for new projects and leaving existing projects alone will be imported with:

```bash
bin/console kimai:import:project project.csv --reader=csv --teamlead=anna_admin --no-update
```

The `project.csv` file:
```
Name,Customer,Comment,OrderNumber,OrderDate,Meta.XYZ
My great project,Acme university,A longer comment to talk about the project,1234567890,2019-08-29,hello foo 123
```

## Importing timesheets

This will import timesheets and create these elements on the fly:
- missing customer
- missing projects
- missing activities

Users need to exist before (mainly because the user timezone setting will be used to import the timesheets).

```bash
bin/console kimai:import:timesheet --timezone=UTC --activity=global --delimiter=";" --customer="Imported customer" ~/Downloads/import-timesheets.csv
```

### Options

You can see all option by calling `bin/console kimai:import:timesheet --help`.

### Example

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


## Links

There is also a user contributed plugin for importing CSV data, which can be found here:
[https://github.com/neontribe/KimaiCvsImportBundle](https://github.com/neontribe/KimaiCvsImportBundle)
