---
title: "Smarter duration entry, batch-update improvements and invoice API"
date: "2026-10-05 10:00:00 +0200"
---

Here's a summary of the most notable changes since the last update.

**Improvements**

- Absence calendar shows pending absences
- Smarter input handling on all duration fields (e.g. weekly hours, duration-only mode) - [read docs]({% link _documentation/duration-format.md %})
- Reports now have a sticky first column, which stays visible while scrolling horizontally
- Customer, project and activity dropdowns show longer names (up to 180 characters)
- Week, month and year dropdowns scroll to the selected entry when opened
- New optional column showing the first line of the address in the customer listing
- New button filter team-timesheets by the selected user and date range from "Weekly hours"
- Support the `break` field and other small improvements in the timesheet-batch update form
- Default language for new users can be configured in the system settings
- API: New endpoint to update invoices
- API: The invoice payment date is now a date instead of a date-time
- Language format dropdown shows money, time and date examples

**Bugfixes**

- Absence email links for locales with subregions
- Editing an absence comment failed to open the form
- SAML logins failed on invalid avatar URLs

**Social Media**

We added a new tutorial video for the [Absence calendar]({% link _documentation/absence.md %}#absence-calendar)

Follow us on [YouTube]({{ site.data.socials.youtube.url }}) and [LinkedIn]({{ site.data.socials.linkedin.url }}) for updates and tutorials.
