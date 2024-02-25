---
title: "Release 1.1 - Continuous improvements"
date: "2019-07-24 19:40:00 +0200"
author: kevinpapst
tags: [On-Premise]
---

I'd like to publish new features more often, so lets see if I can keep on releasing quicker in the future.

Since the last release I published the first [paid plugins]({% link _pages/store.html %}), which might be interesting for some companies.
Maybe you want to support further Kimai development with a purchase?!

You know [how to update]({%link _documentation/updates.md %}), right? And now enjoy the latest features 😄

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.0.1...1.1)

**Implemented enhancements:**

- QUESTION: Graceful way to check for several things on startup [\#928]({{ site.kimai_v2_repo }}/issues/928)
- Logging to apache log [\#912]({{ site.kimai_v2_repo }}/issues/912)
- Update Portuguese \(Brazilian\) translation [\#900]({{ site.kimai_v2_repo }}/issues/900)
- Update Swedish translations [\#899]({{ site.kimai_v2_repo }}/issues/899)
- Feature Request - Invoice sum per day [\#879]({{ site.kimai_v2_repo }}/issues/879)
- added invoice calculator to sum by day [\#982]({{ site.kimai_v2_repo }}/pull/982) ([kevinpapst](https://github.com/kevinpapst))
- trigger template events in authentication layout as well [\#981]({{ site.kimai_v2_repo }}/pull/981) ([kevinpapst](https://github.com/kevinpapst))
- added slovakian translations - by caprik [\#952]({{ site.kimai_v2_repo }}/pull/952) ([kevinpapst](https://github.com/kevinpapst))
- Install migrations [\#944]({{ site.kimai_v2_repo }}/pull/944) ([kevinpapst](https://github.com/kevinpapst))
- updated Portuguese \(Brazilian\) transalations \(\#900\) [\#942]({{ site.kimai_v2_repo }}/pull/942) ([MarcosEllys](https://github.com/MarcosEllys))
- updated swedish translations [\#934]({{ site.kimai_v2_repo }}/pull/934) ([kevinpapst](https://github.com/kevinpapst))
- toolbar selects and visibility improvements [\#933]({{ site.kimai_v2_repo }}/pull/933) ([kevinpapst](https://github.com/kevinpapst))
- allow non-interactive installation [\#932]({{ site.kimai_v2_repo }}/pull/932) ([kevinpapst](https://github.com/kevinpapst))
- Support tag creation from query params [\#930]({{ site.kimai_v2_repo }}/pull/930) ([tobybatch](https://github.com/tobybatch))
- performance improvements with new indices [\#927]({{ site.kimai_v2_repo }}/pull/927) ([kevinpapst](https://github.com/kevinpapst))
- Project invoice calculator [\#892]({{ site.kimai_v2_repo }}/pull/892) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- API Tag contastaint [\#976]({{ site.kimai_v2_repo }}/issues/976)
- Add dashboard to initial view + Setup default initial view after login [\#973]({{ site.kimai_v2_repo }}/issues/973)
- Kimai 1.0 installation issue [\#910]({{ site.kimai_v2_repo }}/issues/910)
- Fixes regexp for search timesheets by tag [\#978]({{ site.kimai_v2_repo }}/pull/978) ([tobybatch](https://github.com/tobybatch))
- dashboard is missing in initial view [\#974]({{ site.kimai_v2_repo }}/pull/974) ([kevinpapst](https://github.com/kevinpapst))
- fix possible xss in timesheet description [\#962]({{ site.kimai_v2_repo }}/pull/962) ([kevinpapst](https://github.com/kevinpapst)) - thanks for reporting @osamaalaah
- fix changing project for existing entries [\#940]({{ site.kimai_v2_repo }}/pull/940) ([kevinpapst](https://github.com/kevinpapst))
- fix LDAP edge-case initialization error [\#931]({{ site.kimai_v2_repo }}/pull/931) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- DOCS: Another example for smtp connect [\#971]({{ site.kimai_v2_repo }}/issues/971)
- IP addresses to log if login fails [\#951]({{ site.kimai_v2_repo }}/issues/951)
