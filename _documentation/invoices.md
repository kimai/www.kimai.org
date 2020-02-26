---
title: Invoices
description: Create invoices directly within Kimai from timesheet data in several formats 
toc: true
---

Kimai allows to create invoices from timesheet data in several formats. 

## Invoice document

The invoice system currently supports the following formats:

- `HTML`
  - through the use of Twig templates
  - filename must end with `.html.twig` 
  - Pros: no need for additional software, print or convert to PDF from your browser (if supported)
  - **the recommended invoice document format**
- `DOCX`
  - OOXML - Open Office XML Text
  - Microsoft Word 2007-2013 XML
  - filename must end with `.docx` 
  - Pro: simple customization and possibility to edit the invoice later on
  - Contra: Non-free software required 
- `ODS`
  - Open Document Spreadsheet or OASIS, is the OpenOffice.org XML file format for spreadsheets supported by OpenOffice, LibreOffice, StarCalc, Microsoft and others 
  - file extension: filename must end with `.ods` 
  - Pros: open format, good for exporting and creating enhanced reports with an office software package
  - Contra: not ideal format for invoices
- `XLSX`
  - Microsoft Excel™ 2007 shipped with a new file format, namely Microsoft Office Open XML SpreadsheetML, and Excel 2010 extended this still further with new features. 
  - file extension: filename must end with `.xlsx` 
  - PRO: good for creating enhanced reports with an office software package
  - Contra: Non-free software required, not ideal format for invoices
- `CSV`
  - Comma-separated file with UTF-8 encoding and double-quotes around each field 
  - filename must end with `.csv` 
  - Pro: good for exporting and creating enhanced reports with an office software package
  - Contra: only row based information possible (meta information can't be used properly)

**Be aware**: the default templates were created and tested ONLY with LibreOffice!

## Export state

Invoices and exports share the export state, which is used to mark timesheet records as processed. 
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.

You need to tick the checkbox before printing the invoice, to automatically set the export state on all included records.
 
For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

## Create your own invoice document

There is another repository with some invoice document examples in different formats. 
If you need ideas how to start with yours, have a look at [https://github.com/Keleo/kimai2-invoice-templates](https://github.com/Keleo/kimai2-invoice-templates). 

Invoice documents are searched in two locations:

- `templates/invoice/renderer/`
- `var/invoices/`

Be aware of the following rules:

- Documents are addressed by their filename without extension (e.g. `kimai.html.twig` results in `kimai`) 
- You can use every document name only once: so having `kimai.html.twig` and `kimai.docx` will lead to unpredictable results 
- The first file to be found takes precedence 
- Kimai looks first in `var/invoices/`, so you can overwrite default templates
- You should store your templates in `var/invoices/` as this directory is not shipped with Kimai and not touched during updates (or in your own bundle)
- You can configure different search directories through the config key `kimai.invoice.documents` if you want to add additional template source directories 
- You can hide the default templates by setting the key `kimai.invoice.defaults` to an empty array / null

After you created a new or updated an existing template, you might have to clear the cache to see the results:
{% include cache-refresh.html %} 

#### Configure search path

An example configuration in [local.yaml]({% link _documentation/configurations.md %}) might look like this:

```yaml
kimai:
    invoice:
        # disable the default locations 
        defaults: ~
        # add a new search location
        documents:
            - 'var/my_invoices/'
```

### Twig templates

Generally speaking, you should use only the variable `model` in your template which is an instance of `App\Model\InvoiceModel`.

Please see the [default templates]({{ site.kimai_v2_file }}/templates/invoice/renderer) at 
GitHub to find out which variables can be used. 

Want to include an image in your template? Simply use an image tag. This points to the directory `public/images/my-logo.png`:
 
```twig
{% raw %}<img src="{{ asset('images/my-logo.png') }}">{% endraw %}
```

Best is to host your images on your own domain

```twig
{% raw %}<img src="https://www.example.com/images/my-logo.png">{% endraw %}
```

If you want more examples of the available methods for a timesheet record, you can have a look in the other existing templates, 
like [the template which renders the "My times" page]({{ site.kimai_v2_file }}/templates/timesheet/index.html.twig).

### Docx templates

Docx templates are powered by [PHPWord](https://github.com/PHPOffice/PHPWord) and its `TemplateProcessor`.

**Important:** You have to add one of the variables - either `${entry.description}` or `${entry.row}` - in one table row, 
otherwise the records will not be rendered (but only the global values)! 

The row containing this variable will be cloned for every included (timesheet) record.

If you do not use `${entry.description}` then a fallback for `${entry.row}` is used and will be removed in the rendering process, 
it will not show up in the generated invoice.

See below in `Template variables` to find out which variables you can use in your template.

Find out more about PHPWord templates [here](https://phpword.readthedocs.io/en/latest/templates-processing.html).

### Spreadsheets (ODS, XLSX and CSV)

Spreadsheet templates are powered by [PhpSpreadsheet](https://github.com/PHPOffice/PhpSpreadsheet).

**Important:** within the first 100 rows you MUST-HAVE the template row for timesheet entries, which means there must be 
a value starting with `${entry.` in one of the first 10 columns, otherwise no timesheet records will be rendered!

_Check the default templates if that doesn't make sense to you ;-)_

This row will then be cloned for every timesheet entry. 

See below in `Template variables` to find out which variables you can use in your CSV file.

## Template variables

Be aware, that the following list of variables is only working for the "document" based formats, but NOT for twig templates. 
Twig templates are rendered actively, it is up to the developer to calculate what is needed.  

### Global variables 

The documents which are rendered passively (ODS, XLSX, CSV, DOCX) can use the following global variables:

| Key | Description |
|---|---|
| ${invoice.due_date} | The due date for the invoice payment |
| ${invoice.date} | The creation date of this invoice |
| ${invoice.number} | The generated invoice number |
| ${invoice.currency} | The invoice currency |
| ${invoice.currency_symbol} | The invoice currency as symbol (if available) |
| ${invoice.total_time} | The total working time (entries with a fixed rate are always calculated with 1) |
| ${invoice.duration_decimal} | The total working time as decimal value |
| ${invoice.total} | The invoices total (including tax) with currency |
| ${invoice.total_nc} | The invoices total (including tax) without currency (since 1.6) |
| ${invoice.total_plain} | The invoices total (including tax) as unformatted value (since 1.6.2) |
| ${invoice.subtotal} | The invoices subtotal (excluding tax) with currency |
| ${invoice.subtotal_nc} | The invoices subtotal (excluding tax) without currency (since 1.6) |
| ${invoice.subtotal_plain} | The invoices subtotal (excluding tax) as unformatted value (since 1.6.2) |
| ${invoice.currency} | The invoices currency as string (like EUR or USD) |
| ${invoice.vat} | The VAT in percent for this invoice |
| ${invoice.tax} | The tax of the invoice amount with currency |
| ${invoice.tax_nc} | The tax of the invoice amount without currency (since 1.6) |
| ${invoice.tax_plain} | The tax of the invoice amount as unformatted value (since 1.6.2) |
| ${template.name} | The invoice name, as configured in your template |
| ${template.company} | The company name, as configured in your template |
| ${template.address} | The invoicing address, as configured in your template |
| ${template.title} | The invoice title, as configured in your template |
| ${template.payment_terms} | Your payment terms, might be multiple lines |
| ${template.due_days} | The amount of days for the payment, starting with the day of creating the invoice |
| ${template.vat_id} | The Vat ID for this invoice (since 1.6) |
| ${template.contact} | Extended contact information, might be multiple lines (since 1.6) |
| ${template.payment_details} | Extended payment details like bank accounts, might be multiple lines (since 1.6) |
| ${query.begin} | The query begin as formatted short date |
| ${query.end} | The query end as formatted short date |
| ${query.month} | The month for this query (begin date) |
| ${query.month_number} | The numerical value for the month (with leading zero) |
| ${query.day} | The day for the queries begin as numerical value with leading zero |
| ${query.year} | The year for this query (begin date) |
| ${user.name} | The current users name |
| ${user.email} | The current users email  |
| ${user.alias} | The current users alias  |
| ${user.title} | The current users title  |
| ${user.meta.X} | The current users [preference]({% link _documentation/user-preferences.md %}) named `X`  |

The following values exist for the customer:

| Key | Description |
|---|---|
| ${customer.id} | The customer ID |
| ${customer.address} | The customer address |
| ${customer.name} | The customer name |
| ${customer.contact} | The customer contact |
| ${customer.company} | The customer company |
| ${customer.vat} | The customer Vat ID |
| ${customer.number} | The customer number |
| ${customer.country} | The customer country |
| ${customer.homepage} | The customer homepage |
| ${customer.comment} | The customer comment |
| ${customer.meta.x} | The customer [meta field]({% link _documentation/meta-fields.md %}) named `X`. The internal name `X` needs to be used in lowercase letters, eg. `FooBar` will be available as `${customer.meta.foobar}`. Only available if the field is visible.  |

If a project was selected in the invoice filter the following values exist as well:

| Key | Description |
|---|---|
| ${project.id} | The project ID |
| ${project.name} | The project name |
| ${project.comment} | The project name |
| ${project.order_number} | The project order number |
| ${project.start_date} | Projects start date-time (since 1.7) |
| ${project.end_date} | Projects end date-time (since 1.7) |
| ${project.order_date} | Projects order date-time (since 1.7) |
| ${project.budget_money} | Projects budget including currency (since 1.7) |
| ${project.budget_money_nc} | The projects budget without currency (since 1.7) |
| ${project.budget_money_plain} | The projects budget as unformatted value (since 1.7) |
| ${project.budget_time} | The projects time-budget as seconds (since 1.7) |
| ${project.budget_time_decimal} | The projects time-budget in decimal format (with localized separator) (since 1.7) |
| ${project.budget_time_minutes} | The projects time-budget in minutes with no decimals (since 1.7) |
| ${project.meta.x} | The project [meta field]({% link _documentation/meta-fields.md %}) named `X`. The internal name `X` needs to be used in lowercase letters, eg. `FooBar` will be available as `${project.meta.foobar}`. Only available if the field is visible.  |

If an activity was selected in the invoice filter the following values exist as well:

| Key | Description |
|---|---|
| ${activity.id} | The activity ID |
| ${activity.name} | The activity name |
| ${activity.comment} | The activity name |
| ${activity.meta.x} | The activity [meta field]({% link _documentation/meta-fields.md %}) named `X`. The internal name `X` needs to be used in lowercase letters, eg. `FooBar` will be available as `${activity.meta.foobar}`. Only available if the field is visible.  |

### Timesheet entry variables 

For each timesheet entry you can use the variables from the following table.

| Key | Description | Example |
|---|---|---|
| ${entry.row} | An empty string, used as template row for docx | |
| ${entry.description} | The entries description | _foo bar_ |
| ${entry.amount} | The format duration/amount for this entry | 02:47 h |
| ${entry.rate} | The rate for one unit of the entry (normally one hour) with currency | 1.100,01 EUR |
| ${entry.rate_nc} | The rate for one unit of the entry without currency (since 1.6) | 1100,01 |
| ${entry.rate_plain} | The rate for one unit of the entry as unformatted value (since 1.6.2) | 1100.01 |
| ${entry.total} | The total rate for this entry with currency | 1.278,33 EUR |
| ${entry.total_nc} | The total rate for this entry without currency (since 1.6) | 1.278,33 |
| ${entry.total_plain} | The total rate as unformatted value (since 1.6.2) | 1278.33 |
| ${entry.currency} | The currency for this record as string (like EUR or USD) | EUR |
| ${entry.duration} | The duration in seconds | 10020 |
| ${entry.duration_decimal} | The duration in decimal format (with localized separator) | 2.78 |
| ${entry.duration_minutes} | The duration in minutes with no decimals | 167 |
| ${entry.begin} | The begin date (format depends on the users language) | 27.10.2018 |
| ${entry.begin_time} | The formatted time for the begin of this entry | 14:57 |
| ${entry.begin_timestamp} | The timestamp for the begin of this entry | 1542016273 |
| ${entry.end} | The begin date  (format depends on the users language) | 27.10.2018 |
| ${entry.end_time} | The formatted time for the end of this entry | 17:44 |
| ${entry.end_timestamp} | The timestamp for the end of this entry | 1542016273 |
| ${entry.date} | The start date when this record was created | 27.10.2018 |
| ${entry.user_id} | The user ID | 1 |
| ${entry.user_name} | The username | susan_super |
| ${entry.user_alias} | The user alias | Susan Miller |
| ${entry.activity} | Activity name | Post production |
| ${entry.activity_id} | Activity ID | 124 |
| ${entry.project} | Project name | Nemesis |
| ${entry.project_id} | Project ID | 10 |
| ${entry.customer} | Customer name | Acme Studios |
| ${entry.customer_id} | Customer ID | 3 |
| ${entry.meta.X} | The [meta field]({% link _documentation/meta-fields.md %}) named `X` (if visible)  |
| ${entry.type} | The type of this entry (plugins can add custom types) | timesheet |
| ${entry.category} | The category of this entry (plugins can add custom types) | work |
