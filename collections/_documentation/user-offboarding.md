---
title: Offboarding users
description: The recommended way to handle Kimai accounts of employees who leave your company, without losing historical timesheet data
related:
  - users
  - reporting
  - export
---
 
When an employee leaves your organization, you usually have two goals that seem to conflict:

- their recorded times must stay available for reporting, exports and invoices
- the account should no longer be usable (and in [Kimai Cloud]({% link _documentation/cloud/cloud-user-licenses.md %}) it should no longer cost money)

Both goals are covered by **deactivating** the account. There is no need to delete it.

{% alert danger %}
**Never delete a user to "clean up" your Kimai.**
Deleting a user account permanently removes all their time-records, unless you explicitly move them to another user.
This cannot be undone and there is no way to restore the data afterwards.
{% endalert %}

## The recommended way: deactivate the account

1. Stop any running time-record of that user at `Time tracking → All times`
2. Open `System → Users` and edit the users profile
3. Toggle the `Active` checkbox
4. Save

That's it. The account is now disabled, the user cannot login any longer, but all data stays exactly where it is.

Read more about the behaviour of disabled accounts in the [user documentation]({% link _documentation/users.md %}#deactivated-users).

## What happens to the recorded times?

Nothing — deactivation only affects the account, never the data.

- All time-records remain in the database and keep their original owner
- [Reports]({% link _documentation/reporting.md %}) covering multiple users (e.g. weekly, monthly and yearly user reports) still list the deactivated user for those time-ranges where records were created
- [Exports]({% link _documentation/export.md %}) for a date range still contain their entries
- Existing [invoices]({% link _documentation/invoices.md %}) and the invoice archive are untouched
- Budgets, statistics and all totals stay correct

The only limitation: a deactivated user is no longer offered in the `User` filter dropdown of the timesheet, export and invoice screens.
So you cannot filter *for* that person any more, but their records are still included whenever you query the data without a user filter.
If you need a report for exactly this person, reactivate the account temporarily, run the report and deactivate it again.

## Consequences of a deactivation

What the user can no longer do:

- log in to Kimai
- use the [API]({% link _documentation/user-api.md %}) — existing API tokens stop working
- receive system emails and notifications

What changes for the administration:

- the account is hidden from the user listing (use the `Active = No` filter to see it)
- the user cannot be selected in dropdowns any more, so no new time-records, absences or contracts can be assigned to them
- the user cannot be chosen as `Supervisor` for other accounts

{% alert warning %}
Before deactivating, check whether the user is the **teamlead** of a [team]({% link _documentation/teams.md %}) or the **supervisor** of other users.
A team always needs at least one teamlead — assign a replacement first, otherwise you cannot edit that team any more.
{% endalert %}

A deactivated account can be reactivated at any time: open `System → Users`, set the search filter `Active` to `No` (or `Both`), edit the user and check `Active` again.
The account keeps its username, email, all preferences and all data.

## Kimai Cloud: does a deactivated user cost money?

Kimai Cloud uses a per-seat model and **only active users consume a license**.
Deactivating the leaving employee frees the seat, so you can assign it to their successor without buying an additional license.

Please note that freeing a seat does not automatically reduce your subscription.
If you want to pay for fewer users, you have to reduce the license count in the [My Cloud]({{ site.cloud.my_cloud }}) portal — the change takes effect with the next billing period.

All details: [User licenses]({% link _documentation/cloud/cloud-user-licenses.md %}).

## Deleting a user

Deletion is only meant for accounts that were created by mistake or for cases where you are legally required to remove personal data (e.g. a GDPR erasure request).

{% alert danger %}Deleting a user is irreversible.{% endalert %}

If you do not select a replacement user, the delete process removes all data that belongs to this account, including

- all time-records (they are gone — reports, exports and statistics will change retroactively)
- all invoices that were created by this user, including the invoice archive entries
- user specific rates, team memberships, working times/contract data, preferences and API tokens

There is no undo and no way to restore this from within Kimai (except a [database backup]({% link _documentation/backups.md %})).

If you still have to delete the account, open `System → Users`, choose `Delete` and use the `User` dropdown in the confirmation dialog:

- **with a replacement user selected**: all time-records and invoices of the deleted account are moved to that user, nothing is lost
- **without a replacement user**: everything listed above is deleted permanently

The confirmation dialog tells you how many time-records exist and their total duration — please read it before confirming.

{% alert warning %}
Moving records to a replacement user rewrites their ownership. Reports and exports will then show the *replacement* user for those entries,
so the historical information "who worked on this" is lost. Hourly rates that were already stored on the time-records are not recalculated.
{% endalert %}

If your goal is only to remove personal data while keeping the recorded times for accounting reasons, deleting is usually the wrong tool.
Deactivate the account instead and anonymize the personal fields (alias, email, title, avatar) by editing the profile.
