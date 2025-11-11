
This bundle has the following features: 

1. Parallel e-invoice creation next to the normal invoice flow
2. Automatic generation of a PDF with all contained timesheets  
3. Configuration of a global language, which is used to format all invoices data (money, date, time).

### E-Invoices

Support for EU e-invoices with the following profiles is added:

- `EN16931` (CII)
- `EN16931` (UBL)
- `XRechnung 3.0` (CII)
- `XRechnung 3.0` (UBL)
- `Zugferd` (PDF/A hybrid)
- `Factur-X` (PDF/A hybrid)

The e-invoice XML is always generated side by side to the original invoice document, no matter if that is PDF or e.g. Word, and it can be downloaded. 
If a hybrid format is chosen, the invoice document must be a PDF. 
The invoice will then be generated as a `PDF/A-3 + associated files + additional XMP RDF` (for ZUGFeRD and Factur-X). 

Kimai supports the following payment types (numbers are the official IDs):
- 58: SEPA Credit Transfer
- 59: SEPA Direct Debit
- 30: Credit Transfer
- 49: Direct Debit
- 42: Payment To Bank Account
- 48: Card Payment
- 10: Cash

The document type is hard-coded to `Commercial invoice (380)` and can currently not be changed. 

You can configure the following fields for every invoice template:
- E-Invoice profile type
- Payment type
- Account or card-holder 
- IBAN or card number

![E-Invoice Settings]({% link /images/blog/e-invoicing-eu-setting.webp %}){:class="image"}

### Automatic timesheet PDF

When creating a new invoice, another PDF will be created, which contains a summary grouped-by-project (on the first page) 
and the list of all contained timesheets (on the following pages).

The file can be downloaded on the invoice archive listing page, from the `Timesheet` action in the dropdown.

You could generate the same PDF using the export function in Kimai, but that requires manual steps:

- changing to the export
- filtering the exact same timesheets
- creating the export 
- renaming the file to match the invoice

The used "export template" for this feature can be configured. 

This feature needs to be activated at [System > Settings > Invoices]({% link _documentation/configurations.md %}). 

### Data format language

In the core system of Kimai, you configure the language for an invoice via its template. Then this language is used for translations and also for the formatting of data.

This behavior might not be desired if you export invoice data e.g. to JSON and use that as input for further processing.
Or if you translate your invoice to english for cross-country sales but still want to use your countries formats.

Without choosing a language the default behaviour is used. 

This feature needs to be activated by choosing a locale at [System > Settings > Invoices]({% link _documentation/configurations.md %}).
You can deactivate it by using the empty dropdown field.

### Additional formats

The plugins adds renderer for other invoice template formats, such as:

- JSON: with the file extension `.json.twig`
- XML: with the file extension `.xml.twig`
- PlainText: with the file extension `.txt.twig`

You can find pre-made templates for these renderer at [this GitHub repository](https://github.com/kimai/invoice-templates/tree/main/data-transfer) 
