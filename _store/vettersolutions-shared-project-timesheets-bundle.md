---
title: Shared Project Timesheets for Kimai
name: Shared Project Timesheets Plugin
intro: Share project timesheets with anyone!
developer: vettersolutions
date: "2020-12-18 18:00:00 +0200"
icon: fas fa-receipt
price: "0"
version: v1.0.0
download: https://github.com/dexterity42/SharedProjectTimesheetsBundle/archive/master.zip
github: https://github.com/dexterity42/SharedProjectTimesheetsBundle
type: plugin
tags:
  - plugin
new: false
bundle:
  name: "SharedProjectTimesheetsBundle"
  command: "kimai:bundle:shared-project-timesheets:install"
  versions: 
    - ["1.0", "1.11"]
---

A Kimai plugin that allows you to share your project timesheets with anyone you want to grant access to.

## Features

- Create publicly accessible urls for the project timesheets you want to share
- Access control feature
  - protect the shared project timesheets with a password
- View control feature
  - show or hide user of records (name of user)
  - show or hide rates of records (hour rate, total rate)
  - show or hide chart with day comparison by selected month (coming soon)
  - show or hide chart with month comparison by selected year (coming soon)
- View customizations
  - define whether and how to merge records of a day (e.g. merge records of one day, use description of last record)


After installation: open Kimai in your browser and navigate to "Shared project timesheets".

## Permissions

Currently, there are no specific plugin permissions. The role `ROLE_SUPER_ADMIN` is required to manage the shared project timesheets.

## Contribute

Please feel free to report bugs and suggest new features on Github: 
[https://github.com/dexterity42/SharedProjectTimesheetsBundle/issues/new](https://github.com/dexterity42/SharedProjectTimesheetsBundle/issues/new)

If you're a developer and want to contribute to this plugin, fork the repository and send me a pull request.
