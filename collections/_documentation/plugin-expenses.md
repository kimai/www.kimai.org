---
title: Expenses
description: Keep track of your expenses and include them in your invoices
canonical: /documentation/plugin-expenses.html
---

{% include plugins/expenses.md %}  

## Usage 

When logged in as user with sufficient permissions, you will see the expense administration screen at `/en/expenses/`.

During the installation a `Demo` category will be created, so you can immediately start adding expenses.
You can rename it after your first test.

### Categories

Expenses are categorized. An expense category serves these main purposes:
- it groups expenses
- it sets default values
- it allows to configure a price per piece

By entering costs, you can pre-define how much will be calculated for "one expense" item.
Let's say you enter `10` as `Costs` and the user enters `5` as `Quantity`. The expense will then be worth `50`.

But if you want your user to enter the real price, then you enter 1 as cost.

### Price vs Amount

Each expense has two fields:
- Quantity (visible for all users)
- Amount (visible for Admins only)

A regular can see the `Quantity` field. Only Admins can edit an expenses `Amount` directly. 

### Example

The following example explained:
{% include docs-image.html src="/images/documentation/expenses/expense-category.webp" title="One expense category" width="750px" %}

The category `Driving distance` can be used to track travelling routes between the office and a client location.
It will be charged with 0.30 per Kilometer.

Now let's assume a user creates an expense as seen in the following screenshot with the new `Driving distance` category and an amount of `74`.

{% include docs-image.html src="/images/documentation/expenses/expense.webp" title="The expense is using the previously created category" width="750px" %}

Then the amount of `74` kilometers is multiplied by the costs of `0.30`, which results in the amount of `22,20 €`.

{% include docs-image.html src="/images/documentation/expenses/listing.webp" title="The expense with costs" width="750px" %}

## Invoices

As expenses will be automatically included in your invoices, you might want to distinguish between expenses and timesheets.
The invoice template variable `${entry.type}` contains that info.
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

{% include snippets/search-custom-field.md %}

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

{% include snippets/store-howto-permissions.md %}
