A browser add-on for starting and stopping Kimai timers without opening Kimai. Install it from the [Chrome Web Store](https://chromewebstore.google.com/detail/kimai-pomiar-czasu-web-sy/eliiemekophpilppaobljfjkhbkmchjg), it works in Chrome, Edge and Brave.

## Features

- Start and stop a timer in one click, with the elapsed time on the toolbar badge.
- Projects grouped by customer, so a long list stays usable. The last choice is remembered.
- Resume any past entry. If something is already running, resume stops it and switches over.
- Correct a running entry in place: description, start time, end time, billable.
- Daily and weekly totals in the header, and the last twenty entries split into days.
- A billable switch, and a `$` mark on every row of the list that flips one entry without opening Kimai.
- It refuses to start a timer on an empty, too short or generic description ("fixes", "call", "bug fixing"). The minimum length is set in the options, 0 turns the check off.
- Polish and English, picked in the settings rather than following the browser.

## Setup

Open the add-on settings and enter your Kimai URL and your own API token (Profile > API in Kimai). The add-on uses the Bearer token; the legacy `X-AUTH` pair is not supported. It asks for access to the one address you entered and nothing else, and sends no telemetry.

## Billable switch permission

Changing the billable flag needs the `edit_billable_own_timesheet` permission, which by default only teamlead and above hold. Without it, the add-on starts the timer anyway, leaves billing to Kimai and dims the switch. An administrator can enable it for `ROLE_USER` under Administration > Roles, section "Timesheet (own)".
