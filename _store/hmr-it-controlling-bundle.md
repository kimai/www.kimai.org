---
title: Controlling plugin
name: Controlling plugin (German law, break time check, overtime)
intro: "A plugin for Kimai 2 which checks if one of your users violated the German break time law + nominal and actual work time comparison + overtime view"
developer: hmr-it
date: "2020-10-09 10:00:00"
icon: fa fa-gavel
price: "99€"
gumroad: iVspM
new: true
tags:
  - plugin
bundle:
    name: "ControllingBundle"
    screenshots:
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-menu.png"
         title: Menu item 
         description: "Admins see a counter + Users see more detailed statistics" 
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-overview.png"
         title: "Overview"
         description: "See every users working time per month + it's red for undertime and green for overtime"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-overtime.png"
         title: "Overtime"
         description: "See a summery of over- or undertime for every user since first day in the company"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-breaktimecheck.png"
         title: "Break times"
         description: "See if users have violated the German break time law"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-overlapping.png"
         title: "Overlapping times"
         description: "See if your users have overlapping times"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-missingdays.png"
         title: "Missing days"
         description: "See if your users have missing days"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-settings.png"
         title: "Settings"
         description: "Fully configurable via GUI"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-handout.png"
         title: "Handout"
         description: "Handouts downloadable per Month"
      - 
         src: "/images/marketplace/hmr-it-controlling-plugin-handout-pdf.png"
         title: "Handout"
         description: "Handouts downloadable per Month"
---

## Features

- See if your users have overtimes or undertimes (since first day in company, per month, per day - all in separate views)
- Check if they violate the German break time law "Arbeitszeitgesetz (ArbZG) § 4 Ruhepausen"
- Users see how much overtimes or undertimes they have + how much they've worked already in the current month and how much they still have to work in the current month
- Filter data per user, time period, and so on
- E-Mail to user to notify him, that he has violated the German break time law via cronjob
- Overview for Administrators to see all calculated times in one view
- Get notified if one of your user's birthday is coming soon
- See all information in the dashboard
- Get notified if one of your user has a anniversaries like 5 years in company
- Handout for employees as PDF to see the worked hours of the month
- Handout downloadable as a single PDF file for all employees or easy sendable via email to each employee (even to his private email account!)
- Detect overlapping times with one click
- See if your users have missing days (no times entered on days where they had to work)
- Fully configurable via GUI
- See with one view in Billing/Export tabs a summery of all entries which are not cleared yet

## Requires

- [Custom-fields plugin](https://www.kimai.org/store/custom-fields-bundle.html) to save the birthday of the user
- Ability to create and run cronjobs
- Kimai 2, V1.10+
