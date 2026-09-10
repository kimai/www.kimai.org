Adds a Jira issue field to every timesheet entry and syncs tracked time to Jira as worklogs,
authenticated with each user's own personal access token (Jira Server / Data Center) or API
token (Jira Cloud).

## Features

- An optional **Jira issue** field (e.g. `PROJ-123`) on every timesheet entry, validated and
  shown as an optional column in timesheet tables and exports - where it renders as a
  **clickable link** straight to the ticket in Jira.
- **Live validation**: as you type an issue key on the timesheet form, the plugin confirms it
  exists in Jira and shows its summary, so a typo never silently syncs to a non-existent issue
  (advisory only - it never blocks saving).
- Automatic **create / update / delete** of the matching Jira worklog when a timesheet entry is
  stopped, edited, or removed - or manual-only sync, your choice. Optionally sync the timesheet
  description as the worklog comment, or time only.
- Optional **reverse import** (`kimai:jira:import`): pull each user's own Jira worklogs back into
  Kimai as timesheets, so time logged in Jira shows up in Kimai reports too - opt-in, matched by
  each user's own token, and de-duplicated so re-runs never create doubles.
- Each user manages their **own** Jira credential on a personal settings page, with a
  "Test connection" button that reports a specific, worded result (rejected credentials, DNS,
  TLS, timeout - each is different and has a different fix).
- Tokens are **encrypted at rest** (libsodium) in their own database table - never in a Kimai
  user preference, never returned by any API.
- **Resilient by design**: saving a timesheet never waits on Jira, a background reconciler
  (`kimai:jira:sync`, meant to run from cron) drains anything that could not sync inline, and an
  expired token is caught by a daily heartbeat check instead of silently going stale.
- Works against both **Jira Cloud** and **Jira Server / Data Center** (Bearer or Basic auth,
  configured per customer - so different customers can run different Jira instances).

## Installation

Checkout the plugin into `var/plugins/JiraBundle` and clear the cache.

Run `bin/console kimai:bundle:jira:install` to create the plugin's own database table.

## Usage

Configure the Jira server URL and authentication mode **on each customer** (Customers \> edit a
customer \> Jira; admin only) - so customers on different Jira instances each get their own. Each
user then opens **Jira settings** from their user menu and stores a personal access token / API
token per customer. From then on, filling in the **Jira issue** field on a timesheet entry is all
it takes - the worklog appears on the referenced Jira issue (the one for that timesheet's customer)
once the entry is stopped or saved with an end time.

See the [documentation](https://hilfor.github.io/kimai-jira-docs/) for the full configuration reference,
including Jira Cloud vs. Server/Data Center setup, per-project routing and auto-create, the
optional `kimai:jira:import` reverse importer and custom-field passthrough, and the cron entries
the background reconciler and importer need.

## Support

Setup help, bug reports and feature requests: [kimai-support@hilfor.biz](mailto:kimai-support@hilfor.biz). The full configuration reference lives in the [documentation](https://hilfor.github.io/kimai-jira-docs/).
