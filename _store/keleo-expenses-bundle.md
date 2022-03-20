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

{% include documentation-link.html chapter="plugin-expenses" %}

## Features

{% include plugins/expenses.md %}

## Importing from Kimai v1

This bundle supports data import from Kimai v1, but you need to imported the other data (like customers) first.

An example for the import command:
```bash
bin/console kimai:bundle:expenses:import-v1 "mysql://username:password@127.0.0.1:3306/database?charset=utf8" "kimai_"
```
