---
title: "Username enumeration via timing, using deprecated API authentication"
date: "2026-04-16 21:19:11 +0000"
ghsa_id: "GHSA-jrc6-fmhw-fpq2"
cve_id:
severity: "low"
affected_version: "<=2.53.0"
patched_version: "2.54.0"
author: "melnicek"
published: "kevinpapst"
state: "published"
---

Kimai exposed a small timing difference in the legacy API authentication flow that accepted `X-AUTH-USER` and `X-AUTH-TOKEN` header. 
In affected versions, requests for existing usernames took measurably longer than requests for unknown usernames, which could allow user enumeration through repeated timing analysis.

The response body and HTTP status stayed identical, so the leak was limited to request timing only.

## Info

This issue affected the [legacy API password authentication mechanism that has already been deprecated]({% link _posts/en/2026-04-13-removing-api-passwords.md %}).

- The authenticator performed password hash verification only when the requested user existed
- Requests for unknown usernames returned faster because no equivalent hash verification work was performed
- Attackers could use repeated probes to distinguish valid usernames from invalid ones
- The practical impact was limited because the gap was small and easier to observe locally than across a real network

## Solution

Invalid logins triggers a "fake" password hashing and adds a random delay to the response, making it impossible to distinguish wrong passwords from unknown user accounts.

Users should update to `2.54.0` or newer.

Administrators can block HTTP requests that include the `X-AUTH-USER` and `X-AUTH-TOKEN` header in their webserver.
