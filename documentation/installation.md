---
layout: kimai
title: Documentation for Kimai
description: Documentation for Kimai Time-Tracking
---
# Installation

The following requirements must be met on the server installation:

* PHP version 5.4 or above
* MySQLi and iconv extension for PHP
* one MySQL database (as Kimai supports table prefixes, this database may be shared with other tools)
* FTP or shell access to set the correct filesystem permissions.

Extract the Kimai release zip/tarball into a server directory accessible from the outside and navigate to this location using your browser. A step-by-step installation program is included with every new release of Kimai. Follow the instructions of the installer and correct missing or incorrect permissions using your FTP or shell account. 
If the step-by-step installer does not work, [please report this error]({{ site.issues_url }}).

Remove the “install” directory after the installation!

After you removed the “install” directory you may login into Kimai using the following credentials:

* user: admin
* password: changeme

Change the administrator password using the settings dialog. Keeping “changeme” as your password is a major security implication!

