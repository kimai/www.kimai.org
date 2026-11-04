---
title: "Weekly-hours grouping, Activity-Choices, dropdown search"
date: "2026-08-04 10:00:00 +0200"
---
  
Here's a summary of the most notable changes in this release.

**Improvements**

- New `Customer` fields `invoice_email` and `language`
- Search for optgroup titles in dropdowns (e.g. projects by their customer name)
- Group timesheets in quick entry controller by day/project/activity and custom-field name & value
- Calculate internal rate of fixed-rate records based on duration
- Hide sidebar in landscape print layouts
- Prevent PDF tables from shrinking
- Allow bookings that consume no budget for projects, whose budget is completely used
- Use 24-hour format for invoice `date_process` variables
- Allow to set `PDFAversion` in PDF templates

**API**

- More fields in the customer collection API call
- Expose API pagination headers via CORS
- Use default values on customer/project/activity instead of `null` on `POST`

**Custom Fields**

Added a new `Activity-Choices` custom-field type for a 4-level dropdown below activities ([read documentation]({% link _documentation/plugin-custom-fields.md %}))

This new field type lets you attach a list of choices to each activity (for example a list of tasks).
When creating or editing a timesheet, a dropdown appears whose available options depend on the selected activity.

**E-Invoices**

- Set the actual delivery date (`BT-72`) to the end of the service period
- Use `PDFA/3-B` as default version in PDFs

**Reminders**

API token authentication [will be removed soon]({% link _posts/en/2026-04-13-removing-api-passwords.md %}), migrate to API keys now.

Follow us on [YouTube]({{ site.data.socials.youtube.url }}) and [LinkedIn]({{ site.data.socials.linkedin.url }}) for updates and tutorials.
