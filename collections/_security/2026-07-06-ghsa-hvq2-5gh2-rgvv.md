---
title: "Creating a default team could grant team lead rights on an existing team"
date: "2026-07-06 16:31:49 +0000"
ghsa_id: "GHSA-hvq2-5gh2-rgvv"
cve_id: "CVE-2026-84807"
severity: "medium"
affected_version: "<= 2.65.0"
patched_version: "2.65.0"
author: "mattmumford-git"
developer: "kevinpapst"
---

Kimai offered a shortcut for creating a "default team" for a customer, project, or activity. 
If a team with that same name already existed, Kimai reused that team and added you as one of its team leads, without checking whether you're allowed to manage it.

- The shortcut was available through the API, as part of the customer, project, and activity endpoints. It was called from the web interface on the customer, project and detail view.
- Using it required the permission to create teams together with the permission to manage that object's teams. By default, **only administrators** have both, so a **default installation was not exposed** — a custom role combining these permissions was needed.
- Teams were matched by name alone. Naming a customer, project, or activity after an existing team was enough for that team to be reused instead of a new one being created.
- Once added as a team lead, a user could act on everything that team grants access to: its customers, projects, activities, members, and their recorded times — limited by what that user's role allows.

## Solution

The three API endpoints for creating a default team now respond with "410 Gone" and refer you to the regular endpoint for creating teams. 
Creating a default team moved to the web interface, where it opens the normal team form pre-filled with the object's name, and the user as team lead.
The team is always created from scratch, duplicate team names are prohibited, so no existing team can be reused.
