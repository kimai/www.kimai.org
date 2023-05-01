---
title: Custom fields
description: Add free configurable custom fields to your Kimai installation
---

{% include plugins/custom-fields.md %}  

Custom fields can be of the following type:
`string`, `integer`, `number`, `duration`, `money`, `language`, `currency`, `country`, `color`, `date`, `datetime`, `email`, `textarea`, `invoice template`, `checkbox`, `choice-list`

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
{: .table }
   
### Checkbox

Use the value `1` as default value for a pre-checked box or `0` for an unchecked box.

If a checkbox is marked as mandatory, the user has to check it in order to submit the form.

### Choice-list

"Choice-list" is a different word for "Select-box" or "Drop-down".
You have to add the entries as comma separated list into the default-value field.
For example a list consisting of fruits would look like this: `Banana,Apple,Orange,Pineapple,Peach`.

As the first entry is pre-selected, you can add an empty field to the dropdown by starting the list
with a leading `,` like this: `,Banana,Apple,Orange,Pineapple,Peach`.
Combined with the mandatory flag, this will force your users to select an entry from the list to be able to submit the form.

Choice list is also capable to configure title and values independently.
Let's assume you have non-human friendly IDs for the value, but want to show a human friendly text, you can separate
each value from its title by using a pipe `|` character: `,01|Banana,02|Apple,Orange,foo|Pineapple,0815|Peach`.

### Invoice template

A select box that is useful if you want to generate automatic invoices via command line / cronjobs.

The Kimai command `bin/console kimai:invoice:create` supports invoice templates via custom-field ([see docs](https://www.kimai.org/documentation/invoices.html#create-invoices-with-cronjobs)).
The option parameter `--template-meta` takes the internal name of the custom field that will identify the invoice template to be used.

## Permissions

| Permission Name         | Description                                         |
|-------------------------|-----------------------------------------------------|
| `configure_meta_fields` | allows to administrate the custom field definitions |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
