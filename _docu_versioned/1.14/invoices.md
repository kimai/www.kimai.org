---
title: Invoices
description: Create invoices directly within Kimai from timesheet data in several formats 
toc: true
canonical: /documentation/invoices.html
---

Kimai allows to create invoices from timesheet data in several formats. 

## Invoice number format

Since Kimai 1.9 you can configure the invoice number format. 
You can mix arbitrary characters and the allowed replacer from the list below. 
All examples represent the date `2019-07-09` (2019, July 9th):

- `{date}` - shortcut for `ymd`. Example: `190709` (default format before Kimai 1.9)
- `{c}` - counter for invoices of all times, starting from 1
- `{cy}` - counter for invoices this year, starting from 1
- `{cm}` - counter for invoices this month, starting from 1
- `{cd}` - counter for invoices this day, starting from 1
- `{Y}` -  full numeric representation of a year (4 digits). Example: `2019` 
- `{y}` - two digit representation of a year. Example: `19`
- `{M}` - numeric representation of a month, with leading zeros. Example: `07`
- `{m}` - numeric representation of a month, without leading zeros. Example: `7`
- `{D}` - day of the month, 2 digits with leading zeros. Example: `09`
- `{d}` - day of the month without leading zeros. Example: `9`
- `{cc}` - per customer invoice counter for all times, starting from 1 (since 1.10)
- `{ccy}` - per customer invoice counter for this year, starting from 1 (since 1.10)
- `{ccm}` - per customer invoice counter for this month, starting from 1 (since 1.10)
- `{ccd}` - per customer invoice counter for this day, starting from 1 (since 1.10)

Each replacer (x) can be combined with a length formatter, which will prepend (X) leading zeros, eg. `{x,X}`. 
Example: to get a three digit long string with year counter use `{cy,3}`, which results in `001` for the first invoice of the year.

{% capture additional_chars %}
Characters outside the replacer may **not** include `{` and `}`.
{% endcapture %}
{% assign additional_chars = additional_chars| markdownify %}
{% include alert.html icon="fas fa-exclamation" type="warning" alert=additional_chars %}

To change the format, look out for the {% include demo-action-button.html icon="fas fa-cog" %} icon in the invoice screen, or change it from the `System configurations`.

### Incrementing the invoice counter

Since 1.10 it is possible to increment the counter by a fixed value: you can add a number to the result. 
For evaluated counters, Kimai takes the amount of found invoices and adds 1, but you can replace `+1` with an addition like `+3`.
This works for the following replacer: `{c}` and `{cy}` and `{cm}` and `{cd}` and `{cc}` and `{ccy}` and `{ccm}` and `{ccd}`. 

Simply use the plus (`+`) after the replacer, eg. `{cy+72}`. This also works in combination with the length formatter, eg.: `{cy+72,3}` 

### Decrementing the invoice counter

Since 1.11 it is possible to decrement the counter by a fixed value: you can subtract a number from the result. 
For evaluated counters, Kimai takes the amount of found invoices and adds `+1`, but you can replace `+1` with a subtraction like `-12`.
This works for the following replacer: `{c}` and `{cy}` and `{cm}` and `{cd}` and `{cc}` and `{ccy}` and `{ccm}` and `{ccd}`. 

Simply use the minus (`-`) after the replacer, eg. `{cy-72}`. This also works in combination with the length formatter, eg.: `{cy-72,3}` 

### Examples

Assume you already wrote 72 invoices this year (before you started to use Kimai), and your counter is an incrementing number 
per year, which is prefixed with the four digit year:
- `{Y}/{cy+73,3}` would result in `2020/073` for your first invoice

Assume that you want to change your invoice numbering and reset it to zero, you already wrote 72 invoices this year, and your counter is an incrementing number per year that should be prefixed with the four digit year:
- `{Y}/{cy-72,3}` would result in `2020/001` for your first invoice

## Export state

Invoices and exports share the export state, which is used to mark timesheet records as processed. 
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.

You need to tick the checkbox before saving (Kimai 1.9) / printing (Kimai 1.8 and below) the invoice, to automatically set the export state on all filtered timesheet records.
 
For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

## Billable items only

Only billable items will be included in invoices (since version 1.10). 
By default, every timesheet records is billable.
Since version 1.14 users can set the billable flag on individual timesheets.  

[Expense items]({% link _store/keleo-expenses-bundle.md %}) have a configurable billable flag per item and only the ones marked as billable (refundable) will be included. 

## Invoice document

The invoice system currently supports the following formats:

- `HTML`
  - through the use of Twig templates
  - filename must end with `.html.twig` 
  - Pro: no need for additional software, print or convert to PDF from your browser (if supported)
  - Contra: you have to understand HTML and Twig
  - **the recommended invoice document format**
- `PDF` (since Kimai 1.9)
  - through the use of Twig templates
  - filename must end with `.pdf.twig` 
  - Pro: no need for additional software
  - Contra: you have to understand HTML, Twig and the MPDF library
- `DOCX`
  - OOXML - Open Office XML Text
  - Microsoft Word 2007-2013 XML
  - filename must end with `.docx` 
  - Pro: simple customization and possibility to edit the invoice later on
  - Contra: Non-free software required 
- `ODS`
  - Open Document Spreadsheet or OASIS, is the OpenOffice.org XML file format for spreadsheets supported by OpenOffice, LibreOffice, StarCalc, Microsoft and others 
  - file extension: filename must end with `.ods` 
  - Pro: open format, good for exporting and creating enhanced reports with an office software package
  - Contra: not ideal format for invoices (harder to customize)
- `XLSX`
  - Microsoft Excel™ 2007 shipped with a new file format, namely Microsoft Office Open XML SpreadsheetML, and Excel 2010 extended this still further with new features. 
  - file extension: filename must end with `.xlsx` 
  - Pro: good for creating enhanced reports with an office software package
  - Contra: Non-free software required, not ideal format for invoices
- `CSV`
  - Comma-separated file with UTF-8 encoding and double-quotes around each field 
  - filename must end with `.csv` 
  - Pro: good for exporting and creating enhanced reports with an office software package
  - Contra: only row based information possible (meta information can't be used properly), UTF-8 is not properly supported when using Excel (see [this issue]({{ site.kimai_v2_repo }}/issues/1537))

**Be aware**: the default templates were created and tested ONLY with LibreOffice!

### Create your own invoice document

Invoice documents are searched in two locations:

- `var/invoices/` - does not exist by default, please create it when you add a new document
- `templates/invoice/renderer/` - don't change files in here, will be overwritten with the next update

Be aware of the following rules:

- Documents are addressed by their filename without extension (e.g. `kimai.html.twig` results in `kimai`) 
- You can use every document name only once: so having `kimai.html.twig` and `kimai.docx` will lead to unpredictable results (the first file to be found takes precedence) 
- Kimai looks for templates in `var/invoices/` first, so you can overwrite default templates
- You should store your templates in `var/invoices/`, as this directory is not shipped with Kimai and not touched during updates
- You can configure different search directories through the config key `kimai.invoice.documents` if you want to add additional template source directories 
- You can hide the default templates by setting the key `kimai.invoice.defaults` to an empty array / null
- New or updated templates can be uploaded via the UI
 
{% include alert.html icon="fas fa-exclamation" type="warning" alert="Do NOT change the default templates, but copy the file and save it (with a new filename) at var/invoices/" %}
 
After you changed an invoice template, you have to [clear the cache]({% link _documentation/cache.md %}) to see the results:

You can have a look at [https://github.com/Keleo/kimai2-invoice-templates](https://github.com/Keleo/kimai2-invoice-templates) to get some inspirations. 

#### Configure search path

An example configuration in [local.yaml]({% link _documentation/local-yaml.md %}) might look like this (this shouldn't be necessary in 90% of all use-cases):

```yaml
kimai:
    invoice:
        # disable the default locations 
        defaults: ~
        # add a new search location
        documents:
            - 'var/my_invoices/'
```

### Uploading invoice documents

Sine Kimai 1.8 you can upload invoice documents via the UI at `/en/invoice/document_upload`.

Due to security restriction currently only the upload of the following formats is allowed: `DOCX`, `ODS`, `XLSX`.

There is a known bug in LibreOffice which exports DOCX files with a wrong mime-type. These files will not be accepted 
by Kimai with the error `This file type is not allowed` ([read this issue](https://github.com/kevinpapst/kimai2/issues/1916) for more information). 
The workaround is to change the document with another word processor: Apple pages, Google Drive and Microsoft 365 Online Office will export the DOCX files with the correct mimetype.

### Twig templates

Generally speaking, you should use only the variable `model` in your template which is an instance of `App\Model\InvoiceModel`.

Please see the [default templates]({{ site.kimai_v2_file }}/templates/invoice/renderer) at 
GitHub to find out which variables can be used. 

Want to include an image in your template? Use the `asset` tag for referencing relative URLs (this example points to the directory `public/images/my-logo.png`):
 
```twig
{% raw %}<img src="{{ asset('images/my-logo.png') }}">{% endraw %}
```

But the safest way is to host your images on your own domain:

```twig
{% raw %}<img src="https://www.example.com/images/my-logo.png">{% endraw %}
```

Want to include a file in your template? 
Use the twig include feature with the `@invoice` namespace . The following example references the file `bar.html.twig` in `var/invoices/foo/`:
```
{% raw %}{% include '@invoice/foo/bar.html.twig' %}{% endraw %}
``` 

### PDF templates 

PDF invoice templates are available since Kimai 1.9. 

These are basically the same as Twig templates. But the resulting HTML is processed by the [MPdf library](https://mpdf.github.io), 
which will convert the HTML & CSS to PDF.

### Docx templates

Docx templates are processed by [PHPWord](https://github.com/PHPOffice/PHPWord) and its `TemplateProcessor`.

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

See below in `Template variables` to find out which variables you can use.

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
| ${invoice.language} | The invoices language as two character code (since 1.9) |
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
| ${query.month} | The month for this query (begin date) **DEPRECATED** |
| ${query.month_number} | The numerical value for the month (with leading zero) **DEPRECATED** |
| ${query.day} | The day for the queries begin as numerical value with leading zero **DEPRECATED** |
| ${query.year} | The year for this query (begin date) **DEPRECATED** |
| ${query.begin_month} | The month for the queries begin date (since 1.9) |
| ${query.begin_month_number} | The numerical value for the month of the queries begin date with leading zero (since 1.9) |
| ${query.begin_day} | The day for the queries begin as numerical value with leading zero (since 1.9) |
| ${query.begin_year} | The year for the queries begin date (since 1.9) |
| ${query.end_month} | The month for the queries end date (since 1.9) |
| ${query.end_month_number} | The numerical value for the month of the queries end date with leading zero (since 1.9) |
| ${query.end_day} | The day for the queries end as numerical value with leading zero (since 1.9) |
| ${query.end_year} | The year for the queries end date (since 1.9) |
| ${user.name} | The current users name |
| ${user.email} | The current users email  |
| ${user.alias} | The current users alias  |
| ${user.title} | The current users title  |
| ${user.meta.X} | The current users [preference]({% link _documentation/user-preferences.md %}) named `X`  |

### Customer variables

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
| ${customer.phone} | The customers phone number (since 1.9) |
| ${customer.mobile} | The customers mobile number (since 1.9) |
| ${customer.email} | The customers email address (since 1.9) |
| ${customer.fax} | The customers fax number (since 1.9) |
| ${customer.meta.x} | The customer [meta field]({% link _documentation/meta-fields.md %}) named `X`. The internal name `X` needs to be used in lowercase letters, eg. `FooBar` will be available as `${customer.meta.foobar}`. Only available if the field is visible.  |

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
| ${entry.week} | The start week number when this record was created (since 1.10) | 39 |
| ${entry.weekyear} | The corresponding year to the week number (since 1.10) | 2018 |
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

### Project variables

If a project was selected in the invoice filter (search form) the following variables exist as well:

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

If you selected more than one project in the search, you will have further variables called `${project.1.X}`, `${project.2.X}` and so on.
The order is not guaranteed, so it is not recommended to rely on those variables.  

### Activity variables

If an activity was selected in the invoice filter (search form) the following variables exist as well:

| Key | Description |
|---|---|
| ${activity.id} | The activity ID |
| ${activity.name} | The activity name |
| ${activity.comment} | The activity name |
| ${activity.meta.x} | The activity [meta field]({% link _documentation/meta-fields.md %}) named `X`. The internal name `X` needs to be used in lowercase letters, eg. `FooBar` will be available as `${activity.meta.foobar}`. Only available if the field is visible.  |

If you selected more than one project in the search, you will have further variables called `${activity.1.X}`, `${activity.2.X}` and so on.
The order is not guaranteed, so it is not recommended to rely on those variables.  

## Create invoices with cronjobs

Since 1.9 Kimai comes with a new command, which allows you to create invoices from the command line.
When combined with a cronjob, you can automate your invoice creation.
 
Find all available options with the `--help` parameter:
```bash
bin/console kimai:invoice:create --help 
```

This command will create one invoice for every customer which had timesheets in this month.
The invoice template that will be used is fetched from the customer meta-field `inv_tpl` (can be an ID or a template name):
```bash
bin/console kimai:invoice:create --user=susan_super --timezone=Europe/Berlin --by-customer --template-meta=inv_tpl 
```

This command will create one invoice for every project which had timesheets in January 2020.
The invoice template that will be used for every invoice is `Freelancer (PDF)`:
```bash
bin/console kimai:invoice:create --user=susan_super --timezone=UTC --by-project --template="Freelancer (PDF)" --start=2020-01-02 --end=2020-01-31
```


