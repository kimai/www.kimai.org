---
title: "Release 1.4 - New team widgets"
date: "2019-10-04 06:00:00 +0200"
author: kevinpapst
tags: [Release]
---

This release contains various bugfixes and some new features:

- improving the new search form (new JS library used) and fixing the "always closing bug"
- new auto-generated user avatars (used in user-list and new widgets, more to come)
- new dashboard widgets for "my teams" and "projects & budgets of my teams"
- czech translations
- show custom fields in data-tables

In the meantime two new addons were added to the Marketplace:
- the [Expense tracking plugin]({% link _store/keleo-expenses-bundle.md %})
- the [Period insert plugin]({% link _store/mr-software-period-insert-bundle.md %})

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donators, you guys rock and help me to keep up the work for Kimai
- the developers who contributed their time and the plugins to the community
- everyone else contributing at GitHub, too many to name you all ...

> I hope you all know how to upgrade... if not [click here]({%link _documentation/updates.md %}).

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.3...1.4)

**Implemented enhancements:**

- User view to list the teams names where the user is assigned as a user and as a team lead [\#1146]({{ site.kimai_v2_repo }}/issues/1146)
- custom fields - User Specific instructions or help fields for end user entry guidance  [\#1133]({{ site.kimai_v2_repo }}/issues/1133)
- Provide full usage of CustomMetaFields [\#1103]({{ site.kimai_v2_repo }}/issues/1103)
- Profile image [\#1078]({{ site.kimai_v2_repo }}/issues/1078)
- Composer update [\#1104]({{ site.kimai_v2_repo }}/pull/1104) ([kevinpapst](https://github.com/kevinpapst))
- added czech translations [\#1075]({{ site.kimai_v2_repo }}/pull/1075) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- upgrade difficulties [\#1153]({{ site.kimai_v2_repo }}/issues/1153)
- Forgetting duration on timesheet entry gives error 500 and save remains greyed out [\#1147]({{ site.kimai_v2_repo }}/issues/1147)
- Invoice - Print and preview results are not the same when no users are selected  [\#1114]({{ site.kimai_v2_repo }}/issues/1114)
- Prevent search from getting closed on each selection [\#1112]({{ site.kimai_v2_repo }}/issues/1112)
- Using the variable ${entry.duration\_decimal} and ${invoice.duration\_decimal} should always have 2 decimals  [\#1080]({{ site.kimai_v2_repo }}/issues/1080)
- fix migrations for older database versions [\#1148]({{ site.kimai_v2_repo }}/pull/1148) ([kevinpapst](https://github.com/kevinpapst))
- Post 1.3 [\#1106]({{ site.kimai_v2_repo }}/pull/1106) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Upgrading failes during cache:clear [\#1152]({{ site.kimai_v2_repo }}/issues/1152)
- Branding on FTP installation [\#1140]({{ site.kimai_v2_repo }}/issues/1140)
- Kimai2 user issue [\#1139]({{ site.kimai_v2_repo }}/issues/1139)
- Invoice view missing the eye option - the one used for excluding columns in the preview report [\#1131]({{ site.kimai_v2_repo }}/issues/1131)
- Sorting Activity to a Customer [\#1126]({{ site.kimai_v2_repo }}/issues/1126)
- Question - How are active users identified in the dashboard view [\#1125]({{ site.kimai_v2_repo }}/issues/1125)
- Installation doesn't work [\#1122]({{ site.kimai_v2_repo }}/issues/1122)
- Error 500 On Fresh Install Of 1.3 [\#1117]({{ site.kimai_v2_repo }}/issues/1117)
- Team timesheet? [\#1109]({{ site.kimai_v2_repo }}/issues/1109)
- Plugin won't register [\#1108]({{ site.kimai_v2_repo }}/issues/1108)
- Error Installation brand new Debian10, Apache2, PHP7.3 [\#1095]({{ site.kimai_v2_repo }}/issues/1095)

**Merged pull requests:**

- User teams in user-list and on dashboard [\#1150]({{ site.kimai_v2_repo }}/pull/1150) ([kevinpapst](https://github.com/kevinpapst))
- fix deprecations [\#1145]({{ site.kimai_v2_repo }}/pull/1145) ([kevinpapst](https://github.com/kevinpapst))
- Fix search dropdown [\#1142]({{ site.kimai_v2_repo }}/pull/1142) ([kevinpapst](https://github.com/kevinpapst))
- fix invoice preview [\#1129]({{ site.kimai_v2_repo }}/pull/1129) ([kevinpapst](https://github.com/kevinpapst))
- Display meta-fields in datatables [\#1116]({{ site.kimai_v2_repo }}/pull/1116) ([kevinpapst](https://github.com/kevinpapst))
