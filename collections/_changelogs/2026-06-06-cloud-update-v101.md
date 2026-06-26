---
title: "Quality of life improvements, new API endpoints, improved Tasks management"
date: "2026-06-06 11:00:00 +0200"
---

Many improvements were shipped since our last message. Here's a summary of the most notable changes.

**Improvements**

- Choose a theme for non-authenticated pages (e.g. Login, Kiosk)
- Filter invoices by user in the invoice archive
- Catalan translation added
- Batch action `Mark as exported` for Expenses
- Option to skip the first-time wizard for new users
- Kiosk login page can now be accessed without login
- Weekly hours can now be added in weeks with already exported timesheets

**API**

- Manage comments for projects and customers
- Download invoices
- Save invoice meta-fields
- Deprecated API passwords [will be removed soon]({% link _posts/en/2026-04-13-removing-api-passwords.md %})

**Tasks**

- Assign timesheets to a task (matching project and activity)
- Widgets refresh and update main timer on start, stop, unassign and delete
- Edit timesheets with teamlead permissions if available

**Importer**

- All import rows are validated before saving
- Validation errors shown at the affected row and field
- Customer importer supports structured addresses and more field variations
- Fix: duplicate customer/project numbers

**Videos**

New video tutorials:

- [Track Expenses](https://www.youtube.com/watch?v=OuHq0tFspuQ)
- [Working Times](https://www.youtube.com/watch?v=BYkgplGTz4Q) 

Follow us [on YouTube]({{ site.data.socials.youtube.url }}) to stay up to date.
