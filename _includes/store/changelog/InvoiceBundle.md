**Version 2.7.0**

Compatibility: requires minimum Kimai 2.48.0

- Use new `Strict` Twig SecurityPolicy when rendering the invoice timesheet PDF
- Use `timesheet` translation key for timesheet download button

**Version 2.6.1**

Compatibility: requires minimum Kimai 2.45.0

- Fix `XRechnung 3.0 (UBL)` generates CII syntax

**Version 2.6.0**

Compatibility: requires minimum Kimai 2.45.0

- Added `Tax status` (Standard, Reverse charge, Exempt) field to Customer
- Added `Tax exemption reason` (free text) field to Customer
- Support for `Reverse Charge` and `Tax exempt` invoices
- Added `Peppol` profile
  - Currently only supports Vat-IDs in `cbc:EndpointID`
  - And only for the countries: Austria, Belgium, Bulgaria, Cyprus, Czech, Germany, Estonia, France, Greece, Croatia, Hungary, Ireland, Lithuania, Luxembourg, Latvia, Malta, Netherlands, Poland, Portugal, Romania, Sweden, Slovenia, Slovakia, Turkey, United Kingdom
  - Beta: this needs testing and feedback!

**Version 2.5.0**

Compatibility: requires minimum Kimai 2.41.0

- Added help labels to explain details
- Added "Extended" profile
- Removed Zugferd / Factur-X profiles (before: always using EN16931 CII, afterwards: when using a PDF template, the selected profile will be used)
- Removed exotic payment methods

**Version 2.4.0**

Compatibility: requires minimum Kimai 2.41.0

- Added support for E-Invoices
- EN16931 (CII + UBL)
- X-Rechnung 3.0 (CII + UBL)
- Zugferd, Factur-X

**Version 2.3.0**

Compatibility: requires minimum Kimai 2.27.0

- Fix compatibility with new export templates in Kimai 2.40

**Version 2.2.0**

Compatibility: requires minimum Kimai 2.27.0

- Required changes for Kimai release 2.27.0
- Code upgrade

**Version 2.1.1**

Compatibility: requires minimum Kimai 2.1.0

- Changed: import Route attribute from correct namespace
- Changed: use bundle identifier to load routes

**Version 2.1.0**

Compatibility: requires minimum Kimai 2.1.0

Use annotation type for routes

**Version 2.0.3**

Compatibility: requires minimum Kimai 2.0.0

Added: use {{invoice}}-timesheet.pdf instead of {{invoice}}.pdf as filename


