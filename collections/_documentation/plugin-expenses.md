---
title: Expenses
description: Keep track of your expenses and include them in your invoices
canonical: /documentation/plugin-expenses.html
---

{% include plugins/expenses.md %}  

## Usage 

Users with sufficient permissions can access the expense administration screen at `/en/expenses/`.

During installation, a default `Demo` category is created to help you get started with adding expenses. You can rename it after completing your first test.

### Categories

Expenses are organized into categories. An expense category serves three main purposes:
- It groups related expenses.
- It sets default values for calculations.
- It allows configuration of a price per unit.

When defining costs, you can pre-set how much will be calculated for a single expense item.  
For example, if you set `10` as the `Cost` and the user enters `5` as the `Quantity`, the total expense will amount to `50`.

If you want users to input the actual price themselves, you can set the cost to `1`.

### Price vs Amount

Each expense consists of two fields:
- **Quantity** (visible to all users)
- **Amount** (visible only to Admins)

Regular users can view and edit the `Quantity` field. However, only Admins have permission to directly edit an expense's `Amount`.

The usual case is that most categories have a fixed price and your users only enter a `quantity`. But: 

{% alert info %}
If you want users to input the actual price themselves, you set the category cost to `1`.  
In that case the `quantity` represents the amount on the receipt.
{% endalert %}

### Example

The following example illustrates this process:  
{% include docs-image.html src="/images/documentation/expenses/expense-category.webp" title="One expense category" width="750px" %}

The category `Driving distance` is designed to track travel routes between the office and a client location. The cost is set at `0.30` per kilometer.

Now, let’s assume a user creates an expense using the new `Driving distance` category and enters a quantity of `74`, as shown in the screenshot below:  
{% include docs-image.html src="/images/documentation/expenses/expense.webp" title="The expense is using the previously created category" width="750px" %}

In this case, the entered quantity of `74` kilometers is multiplied by the cost of `0.30`, resulting in a total amount of `22.20 €`.

{% include docs-image.html src="/images/documentation/expenses/listing.webp" title="The expense with costs" width="750px" %}

## Invoices

Expenses are automatically included in your invoices, so it may be helpful to differentiate between expenses and timesheets.

- The invoice template variable `${entry.type}` indicates the type of entry. Its value will be `expense`. This can be used in tools like Excel with `IF` formulas or conditional formatting.
- The variable `${entry.category}` contains the expense category name.

## Budgets

As initially written:

> If turned on, Expenses count towards budgets and revenue statistics.

At {% include documentation/link-kimai-page.md page="settings" %} in the `Expenses` category you find a setting called `If activated: adds expenses to consumed budgets`.

Switch it on and all expenses will be deducted from your budgets. 

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
