---
title: Vacation plugin
name: Vacation plugin (vacation + official & local holidays)
intro: "A plugin for Kimai 2 which adds the full workflow for vacation + official & local holidays"
developer: hmr-it
date: "2021-01-18 10:00:00"
icon: fa fa-plane
price: "149€"
gumroad: lVLXd
new: true
tags:
  - plugin
bundle:
    name: "VacationBundle"
    command: "bin/console kimai:bundle:vacation:install"
    screenshots:
      - 
         src: "/images/marketplace/hmr-it-vacation-plugin-public-holiday.png"
         title: "Admin area"
         description: "Admins see all public holidays" 
      - 
         src: "/images/marketplace/hmr-it-vacation-plugin-settings.png"
         title: "Admin settings"
         description: "Admins can setup everything in the GUI"
      - 
         src: "/images/marketplace/hmr-it-vacation-plugin-vacation-applications.png"
         title: "Admin POV"
         description: "Admins can view the vacation applications and grant or deny them"
      - 
         src: "/images/marketplace/hmr-it-vacation-plugin-vacation-create.png"
         title: "Vacation application creation"
         description: "The view of the creation of a vacation application"
      - 
         src: "/images/marketplace/hmr-it-vacation-plugin-vacation-summary.png"
         title: "Summary"
         description: "Comprehensive summary of the vacation of all users"
      -
        src: "/images/marketplace/hmr-it-vacation-history-pov.png"
        title: "History"
        description: "History of a single request"
      -
        src: "/images/marketplace/hmr-it-vacation-plugin-user-pov.png"
        title: "User POV"
        description: "User POV"
---

## Features

- Set the vacation entitlement per user via Custom-fields plugin
- Let users create a vacation application based on their vacation days budget
- Admins can grant, deny or cancel vacation applications
- See in one view a summary of all users vacation days
- German public holidays can be automatically imported based on the state
- Manual creation of public/local holidays is also possible
- Fully configurable via GUI
- Support for multiple working times (e.g. 40 h/week, 15 h/week - fully configurable per user)
- Full history of every request

## Requires

- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %}) to save the vacation entitlement per user
- Ability to create and run cronjobs
- Kimai 2, V1.12+

## Documentation
### Setup
Create three custom fields for users using the custom-fields plugin:
- One for the amount of vacation days in the first year in which the users started working (number)
- The other for the amount of vacation days in all other years (number)
- A third one for the daily working time (duration)

If you're logged in as super-admin you will see an item in the menu called "Vacation view". In it there is a settings-tab.
Here you can select the state for public holidays, the activities that will be used as public holidays and vacations.

The last three inputs are dropdowns with all meta-fields. Select the ones you created earlier.

### How to add public holidays automatically

*Important: do the Setup before you run this script! You may want to create a backup before you run this script.*

You may have to adjust your path to composer and you may have to write `php` in front of `bin/console`
Does only work if you use the `git version` of Kimai 2.

Run the following commands:

```bash
cd var/plugins/VacationBundle
bash __create_public_holidays.sh
```

### Roles
The install-command will create two roles:
- `ROLE_VACATION`
- `ROLE_VACATION_ADMIN`

Users with none of the roles won't see the vacation tab in the menu.

If you assign the vacation-role to a user they will see the leave-application tab in the menu.

Super-admins and users with the vacation-admin role have full control over this plugin.

## Updating the plugin

Updating the bundle works the same way as the installation does.

- Delete the directory `var/plugins/VacationBundle/` (to remove deleted files)
- Execute all installation steps again:
    - Copy files
    - Clear cache
    - Update database with `bin/console kimai:bundle:vacation:install`


## Video Tutorial
[![IMAGE ALT TEXT](http://img.youtube.com/vi/LKWNDaq-wZw/0.jpg)](http://www.youtube.com/watch?v=LKWNDaq-wZw "Kimai 2 Vacation / Holiday Plugin Installation + Setup")
