---
title: Custom fields
description: Add free configurable custom fields to your Kimai installation
---

{% include plugins/custom-fields.md %}  

Custom fields can be of the following type:
`string`, `integer`, `number`, `duration`, `money`, `language`, `currency`, `country`, `color`, `date`, `datetime`, `email`, `textarea`, `invoice template`, `checkbox`, `choice-list`, `auto-tags`

## Field types
 
The custom fields will be shown on the "create and edit entity" forms and can have the following types:

| Input field type   | Description                                                                         |
|--------------------|-------------------------------------------------------------------------------------|
| `string`           | simple text field                                                                   |
| `integer`          | number without decimal point                                                        |
| `number`           | number with decimal places                                                          |
| `duration`         | enter a duration in [various formats]({% link _documentation/duration-format.md %}) |
| `money`            |                                                                                     |
| `language`         | dropdown of languages, shown in the user language                                   |
| `currency`         | dropdown of currencies, shown in the user language                                  |
| `country`          | dropdown of countries, shown in the user language                                   |
| `color`            | browser specific input element to select a color                                    |
| `date`             | type a date or select it from the datepicker                                        |
| `datetime`         | type a date and time or select it from the picker                                   |
| `email`            | enter an email address (with basic validation)                                      |
| `url`              | URL field                                                                           |
| `textarea`         | multi-line text field                                                               |
| `invoice template` | dropdown                                                                            |
| `checkbox`         | on/off                                                                              |
| `choice-list`      | drop-down with custom entries                                                       |
| `auto-tags`        | automatic timesheet tagging through assignment on activities/projects/custo mers    |
{: .table }
   
### Checkbox

Use the value `1` as default value for a pre-checked box or `0` for an unchecked box.

If a checkbox is marked as mandatory, the user has to check it in order to submit the form.

### Choice-list

"Choice-list" is a different word for "Select-box" or "Drop-down".
You have to add the entries as comma-separated list in the `Default value` field.
For example a list consisting of fruits would look like this: `Banana,Apple,Orange,Pineapple,Peach`.

As the first entry is pre-selected, you can add an empty field to the dropdown by starting the list
with a leading `,` like this: `,Banana,Apple,Orange,Pineapple,Peach`.
Combined with the mandatory flag, this will force your users to select an entry from the list to be able to submit the form.

Choice list is also capable to configure title and values independently.
Let's assume you have non-human friendly IDs for the value, but want to show a human friendly text, you can separate
each value from its title by using a pipe `|` character: `,01|Banana,02|Apple,Orange,foo|Pineapple,0815|Peach`.

### Invoice template

A select box that is useful if you want to generate automatic invoices via command line / cronjobs.

The Kimai command `bin/console kimai:invoice:create` supports invoice templates via custom-field ([see docs]({% link _documentation/invoices.md %}#create-invoices-with-cronjobs)).
The option parameter `--template-meta` takes the internal name of the custom field that will identify the invoice template to be used.

### Auto-Tags

This advanced feature allows to assign certain tags to Activity, Project and Customer.

Once you assigned such an `auto-tag` e.g to a Project, each future timesheet that is linked to the selected `Project` will be assigned 
the selected `auto-tags`. A user cannot remove these tags, they are automatically assigned after the form (to save the timesheet) was submitted. 

## Visibility

You can limit visibility to [user roles]({% link _documentation/permissions.md %}). 
If you want to use custom roles, you have to follow the documented rules for role naming:
- Completely uppercase
- Starting with `ROLE_`
- For the default roles, you have to use the technical name, e.g. `ROLE_TEAMLEAD` instead of the translated name `Teamlead`

So a role name like `Manager` does not work, it must be `ROLE_MANAGER`.

## Permissions

| Permission Name         | Description                                         |
|-------------------------|-----------------------------------------------------|
| `configure_meta_fields` | allows to administrate the custom field definitions |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include snippets/store-howto-permissions.md %}
