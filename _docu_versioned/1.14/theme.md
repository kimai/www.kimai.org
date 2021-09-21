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

The default theme colors can be changed to one of the following choices:

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

Add this to your [local.yaml]({% link _documentation/local-yaml.md %}).

```yaml
admin_lte:
    options:
        skin: skin-blue-light
```

Please note: unless you change the [permissions]({% link _documentation/permissions.md %}), users can still change the theme color to their wish.
It is recommended to leave the choice to the user, as colors and contrasts are not only a matter of personal choice but might also be necessary for people with visual impairments. 

## Searchable input types

The select boxes for customer, project and activity are by default (since 1.4) searchable Javascript components. 

If you don't like the way this component behaves (eg. if you want native elements on mobile) you can deactivate it by setting the following config  

```yaml
kimai:
    theme:
        select_type: ~
```

This will turn the select-boxes into native select elements. 

## Active entries warning

A small colored warning sign will be shown, if a user has more than X active timesheet entries.

The amount `X` is configured in your [local.yaml]({% link _documentation/configurations.md %}) with the setting `timesheet.active_entries.soft_limit`.

## Icons

Kimai allows you to configure icons in several places (provided by [Font Awesome 5](https://fontawesome.com/icons)) and ships 
with a pre-defined list of icon aliases to guarantee a consistent look.  

The pre-defined icons aliases can be found in this [IconExtension]({{ site.kimai_v2_file }}/src/Twig/IconExtension.php).

Icon aliases can be used by applying the `icon` filter, e.g.

```
{% raw %}<i class="{{ 'money'|icon }}"></i>{% endraw %}
```

## Colors

Kimai allows you to use different color schemes in several places. 

Possible values are:

- `aqua`
- `black`
- `blue`
- `gray`
- `green`
- `purple`
- `red`
- `yellow`
