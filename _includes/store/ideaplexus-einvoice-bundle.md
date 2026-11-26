IdeaplexusEInvoiceBundle creates e-invoices according to EN 16931 from Kimai invoices, for invoice issuers in Germany:

- **ZUGFeRD / Factur-X** (profile EN 16931): the invoice PDF as PDF/A-3 with embedded CII XML, readable by humans and accounting software
- **XRechnung 3.0** (CII syntax): pure XML file, e.g. for public sector customers (Leitweg-ID)

Every generated invoice is tested against the KoSIT validator (XRechnung configuration), veraPDF (PDF/A-3) and Mustang (Factur-X).

## Features

- **Same amounts in PDF and XML**: both are created from the same calculation
- **Pre-check**: missing or invalid data (address, IBAN, tax number …) is listed in the invoice preview; creating an incomplete e-invoice stops with a clear message instead of producing an invalid file
- **Tax types**: standard VAT, reverse charge (EU customers) and VAT exemption, e.g. for small businesses according to § 19 UStG
- **GiroCode** (EPC QR code) in the PDF for payment with a banking app
- **Letterhead according to DIN 5008**, customizable with logo, accent color and overridable Twig blocks
- German tax number or business ID (W-IdNr.) as an alternative to the VAT ID
- Translations in German and English

Not supported: UBL syntax, Peppol delivery, credit notes and cancellations, multiple tax rates in one invoice, direct debit and receiving incoming e-invoices.

## Requirements

- Kimai 2.67.0 or newer
- No further dependencies, the library `horstoeko/zugferd` already ships with Kimai

## Setup

1. Unpack the [release ZIP](https://gitlab.com/ideaplexus/kimai-einvoice-bundle/-/releases) to `var/plugins/` (resulting in `var/plugins/IdeaplexusEInvoiceBundle/`) and run `bin/console kimai:reload --env=prod`
2. Invoice issuer: maintain company, address, e-mail and VAT ID (or the new field "E-invoice: tax number or W-IdNr.")
3. Customers: company, address and country; the Leitweg-ID of public sector customers goes into Kimai's customer field "Buyer reference"
4. Invoice template: choose the invoice document `zugferd-default` (PDF) or `xrechnung` (XML) and fill the new e-invoice fields (payment means, IBAN, tax type …)

The [README](https://gitlab.com/ideaplexus/kimai-einvoice-bundle/-/blob/main/README.md) (German) describes all fields, the customization of the letterhead and the mapping of Kimai data to EN 16931.

## License and support

Free and open source under AGPL-3.0-or-later.

Please report bugs and questions as an [issue on GitLab](https://gitlab.com/ideaplexus/kimai-einvoice-bundle/-/issues).
Help with setup and custom company templates is available from [ideaplexus](https://ideaplexus.com).
