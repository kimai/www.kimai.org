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

A Kimai plugin, which allows configuring additional fields for timesheets, customers, projects, activities and expenses.

## Features

Configure additional fields for the following entities:
 
- `Timesheets`
- `Customers`
- `Projects`
- `Activities`
- `User`
- `Expenses` - see [Expenses plugin]({% link _store/keleo-expenses-bundle.md %})

The custom fields will be shown on the "create and edit entity" forms and can have the following types:

- `string` (simple text field)
- `integer` (number without decimal point)
- `number` (number with decimal places)
- `duration`
- `money`
- `language` (dropdown of languages, shown in the users language)
- `currency` (dropdown of currencies, shown in the users language)
- `country` (dropdown of countries, shown in the users language)
- `color` (browser specific input element to select a color)
- `date`
- `datetime`
- `email`
- `textarea` (multi-line text field)
- `invoice template` (dropdown)
- `checkbox` (on/off)
- `choice-list` (drop-down)

## Documentation

You can create as many fields as you want for each data type, where each field:

- is either optional or mandatory
- has its own visibility, so the access can be restricted:
    - to certain customer/project/activity combinations (eg. a "location" field will only be shown for customer X and project Y)
    - to users with certain permissions or roles
- can be described with a name and help text
- has a maximum length of 255 character

The custom-field data is then available in:

- Data-tables will display all visible fields
- Exports (HTML and Spreadsheets include all visible fields)
- Timesheet exports (include visible timesheet fields)
- API (collections and entities)
- Invoice templates (custom templates have access to all fields)

You can change the "weight" of custom-fields, so they show up in the order you define. 

Be aware:

- Restricted fields won't be visible on the create forms, as Kimai initially can't know if the rule will apply: in these cases the fields will only be shown in the edit forms
- Sensitive data can be configured as "invisible", so it will not show up in the above mentioned places
- Custom fields for users are not exported via the API (this is a limitation in the core application) 

### Field types

#### Checkbox

Use the value `1` as default value for a pre-checked box or `0` for an unchecked box.

If a checkbox is marked as mandatory, the user has to check it in order to submit the form.

#### Choice-list 

"Choice-list" is a different word for "Select-box" or "Drop-down". 
You have to add the entries as comma separated list into the default-value field.
For example a list consisting of fruits would look like this: `Banana,Apple,Orange,Pineapple,Peach`.

As the first entry is pre-selected, you can add an empty field to the dropdown by starting the list 
with a leading `,` like this: `,Banana,Apple,Orange,Pineapple,Peach`. 
Combined with the mandatory flag, this will force your users to select an entry from the list to be able to submit the form.

Choice list is also capable to configure title and values independently.
Let's assume you have non-human friendly IDs for the value, but want to show a human friendly text, you can separate 
each value from its title by using a pipe `|` character: `,01|Banana,02|Apple,Orange,foo|Pineapple,0815|Peach`.

#### Invoice template

A select box that is useful if you want to generate automatic invoices via command line / cronjobs.

The Kimai command `bin/console kimai:invoice:create` supports invoice templates via custom-field ([see docs](https://www.kimai.org/documentation/invoices.html#create-invoices-with-cronjobs)).
The option parameter `--template-meta` takes the internal name of the custom field that will identify the invoice template to be used.

## Usage

When logged in as `SUPER_ADMIN`, you should now see the custom-fields administration screen at `/en/expenses/`.

If this was successful, you can now think about giving permissions to other users as well.

### Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name           | Description |
|---                        |--- |
| `configure_meta_fields`   | allows to administrate the custom field definitions |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
