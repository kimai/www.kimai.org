---
title: Customer
description: Customers in Kimai
toc: true
---

Customers in Kimai are used to manage project and activities, which are then used for time-records.

It is common practice to have a customer for your own company, to track times for administration and other internal work.
 
## Creating customer

Default values for new customers can be configured at [System > Settings]({% link _documentation/configurations.md %}). 

## Customer colors

Each customer can be assigned its own color, for easier identification in the timesheets.

If a project or an activity linked to the customer does not have its own color, the customers color will be used.
The default color code is `#d2d6de`.

## Currency

The customers currency is used when displaying the recorded entries in the timesheets.

It is also used for printing invoices, which is the reason while the invoice screen needs one applied customer filter 
before any data will be shown. 

## Budgets

{% include budgets.md permission="customer" %} 

## Rates

{% include rates.md permission="customer" %} 

## Visibility

By toggling the visibility on a customer, you:
- hide the customer from all drop-downs
- hide the customer from the default list in the customer administration
- hide all projects for this customer from all drop-downs, regardless of their visibility state
- hide all projects for this customer from the default list in the projects administration
- hide the activities for all customer projects from all drop-downs, regardless of their visibility state
- hide the activities for all customer projects from the default list in the activities administration

Please note:
- all currently linked objects will still show the customer in the dropdown as pre-selected option
  - you can still change the customer on timesheet records and projects, which used it before
  - you cannot create new projects for this customer
  - you cannot create new timesheet records for this customer 
- you can still access the hidden entries by changing the visibility filter on the toolbars

The visibility filter in the toolbar has three state: 
- Visible: Yes (all customers that are visible)
- Visible: No (all customers that are invisible)
- Visible "empty" (all customers, not filtering on their visibility)

## Filter and search 

The search drop-down supports filtering by the fields:
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name` 
- `comment`
- `number`
- `contact`
- `email`
- `phone`
- `address`

Additionally you can filter for [custom fields]({% link _documentation/meta-fields.md %}) by using a search phrase like `location:homeoffice`.
This would find all customers with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office` 
- `This office is beautiful`
- `Our offices are very noisy`

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice customername foo` - find all customers matching the search term `customername foo` with the custom field `location` matching the term `homeoffice` 
- `location:homeoffice contract:foo customername` - find all customers matching the search term `customername` with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo` 
- `location:homeoffice contract:foo` - find all customers with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`
