---
title: "Invoice links carried a security token inside the web address"
date: "2026-06-23 22:00:39 +0000"
ghsa_id: "GHSA-4xmp-xqv9-pcrf"
cve_id: "pending"
severity: "low"
affected_version: "< 2.66.0"
patched_version: "2.66.0"
author: "Rajib-Mahmud"
developer: "kevinpapst"
---

Several invoice actions in Kimai were triggered by opening a link that carried a one-time security token as part of the web address. Web addresses end up in browser histories, server logs, and proxies, so such a link could leak and be used by someone else to create an invoice or change the status of an invoice in your name.

- Affected were creating an invoice and changing the status of an invoice. Deleting an invoice used the same pattern, but that route is deactivated by default and isn't reachable in a standard installation, not even for system administrators.
- The token belongs to your session. A leaked address is only usable while that session is valid, and the action runs with your permissions, so anyone using it needs a leaked address from an account that's allowed to manage invoices.
- No data was disclosed by this. The possible outcome is an unwanted invoice or an unwanted status change, both of which remain visible in the invoice list and can be corrected.
- This affects all Kimai installations, both OnPremise and Cloud.

## Solution

The token no longer appears in any web address. Creating an invoice and changing an invoice status now happen through form submissions that carry the token in the request body, marking an invoice as paid moved to a route that doesn't change anything on its own, and deleting an invoice moved to the API, which doesn't need this kind of token at all.
