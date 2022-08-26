{% include documentation-link.html chapter="plugin-expenses" %}

## Features

{% include plugins/expenses.md %}

## Importing from Kimai v1

This bundle supports data import from Kimai v1, but you need to imported the other data (like customers) first.

An example for the import command:
```bash
bin/console kimai:bundle:expenses:import-v1 "mysql://username:password@127.0.0.1:3306/database?charset=utf8" "kimai_"
```
