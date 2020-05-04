---
title: Updates
description: How to update Kimai 2 to the next release version
---

1. Make sure that you have a working [database backup]({% link _documentation/backups.md %}) before you start the update
2. Check [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) for required manual changes between your current and the new version 
3. You can upgrade multiple version at once, eg. from `1.6` to `1.8` while skipping `1.7`

## Updating Kimai 

{% capture alert_note %}
Some tweaks may be necessary to these instructions if you have a developer setup or update on your local computer 
instead of a server. Read the [installation docu]({% link _documentation/installation.md %}) for more information.
{% endcapture %}
{% assign alert_note = alert_note| markdownify %}
{% include alert.html type="info" alert=alert_note %} 

Change into your Kimai directory, then fetch the latest code and install all dependencies: 
```bash
git fetch --tags
git checkout {{ site.kimai_v2_version }}
```

You might have to prefix the next commands with `sudo` and/or `php73` (depends on your environment):

Update all composer dependencies:
```bash
composer install --no-dev --optimize-autoloader
```

And run the Kimai updater:
```bash
bin/console kimai:update
```

Remember to adjust the file permissions if necessary.
{% include file-permissions.html %} 

{% include upgrading-note.html %} 

That's it, Kimai is running the most current version. Enjoy the latest time-tracking features!
