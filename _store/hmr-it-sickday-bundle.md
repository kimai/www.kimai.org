---
title: SickDay plugin
name: SickDay plugin (days of illness)
intro: "A plugin for Kimai 2 to track sick days of user."
developer: hmr-it
date: "2021-03-14 09:00:00"
icon: fa fa-medkit
price: "89€"
gumroad: QtbRf
new: true
tags:
  - plugin
bundle:
    name: "SickDay"
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
- Upload sick certificate / incapacity certificate as PDF and archive it in Kimai 2
- Automatically adds the times absent to the user's timesheet based on their daily working time

## Requirements
- Kamai 2, V1.13 or higher
- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %})

## Installation

First unzip the plugin into to your Kimai `plugins` directory:

```bash
unzip SickDayBundle-x.x.zip -d <kimai path>/var/plugins/
```

And then reload Kimai:

```bash
bin/console kimai:reload
```

### Create database

Run the following command:

```bash
bin/console kimai:bundle:sickday:install
```

This will install all required databases.

## Setup
Create a customer, project and activity for sick days if you haven't already.

Click on `Sick Days` in the menu and select the `settings` tab.

Here you can select if PDFs are required for creating applications, and the activity for sick days (timesheet entries will be created using this).

If you have the MetaFields plugin installed create a new field for users with `duration` as input field. The time you enter will be inserted into the users timesheet when creating applications.

Using the last input you can limit until when applications can be created. `1` for example, will only let users create applications until today minus 1 week.


## Help
#### Menu
The badge in the menu at the entry "Sick Days" will display the amount of sick days with the "notiied" status.

## Permissions
The install-command will create the following permission:
- `sickday_admin`

Users with that permission can create sick days for other users, view the summary screen and change the settings.


## Updating the plugin

Updating the bundle works the same way as the installation does.

- Delete the directory `var/plugins/SickDayBundle/` (to remove deleted files)
- Execute all installation steps again:
    - Copy files
    - Clear cache
    - Update database with `bin/console kimai:bundle:sickday:install` 
