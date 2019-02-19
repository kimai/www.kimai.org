---
layout: post
title: "The backend of Kimai"
date: "2007-01-14 21:18:41 +0200"
author: skilleven
---

At this moment we are radically rewriting the core of Kimai.
This is a necessary step for further development.
As Kimai grows it will be harder to manage, so a good solid structure must exist.
The basic idea behind the rewrite is separation of 'layout' and function:
the parts of Kimai that generate HTML will be in one place, the functionality behind it is in other places.
The big advantage is clear, I think: front-end developers can work on the HTML without being able to break the PHP code.
And PHP developers can not break the HTML.
This actually just means that specialists can concentrate on their field of work and do a better job in less time.

This big change in the core of Kimai will not be noticed by most users.
Kimai will still have the same look and feel.
There are some other changes planned that will affect the user experience in a positive way, though most users will not even notice it.
First of all security. The rewrite will fix some minor security issues that we found.
And the second change is the speed. We will introduce a caching system which will make Kimai run faster.

This also means that it is easier for users to change the HTML to their specific needs and that people can make their own custom HTML-themes.
This seems like a positive change. But we don't propagate it. The reason why is that the functionality of Kimai might change in future versions.
All custom themes should be changed whenever there is a change in the HTML and we can't guarantee this for third party templates.
It will of course be possible to change the look and feel of Kimai with CSS.
The HTML and CSS are set up in such a way that radical layout changes are possible without touching the HTML.
