---
title: "User Preferences API allows standard users to modify: hourly_rate, internal_rate"
date: "2026-04-14 14:05:11 +0000"
ghsa_id: "GHSA-qh43-xrjm-4ggp"
cve_id: "CVE-2026-40486"
severity: "medium"
affected_version: "<=2.52.0"
patched_version: "2.53.0"
author: "udaypali"
published: "kevinpapst"
state: "published"
---

Kimai contained an authorization flaw in the user preferences API.
In affected versions, a standard user could update the restricted financial profile attributes `hourly_rate` and `internal_rate`, 
even though those values were not editable through the normal user interface.

This allowed unprivileged accounts to manipulate business-relevant values that influence future billing and financial calculations.

## Info

This issue was caused by the API accepting and persisting restricted preference values without enforcing the same permission checks as the GUI.

- The regular web form correctly hid these fields from users without the required permissions
- The preferences API still accepted direct `PATCH` requests for the same attributes
- An authenticated low-privilege user could change their own financial rates without administrator approval
- The resulting changes could affect future timesheets, invoicing, exports, and internal financial data

## Solution

Users should update to `2.53.0` or newer.
