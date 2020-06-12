---
title: Custom-fields plugin for Kimai 2
name: Custom-fields plugin
intro: "Create free configurable additional fields for timesheets, customers, projects, activities and users."
developer: keleo
date: "2019-06-25 20:00:00 +0200"
icon: fas fa-keyboard
demo: true 
price: "49€"
screenshot: 
  - /images/marketplace/meta-fields-screenshot.png
  - /images/marketplace/meta-fields-create.jpg
  - /images/marketplace/meta-fields-example.jpg
  - /images/marketplace/meta-fields-example2.jpg
gumroad: kimai2-custom-fields
featured: Create free configurable additional (optional and mandatory) fields for timesheets, customers, projects and activities in various formats. 
new: false
toc: true
tags:
  - plugin
---

A Kimai 2 plugin, which allows to configure additional fields for timesheets, customers, projects and activities.

## Features

Configure additional fields for the following entities:

- `Timesheets`
- `Customers`
- `Projects`
- `Activities`
- `User`
- `Expenses` - see [Expenses plugin]({% link _store/expenses-bundle.md %})

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

## Purchase

{% include store-gumroad-and-support.html %}

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

Be aware:

- Restricted fields won't be visible on the create forms, as Kimai initially can't know if the rule will apply: in these cases the fields will only be shown in the edit forms
- Sensitive data can be configured as "invisible", so it will not show up in the above mentioned places
- Custom fields for users are not exported via the API (this is a limitation in the core application) 

### Field types

#### Invoice template

A select box that is very useful if you want to generate automatic invoices via command line / cronjobs.

The Kimai command `bin/console kimai:invoice:create` supports invoice templates via custom-field ([see docs](https://www.kimai.org/documentation/invoices.html#create-invoices-with-cronjobs)).
The option parameter `--template-meta` takes the internal name of the custom field that will identify the invoice template to be used.

#### Checkbox

Use the value `1` as default value for a pre-checked box or `0` for an unchecked box.

If a checkbox is marked as mandatory, the user has to check it in order to submit the form.

#### Choice-list 

Lets you create a dropdown. You have to add the entries as comma separated list into the default-value field.
For example a list consisting of fruits would look like this: `Banana,Apple,Orange,Pineapple,Peach`.

As the first entry is always pre-selected in that case, you can add a empty field to the dropdown by adding a leading `,` 
to the list like this: `,Banana,Apple,Orange,Pineapple,Peach`. Combined with the mandatory flag, this will force your users to 
select an entry from the list of fruits to be able to submit the form.

### Compatibility

Please make sure to use the correct version of the plugin, which must be compatible with your Kimai version:

| Bundle version    | Minimum Kimai 2 version   |
| ---               |---                        |
| 1.10 - 1.11       | 1.9                       |
| 1.8 - 1.9         | 1.7                       |
| 1.6 - 1.7         | 1.6.2                     |
| 1.5               | 1.6                       |
| 1.3.2 - 1.4.1     | 1.4                       |
| 1.1.1 - 1.2       | 1.1                       |
| 1.0               | 1.0                       |
{: .table }

## Installation

{% include store-plugin-installation.md plugin="MetaFieldsBundle" command="kimai:bundle:metafields:install" %}

## Usage

When logged in as `SUPER_ADMIN`, you should now see the custom-fields administration screen at `/en/expenses/`.

If this was successful, you can now think about giving permissions to other users as well.

### Permissions

This bundle ships a new permission, which limit access to certain functions:

- `configure_meta_fields` - allows to administrate the custom field definitions

By default, it is assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You don't need the following since Kimai 1.6. Please adjust all permission settings in your administration." %}

Read how to assign these permission to your user roles in the [permission documentation](https://www.kimai.org/documentation/permissions.html).

This is a proposal if you use the bundle in a multi-user environment:
```yaml
kimai:
    permissions:
        roles:
            ROLE_SUPER_ADMIN: ['configure_meta_fields']
            ROLE_ADMIN: ['configure_meta_fields']
```

After changing the permissions in local.yaml, you need to clear the application cache.

## Screenshot

![Screenshot](https://www.kimai.org/images/marketplace/meta-fields-screenshot.png)
 
