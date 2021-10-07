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

For the full article checkout the [Google Bughunter University](https://sites.google.com/site/bughunteruniversity/nonvuln/cached-content-after-logout):

> Some of the vulnerability reporters notice that, after logging out of a web application but do not close their current browser tab, they are still able to use the "back" button in their browser to access cached documents. 
>
> We generally do not consider this to be a well-defined security risk. In order to access the cached pages, the attacker will need physical access to the targeted login session, or the ability to execute arbitrary code with the current user's privileges on the system.
>
> We believe that attackers with this degree of access are firmly outside the security model of contemporary browsers and operating systems, and will be able to extract comparable information from the records persisted in system memory or in the filesystem using off-the-shelf tools; they may also simply modify the system to place a keylogger or other malicious software that collects passwords or cookies, or injects malicious scripts onto every visited page.

## CSV Excel Formula injection

Kimai does have a couple of code pieces in place to prevent simple `Dynamic Data Exchange` or `DDE payload` attacks. 
But in general I consider this to be a problem of Excel and not Kimai.

A shortened version of [Google Bughunter University](https://sites.google.com/site/bughunteruniversity/nonvuln/csv-excel-formula-injection):

> This issue should mitigated by the application which would be importing/interpreting data from an external source, as Microsoft Excel does (for example) by showing a warning. 
> 
> In other words, the proper fix should be applied when opening the CSV files, rather then when creating them.

## Cross-site Scripting (XSS) in branding settings

Some researchers find that you can inject HTML into the fields `theme.branding.company` and `theme.branding.mini`, 
which allows injecting HTML attributes to execute Javascript. 

This is documented behavior, see [System > Setting](https://www.kimai.org/documentation/configurations.html) in the `My company` chapter

> The settings for company and mini name can contain the HTML tags &lt;b>&lt;i>&lt;u>&lt;strong>&lt;em>&lt;img>&lt;svg> for formatting.

The only person able to update these settings is a System-Admin (likely the owner of the Kimai instance), 
who can already change and delete everything in Kimai: "With great power comes great responsibility".

So this cannot be considered a security issue.
