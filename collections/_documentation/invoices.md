---
title: Invoices
description: Create invoices within Kimai in several file formats 
canonical: /documentation/invoices.html
related:
  - invoice-templates
  - plugin-invoice
---

Kimai allows creating invoices from timesheet data in several formats.

{% include youtube-video.html id="first_invoice" %}

## Export flag

Invoices and exports share the `export` flag, which is used to mark timesheet records as processed.
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.

For further information, read the [timesheet documentation]({% link _documentation/timesheet.md %}).

## Billable items only

Only billable items will be included in invoices.

By default, every timesheet record is billable, but users can set the billable flag on individual timesheets.

[Expense items]({% link _store/keleo-expenses-bundle.md %}) have a configurable billable flag per item and only the ones marked as billable (refundable) will be included.

## Invoice templates

You need an invoice template to create an invoice. 
The invoice template is a set of attributes, that defines the invoice settings, like sending company and tax rate.  

- `Name` - Internal name to identify the template
- `Title` - UTitle of the rendered invoice (usually something like "Invoice")
- `Invoice issuer` - Data for the "invoice sender" is pulled from this company: you need to [create a customer]({% link _documentation/customer.md %}) for your own company and configure all attributes like `Company name`, `Vat ID` and `address`
- `Terms of payment` - Free text field to clarify payment details
- `Contact` - Free text field to store contact details
- `Bank account` - Human readable payment details (like bank name and account number)
- `Tax rate` - Tax rate of this invoice
- `Payment term in days` - Duration until this invoice needs to be paid in (in days)
- `Language` - Language for translations (only works in PDF and HTML invoices)
- `Invoicenumber-Generator` - Which logic to use when generating the invoice number
- `Invoice template` - The renderer of the invoice (default or custom template)
- `Grouping of invoice lines` - How invoice items are grouped
- `E-Invoicing` - Read the [Invoice+ plugin]({% link _documentation/plugin-invoice.md %}) docs (OnPremise customer need to [purchase the plugin]({% link _store/keleo-invoice-bundle.md %}))

Further information are available: 

- Read how to [create your own invoice template]({% link _documentation/invoice-templates.md %})
- The community shares re-usable invoices templates at [https://github.com/kimai/invoice-templates](https://github.com/kimai/invoice-templates)
- Due to security restrictions, you can only upload the formats `DOCX`, `ODS`, `XLSX`
- Cloud customers [need to send customer Twig templates]({% link _documentation/cloud/cloud-invoice-templates.md %}) to the support

## Invoice state

Invoices can have multiple states:
- `New` invoices were just created
- `Waiting for payment` means the invoice was sent to the customer
- `Invoice paid` flags the invoice for its final state (you have to choose a payment date)
- `Canceled` invoices were accidentally created or required changes after creation

### Cancel invoices

It is important to understand, that Kimai does not keep track of the items that were included in an invoice.

By canceling an invoice, you do **not** reset the `export` state of the timesheets,
but have to filter for already exported records if you want to re-create the invoice with the same timesheets.

Canceled invoices stay in the system and the invoice number will be kept for bookkeeping.

### Deleting invoices

Invoices should not be deleted, because this can cause problems in Kimai (depending on your invoice number format).

You should instead "cancel" invalid invoices. Some users fear legal issues if they don't have consecutive invoice numbers, 
but this is often not a legal requirement (please clarify with your accountant).

If you still insist on deleting invoices, do **not** delete them if you already created invoices afterward.
This will cause troubles with your invoice counter, as Kimai is calculating invoice numbers from the number of entries in the database.
By deleting invoices, you lower the number of invoices in the database, and the next invoice number might be one that was already used.

Invoice deletion is therefor disabled by default, but you can activate it with the `delete_invoice` [permissions]({% link _documentation/permissions.md %}).  

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
- `{Y}`         - full numeric representation of a year (4 digits). Example: `2019`
- `{y}`         - two digit representation of a year. Example: `19`
- `{M}`         - numeric representation of a month, with leading zeros. Example: `07`
- `{m}`         - numeric representation of a month, without leading zeros. Example: `7`
- `{D}`         - day of the month, 2 digits with leading zeros. Example: `09`
- `{d}`         - day of the month without leading zeros. Example: `9`
- `{YY}`        - full numeric representation of a year (4 digits), to be used with decrement/increment (default increment = 1). Example: `2020`
- `{MM}`        - numeric representation of a month, to be used with decrement/increment (default increment = 1). Example: `10`
- `{DD}`        - day of the month, to be used with decrement/increment (default increment = 1). Example: `24`
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

{% alert warning %}
1. Characters outside the replacer **cannot** include `{` and `}`.
2. The invoice number is unique in Kimai, and you cannot generate an invoice with the same invoice number twice. Kimai will try to avoid that automatically by incrementing the counter, but if that is impossible, you'll see an error message.
3. You can change the format at [System → Settings]({% link _documentation/configurations.md %}).
   {% endalert %}

### Increment counter

It is possible to increment the counter by adding a number to the result.
For evaluated counters, Kimai takes the number of found invoices and adds 1, but you can replace `+1` with an addition like `+3`.
This works for the following replacer: `{c}` and `{cy}` and `{cm}` and `{cd}` and `{cc}` and `{ccy}` and `{ccm}` and `{ccd}`.

Simply use the plus (`+`) after the replacer, eg. `{cy+72}`. This also works in combination with the length formatter, eg.: `{cy+72,3}`

### Decrement counter

You can decrement the counter subtracting a number from the result.
For evaluated counters, Kimai takes the number of found invoices and adds `+1`, but you can replace `+1` with a subtraction like `-12`.
This works for the following replacer: `{c}` and `{cy}` and `{cm}` and `{cd}` and `{cc}` and `{ccy}` and `{ccm}` and `{ccd}`.

Simply use the minus (`-`) after the replacer, eg. `{cy-72}`. This also works in combination with the length formatter, eg.: `{cy-72,3}`

### Examples

Assume you already wrote 72 invoices this year (before you started to use Kimai), and your counter is an incrementing number
per year, which is prefixed with the four-digit year:
- `{Y}/{cy+73,3}` would result in `2020/073` for your first invoice

Assume that you want to change your invoice numbering and reset it to zero, you already wrote 72 invoices this year, and your counter is an incrementing number per year that should be prefixed with the four digit year:
- `{Y}/{cy-72,3}` would result in `2020/001` for your first invoice

## Invoice archive

All invoices will be stored in the `Invoice history` listing page. 

The search supports filtering by the fields:
- `creation date`
- `customer`
- `state`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `comment`
- `customer name`
- `customer company`

{% include snippets/search-custom-field.md %}
 
## Permissions

{% include documentation/permissions.md id="invoice" howto=true %}
