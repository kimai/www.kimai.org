---
title: Bughunter
---

Some answers to the most common reports that I receive from independent security researchers, which I do **not** consider 
to be security issues in Kimai or behavior that needs to be addressed.

## "Back" button that keeps working after logout

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

## CSV Excel Formula injection

Kimai does have a couple of code pieces in place to prevent simple `Dynamic Data Exchange` or `DDE payload` attacks. 
But in general I consider this to be a problem of Excel and not Kimai.

A shortened version of [Google Bughunter University](https://bughunters.google.com/learn/invalid-reports/google-products/4965108570390528/csv-formula-injection):

> This issue should mitigated by the application which would be importing/interpreting data from an external source, as Microsoft Excel does (for example) by showing a warning. 
> 
> In other words, the proper fix should be applied when opening the CSV files, rather then when creating them.

## Logout works without CSRF token

The pure fact that the logout link works without any protection is not a vulnerability.
If someone manages to get a hold of your Kimai URL and is able to make you open the logout link without knowing (eg. as URL of a hidden image in an email) - you would be logged out.
That entire scenario is already unlikely, but if it happens it is only annoying.

There are pages like superlogout.com (do not visit!) which will log you out of dozens of popular services.
All of these linked sites [do not work against this feature](https://bughunters.google.com/learn/invalid-reports/web-platform/csrf-clickjacking/5072689380982784) by making it overly-complicated to logout of their website/service.

All in all: I do not consider this to be a security risk.

## Unverified Password Change

I am not going to repeat everything that Google has to say about [Attacks working only when sharing local account with the attacker](https://bughunters.google.com/learn/invalid-reports/invalid-attack-scenarios/6576292268605440/attacks-working-only-when-sharing-local-account-with-the-attacker), 
so please follow the link. 

In my words: 
- The account needs to be fully authenticated to work, so "Remember me" session will force a re-login before opening the "change password" page.
- There is no win asking for the current password, as it can always be recovered by admins or by using the "forgot password" function. Worst case: the only system admin losses access and email is not configured: then it is always possible to using the console application to reset the password. 
- If an attacker gains access to an active user session, there are much bigger risks, like tampering with recorded data.

All in all: I do not consider this to be a security risk, but a UX improvement. Finally, this screenshot:

{% include docs-image.html src="/images/documentation/bughunter/google-password-change.webp" title="Google allows to change my password, without asking for the current password" width="700px" %}
