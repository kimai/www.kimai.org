---
title: Bughunter
---

## Reporting 

- You can report any security related vulnerability via email to [support@kimai.org](mailto:support@kimai.org), in the [advisory section at GitHub](https://github.com/kimai/kimai/security/advisories) or at [VulDB.com](https://vuldb.com/). 
- If you post the advisory on any other platform, I will read them, but I will not respond there.
- You can expect that your message will be answered in 24-72 hours.
- I will work as fast as I can to fix the problem and publish a bugfix release / security update. Depending on the size of the required fixes, this might take a couple of hours or a couple of days.
- If you try to ask for money BEFORE sharing details of a report, you won't get a reply and your email will be blocked.

## Rewards

This is an open-source project and I cannot offer a financial bug bounty program.
The community including myself is grateful for any (discrete) disclosure of vulnerabilities!

You will be mentioned in the release notes if your issue is valid and a fix is shipped. 
And if you want to be mentioned on social media, I will happily do so as well.

## Testing

Make a good faith effort to avoid privacy violations, destruction of data, and interruption or degradation of our service.
Only interact with accounts you own or with explicit permission of the account holder.

### Exclusions

YOU MAY NOT TEST AGAINST SERVERS YOU DO NOT HAVE EXPLICIT PERMISSION TO TEST.

While researching, please refrain from:

- Denial of service
- Spamming
- Social engineering (including phishing)

Do not pentest Kimai-Cloud or Demo installations without prior consent.

There are EU [^1] and German[^2] laws that require service owners to report certain attacks to the authorities.
This makes it difficult to cooperate in scenarios without prior written consent.

## No answer to your beg email?

You have sent a report and did not receive an answer?

Then you are very likely one of the thousands of "security researchers" who are sending out automated emails to every domain they can find. 
You did not bother to check the bigger picture, you maybe even send an invalid report. 

I am wasting my time with these "beg reports", as I receive dozens of them every week, and I am not going to answer personally.

## Common reports

Some answers to the most common reports that I receive from independent security researchers, which I do **not** consider
to be security issues in Kimai or behavior that needs to be addressed.

### No DMARC record found

This does not qualify, read why [at dmarcreport.com](https://dmarcreport.com/blog/no-dmarc-record-found-bug-bounty-is-a-beg-bounty/).

And we are using DMARC, DKIM and SPF in combination to protect our email domain.

### Misconfigured SPF

Whether the soft fail `~all` or the fail `-all` qualifier is used, is a matter of choice of the server admin.
The common industry standard recommends using SPF as just one part of the bigger picture and therefor `~all` for active and email sending domains.

Besides: we are using DMARC, DKIM and SPF in combination to protect our email domain.

### Missing Certificate Authority Authorization Rule

Ok, if you are using automated tests, at least make sure they work.

a) it is not a security risk
b) we have a `CAA` record in place with the value `0 issue "letsencrypt.org"`

Make your homework before spamming domain owners with nonsense.

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

### CSV Excel Formula injection

Kimai does have a couple of code pieces in place to prevent simple `Dynamic Data Exchange` or `DDE payload` attacks. 
But in general I consider this to be a problem of Excel and not Kimai.

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

{% include docs-image.html src="/images/documentation/bughunter/google-password-change.webp" title="Google allows to change my password, without asking for the current password" width="700px" %}

[^1]: https://www.consilium.europa.eu/en/policies/cybersecurity/
[^2]: https://www.bsi.bund.de/DE/Themen/Regulierte-Wirtschaft/Weitere_regulierte_Unternehmen/Anbieter_digitaler_Dienste/Meldungen/meldungen_node.html
