---
title: Vacation plugin
name: Vacation plugin (vacation + official & local holidays)
redirect_from: /store/hmr-it-vacation-bundle.html
intro: "A plugin for Kimai which adds the full workflow for vacation + official & local holidays"
developer: mr-software
date: "2022-02-13 10:00:00 +0200"
icon: fa fa-plane
demo: false 
price: "199€"
gumroad: lVLXd
new: false
type: plugin
tags:
  - plugin
bundle:
  name: "VacationBundle"
  command: "kimai:bundle:vacation:install"
  purchase: true
  assets: false
  versions:
    - ["1.23", "1.16.10"]
screenshots:
  - 
    src: "/images/marketplace/mr-software-vacation-1.png"
    title: Menu item
    description: "Settings of the plugin"
  - 
    src: "/images/marketplace/mr-software-vacation-2.png"
    title: Menu item
    description: "Admins can the history"
  - 
    src: "/images/marketplace/mr-software-vacation-3.png"
    title: Menu item
    description: "Admins can edit the vacation days amount per amount"
  - 
    src: "/images/marketplace/mr-software-vacation-4.png"
    title: Menu item
    description: "Admins can see a summary of all vacation days"
  - 
    src: "/images/marketplace/mr-software-vacation-5.png"
    title: Menu item
    description: "Admins can configure public/local holidays"
  -
    src: "/images/marketplace/mr-software-vacation-6.png"
    title: Menu item
    description: "Admins can see all vacation applications"
---

## Installation and demo video

{% include youtube-video.html id="HjJClWQKzWY" title="Kimai 2 Vacation + Sick Day + Controlling Plugin Installation + Setup" %}

## Features

- Set the vacation entitlement per user via Custom-fields plugin
- Let users create a vacation application based on their vacation days budget
- Admins can grant, deny or cancel vacation applications
- See in one view a summary of all users vacation days
- German and Austrian public holidays can be automatically imported based on the state
- Manual creation of public/local holidays is also possible
- Support for multiple working times (e.g. 40 h/week, 15 h/week - fully configurable per user and per day)
- Full history of every vacation application

## Requires

- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %})
- Kimai v1.16.10+
