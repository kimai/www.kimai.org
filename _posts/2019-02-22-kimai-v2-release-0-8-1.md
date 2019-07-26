---
layout: post
title: "Release 0.8.1 - just a bugfix release"
date: "2019-02-22 19:00:00 +0200"
author: kevinpapst
tags: [Release]
---

This is a bugfix release for 0.8. Remember to execute the necessary timezone conversion script, 
if you haven't updated to 0.8 before ([see UPGRADING]({{ site.kimai_v2_repo }}/blob/master/UPGRADING.md#08)).

[Full Changelog]({{ site.kimai_v2_repo }}/compare/0.8...0.8.1)

**Upgrade from 0.8:**

- fetch the latest sources and refresh your cache: [How to upgrade Kimai]({{ site.kimai_v2_repo }}/blob/master/UPGRADING.md)

**Upgrade from 0.7 or before:**

- Execute the database migrations: [How to upgrade Kimai]({{ site.kimai_v2_repo }}/blob/master/UPGRADING.md)
- One more step is required: [Convert your timesheet data for timezone support]({{ site.kimai_v2_repo }}/pull/372)

**Fixed bugs:**

- deletion of customers leads to internal server error 500 [\#589]({{ site.kimai_v2_repo }}/issues/589)
- Entry editor label wrong \(from/to\) [\#587]({{ site.kimai_v2_repo }}/issues/587)
- resize mobile navbar buttons [\#582]({{ site.kimai_v2_repo }}/issues/582)

**Merged pull requests:**

- Support foreign keys with SQLite [\#590]({{ site.kimai_v2_repo }}/pull/590) ([kevinpapst](https://github.com/kevinpapst))
- post release fixes [\#584]({{ site.kimai_v2_repo }}/pull/584) ([kevinpapst](https://github.com/kevinpapst))
- Mobile navbar size [\#583]({{ site.kimai_v2_repo }}/pull/583) ([kevinpapst](https://github.com/kevinpapst))
