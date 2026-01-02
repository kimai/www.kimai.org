---
title: Invoice templates
description: Creating custom invoice templates for  
canonical: /documentation/invoice-templates.html
related:
  - invoices
  - plugin-invoice
---

The invoice system currently supports the following file formats for generating invoices:

**PDF**

- Filename must end with `.pdf.twig`
- Pro: no need for additional software
- Contra: you have to understand HTML and Twig
- **The recommended invoice document format**

**HTML**

- Filename must end with `.html.twig`
- Pro: no need for additional software, print or convert to PDF from your browser
- Contra: you have to understand HTML and Twig

**DOCX**

- Microsoft Word
- Filename must end with `.docx`
- Pro: possibility to edit the invoice later on, can be converted to PDF
- Contra: not accepted for invoices in many countries, non-free software required

**ODS**

- Open Document Spreadsheet is supported by OpenOffice, LibreOffice, StarCalc, Microsoft and others
- File extension: filename must end with `.ods`
- Pro: free and open format, can be converted to PDF
- Contra: not accepted for invoices in many countries

**XLSX**

- File extension: filename must end with `.xlsx`
- Pro: good for creating enhanced reports with an office software package
- Contra: not accepted for invoices in many countries, non-free software required

## Create a template

Invoice documents are searched in two locations:

- `var/invoices/` - does not exist by default, please create it when you add your templates
- `templates/invoice/renderer/` - don't change files in here, will be overwritten with the next update

Be aware of the following rules:

- Documents are addressed by their filename without extension (e.g. `kimai.html.twig` results in `kimai`)
- You can use every document name only once: so having `kimai.html.twig` and `kimai.docx` will lead to unpredictable results (the first file to be found takes precedence)
- Kimai looks for templates in `var/invoices/` first, so you can overwrite default templates
- You should store your templates in `var/invoices/`, as this directory is not shipped with Kimai and not touched during updates

{% alert warning %}Do NOT change the default templates, but copy the file and save it at `var/invoices/`{% endalert %}

### Pre-made templates 

There is a place where the community can share invoice templates. Please do so, if you created a nice looking and re-usable template yourself!

The repository for all templates is [https://github.com/kimai/invoice-templates](https://github.com/kimai/invoice-templates) and it includes installation notes.

### PDF templates

PDF files are generated from HTML, which itself is created with a Twig template (see below).

There is so much to say about PDF templates, that there is a dedicated page about [PDF templates]({% link _documentation/pdf-templates.md %}).

### Twig templates (HTML)

Twig templates are used to generate HTML and PDF files.

Generally speaking, you have two main variables in your template which you should use:
- `invoice` which is an array of variables (see `Global variables` below) 
- `entries` which is an array of arrays, representing the invoice items and their `Invoice items`

**Attention**: accessing the `model` variable (instance of `App\Model\InvoiceModel`) directly is deprecated and will be removed in the future (no BC promise given!)

Please see the [default templates]({{ site.kimai_v2_file }}/templates/invoice/renderer) at GitHub to find out which variables can be used.

Want to include an image in your template? Use the `asset` tag for referencing relative URLs (this example points to the directory `public/images/my-logo.png`):

```twig
{% raw %}<img src="{{ asset('images/my-logo.png') }}">{% endraw %}
```
 
But the safest way is to host your images on your own domain:

```twig
{% raw %}<img src="https://www.example.com/images/my-logo.png">{% endraw %}
```

Due to security reasons, most twig functions and filters are disabled in the invoice renderer.
Therefor you cannot use `include` or `embed` to include other templates.

After you changed a twig template, you have to [clear the cache]({% link _documentation/cache.md %}) to see the results.

#### Custom fields

Iterating above all entries (line items) in the invoice with `{% raw %}{% for line in entries %}{% endraw %}` allows access to your custom fields.

Want to use a **timesheet custom-field** in your template?
```twig
{% raw %}{% if line['entry.meta.foo'] is defined %}
    Foo: {{ line['entry.meta.foo'] }}
{% endif %}{% endraw %}
``` 
Please be aware:
- you can access timesheet custom fields only if you use the "sum calculation" standard, which creates one invoice line item per timesheet.
- if you group timesheets, e.g., by project, you lose access to their custom fields.
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

### Docx templates

Docx templates are processed by [PHPWord](https://github.com/PHPOffice/PHPWord) and its `TemplateProcessor`.

**Important:** You have to add the variable `${entry.row}` in the table row that will be duplicated for each entry,
otherwise the records will not be rendered at all. In that case only the global values will be replaced!

The row containing this variable will be cloned for every included (timesheet) record.

The variable `${entry.row}` will be removed during the rendering process, it will not show up in your generated invoices.

See below in `Template variables` to find out which variables you can use in your template.

Find out more about PHPWord templates [here](https://phpword.readthedocs.io/en/latest/templates-processing.html).

### Spreadsheets (ODS and XLSX)

Spreadsheet templates are powered by [PhpSpreadsheet](https://github.com/PHPOffice/PhpSpreadsheet).

**Important:** within the first 100 rows of the **active spreadsheet** you MUST-HAVE the template row for timesheet entries, which means there must be
a value starting with `${entry.` in one of the first 10 columns, otherwise no timesheet records will be rendered. 

If you don't have that, you will see the error `Invalid invoice document, no template row found.`.
This error might also happen if you have multiple sheets in your spreadsheet, and save the file while the active sheet is one without the `${entry.` placeholder.  

_Check the default templates if that doesn't make sense to you ;-)_

The row containing the `${entry.` template will be cloned for every timesheet entry.

See below in `Template variables` to find out which variables you can use.

## Template variables

Be aware, that the following list of variables is working for the "document" based formats (ODS, XLSX, DOCX).

Twig rendering is different, you have to access the variables with `{% raw %}{{ invoice['xxx.yyy'] }}{% endraw %}` instead of `${xxx.yyy}`. 

Date variables have equivalents with the suffix `_process`, so you can use them in combination with the Twig filter for date formatting e.g. `|date('d. m. Y.')`.
So you can either use the pre-formatted date value or you can convert it yourself.
The example `{% raw %}{{ invoice['invoice.due_date'] }}{% endraw %}` would then be converted to `{% raw %}{{ invoice['invoice.due_date_process']|date('d. m. Y.') }}{% endraw %}`.

### Global variables

| Twig                                    | Document (DOCX, XLSX, ODS)      | Description                                                                                           |
|-----------------------------------------|---------------------------------|-------------------------------------------------------------------------------------------------------|
| `invoice['invoice.due_date']`           | `${invoice.due_date}`           | The due date for the invoice payment formatted in the requested locale                                |
| `invoice['invoice.due_date_process']`   | `${invoice.due_date_process}`   | The due date for the invoice payment, to be formatted with the twig filter `date()`                   |
| `invoice['invoice.date']`               | `${invoice.date}`               | The creation date of this invoice                                                                     |
| `invoice['invoice.date_process']`       | `${invoice.date_process}`       | The creation date of this invoice, to be formatted with the twig filter `date()`                      |
| `invoice['invoice.number']`             | `${invoice.number}`             | The generated invoice number                                                                          |
| `invoice['invoice.currency']`           | `${invoice.currency}`           | The invoice currency                                                                                  |
| `invoice['invoice.currency_symbol']`    | `${invoice.currency_symbol}`    | The invoice currency as symbol (if available)                                                         |
| `invoice['invoice.total_time']`         | `${invoice.total_time}`         | The total working time (entries with a fixed rate are always calculated with 1)                       |
| `invoice['invoice.duration_decimal']`   | `${invoice.duration_decimal}`   | The total working time as decimal value                                                               |
| `invoice['invoice.language']`           | `${invoice.language}`           | The invoices language as two character code                                                           |
| `invoice['invoice.total']`              | `${invoice.total}`              | The invoices total (including tax) with currency                                                      |
| `invoice['invoice.total_nc']`           | `${invoice.total_nc}`           | The invoices total (including tax) without currency                                                   |
| `invoice['invoice.total_plain']`        | `${invoice.total_plain}`        | The invoices total (including tax) as unformatted value                                               |
| `invoice['invoice.subtotal']`           | `${invoice.subtotal}`           | The invoices subtotal (excluding tax) with currency                                                   |
| `invoice['invoice.subtotal_nc']`        | `${invoice.subtotal_nc}`        | The invoices subtotal (excluding tax) without currency                                                |
| `invoice['invoice.subtotal_plain']`     | `${invoice.subtotal_plain}`     | The invoices subtotal (excluding tax) as unformatted value                                            |
| `invoice['invoice.currency']`           | `${invoice.currency}`           | The invoices currency as string (like EUR or USD)                                                     |
| `invoice['invoice.vat']`                | `${invoice.vat}`                | **Deprecated** The VAT in percent for this invoice                                                    |
| `invoice['invoice.tax']`                | `${invoice.tax}`                | **Deprecated** The tax of the invoice amount with currency                                            |
| `invoice['invoice.tax_nc']`             | `${invoice.tax_nc}`             | **Deprecated** The tax of the invoice amount without currency                                         |
| `invoice['invoice.tax_plain']`          | `${invoice.tax_plain}`          | **Deprecated** The tax of the invoice amount as unformatted value                                     |
| `invoice['invoice.tax_hide']`           | `${invoice.tax_hide}`           | **Deprecated** A boolean flag indicating if the tax field should be hidden (only applies if tax = 0)  |
| `invoice['template.name']`              | `${template.name}`              | The invoice template (for internal use, usually not needed)                                           |
| `invoice['template.title']`             | `${template.title}`             | The invoice document title                                                                            |
| `invoice['template.payment_terms']`     | `${template.payment_terms}`     | Your payment terms, might be multiple lines                                                           |
| `invoice['template.due_days']`          | `${template.due_days}`          | The amount of days for the payment, starting with the day of creating the invoice                     |
| `invoice['template.contact']`           | `${template.contact}`           | Extended contact information, might be multiple lines                                                 |
| `invoice['template.payment_details']`   | `${template.payment_details}`   | Payment details like bank accounts (free text, might be multiple lines)                               |
| `invoice['query.begin']`                | `${query.begin}`                | The query begin as formatted short date                                                               |
| `invoice['query.begin_process']`        | `${query.begin_process}`        | The query begin, to be formatted with the twig filter `date()`                                        |
| `invoice['query.end']`                  | `${query.end}`                  | The query end as formatted short date                                                                 |
| `invoice['query.end_process']`          | `${query.end_process}`          | The query end, to be formatted with the twig filter `date()`                                          |
| `invoice['query.begin_month']`          | `${query.begin_month}`          | The month for the queries begin date                                                                  |
| `invoice['query.begin_month_number']`   | `${query.begin_month_number}`   | The numerical value for the month of the queries begin date with leading zero                         |
| `invoice['query.begin_day']`            | `${query.begin_day}`            | The day for the queries begin as numerical value with leading zero                                    |
| `invoice['query.begin_year']`           | `${query.begin_year}`           | The year for the queries begin date                                                                   |
| `invoice['query.end_month']`            | `${query.end_month}`            | The month for the queries end date                                                                    |
| `invoice['query.end_month_number']`     | `${query.end_month_number}`     | The numerical value for the month of the queries end date with leading zero                           |
| `invoice['query.end_day']`              | `${query.end_day}`              | The day for the queries end as numerical value with leading zero                                      |
| `invoice['query.end_year']`             | `${query.end_year}`             | The year for the queries end date                                                                     |
| `invoice['query.activity.name']`        | `${query.activity.name}`        | Activity name (only if exactly one activity was filtered)                                             |
| `invoice['query.activity.comment']`     | `${query.activity.comment}`     | Activity comment/description (only if exactly one activity was filtered)                              |
| `invoice['query.project.name']`         | `${query.project.name}`         | Project name (only if exactly one project was filtered)                                               |
| `invoice['query.project.comment']`      | `${query.project.comment}`      | Project comment/description (only if exactly one project was filtered)                                |
| `invoice['query.project.order_number']` | `${query.project.order_number}` | Project Order-Number (only if exactly one project was filtered)                                       |
| `invoice['user.display']`               | `${user.display}`               | The current users display name                                                                        |
| `invoice['user.email']`                 | `${user.email}`                 | The current users email                                                                               |
| `invoice['user.name']`                  | `${user.name}`                  | The current users name                                                                                |
| `invoice['user.alias']`                 | `${user.alias}`                 | The current users alias                                                                               |
| `invoice['user.title']`                 | `${user.title}`                 | The current users title                                                                               |
| `invoice['user.see_others']`            | `${user.see_others}`            | A boolean indicating if the current user can see other users items                                    |
| `invoice['user.meta.X']`                | `${user.meta.X}`                | The current [users preference]({% link _documentation/user-preferences.md %}) named `X`               |
{: .table }

### Tax Rows

Tax rows are only available in Twig. You can loop all tax rows with `{% raw %}{% for tax in invoice['invoice.tax_rows'] %}{% endraw %}`.

| Twig              | Description                                                                                                                 |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------|
| `tax['show']`     | Whether the row should be displayed                                                                                         |
| `tax['name']`     | Name of the Tax rule (should be translated with the `trans` filter)                                                         |
| `tax['rate']`     | The tax rate between 0 and 99                                                                                               |
| `tax['note']`     | An empty or non-empty string like "Reverse charge" or the Tax exempt message (should be translated with the `trans` filter) |
| `tax['amount']`   | Tax amount (should be used in combination with the `money` filter                                                           |
| `tax['currency']` | The tax currency                                                                                                            |
| `tax['counter']`  | And ID that you can use to create footnotes for the `note`                                                                  |
{: .table }

### Invoice items (timesheets)

You can loop all invoice items in Twig with `{% raw %}{% for item in entries %}{% endraw %}`. For all other formats see docs above.

| Twig                                | Document (DOCX, XLSX, ODS)     | Description                                                                                                                                                                                                                  | Example         |
|-------------------------------------|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|
| -                                   | `${entry.row}`                 | An empty string, only used as template row for DOCX                                                                                                                                                                          |                 |
| `item['entry.description']`         | `${entry.description}`         | The entries description                                                                                                                                                                                                      | _foo bar_       |
| `item['entry.description_safe']`    | `${entry.description_safe}`    | The entries description. If that is empty the activity name will be used.                                                                                                                                                    | _foo bar_       |
| `item['entry.amount']`              | `${entry.amount}`              | DEPRECATED (do not use): The decimal duration for this entry. If this is a fixed rate entry, it contains the formatted amount.                                                                                               | 2.78            |
| `item['entry.rate']`                | `${entry.rate}`                | The rate for one unit of the entry (normally one hour) with currency                                                                                                                                                         | 1.100,01 EUR    |
| `item['entry.rate_nc']`             | `${entry.rate_nc}`             | The rate for one unit of the entry without currency                                                                                                                                                                          | 1100,01         |
| `item['entry.rate_plain']`          | `${entry.rate_plain}`          | The rate for one unit of the entry as unformatted value                                                                                                                                                                      | 1100.01         |
| `item['entry.total']`               | `${entry.total}`               | The total rate for this entry with currency                                                                                                                                                                                  | 1.278,33 EUR    |
| `item['entry.total_nc']`            | `${entry.total_nc}`            | The total rate for this entry without currency                                                                                                                                                                               | 1.278,33        |
| `item['entry.total_plain']`         | `${entry.total_plain}`         | The total rate as unformatted value                                                                                                                                                                                          | 1278.33         |
| `item['entry.currency']`            | `${entry.currency}`            | The currency for this record as string (like EUR or USD)                                                                                                                                                                     | EUR             |
| `item['entry.duration']`            | `${entry.duration}`            | The duration in seconds                                                                                                                                                                                                      | 10020           |
| `item['entry.duration_format']`     | `${entry.duration_format}`     | The duration in human-readable format                                                                                                                                                                                        | 02:47           |
| `item['entry.duration_decimal']`    | `${entry.duration_decimal}`    | The duration in decimal format (with localized separator)                                                                                                                                                                    | 2.78            |
| `item['entry.duration_minutes']`    | `${entry.duration_minutes}`    | The duration in minutes with no decimals                                                                                                                                                                                     | 167             |
| `item['entry.begin']`               | `${entry.begin}`               | The begin date (format depends on the users language)                                                                                                                                                                        | 27.10.2018      |
| `item['entry.begin_time']`          | `${entry.begin_time}`          | The formatted time for the begin of this entry                                                                                                                                                                               | 14:57           |
| `item['entry.begin_timestamp']`     | `${entry.begin_timestamp}`     | The timestamp for the begin of this entry                                                                                                                                                                                    | 1542016273      |
| `item['entry.end']`                 | `${entry.end}`                 | The begin date  (format depends on the users language)                                                                                                                                                                       | 27.10.2018      |
| `item['entry.end_time']`            | `${entry.end_time}`            | The formatted time for the end of this entry                                                                                                                                                                                 | 17:44           |
| `item['entry.end_timestamp']`       | `${entry.end_timestamp}`       | The timestamp for the end of this entry                                                                                                                                                                                      | 1542016273      |
| `item['entry.date']`                | `${entry.date}`                | The start date when this record was created                                                                                                                                                                                  | 27.10.2018      |
| `item['entry.date_process']`        | `${entry.date_process}`        | The start date of this record, to be formatted with the twig filter `date()`                                                                                                                                                 |
| `item['entry.week']`                | `${entry.week}`                | The start week number when this record was created                                                                                                                                                                           | 39              |
| `item['entry.weekyear']`            | `${entry.weekyear}`            | The corresponding year to the week number                                                                                                                                                                                    | 2018            |
| `item['entry.user_id']`             | `${entry.user_id}`             | The user ID                                                                                                                                                                                                                  | 1               |
| `item['entry.user_name']`           | `${entry.user_name}`           | The username                                                                                                                                                                                                                 | susan_super     |
| `item['entry.user_alias']`          | `${entry.user_alias}`          | The user alias                                                                                                                                                                                                               | Susan Miller    |
| `item['entry.user_preference.foo']` | `${entry.user_preference.foo}` | The user preference called `foo`                                                                                                                                                                                             | bar             |
| `item['entry.activity']`            | `${entry.activity}`            | Activity name                                                                                                                                                                                                                | Post production |
| `item['entry.activity_id']`         | `${entry.activity_id}`         | Activity ID                                                                                                                                                                                                                  | 124             |
| `item['entry.project']`             | `${entry.project}`             | Project name                                                                                                                                                                                                                 | Nemesis         |
| `item['entry.project_id']`          | `${entry.project_id}`          | Project ID                                                                                                                                                                                                                   | 10              |
| `item['entry.customer']`            | `${entry.customer}`            | Customer name                                                                                                                                                                                                                | Acme Studios    |
| `item['entry.customer_id']`         | `${entry.customer_id}`         | Customer ID                                                                                                                                                                                                                  | 3               |
| `item['entry.meta.foo']`            | `${entry.meta.foo}`            | The [meta field]({% link _documentation/plugin-custom-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${entry.meta.foo}`. Only available if the field is visible. |                 |
| `item['entry.tags']`                | `${entry.tags}`                | Comma separated list of all tags                                                                                                                                                                                             | foo, bar        |
| `item['entry.type']`                | `${entry.type}`                | The type of this entry (plugins can add custom types)                                                                                                                                                                        | timesheet       |
| `item['entry.category']`            | `${entry.category}`            | The category of this entry (plugins can add custom types)                                                                                                                                                                    | work            |
{: .table }

### Invoice issuer

The invoice issuer is the company sending the invoice.

| Twig                                | Document (DOCX, XLSX, ODS)   | Description (highlighted words are the names in the UI)                                                                                                                                                                                  |
|-------------------------------------|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `invoice['issuer.id']`              | `${issuer.id}`               | The internal customer ID (do not display that on your invoices)                                                                                                                                                                          |
| `invoice['issuer.name']`            | `${issuer.name}`             | The customer `name`                                                                                                                                                                                                                      |
| `invoice['issuer.comment']`         | `${issuer.comment}`          | The `description` of this customer                                                                                                                                                                                                       |
| `invoice['issuer.address_line1']`   | `${issuer.address_line1}`    | Customer address: Line 1                                                                                                                                                                                                                 |
| `invoice['issuer.address_line2']`   | `${issuer.address_line2}`    | Customer address: Line 2                                                                                                                                                                                                                 |
| `invoice['issuer.address_line3']`   | `${issuer.address_line3}`    | Customer address: Line 3                                                                                                                                                                                                                 |
| `invoice['issuer.postcode']`        | `${issuer.postcode}`         | Customer address: Post Code                                                                                                                                                                                                              |
| `invoice['issuer.city']`            | `${issuer.city}`             | Customer address: City                                                                                                                                                                                                                   |
| `invoice['issuer.contact']`         | `${issuer.contact}`          | Usually the name of the customer `contact` person                                                                                                                                                                                        |
| `invoice['issuer.company']`         | `${issuer.company}`          | The `company name`                                                                                                                                                                                                                       |
| `invoice['issuer.vat_id']`          | `${issuer.vat_id}`           | The customer `Vat ID`                                                                                                                                                                                                                    |
| `invoice['issuer.number']`          | `${issuer.number}`           | The customer `account` number                                                                                                                                                                                                            |
| `invoice['issuer.country']`         | `${issuer.country}`          | The `country` of the customer location, as 2-letter code                                                                                                                                                                                 |
| `invoice['issuer.country_name']`    | `${issuer.country_name}`     | The translated `country` name                                                                                                                                                                                                            |
| `invoice['issuer.homepage']`        | `${issuer.homepage}`         | A URL to the customer `homepage`                                                                                                                                                                                                         |
| `invoice['issuer.phone']`           | `${issuer.phone}`            | The customers `phone` number                                                                                                                                                                                                             |
| `invoice['issuer.mobile']`          | `${issuer.mobile}`           | The customers `mobile` number                                                                                                                                                                                                            |
| `invoice['issuer.email']`           | `${issuer.email}`            | The customers `email` address                                                                                                                                                                                                            |
| `invoice['issuer.fax']`             | `${issuer.fax}`              | The customers `fax` number                                                                                                                                                                                                               |
| `invoice['issuer.invoice_text']`    | `${issuer.invoice_text}`     | The configurable invoice text for that customer                                                                                                                                                                                          |
| `invoice['issuer.buyer_reference']` | `${issuer.buyer_reference}`  | Buyer reference, used in e-invoicing                                                                                                                                                                                                     |
| `invoice['issuer.meta.foo']`        | `${issuer.meta.foo}`         | The customer [meta field]({% link _documentation/plugin-custom-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${customer.meta.foo}`. Only available if the field is visible. |
{: .table }

### Customer

The customer is the company receiving the invoice.

| Twig                                  | Document (DOCX, XLSX, ODS)    | Description (highlighted words are the names in the UI)                                                                                                                                                                                  |
|---------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `invoice['customer.id']`              | `${customer.id}`              | The internal customer ID (do not display that on your invoices)                                                                                                                                                                          |
| `invoice['customer.name']`            | `${customer.name}`            | The customer `name`                                                                                                                                                                                                                      |
| `invoice['customer.comment']`         | `${customer.comment}`         | The `description` of this customer                                                                                                                                                                                                       |
| `invoice['customer.address_line1']`   | `${customer.address_line1}`   | Customer address: Line 1                                                                                                                                                                                                                 |
| `invoice['customer.address_line2']`   | `${customer.address_line2}`   | Customer address: Line 2                                                                                                                                                                                                                 |
| `invoice['customer.address_line3']`   | `${customer.address_line3}`   | Customer address: Line 3                                                                                                                                                                                                                 |
| `invoice['customer.postcode']`        | `${customer.postcode}`        | Customer address: Post Code                                                                                                                                                                                                              |
| `invoice['customer.city']`            | `${customer.city}`            | Customer address: City                                                                                                                                                                                                                   |
| `invoice['customer.contact']`         | `${customer.contact}`         | Usually the name of the customer `contact` person                                                                                                                                                                                        |
| `invoice['customer.company']`         | `${customer.company}`         | The `company name`                                                                                                                                                                                                                       |
| `invoice['customer.vat_id']`          | `${customer.vat_id}`          | The customer `Vat ID`                                                                                                                                                                                                                    |
| `invoice['customer.number']`          | `${customer.number}`          | The customer `account` number                                                                                                                                                                                                            |
| `invoice['customer.country']`         | `${customer.country}`         | The `country` of the customer location, as 2-letter code                                                                                                                                                                                 |
| `invoice['customer.country_name']`    | `${customer.country_name}`    | The translated `country` name                                                                                                                                                                                                            |
| `invoice['customer.homepage']`        | `${customer.homepage}`        | A URL to the customer `homepage`                                                                                                                                                                                                         |
| `invoice['customer.phone']`           | `${customer.phone}`           | The customers `phone` number                                                                                                                                                                                                             |
| `invoice['customer.mobile']`          | `${customer.mobile}`          | The customers `mobile` number                                                                                                                                                                                                            |
| `invoice['customer.email']`           | `${customer.email}`           | The customers `email` address                                                                                                                                                                                                            |
| `invoice['customer.fax']`             | `${customer.fax}`             | The customers `fax` number                                                                                                                                                                                                               |
| `invoice['customer.invoice_text']`    | `${customer.invoice_text}`    | The configurable invoice text for that customer                                                                                                                                                                                          |
| `invoice['customer.buyer_reference']` | `${customer.buyer_reference}` | Buyer reference, used in e-invoicing                                                                                                                                                                                                     |
| `invoice['customer.meta.foo']`        | `${customer.meta.foo}`        | The customer [meta field]({% link _documentation/plugin-custom-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${customer.meta.foo}`. Only available if the field is visible. |
{: .table }

### Project

The following variables exist, if projects could be found in the filtered data:

| Twig                                     | Document (DOCX, XLSX, ODS)       | Description (highlighted words are the names in the UI)                                                                                                                                                                                |
|------------------------------------------|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `invoice['project.id']`                  | `${project.id}`                  | The internal project ID (do not display that on your invoices)                                                                                                                                                                         |
| `invoice['project.name']`                | `${project.name}`                | The project `name`                                                                                                                                                                                                                     |
| `invoice['project.comment']`             | `${project.comment}`             | The `description` of this project                                                                                                                                                                                                      |
| `invoice['project.order_number']`        | `${project.order_number}`        | The project `order number`                                                                                                                                                                                                             |
| `invoice['project.start_date']`          | `${project.start_date}`          | The `Project start` date-time                                                                                                                                                                                                          |
| `invoice['project.end_date']`            | `${project.end_date}`            | The `Project end` date-time                                                                                                                                                                                                            |
| `invoice['project.order_date']`          | `${project.order_date}`          | Projects `order date`-time                                                                                                                                                                                                             |
| `invoice['project.budget_money']`        | `${project.budget_money}`        | Projects budget including currency                                                                                                                                                                                                     |
| `invoice['project.budget_money_nc']`     | `${project.budget_money_nc}`     | The projects budget without currency                                                                                                                                                                                                   |
| `invoice['project.budget_money_plain']`  | `${project.budget_money_plain}`  | The projects budget as unformatted value                                                                                                                                                                                               |
| `invoice['project.budget_time']`         | `${project.budget_time}`         | The projects time-budget as seconds                                                                                                                                                                                                    |
| `invoice['project.budget_time_decimal']` | `${project.budget_time_decimal}` | The projects time-budget in decimal format (with localized separator)                                                                                                                                                                  |
| `invoice['project.budget_time_minutes']` | `${project.budget_time_minutes}` | The projects time-budget in minutes with no decimals                                                                                                                                                                                   |
| `invoice['project.number']`              | `${project.number}`              | The project number                                                                                                                                                                                                                     |
| `invoice['project.invoice_text']`        | `${project.invoice_text}`        | The project invoice-text                                                                                                                                                                                                               |
| `invoice['project.meta.foo']`            | `${project.meta.foo}`            | The project [meta field]({% link _documentation/plugin-custom-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${project.meta.foo}`. Only available if the field is visible. |
{: .table }

If more than one project was found, you will have further variables (same list as above) called `${project.1.name}`, `${project.2.name}` and so on.
The order is not guaranteed, so it is not recommended relying on those variables. 
If your template relies on a `{$project.X}` variable, it is recommended to limit the invoice data with the project search filter. 

### Activity

The following variables exist, if activities could be found in the filtered data:

| Twig                               | Document (DOCX, XLSX, ODS)   | Description (highlighted words are the names in the UI)                                                                                                                                                                                  |
|------------------------------------|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `invoice['activity.id']`           | `${activity.id}`             | The internal activity ID (do not display that on your invoices)                                                                                                                                                                          |
| `invoice['activity.name']`         | `${activity.name}`           | The activity `name`                                                                                                                                                                                                                      |
| `invoice['activity.comment']`      | `${activity.comment}`        | The `description` of this activity                                                                                                                                                                                                       |
| `invoice['activity.number']`       | `${activity.number}`         | The activity number                                                                                                                                                                                                                      |
| `invoice['activity.invoice_text']` | `${activity.invoice_text}`   | The activity invoice-text                                                                                                                                                                                                                |
| `invoice['activity.meta.foo']`     | `${activity.meta.foo}`       | The activity [meta field]({% link _documentation/plugin-custom-fields.md %}) with the internal name `foo` (must be in lowercase letters, e.g. `FOO` will be available as `${activity.meta.foo}`. Only available if the field is visible. |
{: .table }

If more than one activity was found, you will have further variables (same list as above) called `${activity.1.name}`, `${activity.2.name}` and so on.
The order is not guaranteed, so it is not recommended relying on those variables.
If your template relies on a `{activity.X}` variable, it is recommended to limit the invoice data with the activity search filter.

### Uploading invoice templates

You can upload invoice documents via the UI at `/en/invoice/document_upload`.

Due to security restrictions currently only the upload of the following formats is allowed: `DOCX`, `ODS`, `XLSX`.

There is a known bug in LibreOffice which exports DOCX files with a wrong mime-type. These files will not be accepted
by Kimai with the error `This file type is not allowed` ([read this issue]({{ site.kimai_v2_repo }}/issues/1916) for more information).
The workaround is to change the document with another word processor: Apple pages, Google Drive and Microsoft 365 Online Office will export the DOCX files with the correct mimetype.

### Twig debug template

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
