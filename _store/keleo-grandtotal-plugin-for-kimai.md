---
title: GrandTotal plugin for Kimai
name: Grandtotal plugin
intro: "A GrandTotal 6 plugin, which allows to import Kimai timesheets"
slug: grandtotal-plugin-for-kimai
developer: keleo
date: "2020-06-07 21:00:00 +0200"
icon: far fa-envelope
price: "0"
download: https://github.com/Keleo/kimai2-grandtotal/raw/master/Kimai2.grandtotalplugin.zip
github: https://github.com/Keleo/kimai2-grandtotal
type: client
tags:
  - GrandTotal
---

Attention: this is **NOT** a Kimai bundle, but a plugin that can be installed inside GrandTotal.

## Installation

**Via GitHub**:

Download the [Plugin as ZIP](https://github.com/Keleo/kimai2-grandtotal/raw/master/Kimai2.grandtotalplugin.zip), 
extract and then double-click the `Kimai2.grandtotalplugin` archive.

If you have a valid GrandTotal installation, the plugin will be installed.

**Via GrandTotal**:

The recommended way to install the plugin is to open the `Overview` in GrandTotal and then select the `Get plugins` page.
Under `Time importers (Webservices)` you find the `Kimai` plugin. Click it and GrandTotal will install the plugin.

![Installation](https://raw.githubusercontent.com/Keleo/kimai2-grandtotal/master/grandtotal-kimai-installation.png "Kimai plugin installation")

### Configuration

Open the `Kimai` plugin page (_Not invoiced_) and then click the `cogs` icon in the lower right corner of the status bar. 
The configuration dialog will show up: enter the `domain` of your Kimai installation, the `username` and `API password` (this is NOT your normal login password!). 

![Configuration](https://raw.githubusercontent.com/Keleo/kimai2-grandtotal/master/grandtotal-kimai-login.png "Configure the plugin")

For testing you can use `https://demo.kimai.org`, the username `susan_super` and the API password `api_kitten`.

### Configuration

After confirming the configuration settings, the timesheet data will be loaded. 
This might take a while, please be patient while the loading indicator is active.

![Listing](https://raw.githubusercontent.com/Keleo/kimai2-grandtotal/master/grandtotal-kimai-listing.png "Timesheet data listing")

From here on, you can use the normal time importer flow: select the entries you want to add to your next invoice and hit `Invoice Selection`.
