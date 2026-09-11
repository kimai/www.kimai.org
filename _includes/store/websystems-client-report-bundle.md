Share a time report with a client under a public link, as a web page and as a PDF. The client does not need a Kimai account.

## Features

- **Public link with a token**: `https://<your-kimai>/share/<token>`, and the same report as a PDF under `/share/<token>/pdf`.
- **Billable and non-billable time on one page.** The summary always counts both, so the client sees "65:43 (75.41%) of 87:09" instead of a shorter list with no explanation of what is missing. Non-billable rows get a "no charge" badge and can be hidden from the table; the summary stays complete.
- **Revocation and expiry dates.** A revoked or expired link returns 404, exactly like a mistyped token, so the address space cannot be probed from outside.
- **Visit counter** with the date of the last visit, and an **email to the person who created the link** when the client opens it for the first time.
- **English or Polish report**, chosen when the link is created, regardless of the language of the account that created it.
- **Scope**: one project or a whole customer, any date range, optionally narrowed to selected users, activities or tags.
- **A "share with client" button on the Kimai Export screen**, carrying over the filters set there.
- Company logo on the page and in the PDF.

Links are created under Reporting, visible from the teamlead role up. The billable split comes straight from the "Billable" field of each timesheet entry, the report does not calculate anything on its own, so set it before sending the link.

## Branding

The report ships with the Web Systems logo. To use your own, replace `Resources/assets/logo.png` and the `COMPANY` and `LOGO_FILE` constants in `Report/Branding.php`.

## Not there yet

- Several projects in one report (it is one project or a whole customer).
- Branding from the admin panel: the logo and company name live in the plugin files.
- Rates and amounts: the report shows time only.
- A preview from the admin panel before sending the link.
