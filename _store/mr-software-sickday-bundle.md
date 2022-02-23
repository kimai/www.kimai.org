---
title: Sick-Day plugin
name: Sick-Day plugin (days of illness)
redirect_from: /store/hmr-it-sickday-bundle.html
intro: "A plugin for Kimai to track the sick-days of users."
developer: mr-software
date: "2022-02-13 10:00:00 +0200"
icon: fa fa-medkit
demo: false 
price: "149€"
gumroad: QtbRf
new: false
type: plugin
tags:
  - plugin
bundle:
  name: "SickDayBundle"
  command: "kimai:bundle:sickday:install"
  purchase: true
  assets: false
  versions:
    - ["1.23", "1.16.10"]
screenshots:
  - 
    src: "/images/marketplace/mr-software-sickday-1.png"
    title: Menu item
    description: "Admins see a summary of all sick days"
  - 
    src: "/images/marketplace/mr-software-sickday-2.png"
    title: Menu item
    description: "Admins can quickly navigate to the timesheets (sick days) of users"
  - 
    src: "/images/marketplace/mr-software-sickday-3.png"
    title: Menu item
    description: "Require PDF while creating a sick day"
---

## Installation and demo video

{% include youtube-video.html id="HjJClWQKzWY" title="Kimai 2 Vacation + Sick Day + Controlling Plugin Installation + Setup" %}

## Features

- Track the days of illness of your users
- Upload sick certificate / incapacity certificate as PDF and archive it in Kimai
- Automatically adds the times absent to the user's timesheet based on their daily working time

## Requires

- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %})
- Kimai v1.16.10+
