---
title: "Authenticated SSTI to RCE by uploading a malicious twig file"
date: "2023-10-27 16:27:17 +0000"
ghsa_id: "GHSA-fjhg-96cp-6fcw"
cve_id: "CVE-2023-46245"
severity: "high"
affected_version: "< 2.1.0"
patched_version: "2.1.0"
author: "ixSly"
published: "kevinpapst"
state: "published"
---

Kimai contained a server-side template injection vulnerability in Twig-based invoice rendering.
In affected versions, an authenticated user with the ability to upload a malicious Twig template could execute 
arbitrary code on the server when the template was rendered.

Because the vulnerable code path was used during invoice generation, a crafted template could escalate from template 
injection to remote code execution.

## Info

This issue affected Twig-based rendering of uploaded invoice templates.

- A malicious Twig file could be uploaded and later executed during invoice generation
- The injected template code ran on the server during rendering
- Successful exploitation could lead to arbitrary command execution
- This turned an authenticated template upload capability into a high-impact server compromise risk
- Exploitation required an System-Admin or someone with equivalent template upload capabilities
- **Kimai Cloud is not affected** because Twig templates have to pass a manual review process

## Solution

Users should update to `2.1.0` or newer.
