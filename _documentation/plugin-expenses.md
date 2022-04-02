---
title: Expenses
description: Keep track of your expenses and include them in your invoices
toc: true
---

{% include plugins/expenses.md %}  

## Usage

When logged in as user with sufficient permissions, you will see the expense administration screen at `/en/expenses/`.

### Setup

During the installation a `Demo` category will be created, so you can immediately start adding expenses.
You can rename it after your first test.

## Invoices

As expenses will be automatically included in your invoices, you might want to distinguish between expenses and timesheets.

Since Kimai 1.6.2 and ExpensesBundle 1.5 this can be done with the invoice template variable `${entry.type}`.
The value will be `expense` and can be used for example in Excel with `ifthan` formulas or in combination with a `conditional format`.

The invoice template variable `${entry.category}` will contain the category name of the expense.
