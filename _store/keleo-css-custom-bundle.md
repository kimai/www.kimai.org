---
title: Custom CSS Plugin for Kimai 2
name: Custom CSS Plugin
intro: "A Kimai 2 plugin, which allows to edit custom CSS rules through an administration screen."
developer: keleo
date: "2019-02-21 20:00:00 +0200"
icon: fab fa-css3
price: free
version: 0.1
download: https://github.com/Keleo/CustomCSSBundle/archive/master.zip
github: https://github.com/Keleo/CustomCSSBundle
screenshot: 
  - https://raw.githubusercontent.com/Keleo/CustomCSSBundle/master/screenshot.jpg
featured: 20
features:
  - change Kimai look for all users
  - pre-made css rules included 
  - hide header on mobile
  - change application title
tags:
  - plugin
  - kimai 2
---

This bundle ships with some pre-defined CSS rules, which can be added with a button click.

You can test the Plugin in the [Plugin demo]({% link _pages/demo.md %}).

## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/Keleo/CustomCSSBundle.git
```

And then rebuild the cache:
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

You could also [download it as zip](https://github.com/keleo/CustomCSSBundle/archive/master.zip) and upload the directory via FTP:

```
/kimai/var/plugins/
├── CustomCSSBundle
│   ├── CustomCSSBundle.php
|   └ ... more files and directories follow here ...
```

## Permissions

This bundle ships a new administration screen, which will be available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator
- `edit_custom_css` - every use that owns this permission

## Storage

This bundle stores the custom CSS rules in the file `var/data/custom-css-bundle.css`.
Make sure its writable by your webserver!