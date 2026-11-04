---
title: "Project lock dates, Serbian, absence calendar and new API endpoints "
date: "2026-09-15 20:00:00 +0200"
---

Here's a summary of the most notable changes of the last few weeks.

**Improvements**

- Added a lock date to active projects to restrict timesheet editing for past periods - [read docs]({% link _documentation/project.md %}#times-locked-until)
- Added Serbian translations
- Users with only the `create_own_timesheet` permission can now create timesheets from the activity listing
- Documentation links now have a higher contrast and show the page title
- Creating the default team now uses a modal form
- The two-factor authentication (2FA) form is now shown for SAML users, even if the login form is deactivated

**API**

- Added `budget`, `timeBudget` and `budgetType` to the customer, project and activity collection endpoints
- New endpoint to delete invoices
- New endpoints for favorites

**Importer**

- Custom field definitions are now initialized when creating or updating customers, projects or activities
- Imported custom fields are no longer hidden by default, but use their configured visibility

**Work Contract**

- API improvements:
    - New endpoints to list (`GET`) and create (`POST`) manual working time bookings
    - New endpoints to list (`GET`) and create (`POST`) manual vacation bookings
    - Absences now include their `comment`
    - A `comment` can now be added when rejecting an absence
- Absence calendar:
    - Users without absences can be shown or hidden on the initial screen
    - Team pages show all users, with and without absences, and their visibility can be toggled
    - User avatars are now displayed
    - Users with either the `view_other_absence` or `view_team_absence` permission can see all team members
    - Read the [updated documentation]({% link _documentation/absence.md %}#absence-calendar)
- `default` is now used as placeholder for the default public holiday group

**Reminders**

API token authentication [will be removed soon]({% link _posts/en/2026-04-13-removing-api-passwords.md %}) - please migrate to API keys now.

Follow us on [YouTube]({{ site.data.socials.youtube.url }}) and [LinkedIn]({{ site.data.socials.linkedin.url }}) for updates and tutorials.
