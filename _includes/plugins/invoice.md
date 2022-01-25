
This bundle has the following features: 

- Automatic generation of a PDF with all contained timesheets  
- Configuration of a global language, which is used to format all invoices data (money, date, time).

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

### Data format language

In the core system of Kimai, you configure the language for an invoice via its template. Then this language is used for translations and also for the formatting of data.

This behavior might not be desired if you export invoice data e.g. to JSON and use that as input for further processing.
Or if you translate your invoice to english for cross-country sales but still want to use your countries formats.

You configure the format with the new `Language for formatting` configuration, 
which can be configured via the global Settings screen or from within the “Invoice settings” screen.
