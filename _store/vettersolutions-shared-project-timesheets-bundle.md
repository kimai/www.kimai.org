---
title: Shared Project Timesheets for Kimai 2
name: Shared Project Timesheets Plugin
intro: Share project timesheets with anyone!
developer: vettersolutions
date: "2020-12-18 18:00:00 +0200"
icon: fas fa-receipt
price: "0"
version: v1.0.0
download: https://github.com/dexterity42/SharedProjectTimesheetsBundle/archive/master.zip
github: https://github.com/dexterity42/SharedProjectTimesheetsBundle
tags:
- plugin
new: true
---

A Kimai 2 plugin that allows you to share your project timesheets with anyone you want to grant access to.

## Features

- Create publicly accessible urls for the project timesheets you want to share
- Manage the view and decide what will be exposed
  - Password protection
  - Show/hide user of records (name of user)
  - Show/hide rates of records (hour rate, total rate)
  - Define whether and how to merge records of a day

## Installation

First clone this plugin to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/dexterity42/SharedProjectTimesheetsBundle.git
```

Go back to the root of your Kimai installation and clear the cache:
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

Execute database migrations:
```
bin/console kimai:bundle:shared-project-timesheets:install
```

You're done. Open up your browser and navigate to "Shared project timesheets".

## Permissions

Currently, there are no specific plugin permissions. The role `ROLE_SUPER_ADMIN` is required to manage the shared project timesheets.

## Contribute

Please feel free to report bugs and suggest new features on Github: https://github.com/dexterity42/SharedProjectTimesheetsBundle/issues/new

If you're a developer and want to contribute to this plugin, fork the repository and send me a pull request.
