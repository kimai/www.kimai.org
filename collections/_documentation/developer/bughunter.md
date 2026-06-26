---
title: Reporting security issues
---

This document is aimed at security researchers and describes how to report vulnerabilities in Kimai.

If you want to know how we handle security issues and which ones have been reported, visit our [Security advisories]({% link _documentation/developer/security.md %}) page.

## Reporting a vulnerability
 
Please do not report security vulnerabilities in the public issue tracker. Instead, use one of the following channels:

- Email: [support@kimai.org](mailto:support@kimai.org)
- GitHub Security Advisory: [github.com/kimai/kimai/security/advisories](https://github.com/kimai/kimai/security/advisories)

Reports submitted to other platforms will not receive a response, even if they are read.

You can expect an acknowledgment within 1–3 working days. The time to release a fix varies depending on the severity and complexity of the issue — from a few hours to several weeks.

> **Note:** Requesting payment or a bounty before sharing vulnerability details will result in the report being dismissed and the sender blocked.

## Bug bounty & rewards

Kimai is an open-source project and does not offer a financial bug bounty program.

Valid, responsibly disclosed vulnerabilities are rewarded with:

- Credit in the release notes
- Optional mention on social media, on request

The community is genuinely grateful for responsible and discreet disclosures.

## Testing guidelines

Make a good-faith effort to avoid privacy violations, data loss, and service disruption. Only test against accounts you own or have explicit written permission to access.

> Do not test against Kimai Cloud or demo installations without prior written consent.

### Permitted

- Testing on your own self-hosted Kimai instance
- Testing in environments you own or have explicit written permission to access

### Not permitted

- Denial-of-service attacks
- Spamming
- Social engineering or phishing
- Testing against third-party infrastructure without consent

EU and German law may require service operators to report certain attacks to authorities, even without malicious intent. Prior written consent protects both parties.

## Automated reports

We regularly receive reports that don't meet the quality bar for a disclosure. Common issues include:

- Demonstrations against internal APIs in ways that aren't reachable through the Kimai UI
- Exaggerated severity levels that don't reflect realistic attack scenarios (see [Severity levels]({% link _documentation/developer/security.md %}))
- Multi-page write-ups padded with boilerplate code and filler text (AKA unvalidated, AI output)

And our favorites:
- Descriptions of Kimai features or behavior that don't exist (unvalidated AI-hallucinations)
- Reports that ignore this documentation page

**If you use AI tools to draft your report, you're responsible for reviewing and validating every claim before submission. 
Raw LLM output — even if technically accurate — won't be credited unless a human researcher is available to answer follow-up questions.**

To be considered, a report must:

- Clearly identify the affected component or endpoint
- Describe the vulnerability and its potential impact
- Include reproduction steps and/or a realistic proof of concept
- Not include one of the points listed below 

Every submitted report requires significant unplanned time to triage and evaluate, given the potential implications.
That time comes directly at the expense of other development work.
We appreciate every effort to help secure Kimai, but we can't afford to spend limited maintainer resources on reports 
that don't meet these criteria.

We might not answer in such cases and repeated low-quality submissions may result in your account being blocked.

## Not security issues

This is an incomplete list of issues that are not considered vulnerabilities in Kimai or behavior that needs to be addressed.

### Password reset: Host header poisoning

Kimai's password reset flow generates the emailed login link based on the current HTTP request context. 
If the hosting environment forwards attacker-controlled `Host` headers to the application, 
the reset email will contain a link pointing to an attacker-controlled domain. 
This allows the attacker to capture the signed login-link token and take over the target account.

**Why we do not classify this as a security issue in Kimai**

This attack requires that the `TRUSTED_HOSTS` environment variable is not configured. 
Kimai's installation documentation explicitly lists this variable as mandatory:

- `APP_SECRET` — You **MUST** set this to a long and unique string
- `TRUSTED_HOSTS` — You **MUST** set this to the domain name used to access Kimai (can be a regexp like `localhost|127.0.0.1|kimai.example.com`)
- `TRUSTED_PROXIES` — Default: "nginx,localhost,127.0.0.1"

The application cannot determine which hostnames are legitimate on its own — only the administrator of a given deployment knows how the instance is reachable. 
Setting `TRUSTED_HOSTS` is a fundamental part of securing any Symfony-based application, and this class of attack has been publicly 
documented since [2013 (CVE-2013-4752)](https://symfony.com/blog/security-releases-symfony-2-0-24-2-1-12-2-2-5-and-2-3-3-released#cve-2013-4752-request-gethost-poisoning).

A missing or incorrect server configuration is the responsibility of the administrator, not a defect in the application.

**Additional mitigation:** This attack does not work against accounts with two-factor authentication enabled.

### CSV Formula injection

Kimai does have a couple of code pieces in place to prevent simple `Dynamic Data Exchange` or `DDE payload` attacks. 
CSV is a text format. If tools treat CSV files as more, its their responsibility to handle all content. 
In other words: I consider potential formula injection attacks through CSV files as a problem of Excel and not Kimai.

A shortened version of [Google Bughunter University](https://bughunters.google.com/learn/invalid-reports/google-products/4965108570390528/csv-formula-injection):

> This issue should mitigated by the application which would be importing/interpreting data from an external source, as Microsoft Excel does (for example) by showing a warning. 
> 
> In other words, the proper fix should be applied when opening the CSV files, rather then when creating them.

### Logout works without CSRF token

The pure fact that the logout link works without any protection is not a vulnerability.
If someone manages to get a hold of your Kimai URL and is able to make you open the logout link without knowing (eg. as URL of a hidden image in an email) - you would be logged out.
That entire scenario is already unlikely, but if it happens it is only annoying.

There are pages like superlogout.com (do not visit!) which will log you out of dozens of popular services.
All of these linked sites [do not work against this feature](https://bughunters.google.com/learn/invalid-reports/web-platform/csrf-clickjacking/5072689380982784) by making it overly-complicated to logout of their website/service.

All in all: I do not consider this to be a security risk.

### Unverified Password Change

I am not going to repeat everything that Google has to say about [Attacks working only when sharing local account with the attacker](https://bughunters.google.com/learn/invalid-reports/invalid-attack-scenarios/6576292268605440/attacks-working-only-when-sharing-local-account-with-the-attacker), 
so please follow the link. 

In my words: 
- The account needs to be fully authenticated to work, so "Remember me" session will force a re-login before opening the "change password" page.
- There is no win asking for the current password, as it can always be recovered by admins or by using the "forgot password" function. Worst case: the only system admin losses access and email is not configured: then it is always possible to using the console application to reset the password. 
- If an attacker gains access to an active user session, there are much bigger risks, like tampering with recorded data.

All in all: I do not consider this to be a security risk, but a UX improvement. Finally, this screenshot:

{% include docs-image.html width="480px" src="/images/documentation/bughunter/google-password-change.webp" title="Google allows to change a password without the current password" %}

### "Back" button that keeps working after logout

I do not consider this as a security risk. If a user leaves his browser unprotected, he has much more to worry about than a colleague
browsing through the tab history of a browser in which Kimai was open. To me this is a theoretical problem because you need
physical access to the machine, which exposes way worse security risks.

Besides, the only known workaround for this behavior is to cache bust each and every page of the application, which is in no way acceptable.

For the full article checkout the [Google Bughunter University](https://bughunters.google.com/learn/invalid-reports/web-platform/navigation/6057503504465920/content-in-cache-after-logout):

> Some of the vulnerability reporters notice that, after logging out of a web application but do not close their current browser tab, they are still able to use the "back" button in their browser to access cached documents.
>
> We generally do not consider this to be a well-defined security risk. In order to access the cached pages, the attacker will need physical access to the targeted login session, or the ability to execute arbitrary code with the current user's privileges on the system.
>
> We believe that attackers with this degree of access are firmly outside the security model of contemporary browsers and operating systems, and will be able to extract comparable information from the records persisted in system memory or in the filesystem using off-the-shelf tools; they may also simply modify the system to place a keylogger or other malicious software that collects passwords or cookies, or injects malicious scripts onto every visited page.

### No DMARC record found

Not only does this not qualify (read why [at dmarcreport.com](https://dmarcreport.com/blog/no-dmarc-record-found-bug-bounty-is-a-beg-bounty/)),
but we are indeed using DMARC, DKIM and SPF in combination to protect our email domains.

### Misconfigured SPF

Whether the soft fail `~all` or the fail `-all` qualifier is used, is a matter of choice of the server admin.
The common industry standard recommends using SPF as just one part of the bigger picture and therefor `~all` for active and email sending domains.

Besides: we are using DMARC, DKIM and SPF in combination to protect our email domain.

### Missing Certificate Authority Authorization Rule

Ok, if you are using automated tests, at least make sure they work.

- it is not a security risk
- there is a `CAA` record with the value `0 issue "letsencrypt.org"` in place

### Website framing

Being able to frame a website doesn't necessarily mean, that there is a security threat.

Unless you can prove a clickjacking attack, I do not consider this hypothetical problem to be an issue.
