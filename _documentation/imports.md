---
title: Importing data
description: Importing data into Kimai, migrating from another system
toc: true
since_version: 1.6
---

## Importing from Kimai v1

There is a dedicated chapter about [migrating data from Kimai v1]({% link _documentation/migration-v1.md %}).

## Importing projects

This will import projects and create missing customers on the fly.

An empty team (with the projects name) can be created for each project, therefor the `teamlead` options needs to be set.
These teams will be assigned to the projects, but not to the customers. 

```bash
bin/console kimai:import:customer --teamlead=anna_admin --delimiter=";" --comment="" ~/Downloads/import-customers.csv
```

### All options

You can see all option by calling `bin/console kimai:import:customer --help` which will show:

```bash
Description:
  Import projects from CSV file

Usage:
  kimai:import:customer [options] [--] <file>

Arguments:
  file                         The CSV file to be imported

Options:
      --teamlead=TEAMLEAD      If you want to create empty teams for each project, give the username of the teamlead to be assigned
      --delimiter[=DELIMITER]  The CSV field delimiter [default: ","]
      --comment[=COMMENT]      A description to be added to created customers and projects. %s will be replaced with the current datetime [default: "Imported at %s"]

Help:
  This command allows to import projects from a CSV file, creating customers (if not existing) and optional empty teams for each project.
  Imported customer will be matched by name and optionally created on the fly.
  Required column names: Name, Customer
  Supported column names: Name, Customer, Comment, OrderNumber, OrderDate
```

Minimum content for a CSV file (using the delimiter `;`):

```
Name;Customer
Project name;Customer name
```

Full content for a CSV file (using default delimiter `,`):

```
Name,Customer,Comment,OrderNumber,OrderDate
Project name,Customer name,a longer comment,1234567890,2019-08-29
```

## Importing timesheets

This will import timesheets and create on the fly:
- missing customer
- mising projects
- missing activities

Users have to be existing before (mainly because the users timezone setting is used to import the timesheets).

```bash
bin/console kimai:import:timesheet --timezone=UTC --activity=global --delimiter=";" --customer="Imported customer" ~/Downloads/import-timesheets.csv
```

### All options

You can see all option by calling `bin/console kimai:import:timesheet --help` which will show:

```bash
Description:
  Import timesheets from CSV file

Usage:
  kimai:import:timesheet [options] [--] <file>

Arguments:
  file                         The CSV file to be imported

Options:
      --timezone[=TIMEZONE]    The timezone to be used. Supports: "valid timezone names", the string "user" (using the configured users timezone) and the string "server" (PHP default timezone) [default: "user"]
      --customer[=CUSTOMER]    A customer ID or name to assign for empty entries. Defaults to creating a new customer which is used for all un-linked projects
      --activity[=ACTIVITY]    Whether new activities should be "global" or "project" specific. Allowed values are "global" and "project" [default: "project"]
      --delimiter[=DELIMITER]  The CSV field delimiter [default: ","]
      --begin[=BEGIN]          Default begin if none was provided in the format HH:MM [default: "00:00"]
      --comment[=COMMENT]      A description to be added to created customers, projects and activities. %s will be replaced with the current datetime [default: "Imported at %s"]

Help:
  This command allows to import timesheets from a CSV file, which are formatted like CSV exports.
  Imported customer, projects and activities will be matched by name.
  Supported columns names: Date, From, To, Duration, Rate, User, Customer, Project, Activity, Description, Exported, Tags, Hourly rate, Fixed rate
```

## Links

There is also a user contributed plugin for importing CSV data, which can be found here:
[https://github.com/neontribe/KimaiCvsImportBundle](https://github.com/neontribe/KimaiCvsImportBundle)
