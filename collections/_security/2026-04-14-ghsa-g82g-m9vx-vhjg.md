---
title: "Stored XSS via incomplete HTML attribute escaping in Team-Member widget"
date: "2026-04-14 14:03:14 +0000"
ghsa_id: "GHSA-g82g-m9vx-vhjg"
cve_id: "CVE-2026-40479"
severity: "high"
affected_version: "<= 2.52.0"
patched_version: "2.53.0"
author: "wooseokdotkim"
published: "kevinpapst"
state: "published"
---

Kimai contained a stored cross-site scripting vulnerability in the team member widget.
The client-side HTML escaping logic did not escape quote characters correctly, which allowed attacker-controlled profile data to break out of an HTML attribute context.

In affected versions, a malicious value stored in the user alias field could execute JavaScript when the generated markup was rendered in the browser.

## Info

This issue affected the escaping logic used for user-controlled content in HTML attributes.

- The vulnerable code path escaped `<`, `>` and `&`, but not single or double quotes
- The payload could be stored in profile data and later rendered in the team member widget
- Exploitation could lead to stored XSS in privileged browser sessions
- A low-privileged user could target administrators who viewed the affected UI

## Solution

Users should update to `2.53.0` or newer.
