---
title: Expenses plugin for Kimai
name: Expenses  plugin
intro: "Keep track of your expenses and include them in your invoices."
slug: expenses-bundle
developer: kevinpapst
date: "2019-09-14 10:00:00 +0200"
icon: fas fa-money-check
demo: true 
price: "49€"
gumroad: kimai2-expenses
featured: Keep track of your expenses based on a customer, project and activity. These expenses can be categorized and included in your invoices.  
new: false
type: featured
tags:
  - plugin
redirect_from:
  - /store/expenses-bundle.html
  - /documentation/expenses/
  - /v1/expenses.html
bundle:
  name: "ExpensesBundle"
  command: "kimai:bundle:expenses:install"
  purchase: true
  versions:
    - ["1.21 - 1.24", "1.15"]
    - ["1.20", "1.14.1"]
    - ["1.19 - 1.19.1", "1.14"]
    - ["1.16 - 1.18.1", "1.12"]
    - ["1.15", "1.11"]
    - ["1.14", "1.10"]
    - ["1.11 - 1.13", "1.9"]
    - ["1.7 - 1.10", "1.7"]
    - ["1.5 - 1.6", "1.6.2"]
    - ["1.4", "1.6.1"]
    - ["1.3", "1.6"]
    - ["1.1 - 1.2", "1.4"]
    - ["1.0", "1.3"]
screenshots:
  - 
    src: "/images/marketplace/expenses-listing.png"
    title: "Expenses administration"
    description: "Paginated listing of all recorded expenses"
  - 
    src: "/images/marketplace/expenses-search.png"
    title: "Search expense"
    description: "Your expenses can be filtered with the search found in multiple Kimai screens"
  - 
    src: "/images/marketplace/expenses-edit.png"
    title: "Edit expense"
    description: "Editing or creating a new expense allows you to enter these fields"
  - 
    src: "/images/marketplace/expenses-categories.png"
    title: "Expense category"
    description: "Expenses are categorized to have a better overview and filter options"
  - 
    src: "/images/marketplace/expenses-category-edit.png"
    title: "Edit category"
    description: "You can set a name, cost factor and short help text for each category"
---

A Kimai plugin to keep track of your expenses based on a customer, project and activity.
These expenses can be categorized and included in your invoices.

## Features

- Record all your expenses and show them in a table view
    - The data can be searched- and filtered (see screenshots)
- All (billable) expenses will be automatically included in your invoices
    - Negative amounts allow for complex bookings, budget and invoice adjustments
- Manage expenses via API
- Export expenses in: Excel, PDF, HTML
- Support for custom-fields (see [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %}))
- Include expenses in Kimai export module
- Import expenses from Kimai 1

Expenses will be assigned to free configurable categories and each category has:
- name
- visibility flag
- default cost

Each expense has the following fields:
- a date-time
- category (see above)
- user
- project (and customer)
- activity (optional)
- description (free text field)
- the cost (can be hidden for default user, if you use default cost via category)
- an amount (see it as multiplier, use 1 if you want to charge the cost only)
- a billable flag (non-billable expenses will not be added to your invoices)
- an export flag (to make sure, that each expense will be invoiced only once)

## Usage

When logged in as `SUPER_ADMIN`, you will see the expense administration screen at `/en/expenses/`.

If this was successful, think about the permission setup for other user roles.

### Setup

During the installation a `Demo` category will be created, so you can immediately start adding expenses.
You should rename it during your first test!

### Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name            | Description                                                                                                |
|----------------------------|------------------------------------------------------------------------------------------------------------|
| `view_expense`             | allows access to the expenses screen                                                                       |
| `edit_expense`             | edit existing expenses                                                                                     |
| `edit_expense_cost`        | edit the cost of a single expense (deactivate this, if you want to provide default costs via the category) |
| `export_expense`           | export expenses                                                                                            |
| `create_expense`           | create new expenses                                                                                        |
| `delete_expense`           | delete existing expenses                                                                                   |
| `manage_expense_category`  | manage expense types                                                                                       | 
| `edit_exported_expense`    | allow to edit and delete exported expenses                                                                 | 
{: .table }

Pre-defined permissions are assigned to all default user roles.

The following restrictions are in place for accessing other user's data:
 - can only be seen by users who own the `view_other_timesheet` 
 - users that own the `view_expense` permission but NOT `view_other_timesheet` will only see own expenses
 - the visible data for non-admin users (permission `view_all_data`) is limited by team assignments 

{% include store-howto-permissions.md %}

## Invoices

As expenses will be automatically included in your invoices, you might want to distinguish between expenses and timesheets.

Since Kimai 1.6.2 and ExpensesBundle 1.5 this can be done with the invoice template variable `${entry.type}`.
The value will be `expense` and can be used for example in Excel with `ifthan` formulas or in combination with a `conditional format`.

The invoice template variable `${entry.category}` will contain the category name of the expense.

## Importing from Kimai v1

This bundle supports data import from Kimai v1, but you need to imported the other data (like customers) first.

An example for the import command:
```bash
bin/console kimai:bundle:expenses:import-v1 "mysql://username:password@127.0.0.1:3306/database?charset=utf8" "kimai_"
```
