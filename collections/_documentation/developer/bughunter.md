---
title: Vulnerability disclosure policy
---

This document describes how security vulnerabilities are handled for Kimai.

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

> **Warning:** Do not test against Kimai Cloud or demo installations without prior written consent.

### Permitted

- Testing on your own self-hosted Kimai instance
- Testing in environments you own or have explicit written permission to access

### Not permitted

- Denial-of-service attacks
- Spamming
- Social engineering or phishing
- Testing against third-party infrastructure without consent

EU and German law may require service operators to report certain attacks to authorities, even without malicious intent. Prior written consent protects both parties.[^1][^2]

## Automated and low-quality reports

We receive a high volume of automated or templated reports that show no familiarity with Kimai or its codebase. These reports are not reviewed.

To be considered, a report should:

- Clearly identify the affected component or endpoint
- Describe the vulnerability and its potential impact
- Include reproduction steps or a proof of concept
- AI-generated reports must be reviewed and validated by a human before submission. Posting raw LLM output, even if technically accurate, will not be credited unless a human researcher is available to answer follow-up questions.

Reports that do not meet these criteria, or that demand payment before sharing details, will not receive a response.

## Not security issues

This is an incomplete list of issues that are not considered vulnerabilities in Kimai or behavior that needs to be addressed.

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

{% include docs-image.html src="/images/documentation/bughunter/google-password-change.webp" title="Google allows to change my password, without asking for the current password" %}

[^1]: https://www.consilium.europa.eu/en/policies/cybersecurity/
[^2]: https://www.bsi.bund.de/DE/Themen/Regulierte-Wirtschaft/Weitere_regulierte_Unternehmen/Anbieter_digitaler_Dienste/Meldungen/meldungen_node.html
