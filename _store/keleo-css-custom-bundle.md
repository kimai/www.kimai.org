---
title: Custom CSS plugin for Kimai
name: Custom CSS plugin
intro: "A plugin, which allows editing custom CSS rules through an administration screen."
developer: keleo
date: "2019-02-21 20:00:00 +0200"
icon: fab fa-css3
price: "0"
download: https://github.com/Keleo/CustomCSSBundle/archive/master.zip
github: https://github.com/Keleo/CustomCSSBundle
type: plugin
tags:
  - plugin
bundle:
  name: "CustomCSSBundle"
  clone: "https://github.com/Keleo/CustomCSSBundle.git" 
screenshots:
  - 
    src: "/images/marketplace/custom-css-edit.png"
    title: Custom CSS administration
    description: The new administration page with all available pre-made rules 
  -
    src: "/images/marketplace/custom-css-before.png"
    title: Timesheet
    description: Default timesheet view before using rules
  - 
    src: '/images/marketplace/custom-css-after.png'
    title: Custom timesheet
    description: "Timesheet view with activated custom rules: highlight active records, hide overlapping records"
---

You can test the Plugin in the [Plugin demo]({% link _pages/demo.md %}).

Full documentation available [in the documentation]({% link _documentation/plugin-custom-css.md %}).

{% include plugins/custom-css.md %}

### Storage

This bundle stores the custom CSS rules in the file `var/data/custom-css-bundle.css`.
Make sure its writable by your webserver and included in your backups.
