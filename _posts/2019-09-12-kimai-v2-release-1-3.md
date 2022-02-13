---
layout: post
title: "Release 1.3 - Searching"
date: "2019-09-12 12:00:00 +0200"
author: kevinpapst
tags: [Release]
---

Being agile means releasing early and often to get quick feedback. So this time I took only two weeks for a new release, 
as a major change was introduced which I want to get out to you before investing more time to polish it even further (the new search form).  

This release is mainly about:
- the new introduced search / filter options for [timesheets]({%link _documentation/timesheet.md %}#filter-and-search), [customers]({%link _documentation/customer.md %}#filter-and-search) ...
- sortable table columns
- improved tag management

In the meantime a new addon was added to the Marketplace:
- the [Empty description checker plugin]({% link _store/mr-software-empty-description-checker-bundle.md %})

Thanks to all of you, especially:
- all clients and donators, you guys rock and help me to keep up the work for Kimai!!!
- the developers who contributed their time and the plugins to the community
- everyone else contributing at GitHub, too many to name you all ...

The next version will include:
- Czech translations (which didn't make it into 1.3)
- Improvements for custom fields
- ... more to come ...

> I hope you all know how to upgrade... if not [click here]({%link _documentation/updates.md %}). And now enjoy the latest features!

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/1.2...1.3)

**Implemented enhancements:**

- Cookie Expiration should automatically lead to sign in page [\#1027](https://github.com/kevinpapst/kimai2/issues/1027)
- customer specific translations [\#1099](https://github.com/kevinpapst/kimai2/pull/1099) ([kevinpapst](https://github.com/kevinpapst))
- support multiple invoice repositories [\#1084](https://github.com/kevinpapst/kimai2/pull/1084) ([kevinpapst](https://github.com/kevinpapst))
- added font-awesome paper-plane [\#1077](https://github.com/kevinpapst/kimai2/pull/1077) ([hmr-it-jr](https://github.com/hmr-it-jr))

**Fixed bugs:**

- swagger file type text [\#1094](https://github.com/kevinpapst/kimai2/issues/1094)
- Tags search fails when there are numerous tags which start with a specific identifier [\#1082](https://github.com/kevinpapst/kimai2/issues/1082)
- Content of ${entry.description} not from table timesheet.description [\#1076](https://github.com/kevinpapst/kimai2/issues/1076)
- Wrong ${entry.total} for fixed rate items if more than one [\#1073](https://github.com/kevinpapst/kimai2/issues/1073)
- Post release 1.2 [\#1068](https://github.com/kevinpapst/kimai2/pull/1068) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- When create invoice, Description field is not description but is Activity [\#1093](https://github.com/kevinpapst/kimai2/issues/1093)
- Critical error after upgrading from 1.1 to 1.2 [\#1071](https://github.com/kevinpapst/kimai2/issues/1071)

**Merged pull requests:**

- fix API version string [\#1096](https://github.com/kevinpapst/kimai2/pull/1096) ([kevinpapst](https://github.com/kevinpapst))
- handles session timeouts in modals [\#1092](https://github.com/kevinpapst/kimai2/pull/1092) ([kevinpapst](https://github.com/kevinpapst))
- added table ordering [\#1086](https://github.com/kevinpapst/kimai2/pull/1086) ([kevinpapst](https://github.com/kevinpapst))
- Improved tag auto-completion + added tag management  [\#1083](https://github.com/kevinpapst/kimai2/pull/1083) ([kevinpapst](https://github.com/kevinpapst))
- use timesheet description in invoices [\#1079](https://github.com/kevinpapst/kimai2/pull/1079) ([kevinpapst](https://github.com/kevinpapst))
- refactored search with free search term support [\#1064](https://github.com/kevinpapst/kimai2/pull/1064) ([kevinpapst](https://github.com/kevinpapst))
