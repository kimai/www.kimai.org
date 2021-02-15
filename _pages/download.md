---
layout: page
title: Download
description: Download - Kimai time-tracker
options: '<a href="https://github.com/kevinpapst/kimai2/releases.atom" class="btn btn-option"><i class="fa fa-rss"></i></a>'
lang: en
lang-ref: download
redirect_from:
  - /en/download.html
  - /download.html
---

# Download Kimai - it's FREE!

{% capture docText %}
Full installation instructions can be found in our [documentation]({% link _documentation/installation.md %}).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

### Server requirements 

These requirements are provided by almost all hosting companies:

- PHP 7.2.9 or higher
    - PHP extensions: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip`, `xsl`
- Database (MySQL, MariaDB, SQLite)
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache with mod_rewrite ...)
- A modern browser

## Installation with SSH 

**The recommended way to install Kimai!** 

You will use `git` and `composer` for the [installation]({% link _documentation/installation.md %}), which will be executed directly on the target system. 
Please read the [instructions]({% link _documentation/installation.md %}) carefully.
 
<a href="{% link _documentation/installation.md %}" class="btn btn-success"><i class="fas fa-book"></i> Read installation docs</a>

## Shared hosting with FTP

This way is not supported! Kimai does neither support updates in this mode nor ships a web-installer like other web-apps.
There [is a workaround]({% link _documentation/ftp.md %}), but you need to understand that you are on your own, only paid support possible.

## Development version

A development version is the latest package we are currently working on, also referred to as the `master`. 
It will have new features and bugfixes included (see [demo site]({% link _pages/demo.md %})), but it might not be as stable as an official release.
If you are an experienced user of Kimai and have the resources to help us with testing or just like to play with brand new features, you should [install the latest development version]({% link _documentation/installation.md %}#development-installation).

Please help us, test it and [leave some feedback]({{ site.kimai_v2_repo }}/issues) if you find any problems.

### More downloads

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-secondary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} ZIP</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Development ZIP</a>
<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> All releases </a>
