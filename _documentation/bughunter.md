---
title: Bughunter
---

Some answers to the most common reports that I receive from independent security researchers

## "Back" button that keeps working after logout

I do not consider this as a security risk, please read the article at the [Google Bughunter University](https://sites.google.com/site/bughunteruniversity/nonvuln/cached-content-after-logout) for more information.

Here is the most important excerpt:

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
