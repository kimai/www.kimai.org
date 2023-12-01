
## Features

{% include plugins/expenses.md %}

### Invoice calculator

This bundle ships two new invoice calculator:

- `ExpenseActivityInvoiceCalculator` one entry per activity, expenses display description
- `ExpenseCategoryProjectInvoiceCalculator` - one entry for each expense category, timesheets are grouped into one entry per project

{% comment %}
### Export template

This bundle has the functionality to export filtered expenses to CSV, Excel, HTML and PDF.

The formats `HTML` and `PDF` can be overwritten by creating the files:

- `var/export/expense-bundle.html.twig` (for HTML format)
- `var/export/expense-bundle.pdf.twig` (for PDF format)
{% endcomment %}

### Importing from Kimai v1

This bundle supports data import from Kimai v1, but you need to imported the other data (like customers) first.

An example for the import command:
```bash
bin/console kimai:bundle:expenses:import-v1 "mysql://username:password@127.0.0.1:3306/database?charset=utf8" "kimai_"
```
