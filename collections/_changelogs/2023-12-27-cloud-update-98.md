---
title: "Cloud Update 98"
date: "2023-12-27 14:00:00 +0200"
---

**Improvement**

- Show API URL in user profile (for simpler integration with apps)
- Importer: new created users during import require to change password
- Tasks: stopping a task multiple times will not raise an error anymore
- Speed improvements by reducing database calls per page
- Many translation improvements

**Working times**

- New: manual bookings for holidays, to top up available vacation days
- New: category to book "child is sick" absences
- New: category to book "parental leave" absences
- Prevent booking absences across a time-range of two years
- Limit selectable time-range to selected year for absences and manual bookings
- Fixed day calculation of vacations with public holidays in between

**Expenses**

- Calculate "exported" vs. "not exported" statistics and use in several reports
- Sort invoice entries if "expense category project" grouping is activated
- Fixed broken "category" translation
