---
title: Theme
description: Theme related configuration and developer documentation for Kimai
toc: true
---

Kimai uses the [AdminLTE theme](https://github.com/kevinpapst/AdminLTEBundle/) which can be configured in the file `config/packages/admin_lte.yaml`. 
You find the theme specific documentation [here](https://github.com/kevinpapst/AdminLTEBundle/blob/master/Resources/docs/configurations.md).

All Kimai specific theme settings will be available in the twig templates with the global `kimai_context` key, e.g.

```twig
{% raw %}{{ kimai_context.select_type }}{% endraw %}
``` 

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

Add this to your [local.yaml]({% link _documentation/configurations.md %}).

```yaml
admin_lte:
    options:
        skin: skin-blue-light
```

Please note: unless you change the [permissions]({% link _documentation/permissions.md %}), users can still change the theme color to their wish.
It is recommended to leave the choice to the user, as colors and contrasts are not only a matter of personal choice but might also be necessary for people with visual impairments. 

## Searchable input types

The select boxes for customer, project and activity are by default the OS standard UI elements. 
This might be a limit for users with a long list of active and non-hidden elements.

Therefor a test is currently running, which can be activated setting the the following configuration:  

```yaml
kimai:
    theme:
        select_type: selectpicker
```

This will turn the select boxes into javascript elements with quick search option. 

Why is this a beta test? It's not clear, if we keep on using this javascript library or activate it by default.
Therefor your feedback is highly welcome, please post your opinion at GitHub.   

## Active entries warning

A small colored warning sign will be shown, if a user has more than X active timesheet entries.

The amount `X` is configured in your `local.yaml` with the setting `timesheet.active_entries.soft_limit` (see [configurations.md]({% link _documentation/configurations.md %})).

## Icons

Kimai allows you to configure icons in several places (provided by [Font Awesome 5](https://fontawesome.com/icons)) and ships 
with a pre-defined list of icon aliases to guarantee a consistent look.  

The pre-defined icons aliases can be found in this [TwigExtension]({{ site.kimai_v2_file }}/src/Twig/Extensions.php).

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
