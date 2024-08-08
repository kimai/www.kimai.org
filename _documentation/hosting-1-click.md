---
title: 1-click deployments and hosted platforms
navigation: 1-click installations
description: Kimai can be hosted on various systems and many hosting companies support 1-click installations for Kimai directly.  
canonical: /documentation/hosting-1-click.html
---

{% include snippets/unsupported-installation-warning.md %}
{% include snippets/self-hosting-warning.md %}

The following platforms adopted Kimai to be compatible with their one-click installation systems.

### YunoHost

With [YunoHost](https://yunohost.org), you can easily manage a server for your friends, association or enterprise. 
The Kimai [package](https://github.com/YunoHost-Apps/kimai2_ynh) can be found at GitHub.  

[Install Kimai with YunoHost](https://install-app.yunohost.org/?app=kimai2){: .btn .btn-success}

### Cloudron

[Cloudron](https://cloudron.io) provides a secure and ready to use Kimai package, which will be kept up-to-date automatically.
There is [documentation available](https://docs.cloudron.io/apps/kimai/) on how to customize configs and install plugins.

[Install Kimai with Cloudron](https://cloudron.io/button.html?app=org.kimai.cloudronapp){: .btn .btn-success}


### Cloudjiffy

[CloudJiffy](https://cloudjiffy.com/) provides a scalable, hourly billed and easy to use PaaS platform. Kimai is always deployed from the latest Github branch, thus you can rest easy that your software will always be up-to-date.

[Kimai is only a button-click away](https://cloudjiffy.com/blog/solutions/one-click-solutions/kimai-time-tracking-on-cloudjiffy){: .btn .btn-success}

### Elestio
[Elestio](https://elest.io/) offers fully managed Kimai instances in 112 regions across 28 countries and covers everything from deployment to security, monitoring, and updates.
You get full root SSH access to Kimai instance, and a web dashboard for stack and env var changes. 
You don't have to worry about updates as Elestio auto updates Kimai instance weekly which can be configured or disabled from the dashboard easily.

[Deploy Kimai to Elestio](https://elest.io/open-source/kimai){: .btn .btn-success}

### Softaculous

Be warned that Softaculous **does not yet provide updates of Kimai**, so you are stuck with the installed version. 
There have been a few other problems reported, using this installation type is ONLY FOR EVALUATION usage.   

[Install Kimai with Softaculous](https://www.softaculous.com/apps/others/Kimai){: .btn .btn-success}

### Vesta Control Panel

Be aware that VestaCP uses the `admin` user instead of `www-data`. Replace the names in the regular permission commands.
Read [this issue]({{ site.kimai_v2_repo }}/issues/743) if you have further questions.

### ISPConfig 3

There is an installation doc (only in German) available at [www.howtoforge.de](https://www.howtoforge.de/anleitung/installation-kimai2-webbasierte-zeiterfassung-in-einem-ispconfig3-web/).
