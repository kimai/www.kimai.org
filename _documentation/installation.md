---
title: Installation
description: How to install Kimai on your server with git, composer and SSH or FTP
toc: true
canonical: /documentation/installation.html
related:
  - fresh-ubuntu-18
  - fresh-ubuntu-20
  - webserver-configuration
  - ftp
redirect_from: /documentation/installation/
---

The recommended way to install Kimai is via SSH, you need GIT and [Composer](https://getcomposer.org/doc/00-intro.md).

## Recommended setup

To install Kimai in your production environment, connect with SSH to your server and change to your webservers (document) root directory.
You need to install Git and [Composer](https://getcomposer.org/doc/00-intro.md) if you haven't already.

First clone this repo ({{ site.kimai_v2_version }} is the [latest stable release]({{ site.kimai_v2_repo }}/releases)):

```bash
git clone -b {{ site.kimai_v2_version }} --depth 1 https://github.com/kevinpapst/kimai2.git
cd kimai2/
```

Now install all dependencies:
```bash
composer install --no-dev --optimize-autoloader -n
```

Configure the database connection and server version in the `.env` file:
```
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database?charset=utf8&serverVersion=5.7
```

And run the Kimai installer:
```bash
bin/console kimai:install -n
```

{% capture windows %}
Windows users might have to prefix the composer and installation commands with `php`, eg.:  
`php bin/console kimai:install -n`
{% endcapture %}
{% assign windows = windows|markdownify %}

{% include alert.html icon="fab fa-windows" type="warning" alert=windows %}

### File permissions

The webserver needs write permissions for several directories, so make sure the
[file permissions are correct](https://symfony.com/doc/current/setup/file_permissions.html).
{% include file-permissions.html %}

### Create your first user

There are several options to create your first user:

- via command: `bin/console kimai:user:create username admin@example.com ROLE_SUPER_ADMIN`
- via login screen: you can register a user, the first one will be promoted to the role `ROLE_SUPER_ADMIN`
- you can configure [LDAP]({% link _documentation/ldap.md %}) or [SAML]({% link _documentation/saml.md %}) for authentication

If you are going to [import data from Kimai v1]({% link _documentation/migration-v1.md %}) choose a username & email that was not used in v1.

### Webserver

Configure your web server (like Nginx or Apache) to point its DocumentRoot at the `public/` directory.
For more details, see the [Webserver How-To]({% link _documentation/webserver-configuration.md %}).

{% include alert.html icon="far fa-smile-beam" type="success" alert="Installation complete: enjoy time-tracking!" %}

Oh ... wait! Before you leave, please read the [initial setup guide]({% link _documentation/inital-setup.md %}).

## Docker

There is a dedicated article about [Docker setups]({% link _documentation/docker.md %}) for Kimai, suitable for development and production.

## Hosting and 1-click installations

The following platforms adopted Kimai to be compatible with their one-click installation systems.

### YunoHost

[![Install kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=kimai2)

Kimai [package](https://github.com/YunoHost-Apps/kimai2_ynh) for [YunoHost](https://yunohost.org).

### Cloudron

[Cloudron](https://cloudron.io) provides a secure and ready to use Kimai package, which will be kept up-to-date automatically.

[![Install Kimai with Cloudron](https://cloudron.io/img/button32.png)](https://cloudron.io/button.html?app=org.kimai.cloudronapp)

### Vesta Control Panel

Be aware that VestaCP uses the `admin` user instead of `www-data`. Replace the names in the permission commands above.
Read [this issue]({{ site.kimai_v2_repo }}/issues/743) if you have further questions.

### Cloudjiffy
[CloudJiffy](https://cloudjiffy.com/) provides a scalable, hourly billed and easy to use PaaS platform and the setup of Kimai is [only a click of a button away](https://cloudjiffy.com/blog/solutions/one-click-solutions/kimai-time-tracking-on-cloudjiffy). Kimai is always deployed from the latest Github branch, thus you can rest easy that your software will always be up-to-date.

## Shared hosting

How to install Kimai at shared hosting companies. Please share our insights if you have managed to get it up and running with another company!

If you can't find the correct version, ask your hoster! Or [let us help you]({% link _store/keleo-installation-support.md %}).

### Ionos / 1&1

- GIT is normally pre-installed and can be used via SSH
- composer has to be installed manually
- The default PHP version is often too low (PHP 5.x) - you can check that with `php -v`
    - If it is lower than 7.3, you have to prefix all commands with the proper version, eg. `/usr/bin/php7.3-cli` (even composer)
    - Example composer: `/usr/bin/php7.3-cli composer.phar install --no-dev --optimize-autoloader`
    - Example installation: `/usr/bin/php7.3-cli bin/console kimai:install -n`

### Domainfactory

- GIT is pre-installed and can be used via SSH
- composer has to be installed manually: `curl -sS https://getcomposer.org/installer | php7.3.5-cli`
- The default PHP version is often too low (PHP 5.x or even PHP 4.x) - you can check that with `php -v`
    - If it is lower than 7.3, you have to prefix all commands with the proper version, eg. `php7.3.5-cli` (even composer)
    - Example composer: `php7.3.5-cli composer.phar install --no-dev --optimize-autoloader`
    - Example installation: `php7.3.5-cli bin/console kimai:install -n`

### All-Inkl

All-Inkl has several CLI versions of PHP available via `php73`, `php74` and so on.
Composer is running at `/usr/bin/composer`, so you execute it like that:
- `php74 /usr/bin/composer install --no-dev --optimize-autoloader -n`
- `php74 bin/console kimai:install -n`

### Strato

Strato has a special setup of PHP, you need to find the proper version first.

- PHP-Directory: `/opt/RZphp{major}{minor}/bin/php-cli` (Shared Hosting)
- PHP-Directory: `/usr/bin/php{major}{minor}` (Managed Server)

For example, if you want to use PHP 7.3 use always the absolute path when running a PHP based command: so prefix all commands with eg. `/opt/RZphp73/bin/php-cli` in bash.

How to install Kimai:
- Install composer: `curl -sS https://getcomposer.org/installer | /opt/RZphp73/bin/php-cli`
- Clone Kimai as stated above and then `cd kimai2`
- Install composer packages with `/opt/RZphp73/bin/php-cli ../composer.phar install --no-dev --optimize-autoloader`
- Configure your `.env` file, eg. with `nano .env`
- Install Kimai database `/opt/RZphp73/bin/php-cli bin/console kimai:install -n`

Reload your configuration `/opt/RZphp73/bin/php-cli bin/console kimai:reload`

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
  example, if using version 7.3, the path to PHP should be `/opt/plesk/php/7.3/bin/php`.
- Switch user to be "root" (otherwise access to Plesk subfolder is denied) with `su`.
- Navigate to the root folder where Plesk is hosting the websites from.
  Typically, the root can be found at `/var/www/vhosts/<domain_name>`. For hosting
  location on Windows, please refer to official [Plesk documentation](https://docs.plesk.com/en-US/onyx/administrator-guide/web-hosting/website-directory-structure.68695/):
  ```bash
  cd /var/www/vhosts/kimai.my-domain.com
  ```
- Install composer: `curl -sS https://getcomposer.org/installer | /opt/plesk/php/7.3/bin/php`
- Clone Kimai: `git clone -b {{ site.kimai_v2_version }} --depth 1 https://github.com/kevinpapst/kimai2.git`
- Enter Kimai directory: `cd kimai2`
- Install composer packages: `/opt/plesk/php/7.3/bin/php ../composer.phar install --no-dev --optimize-autoloader`
- Configure `.env` file to have correct database credentials
- Install Kimai database: `/opt/plesk/php/7.3/bin/php bin/console kimai:install -n`
- Change ownership of `kimai2` folder:
    ```
    cd ..
    chown -R psacln:psaserv kimai2
    chmod -R g+r kimai2
    chmod -R g+rw kimai2/var/
    chmod -R g+rw kimai2/public/avatars/
    ```
- Switch user back to your normal user account (must not be root), e.g. 'user': `su -p user`
- Reload caches:
    ```
    cd kimai2
    bin/console kimai:reload --env=prod
    ```
- Create first user: `bin/console kimai:user:create username admin@example.com ROLE_SUPER_ADMIN`
- Adjust [Apache configuration](https://www.kimai.org/documentation/webserver-configuration.html)
  to point to the "public" subfolder of the Kimai installation, i.e. set the path to
  `/var/www/vhosts/my-domain.com/kimai2/public`. Also ensure that `ServerName`
  and `ServerAlias` are set to `kimai.my-domain.com` and `www.kimai.my-domain.com`.

### Netcup

- Clone Kimai in the root folder as stated above and then `cd kimai2`
- Install composer: `curl -sS https://getcomposer.org/installer | /usr/bin/php`
- Install dependencies: `php composer.phar install --no-dev --optimize-autoloader`
- configure your .env file, eg. `nano .env`
- install kimai: `php bin/console kimai:install -n`
- reload config: `php bin/console kimai:reload`
- Configure Netcup (using the customer controlpanel) to use "/kimai2/public" as root folder for the domain (or subdomain) of your choice and add SSL (Letsencrypt) for this domain

See issue [#1620](https://github.com/kevinpapst/kimai2/issues/1620).

## FTP installation

Installation via FTP is not supported. Kimai cannot be installed with FTP.

You have two choices:
- get a proper webhosting/virtual server with SSH support
- use a [SaaS time-tracking software](https://www.kimai.cloud)

## Ansible

[Webarchitects Co-operative](https://www.webarchitects.coop/) have written a [Kimai Ansible Galaxy role](https://git.coop/webarch/kimai) for automatically installing and upgrading Kimai sites on their shared hosting servers.

## Installation FAQ

### SQLSTATE[HY000] [2006] MySQL server has gone away

That usually means that your `DATABASE_URL` is wrong. You can run a command like `bin/console doctrine:schema:validate` to check,
if the software can connect successfully to your database.

If that gives you the same error, it is configuration issue which you need to solve first, before you are able to install Kimai.

### Malformed parameter "url"

If you see an error message like this, then you have a special character in your `DATABASE_URL`.
```
!!  
!!  In DriverManager.php line 259:
!!                                
!!    Malformed parameter "url".  
!!
```
This can be a character like `@` or `/` or some others, which need to be urlencoded.
This can easily be done with one command, lets assume your password is `mG0/d1@3aT.Z)s` then you get your password like this:

```bash
php -r "echo urlencode('mG0/d1@3aT.Z)s');echo PHP_EOL;"
mG0%2Fd1%403aT.Z%29s
```

Then your `DATABASE_URL` might look like this:
```
DATABASE_URL=mysql://root:mG0%2Fd1%403aT.Z%29s@127.0.0.1:3306/kimai2
```

### Which user to use, www-data, httpd or your own?

The installation instructions are intended primarily for server applications.

If you are installing Kimai on your personal computer - maybe for use in a local network, but where the computer primarily
serves as a single user computer - you will avoid permission errors by substituting `www-data` in the relevant commands with your username.

In particular, `sudo -u www-data` is a command which grants the `www-data` user temporary administrator/super-user privileges).
However, depending on the configuration of your particular computer, you may be able to avoid `sudo` altogether (your user
may already have adequate permissions). Or your webserver user is not called `www-data` but `httpd`.

You can try first leaving `sudo -u www-data` altogether in the relevant commands.
If you have permission errors, you can substitute it for `sudo -u $USER` in the relevant commands, where username is the
username that runs the server - if you don't know, it is likely your own username that you login with.

#### chown & chmod commands

Further, `chown` and `chmod` commands should be for the username that runs the server instead of `www-data` (again, if you
don't know, it is likely your own username).

Also note that, depending on where you are installing Kimai and how your computer is configured, you may also receive
"operation not permitted" errors when setting file permissions (`chown` and `chmod` commands).
In that case, prefix them with `sudo`.

### Troubleshoot

#### Internal Server Error 500

This error can have several causes. Here is a small summary what to check for if
this error occurs when trying to access the Kimai frontend:

- There could be something wrong with your file permissions. Please check the
  log `var/log/prod.log` in your installation directory.
- Make sure not to reload Kimai as `root` (e.g. via `bin/console kimai:reload
  --env=prod`). The application will create folders and files. If *root* started
  the process you most likely will have permission errors if the web-server is
  not started as `root` as well. [Fix file permissions]({% link _documentation/cache.md %})!

#### Still doesn't work?

These infos were added to give you some possible guidance if you run into troubles. The Linux (and Mac) filesystem
with its permission structure, especially when using server software, can be tricky and challenging.

But this has NOTHING to do with Kimai and we might not be able to help you in such situations ... it is your system and
responsibility, be aware that wrong permissions might break Kimai and can also lead to security problems.
