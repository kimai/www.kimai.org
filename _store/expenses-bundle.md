---
title: Expenses plugin for Kimai 2
name: Expenses  plugin
intro: "Keep track of your expenses and include them in your invoices."
developer: keleo
date: "2019-09-14 10:00:00 +0200"
icon: fas fa-money-check
demo: true 
price: "49€"
screenshot: 
  - /images/marketplace/expenses-screenshot.png
  - /images/marketplace/expenses-categories.png
  - /images/marketplace/expenses-search.png
  - /images/marketplace/expenses-create.png
gumroad: kimai2-expenses
featured: Keep track of your expenses based on customer, project and activity. These spendings can be categorized and included in your invoices.  
new: false
toc: true
tags:
  - plugin
---

A Kimai 2 plugin, which allows to keep track of your expenses based on customer, project and activity.
These spendings can be categorized and included in your Kimai generated invoices.

## Features

- Record all your expenses and show them in a table view
  - The data can be searched- and filtered (see screenshots)  
- All (refundable) expenses will be automatically included in your invoices
- Manage expenses via API
- Import expenses from Kimai 1
- Support for custom fields (see [Custom-fields plugin]({% link _store/custom-fields-bundle.md %}))

Expenses are sorted into free configurable types (categories). Each type has a:
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
- refundable flag (non-refundable expenses will not be added to your invoices)
- an export flag (to make sure, that each expense is invoiced only once)

## Purchase

{% include store-gumroad-and-support.html %}

### Compatibility

Please make sure to use the correct version of the plugin, which must be compatible with your Kimai version:

| Bundle version    | Minimum Kimai 2 version   |
|---                |---                        |
| 1.11 - 1.12       | 1.9                       |
| 1.7 - 1.10        | 1.7                       |
| 1.5 - 1.6         | 1.6.2                     |
| 1.4               | 1.6.1                     |
| 1.3               | 1.6                       |
| 1.1 - 1.2         | 1.4                       |
| 1.0               | 1.3                       |
{: .table }

## Installation

{% include store-plugin-installation.md plugin="ExpensesBundle" command="kimai:bundle:expenses:install" %}

## Usage

When logged in as `SUPER_ADMIN`, you will now see the expenses administration screen at `/en/expenses/`.

If this was successful, you can now think about giving permissions to other users as well.

### Setup categories

Before you can start tracking expenses, you will have to create at least one visible category. 
You will be redirected to the category creation screen if Kimai doesn't find one. 

## Permissions

This bundle ships a couple of new permissions, which limits the access to certain functions:

| Permission Name           | Description |
|---                        |--- |
| `view_expense`            | allows access to the expenses screen |
| `edit_expense`            | edit existing expenses |
| `edit_expense_cost`       | edit the cost of a single expense (deactivate this, if you want to provide default costs via the category) |
| `create_expense`          | create new expenses |
| `export_expense`          | export expenses |
| `delete_expense`          | delete existing expenses |
| `manage_expense_category` | manage expense types | 
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}

## Updating the plugin

Updating the bundle works the same way as the installation does. 

- Delete the directory `var/plugins/ExpensesBundle/` (to remove deleted files)
- Execute all installation steps again:
  - Copy files
  - Clear cache
  - Update database with `bin/console kimai:bundle:expenses:install` 

## Screenshots

The overview page of all expenses:

![Screenshot](https://www.kimai.org/images/marketplace/expenses-screenshot.png)

The category management:

![Screenshot](https://www.kimai.org//images/marketplace/expenses-categories.png)

You can search through all existing expense records:

![Screenshot](https://www.kimai.org/images/marketplace/expenses-search.png)

When creating a new expense, you can record the following fields:

![Screenshot](https://www.kimai.org/images/marketplace/expenses-create.png)
