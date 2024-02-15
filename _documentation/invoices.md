---
title: Invoices
description: Create invoices directly within Kimai from timesheet data in several formats 
canonical: /documentation/invoices.html
redirect_from:
  - /documentation/invoices/
  - /documentation/developer/invoice-templates.html
  - /documentation/invoice-templates/
  - /v1/invoice-templates.html
  - /v1/invoices.html
  - /documentation/2.0/invoices.html
related:
  - plugin-invoice
---

Kimai allows creating invoices from timesheet data in several formats.

{% include youtube-video.html id="first_invoice" %}

## Invoice number format

You can mix arbitrary characters and the allowed replacer from the list below.
All examples represent the date `2019-07-09` (2019, July 9th):

- `{date}`      - shortcut for `ymd`. Example: `190709` (default format before Kimai 1.9)
- `{cname}`     - the customer name
- `{cnumber}`   - the customer number
- `{c}`         - counter for invoices of all times, starting at 1
- `{cy}`        - counter for invoices this year, starting at 1
- `{cm}`        - counter for invoices this month, starting at 1
- `{cd}`        - counter for invoices this day, starting at 1
- `{Y}`         -  full numeric representation of a year (4 digits). Example: `2019`
- `{y}`         - two digit representation of a year. Example: `19`
- `{M}`         - numeric representation of a month, with leading zeros. Example: `07`
- `{m}`         - numeric representation of a month, without leading zeros. Example: `7`
- `{D}`         - day of the month, 2 digits with leading zeros. Example: `09`
- `{d}`         - day of the month without leading zeros. Example: `9`
- `{cc}`        - per customer invoice counter for all times, starting at 1
- `{ccy}`       - per customer invoice counter for this year, starting at 1
- `{ccm}`       - per customer invoice counter for this month, starting at 1
- `{ccd}`       - per customer invoice counter for this day, starting at 1
- `{cu}`        - per user (the one creating the invoice) invoice counter for all times, starting at 1
- `{cuy}`       - per user (the one creating the invoice) invoice counter for this year, starting at 1
- `{cum}`       - per user (the one creating the invoice) invoice counter for this month, starting at 1
- `{cud}`       - per user (the one creating the invoice) invoice counter for this day, starting at 1
- `{ustaff}`    - the user (the one creating the invoice) staff number, empty if not configured
- `{uid}`       - the internal user (the one creating the invoice) ID
 
Each replacer (x) can be combined with a length formatter, which will prepend (X) leading zeros, eg. `{x,X}`.
Example: to get a three digit long string with year counter use `{cy,3}`, which results in `001` for the first invoice of the year.

{% capture additional_chars %}
1. Characters outside the replacer **cannot** include `{` and `}`.  
2. The invoice number is unique in Kimai and you cannot generate an invoice with the same invoice number twice. Kimai will try to avoid that automatically by incrementing the counter, but if that is impossible, you'll see an error message.
3. You can change the format at [System > Settings]({% link _documentation/configurations.md %}).
{% endcapture %}
{% assign additional_chars = additional_chars| markdownify %}
{% include alert.html icon="fas fa-exclamation" type="warning" alert=additional_chars %}

### Incrementing the invoice counter

It is possible to increment the counter by adding a number to the result.
For evaluated counters, Kimai takes the amount of found invoices and adds 1, but you can replace `+1` with an addition like `+3`.
This works for the following replacer: `{c}` and `{cy}` and `{cm}` and `{cd}` and `{cc}` and `{ccy}` and `{ccm}` and `{ccd}`.

Simply use the plus (`+`) after the replacer, eg. `{cy+72}`. This also works in combination with the length formatter, eg.: `{cy+72,3}`

### Decrementing the invoice counter

You can decrement the counter subtracting a number from the result.
For evaluated counters, Kimai takes the amount of found invoices and adds `+1`, but you can replace `+1` with a subtraction like `-12`.
This works for the following replacer: `{c}` and `{cy}` and `{cm}` and `{cd}` and `{cc}` and `{ccy}` and `{ccm}` and `{ccd}`.

Simply use the minus (`-`) after the replacer, eg. `{cy-72}`. This also works in combination with the length formatter, eg.: `{cy-72,3}`

### Examples

Assume you already wrote 72 invoices this year (before you started to use Kimai), and your counter is an incrementing number
per year, which is prefixed with the four digit year:
- `{Y}/{cy+73,3}` would result in `2020/073` for your first invoice

Assume that you want to change your invoice numbering and reset it to zero, you already wrote 72 invoices this year, and your counter is an incrementing number per year that should be prefixed with the four digit year:
- `{Y}/{cy-72,3}` would result in `2020/001` for your first invoice

## Invoice state

Invoices can have multiple states:
- `New` - the invoice was just created
- `Waiting for payment` - the invoice was sent to the customer
- `Invoice paid` - the invoice was paid (you have to choose a payment date)
- `Canceled` - the invoice was accidentally created

### Deleting invoices

Invoices should not be deleted, because this can cause all kinds of weird problems in Kimai (depending on your invoice number format).

You should instead "cancel" invalid invoices. Many users fear legal issues if they don't have consecutive invoice numbers, 
please clarify that with your accountant - this is often not a legal requirement. Instead it is a completely regular workflow, 
that invoices get canceled (the used invoice number will not be released).

If you insist on deleting invoices, do NOT delete them if you already created invoices afterwards.
This will cause troubles with your invoice counter, as Kimai is calculating invoice numbers from the amount of entries in the database.
By deleting invoices you lower the amount of invoices in the database, and the next invoice number might be one that you already used.

Invoice deletion is disabled by default, because of all known problems with deletion. 
You can activate it enabling the [permissions]({% link _documentation/permissions.md %}) called `delete_invoice`.  

## Export state

Invoices and exports share the export state, which is used to mark timesheet records as processed.
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.

You need to tick the "mark as export" checkbox before saving the invoice, to automatically set the export state on all filtered timesheet records.

The "mark as export" checkbox is only available for users with the `edit_export_other_timesheet` [permission]({% link _documentation/permissions.md %}).

For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

## Billable items only

Only billable items will be included in invoices.

By default, every timesheet records is billable, but users can set the billable flag on individual timesheets.

[Expense items]({% link _store/keleo-expenses-bundle.md %}) have a configurable billable flag per item and only the ones marked as billable (refundable) will be included.

***

## Invoice document

The invoice system currently supports the following formats:

- `PDF`
    - through the use of Twig templates
    - filename must end with `.pdf.twig`
    - Pro: no need for additional software
    - Contra: you have to understand HTML, Twig and the MPDF library
    - **the recommended invoice document format**
- `HTML`
    - through the use of Twig templates
    - filename must end with `.html.twig`
    - Pro: no need for additional software, print or convert to PDF from your browser (if supported)
    - Contra: you have to understand HTML and Twig
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

### Create your own invoice document

Invoice documents are searched in two locations:

- `var/invoices/` - does not exist by default, please create it when you add a new document
- `templates/invoice/renderer/` - don't change files in here, will be overwritten with the next update

Be aware of the following rules:

- Documents are addressed by their filename without extension (e.g. `kimai.html.twig` results in `kimai`)
- You can use every document name only once: so having `kimai.html.twig` and `kimai.docx` will lead to unpredictable results (the first file to be found takes precedence)
- Kimai looks for templates in `var/invoices/` first, so you can overwrite default templates
- You should store your templates in `var/invoices/`, as this directory is not shipped with Kimai and not touched during updates
- You can [configure different search directories]({% link _documentation/local-yaml.md %}) through the config key `kimai.invoice.documents` if you want to add additional template source directories

{% include alert.html icon="fas fa-exclamation" type="warning" alert="Do NOT change the default templates, but copy the file and save it (with a new filename) at var/invoices/" %}

After you changed an invoice template, you have to [clear the cache]({% link _documentation/cache.md %}) to see the results.

### More invoice templates 

There is a place where the community can share invoice templates. Please do so, if you created a nice looking an re-usable template yourself!

The repository for all templates is [https://github.com/kimai/invoice-templates](https://github.com/kimai/invoice-templates) and it includes installation notes

### Twig templates

Generally speaking, you have two main variables in your template which you should use:
- `entries` which is an array of arrays, with the first level representing the invoice items and the second level being `Timesheet entry variables` (see below)
- `invoice` which is an array of variables (see `Template variables` below), just with a different syntax for access, e.g.: `{% raw %}{{ invoice['invoice.due_date'] }}{% endraw %}` instead of `{% raw %}${invoice.due_date}{% endraw %}` 
- don't rely on the `model` variable (which is an instance of `App\Model\InvoiceModel`) as it's accessor methods can change without warning

Please see the [default templates]({{ site.kimai_v2_file }}/templates/invoice/renderer) at
GitHub to find out which variables can be used.

Use this debug template to find out which variables are available:
```twig
{% raw %}<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ invoice['invoice.number'] }}-{{ invoice['customer.company']|default(invoice['customer.name'])|u.snake }}</title>
    <style type="text/css">
        {{ encore_entry_css_source('invoice-pdf')|raw }}
    </style>
</head>
<body>
<div class="wrapper">
    <h3>The following list of variables is available for this invoice:</h3>
    <p>Please note, that the available variables will change depending on your search. E.g. the {{ '{{ project }}' }} variables are only available if you selected a project in your search filter.</p>
    <table class="items">
        <tr>
            <th>Variable</th>
            <th>Value</th>
        </tr>
        {% for name, value in invoice %}
            <tr class="{{ cycle(['odd', 'even'], loop.index0) }}">
                <td>{{ "{{ invoice['" ~ name ~ "'] }}" }}</td>
                <td>{{ invoice[name] }}</td>
            </tr>
        {% endfor %}
    </table>
    <h3>The following list is available for all timesheet entries, which can be rendered like this:</h3>
    <pre>
    {{ '{%' }} for entry in entries {{ '%}' }}
    &lt;ul&gt;
        {{ '{%' }} for name, value in entry {{ '%}' }}
            &lt;li&gt;{{ '{{ name }}' }}: {{ '{{ value }}' }}&lt;/li&gt;
        {{ '{%' }} endfor {{ '%}' }}
    &lt;/ul&gt;
    {{ '{%' }} endfor {{ '%}' }}
    </pre>
    <p>The table below contains only the first timesheet record:</p>
    <table class="items">
        <tr>
            <th>Variable</th>
            <th>Value</th>
        </tr>
        {% for entry in entries|slice(1) %}
            {% for name, value in entry %}
                <tr class="{{ cycle(['odd', 'even'], loop.index0) }}">
                    <td>{{ "{{ entry['" ~ name ~ "'] }}" }}</td>
                    <td>{{ value }}</td>
                </tr>
            {% endfor %}
        {% endfor %}
    </table>
</div>
</body>
</html>{% endraw %}
```

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
```twig
{% raw %}{% include '@invoice/foo/bar.html.twig' %}{% endraw %}
``` 

#### Custom fields

Iterating above all entries (line items) in the invoice with `{% raw %}{% for line in entries %}{% endraw %}` 
allows access to your custom fields.

Want to use a **timesheet custom-field** in your template?
```twig
{% raw %}{% if line['entry.meta.foo'] is defined %}
    Foo: {{ line['entry.meta.foo'] }}
{% endif %}{% endraw %}
``` 
Please be aware:
- you can access timesheet custom fields only if you use the "sum calculation" standard, which creates one invoice line item per timesheet.
- if you group timesheets e.g. by project, you loose access to their custom fields.
- entries could be of type "expense" or other types (depending on your used plugins), you can test that with `{% raw %}{% if line['entry.type'] == 'timesheet' '%}{% endraw %}` 

Want to use a **customer custom-field** in your template?
```twig
{% raw %}{% if invoice['customer.meta.foo'] is defined %}
    Foo: {{ invoice['customer.meta.foo'] }}
{% endif %}{% endraw %}
``` 

Want to use a **project custom-field** in your template?
```twig
{% raw %}{% if line['entry.project.meta.foo'] is defined %}
    Foo: {{ line['entry.project.meta.foo'] }}
{% endif %}{% endraw %}
``` 

Want to use a **user preference** in your template?
```twig
{% raw %}{% if line['entry.user_preference.foo'] is defined %}
    Foo: {{ line['entry.user_preference.foo'] }}
{% endif %}{% endraw %}
``` 

### PDF templates

There is so much to say about PDF templates, that there is a dedicated page about [PDF templates]({% link _documentation/pdf-templates.md %}).
 
### Docx templates

Docx templates are processed by [PHPWord](https://github.com/PHPOffice/PHPWord) and its `TemplateProcessor`.

**Important:** You have to add one of the variables - either `${entry.description}` or `${entry.row}` - in one table row,
otherwise the records will not be rendered (but only the global values)!

The row containing this variable will be cloned for every included (timesheet) record.

If you do not use `${entry.description}` then a fallback for `${entry.row}` is used and will be removed in the rendering process,
it will not show up in the generated invoice.

See below in `Template variables` to find out which variables you can use in your template.

Find out more about PHPWord templates [here](https://phpword.readthedocs.io/en/latest/templates-processing.html).

### Spreadsheets (ODS and XLSX)

Spreadsheet templates are powered by [PhpSpreadsheet](https://github.com/PHPOffice/PhpSpreadsheet).

**Important:** within the first 100 rows you MUST-HAVE the template row for timesheet entries, which means there must be
a value starting with `${entry.` in one of the first 10 columns, otherwise no timesheet records will be rendered!

_Check the default templates if that doesn't make sense to you ;-)_

This row will then be cloned for every timesheet entry.

See below in `Template variables` to find out which variables you can use.

## Template variables

Be aware, that the following list of variables is working for the "document" based formats (ODS, XLSX, DOCX).

Twig rendering is different, you have to access the variables with `{% raw %}{{ invoice['xxx.yyy'] }}{% endraw %}` instead of `${xxx.yyy}`. 

### Global variables

| Key                           | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| ${invoice.due_date}           | The due date for the invoice payment                                                    |
| ${invoice.date}               | The creation date of this invoice                                                       |
| ${invoice.number}             | The generated invoice number                                                            |
| ${invoice.currency}           | The invoice currency                                                                    |
| ${invoice.currency_symbol}    | The invoice currency as symbol (if available)                                           |
| ${invoice.total_time}         | The total working time (entries with a fixed rate are always calculated with 1)         |
| ${invoice.duration_decimal}   | The total working time as decimal value                                                 |
| ${invoice.language}           | The invoices language as two character code                                             |
| ${invoice.total}              | The invoices total (including tax) with currency                                        |
| ${invoice.total_nc}           | The invoices total (including tax) without currency                                     |
| ${invoice.total_plain}        | The invoices total (including tax) as unformatted value                                 |
| ${invoice.subtotal}           | The invoices subtotal (excluding tax) with currency                                     |
| ${invoice.subtotal_nc}        | The invoices subtotal (excluding tax) without currency                                  |
| ${invoice.subtotal_plain}     | The invoices subtotal (excluding tax) as unformatted value                              |
| ${invoice.currency}           | The invoices currency as string (like EUR or USD)                                       |
| ${invoice.vat}                | The VAT in percent for this invoice                                                     |
| ${invoice.tax}                | The tax of the invoice amount with currency                                             |
| ${invoice.tax_nc}             | The tax of the invoice amount without currency                                          |
| ${invoice.tax_plain}          | The tax of the invoice amount as unformatted value                                      |
| ${invoice.tax_hide}           | A boolean flag indicating if the tax field should be hidden (only applies if tax = 0)   |
| ${template.name}              | The invoice name, as configured in your template                                        |
| ${template.company}           | The company name, as configured in your template                                        |
| ${template.address}           | The invoicing address, as configured in your template                                   |
| ${template.title}             | The invoice title, as configured in your template                                       |
| ${template.payment_terms}     | Your payment terms, might be multiple lines                                             |
| ${template.due_days}          | The amount of days for the payment, starting with the day of creating the invoice       |
| ${template.vat_id}            | The Vat ID for this invoice                                                             |
| ${template.contact}           | Extended contact information, might be multiple lines                                   |
| ${template.payment_details}   | Extended payment details like bank accounts, might be multiple lines                    |
| ${query.begin}                | The query begin as formatted short date                                                 |
| ${query.end}                  | The query end as formatted short date                                                   |
| ${query.month}                | The month for this query (begin date) **DEPRECATED**                                    |
| ${query.month_number}         | The numerical value for the month (with leading zero) **DEPRECATED**                    |
| ${query.day}                  | The day for the queries begin as numerical value with leading zero **DEPRECATED**       |
| ${query.year}                 | The year for this query (begin date) **DEPRECATED**                                     |
| ${query.begin_month}          | The month for the queries begin date                                                    |
| ${query.begin_month_number}   | The numerical value for the month of the queries begin date with leading zero           |
| ${query.begin_day}            | The day for the queries begin as numerical value with leading zero                      |
| ${query.begin_year}           | The year for the queries begin date                                                     |
| ${query.end_month}            | The month for the queries end date                                                      |
| ${query.end_month_number}     | The numerical value for the month of the queries end date with leading zero             |
| ${query.end_day}              | The day for the queries end as numerical value with leading zero                        |
| ${query.end_year}             | The year for the queries end date                                                       |
| ${query.activity.name}        | Activity name (only if exactly one activity was filtered)                               |
| ${query.activity.comment}     | Activity comment/description (only if exactly one activity was filtered)                |
| ${query.project.name}         | Project name (only if exactly one project was filtered)                                 |
| ${query.project.comment}      | Project comment/description (only if exactly one project was filtered)                  |
| ${query.project.order_number} | Project Order-Number (only if exactly one project was filtered)                         |
| ${user.display}               | The current users display name                                                          |
| ${user.email}                 | The current users email                                                                 |
| ${user.name}                  | The current users name                                                                  |
| ${user.alias}                 | The current users alias                                                                 |
| ${user.title}                 | The current users title                                                                 |
| ${user.see_others}            | A boolean indicating if the current user can see other users items                      |
| ${user.meta.X}                | The current users [preference]({% link _documentation/user-preferences.md %}) named `X` |
{: .table }

### Timesheet entry variables

For each timesheet record you can use these variables:

| Key                          | Description                                                                                                                                                                                                         | Example         |
|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|
| ${entry.row}                 | An empty string, used as template row for docx                                                                                                                                                                      |                 |
| ${entry.description}         | The entries description                                                                                                                                                                                             | _foo bar_       |
| ${entry.amount}              | DEPRECATED (do not use): The decimal duration for this entry. If this is a fixed rate entry, it contains the formatted amount.                                                                                      | 2.78            |
| ${entry.rate}                | The rate for one unit of the entry (normally one hour) with currency                                                                                                                                                | 1.100,01 EUR    |
| ${entry.rate_nc}             | The rate for one unit of the entry without currency                                                                                                                                                                 | 1100,01         |
| ${entry.rate_plain}          | The rate for one unit of the entry as unformatted value                                                                                                                                                             | 1100.01         |
| ${entry.total}               | The total rate for this entry with currency                                                                                                                                                                         | 1.278,33 EUR    |
| ${entry.total_nc}            | The total rate for this entry without currency                                                                                                                                                                      | 1.278,33        |
| ${entry.total_plain}         | The total rate as unformatted value                                                                                                                                                                                 | 1278.33         |
| ${entry.currency}            | The currency for this record as string (like EUR or USD)                                                                                                                                                            | EUR             |
| ${entry.duration}            | The duration in seconds                                                                                                                                                                                             | 10020           |
| ${entry.duration_format}     | The duration in human-readable format                                                                                                                                                                               | 02:47           |
| ${entry.duration_decimal}    | The duration in decimal format (with localized separator)                                                                                                                                                           | 2.78            |
| ${entry.duration_minutes}    | The duration in minutes with no decimals                                                                                                                                                                            | 167             |
| ${entry.begin}               | The begin date (format depends on the users language)                                                                                                                                                               | 27.10.2018      |
| ${entry.begin_time}          | The formatted time for the begin of this entry                                                                                                                                                                      | 14:57           |
| ${entry.begin_timestamp}     | The timestamp for the begin of this entry                                                                                                                                                                           | 1542016273      |
| ${entry.end}                 | The begin date  (format depends on the users language)                                                                                                                                                              | 27.10.2018      |
| ${entry.end_time}            | The formatted time for the end of this entry                                                                                                                                                                        | 17:44           |
| ${entry.end_timestamp}       | The timestamp for the end of this entry                                                                                                                                                                             | 1542016273      |
| ${entry.date}                | The start date when this record was created                                                                                                                                                                         | 27.10.2018      |
| ${entry.week}                | The start week number when this record was created                                                                                                                                                                  | 39              |
| ${entry.weekyear}            | The corresponding year to the week number                                                                                                                                                                           | 2018            |
| ${entry.user_id}             | The user ID                                                                                                                                                                                                         | 1               |
| ${entry.user_name}           | The username                                                                                                                                                                                                        | susan_super     |
| ${entry.user_alias}          | The user alias                                                                                                                                                                                                      | Susan Miller    |
| ${entry.user_preference.foo} | The user preference called `foo`                                                                                                                                                                                    | bar             |
| ${entry.activity}            | Activity name                                                                                                                                                                                                       | Post production |
| ${entry.activity_id}         | Activity ID                                                                                                                                                                                                         | 124             |
| ${entry.project}             | Project name                                                                                                                                                                                                        | Nemesis         |
| ${entry.project_id}          | Project ID                                                                                                                                                                                                          | 10              |
| ${entry.customer}            | Customer name                                                                                                                                                                                                       | Acme Studios    |
| ${entry.customer_id}         | Customer ID                                                                                                                                                                                                         | 3               |
| ${entry.meta.foo}            | The [meta field]({% link _documentation/meta-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${entry.meta.foo}`. Only available if the field is visible. |                 |
| ${entry.tags}                | Comma separated list of all tags                                                                                                                                                                                    | foo, bar        |
| ${entry.type}                | The type of this entry (plugins can add custom types)                                                                                                                                                               | timesheet       |
| ${entry.category}            | The category of this entry (plugins can add custom types)                                                                                                                                                           | work            |
{: .table }

### Customer variables

Variables for the customer who is receiving the invoice:

| Key                                | Description (highlighted words are the names in the UI)                                                                                                                                                                          |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ${customer.id}                     | The internal customer ID (do not display that on your invoices)                                                                                                                                                                  |
| ${customer.name}                   | The customer `name`                                                                                                                                                                                                              |
| ${customer.comment}                | The `description` of this customer                                                                                                                                                                                               |
| ${customer.address}                | The customer `address`                                                                                                                                                                                                           |
| ${customer.contact}                | Usually the name of the customer `contact` person                                                                                                                                                                                |
| ${customer.company}                | The `company name`                                                                                                                                                                                                               |
| ${customer.vat}                    | The customer `Vat ID`                                                                                                                                                                                                            |
| ${customer.number}                 | The customer `account` number                                                                                                                                                                                                    |
| ${customer.country}                | The `country` of the customer location                                                                                                                                                                                           |
| ${customer.homepage}               | A URL to the customer `homepage`                                                                                                                                                                                                 |
| ${customer.phone}                  | The customers `phone` number                                                                                                                                                                                                     |
| ${customer.mobile}                 | The customers `mobile` number                                                                                                                                                                                                    |
| ${customer.email}                  | The customers `email` address                                                                                                                                                                                                    |
| ${customer.fax}                    | The customers `fax` number                                                                                                                                                                                                       |
| ${customer.meta.foo}               | The customer [meta field]({% link _documentation/meta-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${customer.meta.foo}`. Only available if the field is visible.  |
| ${customer.budget_open}            | The open monetary budget for this customer at the end date of your filter query (formatted with currency) (since 1.16.7)                                                                                                         |
| ${customer.budget_open_plain}      | The open monetary budget for this customer at the end date of your filter query (plain float value) (since 1.16.7)                                                                                                               |
| ${customer.time_budget_open}       | The open time budget for this customer at the end date of your filter query (formatted) (since 1.16.7)                                                                                                                           |
| ${customer.time_budget_open_plain} | The open time budget for this customer at the end date of your filter query (integer value = seconds) (since 1.16.7)                                                                                                             |
{: .table }

### Project variables

The following variables exist, if projects could be found in the filtered data:

| Key                               | Description (highlighted words are the names in the UI)                                                                                                                                                                        |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ${project.id}                     | The internal project ID (do not display that on your invoices)                                                                                                                                                                 |
| ${project.name}                   | The project `name`                                                                                                                                                                                                             |
| ${project.comment}                | The `description` of this project                                                                                                                                                                                              |
| ${project.order_number}           | The project `order number`                                                                                                                                                                                                     |
| ${project.start_date}             | The `Project start` date-time                                                                                                                                                                                                  |
| ${project.end_date}               | The `Project end` date-time                                                                                                                                                                                                    |
| ${project.order_date}             | Projects `order date`-time                                                                                                                                                                                                     |
| ${project.budget_money}           | Projects budget including currency                                                                                                                                                                                             |
| ${project.budget_money_nc}        | The projects budget without currency                                                                                                                                                                                           |
| ${project.budget_money_plain}     | The projects budget as unformatted value                                                                                                                                                                                       |
| ${project.budget_time}            | The projects time-budget as seconds                                                                                                                                                                                            |
| ${project.budget_time_decimal}    | The projects time-budget in decimal format (with localized separator)                                                                                                                                                          |
| ${project.budget_time_minutes}    | The projects time-budget in minutes with no decimals                                                                                                                                                                           |
| ${project.meta.foo}               | The project [meta field]({% link _documentation/meta-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${project.meta.foo}`. Only available if the field is visible.  |
| ${project.budget_open}            | The open monetary budget for this project at the end date of your filter query (formatted with currency) (since 1.16.7)                                                                                                        |
| ${project.budget_open_plain}      | The open monetary budget for this project at the end date of your filter query (plain float value) (since 1.16.7)                                                                                                              |
| ${project.time_budget_open}       | The open time budget for this project at the end date of your filter query (formatted) (since 1.16.7)                                                                                                                          |
| ${project.time_budget_open_plain} | The open time budget for this project at the end date of your filter query (integer value = seconds) (since 1.16.7)                                                                                                            |
{: .table }

If more than one project was found, you will have further variables (same list as above) called `${project.1.name}`, `${project.2.name}` and so on.
The order is not guaranteed, so it is not recommended relying on those variables. 
If your template relies on a `{$project.X}` variable, it is recommended to limit the invoice data with the project search filter. 

### Activity variables

The following variables exist, if activities could be found in the filtered data:

| Key                                | Description (highlighted words are the names in the UI)                                                                                                                                                                          |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ${activity.id}                     | The internal activity ID (do not display that on your invoices)                                                                                                                                                                  |
| ${activity.name}                   | The activity `name`                                                                                                                                                                                                              |
| ${activity.comment}                | The `description` of this activity                                                                                                                                                                                               |
| ${activity.meta.foo}               | The activity [meta field]({% link _documentation/meta-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${activity.meta.foo}`. Only available if the field is visible.  |
| ${activity.budget_open}            | The open monetary budget for this activity at the end date of your filter query (formatted with currency) (since 1.16.7)                                                                                                         |
| ${activity.budget_open_plain}      | The open monetary budget for this activity at the end date of your filter query (plain float value) (since 1.16.7)                                                                                                               |
| ${activity.time_budget_open}       | The open time budget for this activity at the end date of your filter query (formatted) (since 1.16.7)                                                                                                                           |
| ${activity.time_budget_open_plain} | The open time budget for this activity at the end date of your filter query (integer value = seconds) (since 1.16.7)                                                                                                             |
{: .table }

If more than one activity was found, you will have further variables (same list as above) called `${activity.1.name}`, `${activity.2.name}` and so on.
The order is not guaranteed, so it is not recommended relying on those variables.
If your template relies on a `{activity.X}` variable, it is recommended to limit the invoice data with the activity search filter.

### Uploading invoice documents

You can upload invoice documents via the UI at `/en/invoice/document_upload`.

Due to security restrictions currently only the upload of the following formats is allowed: `DOCX`, `ODS`, `XLSX`.

There is a known bug in LibreOffice which exports DOCX files with a wrong mime-type. These files will not be accepted
by Kimai with the error `This file type is not allowed` ([read this issue]({{ site.kimai_v2_repo }}/issues/1916) for more information).
The workaround is to change the document with another word processor: Apple pages, Google Drive and Microsoft 365 Online Office will export the DOCX files with the correct mimetype.

## Filter and search in the invoice archive

The search supports filtering by the fields:
- `creation date`
- `customer`
- `state`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `comment`
- `customer name`
- `customer company`

{% include documentation/search-custom-field.md %}
