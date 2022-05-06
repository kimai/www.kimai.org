---
title: Overridable Duration Rounding for Kimai
name: Overridable Duration Rounding plugin
intro: "Override duration rounding for customers, projects and activities"
developer: glorpen
date: "2022-05-06 11:49:16 +0200"
icon: fab fa-hourglass
price: "0"
version: v1.0.2
download: https://github.com/glorpen/kimai-duration-plugin/archive/refs/heads/master.zip
github: https://github.com/glorpen/kimai-duration-plugin
type: plugin
tags:
- plugin
bundle:
  name: "GlorpenDurationBundle"
  clone: "https://github.com/glorpen/kimai-duration-plugin.git"
---

Enables setting duration rounding option (same as global one) to override rounding for any Customer, Project or Activity.

## Installation

Checkout plugin into `var/plugins/GlorpenDurationBundle` & clear cache.

Run `bin/console kimai:bundle:glorpen-duration:install`.

## Usage

After installation, existing Rounding methods will be extended with new functionality.
When editing any Customer, Project or Activity you can set *Rounding of the duration in minutes* option to override global one.
