---
title: Customer Portal
description: Share client and project statistics and timesheets with anyone using a secret URL, optionally password protected.
---

## Sharing customer data

Sharing a customer shows all recorded timesheets.

In addition, a table of all projects is displayed, which shows the project name and budget statistics.
The project statistics are only displayed if the customer statistics are active.

You can activate the following options to show further customer details:

- Timesheets
  - Name of the user
  - Rate (hourly rate, total rate)
- Chart options
  - Annual chart (chart with month comparison by selected year)
  - Monthly chart (chart with day comparison by selected month)
- Statistics
  - Budget statistics
  - Time-Budget

## Sharing project data

Sharing a project shows all recorded timesheets.

You can activate the following options to show further details:

- Timesheets
  - Name of the user
  - Rate (hourly rate, total rate)
- Chart options
  - Annual chart (chart with month comparison by selected year)
  - Monthly chart (chart with day comparison by selected month)
- Statistics
  - Budget statistics
  - Time-Budget
  
## Merging records

Define whether and how to merge records of a day:

- No merging: shows all records as single line
- Merge all records and show the descriptions of all entries
- Merge all records and show the description of the first entry
- Merge all records and show the description of the last entry

## Password protection

You can protect a shared URL by setting a password. 

In that case the user has to enter the password before being able to see the shared data.

## Changing the language

The shared URL contains as first part of the URL the language code, e.g. `/en/auth/customer-portal/0123456789`, which is used to display the content.
You can change the language (here `/en/`) to your required wished language, e.g. `/de/` for German, `/es/` for Spanish, `/fr/` for French and so on ...

## Permissions

{% include documentation/permissions-customer-portal.md %}

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include snippets/store-howto-permissions.md %}
