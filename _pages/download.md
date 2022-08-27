---
layout: page
title: Download
description: Download - Kimai time-tracker
options: '<a href="https://github.com/kevinpapst/kimai2/releases.atom" class="btn btn-option"><i class="fa fa-rss"></i></a>'
lang: en
redirect_from:
  - /en/download.html
  - /download.html
---

# Download Kimai - it's FREE!

<div class="row">
<div class="col-sm-12 col-lg-8" markdown="1">

### Server requirements

These requirements are provided by almost all hosting companies:

- PHP 7.3 or higher
- PHP extensions: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip`, `xsl`
- Database: MariaDB or MySQL
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache with mod_rewrite)
- A free subdomain (use in sub-directory is not supported)
- A modern browser

## Installation with SSH

The recommended way to [install Kimai]({% link _documentation/installation.md %}) is to use `git` and `composer` directly on the target system.

{% capture docText %}
Full installation instructions can be found in our [documentation]({% link _documentation/installation.md %}).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

## Development version

A development version is the latest package we are currently working on, also referred to as the `master`.
It will have new features and bugfixes included (see [demo site]({% link _pages/demo.md %})), but it might not be as stable as an official release.
Experienced Kimai users can help us testing, by [installing the development version]({% link _documentation/installation.md %}#development-installation) 
and [leaving feedback]({{ site.kimai_v2_repo }}/issues) if you encounter any problems.

### Download links

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-secondary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Development version (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> All releases </a>

</div>
{% include card-cloud.html %}
</div>

