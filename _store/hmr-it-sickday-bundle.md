---
title: Sick-Day plugin
name: Sick-Day plugin (days of illness)
intro: "A plugin for Kimai to track the sick-days of users."
developer: hmr-it
date: "2021-03-14 09:00:00"
icon: fa fa-medkit
price: "89€"
gumroad: QtbRf
type: plugin
tags:
  - plugin
bundle:
  name: "SickDayBundle"
  command: "kimai:bundle:sickday:install"    
screenshots:
  - 
    src: "/images/marketplace/hmr-it-sickday-view-user.png"
    title: "User view" 
    description: "User view"
  -
    src: "/images/marketplace/hmr-it-sickday-view-admin.png"
    title: "Admin view"
    description: "Admin view"
  -
    src: "/images/marketplace/hmr-it-sickday-overview.png"
    title: "Overview"
    description: "Overview"
  -
    src: "/images/marketplace/hmr-it-sickday-settings.png"
    title: "Settings"
    description: "Settings"
---

## Features

- Track the days of illness of your users
- Upload sick certificate / incapacity certificate as PDF and archive it in Kimai
- Automatically adds the times absent to the user's timesheet based on their daily working time

## Requirements

- Kimai v1.13 or higher
- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %})

## Setup

Create a customer, project and activity for sick days if you haven't already.

Click on `Sick Days` in the menu and select the `Settings` tab.

Here you can select if PDFs are required for creating applications, and the activity for sick days (timesheet entries will be created using this).

If you have the [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %}) installed create a new field for users with `duration` as input field. The time you enter will be inserted into the users timesheet when creating applications.

Using the last input you can limit until when applications can be created. `1` for example, will only let users create applications until today minus 1 week.

## Help
#### Menu

The badge in the menu at the entry "Sick Days" will display the amount of sick days with the "notified" status.

## Permissions

The install-command will create the following permission:
- `sickday_admin`

Users with that permission can create sick days for other users, view the summary screen and change the settings.
