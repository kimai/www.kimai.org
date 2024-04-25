---
title: Shared hosting
description: How to install Kimai in a shared hosting environment  
canonical: /documentation/shared-hosting.html
---

## Shared hosting

How to install Kimai at shared hosting companies. Please share our insights if you have managed to get it up and running with another company!

If you can't find the correct version, ask your hoster! Or [let us help you]({% link _store/keleo-installation-support.md %}).

### Uberspace

{% include docs-image.html src="/images/documentation/uberspace-logo.png" title="Uberspace Logo" width="144px" %}

[Uberspace](https://uberspace.de) is run by about a dozen people like you that strive to make technology accessible, understandable and manageable.

You can find a detailed how-to guide for installing Kimai in their [Uberlab](https://lab.uberspace.de/guide_kimai/).

### Manitu

Everything needed to install/run kimai (git, composer, etc.) is already preinstalled an available at [manitu.de](https://www.manitu.de/).

Steps to proceed to install kimai in a appropriate subdomain `kimai.your-domain.de` on a shared hosting environment:

- Create/use a SSH user through the manitu configuration menu
- Login with the SSH user
- `cd ../../web` to change to the root directory of the web space
- `git clone -b {{ site.kimai_v2_version }} --depth 1 {{ site.kimai_v2_repo }}.git`
- `cd kimai/`
- `composer install {{ site.kimai_v2_composer_flags }}`
- Create a DB through the hosters configuration menu (called: `Datenbanken`)
- Adjust the DB configuration in `.env`
  DB-Version can be found out through phpMyAdmin with sql instruction: `select Version();`, an example DB connection string:
  ```
  DATABASE_URL=mysql://user:pwd@yourDbServer.manitu.net:3306/YourDbName?charset=utf8mb4&serverVersion=10.11.4-MariaDB-log
  ```
- Run `./bin/console kimai:install -n`
- Change file/directory permission through webspace configuration menu (called: `Datei-Berechtigungen`): use `/web/kimai/var` as destination, use all other default values.
- Create a subdomain for kimai: use /web/kimai/public/ as destination.
- `bin/console kimai:user:create username admin@example.com ROLE_SUPER_ADMIN`

### Ionos / 1&1

- GIT is normally pre-installed and can be used via SSH
- composer has to be installed manually
- The default PHP version is often too low, you can check that with `php -v`
    - If it is lower than 8.1, you have to prefix all commands with the proper version, eg. `/usr/bin/php8.1-cli` (even composer)
    - Example composer: `/usr/bin/php8.1-cli composer.phar install {{ site.kimai_v2_composer_flags }}`
    - Example installation: `/usr/bin/php8.1-cli bin/console kimai:install -n`

### Domainfactory

- GIT is pre-installed and can be used via SSH
- composer has to be installed manually: `curl -sS https://getcomposer.org/installer | php8.1.5-cli`
- The default PHP version is often too low, you can check that with `php -v`
    - If it is lower than 8.1, you have to prefix all commands with the proper version, eg. `php8.1.5-cli` (even composer)
    - Example composer: `php8.1.5-cli composer.phar install {{ site.kimai_v2_composer_flags }}`
    - Example installation: `php8.1.5-cli bin/console kimai:install -n`

### All-Inkl

All-Inkl has several CLI versions of PHP available via e.g. `php81`.

Composer is running at `/usr/bin/composer`, so you execute it like that:
- `php81 /usr/bin/composer install {{ site.kimai_v2_composer_flags }}`
- `php81 bin/console kimai:install -n`

**ATTENTION** They use the PHP Plugin "ionCubeLoader", which is known to cause troubles with Symfony projects (or better with Doctrine Cache files).

This will lead to a 500 error on page loads, unless the cache is not existing yet.
[The workaround](https://github.com/kimai/kimai/discussions/2859#discussioncomment-5405336) is to create a custom `php.ini` that will force ioncube to NOT look into the Kimai directory.

Create two files (replace `your-username-here` with your All-Inkl account name):

- /www/htdocs/your-username-here/kimai/.user.ini
- /www/htdocs/your-username-here/kimai/public/.user.ini

with the content:

```
ioncube.loader.encoded_paths = /www/htdocs/your-username-here/logs
```

### Strato

Strato has a special setup of PHP, you need to find the proper version first.

- PHP-Directory: `/opt/RZphp{major}{minor}/bin/php-cli` (Shared Hosting)
- PHP-Directory: `/usr/bin/php{major}{minor}` (Managed Server)

For example, if you want to use PHP 8.1 use always the absolute path when running a PHP based command: so prefix all commands with eg. `/opt/RZphp81/bin/php-cli` in bash.

How to install Kimai:
- Install composer: `curl -sS https://getcomposer.org/installer | /opt/RZphp81/bin/php-cli`
- Clone Kimai as stated above and then `cd kimai`
- Install composer packages with `/opt/RZphp81/bin/php-cli ../composer.phar install {{ site.kimai_v2_composer_flags }}`
- Configure your `.env` file, eg. with `nano .env`
- Install Kimai database `/opt/RZphp81/bin/php-cli bin/console kimai:install -n`

Reload your configuration `/opt/RZphp81/bin/php-cli bin/console kimai:reload`

### Plesk

If a subdomain has not yet been added, login to the Plesk frontend and add a new
subdomain, e.g. kimai.my-domain.com. Use the database tab of the new subdomain
to create a new database for Kimai. Also check the selected PHP version for
this subdomain in the development-tools section of the subdomain.

Next, the actual installation needs to be done in the command line of the
webserver directly.

- Login to the web server via SSH
- Locate the current PHP version. Plesk stores its PHP instances in the
  directory `/opt/plesk/php`. Depending on which PHP version was configured for
  Kimai subdomain, make sure to use this version during the installation. For
  example, if using version 8.1, the path to PHP should be `/opt/plesk/php/8.1/bin/php`.
- Switch user to be "root" (otherwise access to Plesk subfolder is denied) with `su`.
- Navigate to the root folder where Plesk is hosting the websites from.
  Typically, the root can be found at `/var/www/vhosts/<domain_name>` (Windows user see [here](https://docs.plesk.com/en-US/onyx/administrator-guide/web-hosting/website-directory-structure.68695/)):
  ```bash
  cd /var/www/vhosts/kimai.my-domain.com
  ```
- Install composer: `curl -sS https://getcomposer.org/installer | /opt/plesk/php/8.1/bin/php`
- Clone Kimai: `git clone -b {{ site.kimai_v2_version }} --depth 1 {{ site.kimai_v2_repo }}.git`
- Enter Kimai directory: `cd kimai`
- Install composer packages: `/opt/plesk/php/8.1/bin/php ../composer.phar install {{ site.kimai_v2_composer_flags }}`
- Configure `.env` file to have correct database credentials
- Install Kimai database: `/opt/plesk/php/8.1/bin/php bin/console kimai:install -n`
- Change ownership of `kimai` folder:
    ```
    cd ..
    chgrp -R psacln kimai
    chmod -R g+r kimai
    chmod -R g+rw kimai/var/
    ```
- Switch user back to your normal user account (must not be root), e.g. 'user': `su -p user`
- Reload caches:
    ```
    cd kimai
    bin/console kimai:reload --env=prod
    ```
- Create first user: `bin/console kimai:user:create username admin@example.com ROLE_SUPER_ADMIN`
- Adjust [Apache configuration](https://www.kimai.org/documentation/webserver-configuration.html)
  to point to the "public" subfolder of the Kimai installation, i.e. set the path to
  `/var/www/vhosts/my-domain.com/kimai/public`. Also ensure that `ServerName`
  and `ServerAlias` are set to `kimai.my-domain.com` and `www.kimai.my-domain.com`.

### Netcup

- Clone Kimai in the root folder as stated above and then `cd kimai`
- Install composer: `curl -sS https://getcomposer.org/installer | /usr/bin/php`
- Install dependencies: `php composer.phar install --optimize-autoloader`
- configure your .env file, eg. `nano .env`
- install kimai: `php bin/console kimai:install -n`
- reload config: `php bin/console kimai:reload`
- Configure Netcup (using the customer controlpanel) to use "/kimai/public" as root folder for the domain (or subdomain) of your choice and add SSL (Letsencrypt) for this domain

See issue [#1620]({{ site.kimai_v2_repo }}/issues/1620).

### HostEurope

ATTENTION: Procedure must be undertaken **with the FTP SSH account**, not the WP one.

- Clone Kimai in the root folder as stated above and then `cd kimai`
- Install composer: `curl -sS https://getcomposer.org/installer | /usr/bin/php`
- Install dependencies: `php composer.phar install {{ site.kimai_v2_composer_flags }}`
- configure your .env file, eg. `nano .env`
- install kimai: `php bin/console kimai:install -n`
- reload config: `php bin/console kimai:reload`

After those steps are done, go to the control panel of the webserver
- In HostEurope's webserver administration, select `Domains` -> `Subdomains` and configure `/kimai/public` as Directory `/` URL for the domain (or subdomain) of your choice
- Optionally, under `Security & SSL` -> `Manage SSL` configure an SSL certificate for the domain
- Select `Webspace & Users` -> `File Management` -> `kimai` -> `var` and select all files/folders. Those all belong to the FTP user, change this to the WP user and apply.

### Alfahosting

You need a `v2` plan to use Kimai, as they do not support PHP > 8.0 on CLI (SSH) for long-term customers on the "old" plans (like "Business XXL plan").
