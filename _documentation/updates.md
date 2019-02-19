---
title: Updates
description: How to update Kimai 2 to the next release version
---

1. It is important that you don't execute the [installation steps]({% link _documentation/installation.md %}) before or after your update
2. Make sure that you have a working database backup before you start the update
3. Read the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide and the [release information]({{ site.kimai_v2_repo }}/releases) to check if there are further steps required

### Update process 

{% capture alert_note %}
Some tweaks may be necessary to these instructions if you are using FTP, developing or updating on your local computer 
instead of a server. Read the [installation docu]({% link _documentation/installation.md %}) for more information.
{% endcapture %}
{% assign alert_note = alert_note| markdownify %}
{% include alert.html type="info" alert=alert_note %} 

Change into your Kimai 2 installation directory, then fetch the latest code and install all dependencies:

```bash
git pull origin master
sudo -u www-data composer install --no-dev --optimize-autoloader
```

Refresh your cache:

```bash
sudo -u www-data bin/console cache:clear --env=prod
sudo -u www-data bin/console cache:warmup --env=prod
```

And upgrade your database:

```bash
bin/console doctrine:migrations:migrate
```

Remember to check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide for version specific tasks. 

Done! Enjoy the latest version of Kimai :-) 
