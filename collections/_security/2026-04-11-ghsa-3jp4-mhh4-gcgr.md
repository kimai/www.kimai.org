---
title: "Open-redirect via unvalidated RelayState in SAML ACS handler"
date: "2026-04-11 21:22:05 +0000"
ghsa_id: "GHSA-3jp4-mhh4-gcgr"
cve_id:
severity: "low"
affected_version: "<= 2.52.0"
patched_version: "2.53.0"
author: "morimori-dev"
published: "kevinpapst"
state: "published"
---

Kimai's SAML authentication flow accepted the `RelayState` parameter as a redirect target without sufficiently validating the destination. 
In affected versions, a successful SAML login could therefore redirect users to an attacker-controlled URL.

The issue requires SAML to be enabled and depends on a malicious or manipulated `RelayState` value being supplied during the authentication flow (e.g. a manipulated URL sent via email).

## Info

This issue affected the SAML login flow after successful authentication.

- Kimai accepted the `RelayState` parameter as a redirect destination without sufficiently validating the target URL
- After a successful SAML login, a user could be redirected to an attacker-controlled website
- The issue only affected installations that had SAML authentication enabled
- Exploitation required control over the SAML flow or an IdP-initiated login scenario with a malicious `RelayState` value

## Solution

Users should update to `2.53.0` or newer.
