---
title: Expenses
description: Keep track of your expenses and include them in your invoices
redirect_from: /documentation/expenses/
---

{% include plugins/expenses.md %}  

## Usage

When logged in as user with sufficient permissions, you will see the expense administration screen at `/en/expenses/`.

During the installation a `Demo` category will be created, so you can immediately start adding expenses.
You can rename it after your first test.

## Invoices

As expenses will be automatically included in your invoices, you might want to distinguish between expenses and timesheets.

Since Kimai 1.6.2 and ExpensesBundle 1.5 this can be done with the invoice template variable `${entry.type}`.
The value will be `expense` and can be used for example in Excel with `ifthan` formulas or in combination with a `conditional format`.

The invoice template variable `${entry.category}` will contain the category name of the expense.

## Filter and search

The search supports filtering by the fields:
- `daterange`
- `customer`
- `project`
- `activity`
- `expense category`
- `user`
- `billable`
- `exported`

The free search term will query the field:
- `description`

{% include search-custom-field.md %}

## Permissions

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
