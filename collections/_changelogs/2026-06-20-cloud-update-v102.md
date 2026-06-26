---
title: "Work-contract defaults via API, invoice PDF watermarks"
date: "2026-06-21 10:00:00 +0200"
---
  
Here's a summary of the most notable changes in this release.

**Improvements**

- Invoice PDF templates now support text and image watermarks
- Automatic timesheet exports can now use a configurable PDF template
- Non-admin users can now see assignable timesheets for tasks
- Invoice archive show if a specific user was selected in the query
- Improved validation for new users created during timesheet imports
- Expired login links now redirect to the login page instead of showing an error

**API**

- Support for setting work-contract preferences for new users
- Removed deprecated endpoint `DELETE /api/lock/{user}/{month}`

**Reminders**

API token authentication [is scheduled for deletion]({% link _posts/en/2026-04-13-removing-api-passwords.md %}), please migrate to API keys if you haven't already.

Follow us on [YouTube]({{ site.data.socials.youtube.url }}) and [LinkedIn]({{ site.data.socials.linkedin.url }}) for updates and tutorials.
