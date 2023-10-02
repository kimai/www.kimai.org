---
title: Theme
description: Developer documentation for frontend and theming 
toc: true
canonical: /documentation/theme.html
redirect_from: /documentation/2.0/theme.html
---

Kimai uses the [Tabler.io](https://github.com/kevinpapst/TablerBundle/) bootstrap theme.
You find the theme specific documentation [here](https://github.com/kevinpapst/TablerBundle/blob/main/docs/index.md).

## Twig context

You have the following global objects available to work with:
- the `tabler_bundle` context (see [here](https://github.com/kevinpapst/TablerBundle/blob/main/docs/twig-context.md))
- the `kimai_config` to access system configurations
- the `kimai_context` helper to identify javascript and modal requests 

## Aligning data in tables

Always align the table header to the content cell.

Use the following alignments in your data-tables:

| Data type          | Alignment | Component |
|--------------------|-----------|-----------|
| Date               | Start     |           |
| Datetime           | Start     |           |
| Time               | Center    |           |
| Money              | End       |           |
| Duration           | End       |           |
| Boolean            | Center    |           |
| Text               | Start     |           |
| Count (int)        | Center    | badge     |
| Collections (Text) | Start     | label     |
{: .table }

## Max. active entries warning

A small colored warning sign will be shown, if a user has an active timesheet.

The maximum amount of active timesheets can be configured with the setting `timesheet.active_entries.hard_limit` (called `Permitted number of simultaneously running time entries`, see [System > Settings]({% link _documentation/configurations.md %})).

## Icons

Kimai allows you to configure icons in several places (provided by [Font Awesome 5](https://fontawesome.com/icons)) and ships
with a pre-defined list of icon aliases to guarantee a consistent look.

The pre-defined icons aliases can be found in this `config/packages/tabler.yaml`.

Icon aliases can be used by applying the `icon` filter, e.g.

```
{% raw %}<i class="{{ 'money'|icon }}"></i>{% endraw %}
```

or by using the icon function, e.g.

```
{% raw %}{{ icon('money') }}{% endraw %}
```

