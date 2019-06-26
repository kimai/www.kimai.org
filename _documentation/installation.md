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

Make sure the [file permissions are correct](https://symfony.com/doc/current/setup/file_permissions.html) (`www-data` is an example, which works for Debian based distributions):
```bash
chown -R :www-data .
chmod -R g+r .
chmod -R g+rw var/
```

Configure the database connection in the `.env` file (defaults to SQLite, but MySQL/MariaDB is recommended):
```
APP_ENV=prod
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database
```

Now install all dependencies, you might have to do this as webserver user (prefix with `sudo -u www-data`):
```bash
composer install --no-dev --optimize-autoloader
```

### Database

Create the database if you haven't done it before with a DB administration tool (like PHPMyAdmin):
```bash
bin/console doctrine:database:create
```

Create the required tables:
```bash
bin/console doctrine:schema:create
```

Set the initial database version, you will run into troubles during updates without that:
```bash
bin/console doctrine:migrations:version --add --all -n
```

Warm up the cache, you might have to do this as webserver user (prefix with `sudo -u www-data`):
```bash
bin/console cache:warmup --env=prod
```

### Create your first user

There are several options to create your first user:

- via command: `bin/console kimai:create-user username admin@example.com ROLE_SUPER_ADMIN`
- via login screen: you can register a user, the first one will be promoted to the role `ROLE_SUPER_ADMIN`
- you can [configure LDAP]({% link _documentation/ldap.md %}) for authentication 

If you are going to [import data from Kimai v1]({% link _documentation/migration-v1.md %}) use a different username & email

### Webserver

Configure your web server (like Nginx or Apache) to point its DocumentRoot at the `public/` directory.
For more details, see the [Webserver How-To]({% link _documentation/webserver-configuration.md %}) 
and [this article](https://symfony.com/doc/current/setup/web_server_configuration.html).

{% include alert.html icon="far fa-smile-beam" type="success" alert="Installation complete: enjoy time-tracking!" %}

## Docker

There is a dedicated article about [Docker setups]({% link _documentation/docker.md %}) for Kimai, suitable for development and production. 

## Hosting and 1-click installations

The following platforms adopted Kimai 2 to be compatible with their one-click installation systems.

### YunoHost

[![Install kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=kimai2)

Kimai 2 [package](https://github.com/YunoHost-Apps/kimai2_ynh) for [YunoHost](https://yunohost.org).
 
### Vesta Control Panel

Be aware that VestaCP uses the `admin` user instead of `www-data`. Replace the names in the permission commands above.
Read [this issue](https://github.com/kevinpapst/kimai2/issues/743) if you have further questions. 

## FTP installation

{% include alert.html type="warning" alert="FTP installation is only possible, if your hosting includes SQLite support!" %}
 
If you have no SSH access to your server (e.g. when you use a shared hosting package) then you can [download a package]({% link _pages/download.md %}), 
which includes a pre-installed Kimai version.

You install it via FTP like this:
- [download]({% link _pages/download.md %}) the latest release package for FTP 
- extract it locally and upload all files
- point your domain (document root) to the `public/` directory   
- register your first user in the login screen, you will automatically become `SUPER_ADMIN`
  
The file `var/data/kimai.sqlite` will hold all your data, please include it in your backups.

**Unfortunately there is no support for updates yet. This feature will be included in the future.**

{% capture support %}
I know that you probably don't have the technical background for managing a server yourself and need to rely 
on a shared hosting package. If you thought about switching to a managed server before (they are affordable these days) 
you can contact me, [I offer paid setup support]({% link _store/keleo-installation-support.md %}).
{% endcapture %}
{% assign support = support|markdownify %}

{% include alert.html type="info" alert=support %}

## Development installation

Clone the repository and install all dependencies:

```bash
git clone https://github.com/kevinpapst/kimai2.git
cd kimai2/
composer install
```

Kimai uses a SQLite database by default, which will work out-of-the-box. But you have to change your 
environment to `dev` in your `.env` file. You can also configure a MySQL database if you prefer that:
```
APP_ENV=dev
DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name
```

The next command will import demo data, to test the application in its full beauty - with different user accounts, 
customers, projects, activities and several thousand timesheet records. Lets bootstrap your database 
(command only available in `dev` environment): 
```bash
bin/console kimai:reset-dev
```

Finally you start a web server, you can access Kimai in your browser at <http://127.0.0.1:8000/>.
Stop the built-in web server by pressing `Ctrl + C` while you're in the terminal.
```bash
bin/console server:run
```

You can now login with these accounts:

| Username | Password | API Key | Role |
|---|:---:|:---:|---|
| clara_customer| kitten | api_kitten |Customer |
| john_user| kitten | api_kitten |User |
| chris_user| kitten | api_kitten |User (deactivated) |
| tony_teamlead| kitten | api_kitten |Teamlead |
| anna_admin| kitten | api_kitten |Administrator |
| susan_super| kitten | api_kitten |Super-Administrator |

Demo data can always be deleted by dropping the schema and re-creating it.
The `kimai:reset-dev` command will do that automatically and can always be executed later on to reset your dev database and cache.

If you want to test with an empty installation, erase the database and re-create an empty schema:

```bash
bin/console doctrine:schema:drop --force
bin/console doctrine:schema:create
```

### Frontend assets 
 
To re-generate the frontend assets ([more information here]({% link _documentation/developers.md %})), execute:
```bash
yarn install
npm run prod
```

## Installation FAQ

### SQLite not recommended for production usage

SQLite is a great database engine for testing, but when it comes to production usage it is not recommended:

- It does not support ALTER TABLE commands and makes update procedures very clunky and problematic (we still try to support updates, but they are heavy on large databases)
- It does [not support FOREIGN KEY](https://www.sqlite.org/quirks.html#foreign_key_enforcement_is_off_by_default) constraints [out of the box](https://www.sqlite.org/foreignkeys.html#fk_enable), which can lead to critical bugs when deleting users/activities/projects/customers

Kimai works around the Foreign Keys issue by using a 
[Doctrine PostConnect EventSubscriber]({{ site.kimai_v2_file }}/src/Doctrine/SqliteSessionInitSubscriber.php) since v0.8.1, 
but it is not guaranteed that SQLite handles everything as expected.

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

### chown & chmod commands

Further, `chown` and `chmod` commands should be for the username that runs the server instead of `www-data` (again, if you 
don't know, it is likely your own username).

Also note that, depending on where you are installing Kimai 2 and how your computer is configured, you may also receive 
"operation not permitted" errors when setting file permissions (`chown` and `chmod` commands). 
In that case, prefix them with `sudo`.

### Still doesn't work?

These infos were added to give you some possible guidance if you run into troubles. The Linux (and Mac) filesystem 
with its permission structure, especially when using server software, can be tricky and challenging.

But this has NOTHING to do with Kimai and we might not be able to help you in such situations ... it is your system and 
responsibility, be aware that wrong permissions might break Kimai and can also lead to security problems.
