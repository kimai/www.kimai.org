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
<div class="col-sm-12 col-lg-4">
    <div class="card card-md">
        <div class="card-body text-center">
            <h4>Kimai - Hosted</h4>
            <ul class="list-unstyled lh-lg">
                <li>
                    Free TLS (SSL) certificate
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Hosting & Updates
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Backups
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Custom-fields plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Task management plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Expenses plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Audit-Trail plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    <br>
                    Free plan available for <strong>5</strong> users
                </li>
            </ul>
            <div class="text-center mt-4">
                <a href="https://www.kimai.cloud/pricing" class="btn btn-primary w-100">Choose plan</a>
            </div>
        </div>
    </div>
</div>
</div>

