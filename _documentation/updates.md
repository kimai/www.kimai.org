---
title: Updates
description: How to update Kimai 2 to the next release version
---

## Pre-requisites

1. Don't execute anything from the [installation steps]({% link _documentation/installation.md %}) before or after your update
2. Make sure that you have a working database backup before you start the update
3. Read the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide and the [release information]({{ site.kimai_v2_repo }}/releases) to check if there are further manual steps required for one of the version between yours and the new one 

### Update process 

{% capture alert_note %}
Some tweaks may be necessary to these instructions if you have a developer setup or update on your local computer 
instead of a server. Read the [installation docu]({% link _documentation/installation.md %}) for more information.
{% endcapture %}
{% assign alert_note = alert_note| markdownify %}
{% include alert.html type="info" alert=alert_note %} 

Change into your Kimai directory, then fetch the latest code and install all dependencies.
You might have to prefix the `composer` and `bin/console` commands with `sudo -u www-data` (depends on your setup):

```bash
git fetch --tags
git checkout {{ site.kimai_v2_version }}
composer install --no-dev --optimize-autoloader
```

Refresh your cache:
```bash
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

And upgrade your database:

```bash
bin/console doctrine:migrations:migrate
```

Important: Finally execute the version specific tasks from the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide. 
 
{% include alert.html icon="far fa-smile-beam" type="success" alert="Done, enjoy the latest version of Kimai!" %}
