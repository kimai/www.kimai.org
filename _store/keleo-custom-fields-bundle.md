---
title: Custom-fields plugin for Kimai
name: Custom-fields plugin
intro: "Create free configurable additional fields for timesheets, customers, projects, activities and users."
slug: custom-fields-bundle
developer: kevinpapst
date: "2019-06-25 20:00:00 +0200"
icon: fas fa-keyboard
demo: true 
price: "49€"
gumroad: kimai2-custom-fields
featured: Create free configurable additional fields for timesheets, customers, projects, activities and users in various formats. Fields can be optional or mandatory and restricted by permissions.
new: false
toc: false
type: featured
tags:
  - plugin
bundle:
  name: "MetaFieldsBundle"
  command: "kimai:bundle:metafields:install"
  purchase: true
  versions:
    - ["1.18", "1.15"]
    - ["1.17", "1.14"]
    - ["1.15 - 1.16", "1.11"]
    - ["1.14", "1.10.2"]
    - ["1.10 - 1.13", "1.9"]
    - ["1.8 - 1.9", "1.7"]
    - ["1.6 - 1.7", "1.6.2"]
    - ["1.5", "1.6"]
    - ["1.3.2 - 1.4.1", "1.4"]
    - ["1.1.1 - 1.2", "1.1"]
    - ["1.0", "1.0"]
screenshots:
  - 
    src: "/images/marketplace/meta-fields-listing.png"
    title: "Custom fields administration"
    description: "The listing page shows all available item-types and their configured custom fields"
  - 
    src: "/images/marketplace/meta-fields-create.png"
    title: "Create custom field (Customer)"
    description: "The dialog to create a new custom field for Customers"
  - 
    src: "/images/marketplace/meta-fields-edit.png"
    title: "Edit custom field (Project)"
    description: "Editing an already existing custom field for Projects (type boolean, see default value)"
  - 
    src: "/images/marketplace/meta-fields-timesheet.png"
    title: "Teams timesheets"
    description: "The timesheet listing, displaying the visible custom field Location"
  - 
    src: "/images/marketplace/meta-fields-timesheet-edit.png"
    title: "Edit timesheet"
    description: "Editing a timesheet record with a new choice-list custom field"
---

{% include documentation-link.html chapter="plugin-custom-fields" %}

Allows configuration of additional (custom) fields for:
`Timesheets`, `Customers`, `Projects`, `Activities`, `Invoices`, `User`, `Expenses` (see [plugin]({% link _store/keleo-expenses-bundle.md %})).

## Features

{% include plugins/custom-fields.md %}

### Field types

Custom fields can be of the following type: 
`string`, `integer`, `number`, `duration`, `money`, `language`, `currency`, `country`, `color`, `date`, `datetime`, `email`, `textarea`, `invoice template`, `checkbox`, `choice-list`

More about those [in the documentation]({% link _documentation/plugin-custom-fields.md %}).
