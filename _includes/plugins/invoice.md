
This bundle has the following features: 

1. Parallel e-invoice creation next to the normal invoice flow
2. Automatic generation of a PDF with all contained timesheets  
3. Configuration of a global language, which is used to format all invoices data (money, date, time).

## E-Invoices

Electronic invoices are limited to supported for EU formats.

**Important to know**:
- The document type is `Commercial invoice (380)` and can currently not be changed
- Every item that is a timesheet will be added with the unit code `HUR` for "hour"
- Every item that is a NOT timesheet will be added with the unit code `H87` for "piece"
- The line amount is the decimal duration for everything that is not fixed priced
- Fixed price line items will use the reported amount, which varies between grouping and item type

## Customer

The data for the "invoice sender" is pulled from the `Invoice issuer` company, which is configured in the invoice template.  
That means you need to [create a customer]({% link _documentation/customer.md %}) for your own company and add all the 
required attributes like `Company name`, `Vat ID` and the `address fields`.

The customer also has these fields, that influence the invoice:
- `Buyer reference` - free text info that identifies the customer as sender or receiver
- `Invoice template` - which template will be used when creating an invoice for the customer
- `Tax status` - possible values: `Taxable`, `Reverse charge`, `Exempt`
- `Tax exemption reason` - required free text field in case `Tax status` is `Exempt` 

## Invoice template

You can configure the following fields for every invoice template:
- `E-Invoice` profile type (see below)
- `Payment type` (see below)
- `Account or card-holder`
- `IBAN or card number`

![E-Invoice Settings]({% link /images/blog/e-invoicing-eu-setting.webp %}){:class="image"}

### Profiles

Support for EU e-invoices with the following profiles is added:
- `EN16931` (CII)
- `EN16931` (UBL)
- `Extended` (CII)
- `Extended` (UBL)
- `Peppol` (UBL) **beta**
- `XRechnung 3.0` (CII)
- `XRechnung 3.0` (UBL)

Kimai also support generating hybrid formats: 
- `ZUGFeRD` (PDF/A)
- `Factur-X` (PDF/A

The e-invoice XML is always generated side by side to the original invoice document, no matter if that is PDF or e.g. Word, and the XML can be downloaded. 
If a hybrid format is chosen, the invoice document must be a PDF. 
The invoice will then be generated as a `PDF/A-3 + associated files + additional XMP RDF` (for `ZUGFeRD` and `Factur-X`). 

### Payment type

Kimai supports the following payment types (numbers are the official IDs):
- `SEPA Credit Transfer` (58)
- `SEPA Direct Debit` (59)


### Peppol

Peppol is in **BETA** status: this needs testing and feedback!

- Currently only supports Vat-IDs in `cbc:EndpointID`
- Limited to these countries: Austria, Belgium, Bulgaria, Cyprus, Czech, Germany, Estonia, France, Greece, Croatia, Hungary, Ireland, Lithuania, Luxembourg, Latvia, Malta, Netherlands, Poland, Portugal, Romania, Sweden, Slovenia, Slovakia, Turkey, United Kingdom

## Automatic timesheet PDF

When creating a new invoice, another PDF will be created, which contains a summary grouped-by-project (on the first page) 
and the list of all contained timesheets (on the following pages).

The file can be downloaded on the invoice archive listing page, from the `Timesheet` action in the dropdown.

You could generate the same PDF using the export function in Kimai, but that requires manual steps:

- changing to the export
- filtering the exact same timesheets
- creating the export 
- renaming the file to match the invoice

The used "export template" for this feature can be configured. 

To activate this features go to `Invoices` at [System → Settings]({% link _documentation/configurations.md %}). 

## Data format language

In the core system of Kimai, you configure the language for an invoice via its template. Then this language is used for translations and also for the formatting of data.

This behavior might not be desired if you export invoice data e.g. to JSON and use that as input for further processing.
Or if you translate your invoice to english for cross-country sales but still want to use your countries formats.

Without choosing a language the default behaviour is used. 

To activate this feature go to `Invoices` at [System → Settings]({% link _documentation/configurations.md %}) and select a locale.
You can deactivate it by using the empty dropdown field.

## Additional formats

The plugins adds renderer for other invoice template formats, such as:

- JSON: with the file extension `.json.twig`
- XML: with the file extension `.xml.twig`
- PlainText: with the file extension `.txt.twig`

You can find pre-made templates for these renderer at [this GitHub repository](https://github.com/kimai/invoice-templates/tree/main/data-transfer) 
