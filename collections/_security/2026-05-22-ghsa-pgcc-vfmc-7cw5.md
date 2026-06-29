---
title: "CSRF attack allowed tricking logged-in users into creating teams and changing access"
date: "2026-05-22 05:45:52 +0000"
ghsa_id: "GHSA-pgcc-vfmc-7cw5"
cve_id: "CVE-2026-49992"
severity: "medium"
affected_version: "<=2.57.0"
patched_version: "2.58.0"
author: "Mitchell45"
developer: "kevinpapst"
---

Kimai's shortcut for creating a default team could be triggered by a logged-in user opening a malicious web page, without that user meaning to. 
The hidden action would create or reuse a team, make the user its teamlead, and link a project, customer, or activity to that team, silently changing who has access to that data.

- The issue affects the "create default team" shortcuts for projects, customers, and activities in the admin area.
- These shortcuts were reachable through simple `GET` links, which a malicious web page can trigger automatically when a logged-in user visits it (a cross-site request forgery, or CSRF).
- Once triggered, the action creates or reuses a team, adds the current user as its teamlead, and binds the target project, customer, or activity to that team.
- This changes the authorization structure (who can see and manage the affected data), not a harmless personal setting, so the effects can reach into visibility rules, team-based access control, and reporting.
- The user being tricked must already have permission to manage the permissions of the object in question, so the action runs with their existing access rights.
- All Kimai installations (OnPremise and Cloud) are affected.

## Solution

The affected shortcuts were removed as plain `GET` links and moved to API `POST` endpoints, which can't be triggered by a victim opening a crafted web page.
