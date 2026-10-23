Share a time report with a client under a public link, as a web page and as a PDF. The client does not need a Kimai account. Since 1.3.0 the plugin also brings an internal **work report** for the team and a **JSON API** for both, so reports can be produced by scripts and agents.

## Features

- **Public link with a token**: `https://<your-kimai>/share/<token>`, and the same report as a PDF under `/share/<token>/pdf`.
- **Billable and non-billable time on one page.** The summary always counts both, so the client sees "65:43 (75.41%) of 87:09" instead of a shorter list with no explanation of what is missing. Non-billable rows get a "no charge" badge and can be hidden from the table; the summary stays complete.
- **Revocation and expiry dates.** A revoked or expired link returns 404, exactly like a mistyped token, so the address space cannot be probed from outside.
- **Visit counter** with the date of the last visit, and an **email to the person who created the link** when the client opens it for the first time.
- **English or Polish report**, chosen when the link is created, regardless of the language of the account that created it.
- **Scope**: one project or a whole customer, any date range, optionally narrowed to selected users, activities or tags. A customer-wide report can leave out chosen projects, e.g. a fixed-price one invoiced separately.
- **A "share with client" button on the Kimai Export screen**, carrying over the filters set there.
- Company logo on the page and in the PDF.

## Work report

Reporting > Work report shows who worked on what, for one person, a team or everyone, over any period up to 366 days: totals, a people-by-days grid, hours per project and activity, every entry with its description, and a PDF with the same content. Warnings point at overlapping entries, running timers, entries without a description and unusually long entries or days. Before a report is shown, every breakdown is summed again and compared with the grand total; a mismatch refuses the report instead of showing wrong numbers. Users without access to other people's times see their own time only.

## API

- `GET /api/work-report` (and `/api/work-report/pdf`) with the same filters as the page, strict input validation, and the complete report as JSON.
- `/api/client-reports` to create, list, inspect, revoke and restore client links, including the exact numbers the client will see.

The repository also contains a dependency-free MCP server (`mcp/kimai-mcp.mjs`) on top of this API, for agents that write time reports.

## Usage

Links are created under Reporting, visible from the teamlead role up. The billable split comes straight from the "Billable" field of each timesheet entry, the report does not calculate anything on its own, so set it before sending the link.

## Branding

The report ships with the Web Systems logo. To use your own, replace `Resources/assets/logo.png` and the `COMPANY` and `LOGO_FILE` constants in `Report/Branding.php`.

## Not there yet

- Several projects in one report (it is one project or a whole customer).
- Branding from the admin panel: the logo and company name live in the plugin files.
- Rates and amounts in the client report, which shows time only (the work report API returns amounts when rates are set).
- A preview from the admin panel before sending the link.
