---
layout: post
title: "Announcement - Kimai v2"
date: "2018-06-23 22:00:00 +0200"
author: kevinpapst
---

Welcome to a long overdue blog posting with a major announcement!

## Today I am thrilled to announce that the work on a brand new Kimai version started

Before I start with some background information, here is a list of links about Kimai v2:

- You can find the new website for now at [https://v2.kimai.org](https://v2.kimai.org)
- The project is developed at [Github]({{ site.kimai_v2_repo }})
- We have a [demo site](https://v2.kimai.org/demo/) that is waiting for your tests
- After testing, please leave us your [feedback]({{ site.kimai_v2_repo }}/issues/) at GitHub, 
so we can shape the future development roadmap together

## What happened so far

Simon and I discussed about writing a new Kimai version for a long time and it was also 
[requested by the community for many years]({{ site.kimai_v1_repo }}/issues/259).

We were always unsure whether the effort would pay out. Writing a brand new timetracking software in a modern framework would 
basically mean writing a new software which would only share the same name, the same developer and probably the same approach 
of tracking and managing timesheets.

But there was a point when it became clear that Kimai v1 was overhauled and barely manageable any longer. 
Writing new features for Kimai v1 felt wrong and painful, as the main codebase is more than 10 years old and less than ideal 
considering the great toolkits the PHP community has to offer in 2018.

Also Kimai v1 was never meant to be used on modern devices and even though there were third-party apps, 
the support for mobile usage was not ideal - to say at least.

So it was finally time "to let go" and start working on the next generation of Kimai and inspirational as developers are: 
we call it "Kimai v2" for now.

I choose to use Symfony as technical core layer and a bootstrap based theme, to be up-to-date with the latest 
and greatest features from the open-source world and to be ready for another 10 years of Kimai.

You can find more technical details [at Github]({{ site.kimai_v2_repo }}) and in 
the [developer documentation]({% link _documentation/developers.md %}).

## Current status

The status of the development is in an early stage and some of the advanced features from Kimai v1 are still missing.

The installation process is quick and done in a couple of minutes (you need PHP 7.1.3 or higher) and we already added 
support for [importing your data from Kimai v1]({% link _documentation/migration-v1.md %}). 

But we will very likely not call it "production ready" until the end of the year, as we have a lot of improvements 
in the pipeline which we consider "must-haves" for a time-tracking software in 2018. Until then we will fully support Kimai v1.

Try it out and give us feedback! You should test Kimai v2 early, in order to talk with us and sent in your requests, 
we don't want to break your workflows (especially regarding export and invoicing). 

## Thanks for reading

Join us as early adopters so we can start shaping the best open-source timetracking software together!
We are [waiting for your feedback]({{ site.kimai_v2_repo }}/issues/) as we want to build Kimai v2 in close contact with you.

Cheers,
Kevin  
