---
title: "Timesheets could be assigned to off-limits projects through the API"
date: "2026-04-28 10:27:05 +0000"
ghsa_id: "GHSA-vrr2-g9gh-c3jc"
cve_id: CVE-2026-52820
severity: "medium"
affected_version: "<= 2.56.0"
patched_version: "2.57.0"
author: "offset"
published: "kevinpapst"
state: "published"
---

The Kimai API let any logged-in user attach their own time records to projects that belong to other teams or customers, including ones they normally cannot see. 
By reading the timesheet back through the API, they could also obtain basic details about those projects and customers.

- The flaw lived in the Timesheet API endpoints `PATCH /api/timesheets/{id}` and `POST /api/timesheets`. They accepted any project ID without confirming that the user had team-level access to that project.
- Any authenticated account could trigger the issue. The required permission, `edit_own_timesheet`, is part of the default `ROLE_USER.
- After re-assigning their timesheet, the user could fetch it back with `?full=true` and read serialized project and customer information (name, currency, start/end dates, customer hierarchy) that the team access rules would normally hide.
- **Integrity impact:** foreign time records can pollute project budgets, billing exports, and reports of other teams.
- **Confidentiality impact:** limited disclosure of project and customer metadata through the API response.
- The blast radius is bounded: an attacker can only persist their own timesheet rows and cannot directly modify other teams' existing data.
- All Kimai installations were affected.

## Solution

The form logic now forwards a submitted project ID only when a new timesheet is being created, so existing timesheets can no longer bypass the project visibility check during a PATCH request. 
In addition, a new `TimesheetTeamAccessValidator` runs whenever the project or activity changes and rejects the change if the user lacks team access to the new project.

