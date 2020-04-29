---
title: Installation
description: How to install Kimai 2 on your server with git, composer and SSH or FTP
toc: true
---

The recommended way to install Kimai v2 is via SSH, you need GIT and [Composer](https://getcomposer.org/doc/00-intro.md). 

## Recommended setup 

To install Kimai 2 in your production environment, connect with SSH to your server and change to your webservers (document) root directory.
You need to install Git and [Composer](https://getcomposer.org/doc/00-intro.md) if you haven't already. 

First clone this repo ({{ site.kimai_v2_version }} is the [latest stable release]({{ site.kimai_v2_repo }}/releases)):

```bash
git clone -b {{ site.kimai_v2_version }} --depth 1 https://github.com/kevinpapst/kimai2.git
cd kimai2/
```

Now install all dependencies:
```bash
composer install --no-dev --optimize-autoloader
```

Configure the database connection in the `.env` file:
```
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database
```

And run the Kimai installer:
```bash
bin/console kimai:install -n
```

### File permissions

The webserver needs write permissions for several directories, so make sure the 
[file permissions are correct](https://symfony.com/doc/current/setup/file_permissions.html).
{% include file-permissions.html %} 

### Create your first user

There are several options to create your first user:

- via command: `bin/console kimai:create-user username admin@example.com ROLE_SUPER_ADMIN`
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

The following platforms adopted Kimai 2 to be compatible with their one-click installation systems.

### YunoHost

[![Install kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=kimai2)

Kimai 2 [package](https://github.com/YunoHost-Apps/kimai2_ynh) for [YunoHost](https://yunohost.org).

### Cloudron

[Cloudron](https://cloudron.io) provides a secure and ready to use Kimai package, which will be kept up-to-date automatically.

[![Install Kimai with Cloudron](https://cloudron.io/img/button32.png)](https://cloudron.io/button.html?app=org.kimai.cloudronapp)
 
### Vesta Control Panel

Be aware that VestaCP uses the `admin` user instead of `www-data`. Replace the names in the permission commands above.
Read [this issue]({{ site.kimai_v2_repo }}/issues/743) if you have further questions. 

## Shared hosting

How to install Kimai at shared hosting companies. Please share our insights if you have managed to get it up and running with another company!

If you can't find the correct version, ask your hoster! Or [let us help you]({% link _store/keleo-installation-support.md %}).

### Ionos / 1&1

- GIT is normally pre-installed and can be used via SSH
- composer has to be installed manually
- The default PHP version is often too low (PHP 5.x) - you can check that with `php -v`
  - If it is lower than 7.2, you have to prefix all commands with the proper version, eg. `/usr/bin/php7.3-cli` (even composer)
  - Example composer: `/usr/bin/php7.3-cli composer.phar install --no-dev --optimize-autoloader`
  - Example installation: `/usr/bin/php7.3-cli bin/console kimai:install -n`

### Domainfactory

- GIT is pre-installed and can be used via SSH
- composer has to be installed manually: `curl -sS https://getcomposer.org/installer | php7.3.5-cli`
- The default PHP version is often too low (PHP 5.x or even PHP 4.x) - you can check that with `php -v`
  - If it is lower than 7.2, you have to prefix all commands with the proper version, eg. `php7.3.5-cli` (even composer)
  - Example composer: `php7.3.5-cli composer.phar install --no-dev --optimize-autoloader`
  - Example installation: `php7.3.5-cli bin/console kimai:install -n`

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

This is NOT recommended, but still widely used ... 

Please, do yourself a favour and get a hoster that includes SSH access, it is not 2002 anymore! 
Nowadays even cheap contracts should support SSH.

Now read on: [Kimai FTP installation + tips and tricks]({% link _documentation/ftp.md %}). 

## Ansible

[Webarchitects Co-operative](https://www.webarchitects.coop/) have written a [Kimai 2 Ansible Galaxy role](https://git.coop/webarch/kimai) for automatically installing and upgrading Kimai sites on their shared hosting servers.

## Installation FAQ

### SQLite not supported for production usage

SQLite is a great database engine for testing, but when it comes to production usage it is not recommended for Kimai:

- It does not support ALTER TABLE commands and makes update procedures clunky and problematic (I try to support updates, but they are heavy on large databases)
- It does [not support FOREIGN KEY](https://www.sqlite.org/quirks.html#foreign_key_enforcement_is_off_by_default) constraints [out of the box](https://www.sqlite.org/foreignkeys.html#fk_enable), which can lead to critical bugs when deleting users/activities/projects/customers

Kimai tries to work around the Foreign Keys issue by using a 
[Doctrine PostConnect EventSubscriber]({{ site.kimai_v2_file }}/src/Doctrine/SqliteSessionInitSubscriber.php), 
but this does not work in all environments, it is not intended to be used in large production setups and it can't be guaranteed that SQLite handles everything as expected!

If you insist on using SQLite: make a copy of the database file BEFORE each update, to prevent possible data loss ... **and don't file any bug report - you have been warned!**

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
php -r "echo urlencode('mG0/d1@3aT.Z)s');"
mG0%2Fd1%403aT.Z%29s
```

Then your `DATABASE_URL` might look like this:
```
DATABASE_URL=mysql://root:mG0%2Fd1%403aT.Z%29s@127.0.0.1:3306/kimai2
```

### Which user to use, www-data, httpd or your own?

The installation instructions are intended primarily for server applications. 

If you are installing Kimai 2 on your personal computer - maybe for use in a local network, but where the computer primarily 
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

Also note that, depending on where you are installing Kimai 2 and how your computer is configured, you may also receive 
"operation not permitted" errors when setting file permissions (`chown` and `chmod` commands). 
In that case, prefix them with `sudo`.

#### Still doesn't work?

These infos were added to give you some possible guidance if you run into troubles. The Linux (and Mac) filesystem 
with its permission structure, especially when using server software, can be tricky and challenging.

But this has NOTHING to do with Kimai and we might not be able to help you in such situations ... it is your system and 
responsibility, be aware that wrong permissions might break Kimai and can also lead to security problems.
