---
title: Controlling plugin
name: Controlling plugin (German law, break time check, overtime)
intro: "A plugin for Kimai 2 which checks if one of your users violated the German break time law + nominal and actual work time comparison + overtime view"
developer: hmr-it
date: "2020-10-09 10:00:00"
icon: fa fa-gavel
price: "99€"
gumroad: iVspM
new: false
type: plugin
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
- Users can tag their time spent in home office. At the end of the year this plugin provides every user a comprehensive overview as PDF of the time spent in home office. This is
  important for tax reasons.

## Requires

- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %})
- Ability to create and run cronjobs
- Kimai 2, V1.10+

## Permissions

This bundle ships a new administration screen, which will be available for all users with the `ROLE_SUPER_ADMIN` role. All other users will only see the normal screen.

## Help
#### Menu
The badge in the menu at the entry "Check" does:
- For SuperAdmin: Breaktime Violations - Differences in overtimes
- For normal users: Overtime - Worked time this month/Target hours this month

## Configuration
Create the following fields using the meta-fields plugin:
- Timesheets:
    - Ticket number (Integer)
- User:
    - Daily working time (Duration)
    - First working day (Date)
    - Private E-Mail (Text)
    - Birthday (Date)

Next click on check in the menu and select the settings tab and select the matching meta-fields from the dropdowns.

### Users to exclude
Here you can select a list of users that will be ignored in the breaktime-check.

### Projects to exclude
This lets you exclude projects from breaktime-checks. This can be used for vacation days for example.

## Commands

| Command                                | Description                                                                           |
|----------------------------------------|---------------------------------------------------------------------------------------|
| bin/console timesheet:sendpdf          | Send mails to users with their timesheet of the current month as an attachment |
| bin/console rulebreakchecker:sendmails | If you want to send notification email to Admin and User who violated the Break Time Law then you can call following cli command. Make sure Execute cronjob only once when you want to send email because it will send email everytime it found Rule Break.|
| bin/console birthday:sendmails         | Will send mails to all superadmins if any user has birthday on the current day |
