---
title: Theme
description: Theme related configuration and developer documentation for Kimai
toc: true
canonical: /documentation/theme.html
---

Kimai uses the [AdminLTE theme](https://github.com/kevinpapst/AdminLTEBundle/) which can be configured in the file `config/packages/admin_lte.yaml`.
You find the theme specific documentation [here](https://github.com/kevinpapst/AdminLTEBundle/blob/master/Resources/docs/configurations.md).

All Kimai specific theme settings will be available in the twig templates with the global `kimai_context` key, e.g.

```twig
{% raw %}{{ kimai_context.select_type }}{% endraw %}
``` 

## Aligning data in tables

Please stick to the following alignments in your listing:

| Data type             | Alignment |
|---                    |---|
| Date                  | Left  |
| Datetime              | Left  |
| Time                  | Center  |
| Money                 | Right  |
| Duration              | Right  |
| Boolean               | Center  |
| Text                  | Left  |
| Count (int)           | Center (badge)  |
| Collections (Text)    | Left (label)  |

Always align the table header to the content cell.

## Default theme color

Kimai supports the AdminLTE themes:

- skin-blue
- skin-blue-light
- skin-yellow
- skin-yellow-light
- skin-green
- skin-green-light
- skin-purple
- skin-purple-light
- skin-red
- skin-red-light
- skin-black
- skin-black-light

Each user can change the theme color to their wish (if they have the permission to change their preferences).
It is recommended to leave the choice to the user, as colors and contrasts are not only a matter of personal choice but might also be necessary for people with visual impairments.

The default theme for new created users can be configured in the system settings.

## Searchable input types

The select boxes for customer, project and activity are by default (since 1.4) searchable Javascript components.

If you don't like the way this component behaves (eg. if you want native elements on mobile) you can deactivate it by setting the following config

```yaml
kimai:
    theme:
        select_type: ~
```

This will turn the select-boxes into native select elements.

## Max. active entries warning

A small colored warning sign will be shown, if a user has an active timesheet.

The maximum amount of active timesheets can be configured with the setting `timesheet.active_entries.hard_limit` (called `Permitted number of simultaneously running time entries`, see [System > Settings]({% link _documentation/configurations.md %})).

## Icons

Kimai allows you to configure icons in several places (provided by [Font Awesome 5](https://fontawesome.com/icons)) and ships
with a pre-defined list of icon aliases to guarantee a consistent look.

The pre-defined icons aliases can be found in this [IconExtension]({{ site.kimai_v2_file }}/src/Twig/IconExtension.php).

Icon aliases can be used by applying the `icon` filter, e.g.

```
{% raw %}<i class="{{ 'money'|icon }}"></i>{% endraw %}
```
