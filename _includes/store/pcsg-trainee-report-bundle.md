Create trainee reports directly from Kimai as PDF documents for daily, weekly, monthly or yearly reporting periods.

## Features

* Generate trainee reports as PDF files directly from Kimai
* Supports daily, weekly, monthly and yearly reports
* Weekly reports can be generated for Monday to Friday or Monday to Sunday
* Supports training years 1 to 4
* Two signature modes: signature on every page or signatures on the cover sheet
* Automatically displays the configured company logo in the PDF
* Includes all time entries that overlap the selected reporting period
* German and English translations based on the Kimai UI language

## Requirements

* PHP 8.1 or higher
* Kimai 2.x, recommended build 22000 or higher
* Composer for Git-based installations
* PHP extension `ext-mbstring`
* PHP extension `ext-xml`
* `mpdf/mpdf` PHP library

## Usage

1. Go to **Reporting → Trainee Report** in Kimai.
2. Choose a start date and end date.
3. Select the report format: daily, weekly, monthly or yearly.
4. Select the training year.
5. Choose the signature mode.
6. Click **Generate PDF**.

If a company logo is configured in Kimai, it will automatically be shown on the cover sheet and in the reports.

## Support

If you require support for the usage or setup of this plugin or find any bugs please contact [support@pcsg.de](mailto:support@pcsg.de)!
