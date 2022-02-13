---
title: Sick-Day plugin
name: Sick-Day plugin (days of illness)
intro: "A plugin for Kimai to track the sick-days of users."
developer: mr-software
date: "2022-02-13 10:00:00 +0200"
icon: fa fa-medkit
demo: false 
price: "89€"
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
    - ["1.22", "1.16.10"]
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

- See if your users have overtimes or undertimes (since first day in company, per month, per day)
- Check if they violate the German break time law "Arbeitszeitgesetz (ArbZG) § 4 Ruhepausen"
- Users see how much overtimes or undertimes they have + how much they've worked already in the current month and how much they still have to work in the current month
- Overview for Administrators to see all calculated times in one view
- See if one of your user's birthday is coming soon
- Handout for employees as PDF to see the worked hours of the month
- Handout downloadable as a single PDF file for all employees or easy sendable via email to each employee (even to his private email account!)
- Detect overlapping times with one click
- See if your users have missing days (no times entered on days where they had to work)
- Users can tag their time spent in home office. At the end of the year this plugin provides every user a comprehensive overview as PDF of the time spent in home office. This is
  important for tax reasons.

## Requires

- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %})
- Kimai v1.16.10+
