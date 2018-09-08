---
layout: kimai
title: Downloads - Kimai Time-Tracking
description: Download - Kimai Time-Tracking versions
permalink: /download/
redirect_from:
  - /en/download.html
  - /download.html
---

# Downloads

<section id="downloads">
      <a href="https://github.com/kimai/kimai/releases/download/{{ site.kimai_version }}/kimai_{{ site.kimai_version }}.zip"><span>Release<br/>{{ site.kimai_version }}</span></a>
      <a href="https://github.com/kimai/kimai/zipball/master"><span>Stable<br/>1.x</span></a>
      <a href="https://github.com/kimai/manuals/raw/master/documentation.pdf"><span>Docu<br/>PDF</span></a>
</section>
<div class="clearleft"></div>
<br>

- Release: Contains all the files that are required to install Kimai directly
- Stable: is the developer version of a release, needs some post-install work (like `composer install --no-dev`)

Requirements for Kimai are only:<br/>
**MySQL 4.3** and **PHP 5.5** (required extensions: mysqli, iconv, php-xml)

<div class="clearleft"></div>

* * *

## Installation

1. Use a **modern** Browser
2. You need at least PHP 5.5 and access to a MySQL database.
3. Start your browser and go to your Kimai directory.
4. Kimai has a step-by-step installer, just follow the instructions.

**IMPORTANT**: Remove the `installer` directory when you’ve successfully installed Kimai.

### Update

Please see the [Update documentation](/documentation/updates/) for more information on how to update to a newer version of Kimai.

* * *

## Development version

A development version is the latest package we are currently working on.
It might have new features, but it might be broken as well!

If you are an experienced user of Kimai and have the resources to help us with testing or just like to play with brand new features,
you can [download the latest development version](https://github.com/kimai/kimai/zipball/develop).

Please help us, test it and [give us your feedback]({{ site.issues_url }}) if you find any problems.

## More Downloads

Our documentation has information about fetching the [latest development version]({{ site.docu_url }}developer/index.html).
