---
title: Installation
description: How to install Kimai 2 on your server with git, composer and SSH or FTP
toc: true
---

The recommended way to install Kimai v2 is via SSH, you need GIT and [Composer](https://getcomposer.org/doc/00-intro.md). 

## Recommended setup 

To install Kimai 2 in your production environment, connect with SSH to your server and change to your webservers (document) root directory.
You need to install Git and [Composer](https://getcomposer.org/doc/00-intro.md) if you haven't already. 

First clone this repo ({{ site.kimai_v2_version }} is the [latest available release]({{ site.kimai_v2_repo }}/releases)):

```bash
git clone -b {{ site.kimai_v2_version }} --depth 1 https://github.com/kevinpapst/kimai2.git
cd kimai2/
```

Make sure the [file permissions are correct](https://symfony.com/doc/current/setup/file_permissions.html) and create your `.env` file:
```bash
chown -R :www-data .
chmod -R g+r .
chmod -R g+rw var/
cp .env.dist .env
```

Configure the database connection string in your the `.env` file (Kimai v2 supports MySQL/MariaDB and SQLite):
```
# adjust all settings in .env to your needs
APP_ENV=prod
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database
```
SQLite is not recommended for production usage, check FAQ below. 

Now install all dependencies for Kimai 2:
```bash
sudo -u www-data composer install --no-dev --optimize-autoloader
```
If you see a `Malformed patameter "url"` error, see below in the FAQ.

Optionally create the database:
```bash
bin/console doctrine:database:create
```

Create all schema tables:
```bash
bin/console doctrine:schema:create
```
You can safely ignore the message: *This operation should not be executed in a production environment*!

Make sure that upcoming updates can be correctly applied by setting the initial database version:
```bash
bin/console doctrine:migrations:version --add --all
```

Warm up the cache (as webserver user):
```bash
sudo -u www-data bin/console cache:warmup --env=prod
```

Create your first user with the following command. You will be asked to enter a password afterwards:
```bash
bin/console kimai:create-user username admin@example.com ROLE_SUPER_ADMIN
```
_Tip: You can skip the "create user" step, if you are going to [import data from Kimai v1]({% link _documentation/migration-v1.md %})._

For available roles, please refer to the [user documentation]({% link _documentation/users.md %}).

> If you want to use a fully-featured web server (like Nginx or Apache) to run Kimai, configure it to point its DocumentRoot at the `public/` directory.
> For more details, see [https://symfony.com/doc/current/setup/web_server_configuration.html](https://symfony.com/doc/current/setup/web_server_configuration.html)

Installation complete: enjoy time-tracking :-)

## Docker

There is a dedicated article about [Docker setups]({% link _documentation/docker.md %}) for Kimai, suitable for development and production. 

## Hosting and 1-click installations

These platforms adopted Kimai 2 to be compatible with their one-click installation systems:

### YunoHost

[![Install kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=kimai2)

Kimai 2 [package](https://github.com/YunoHost-Apps/kimai2_ynh) for [YunoHost](https://yunohost.org).
 
## FTP installation

If you have no SSH access to your server (e.g. when you use a shared hosting package) then you need to install Kimai locally and upload it afterwards.

Before I start to explain how to apply this workaround let me briefly explain the problem:
Kimai has no [web-based installer]({{ site.kimai_v2_repo }}/issues/209) for now and you have to create the database tables with a console command.
It also does not come as pre-built ZIP file, so you have to install the dependencies manually.

These are the steps you have to perform:

```
git clone https://github.com/kevinpapst/kimai2.git
cd kimai2/
```

Create the `.env` file (as copy from `.env.dist`), using the `prod` environment and adjust the database connection if needed:
```
# you need all settings from .env.dist, but these two need to be adjusted!
APP_ENV=prod
DATABASE_URL=sqlite:///%kernel.project_dir%/var/data/kimai.sqlite
```
The file `var/data/kimai.sqlite` will hold all your data, so make sure to **include it in your backups**!

Prepare the environment by installing all dependencies:

```bash
composer install --no-dev
```

Create the database schemas:
```bash
bin/console doctrine:schema:create
bin/console doctrine:migrations:version --add --all
```

Optionally, you may create your first user with the following command (you will be prompted for a password).

```bash
bin/console kimai:create-user username admin@example.com ROLE_SUPER_ADMIN
```
But you could also use the *register user* function in the login screen later, as the first user will get `SUPER_ADMIN` permissions.

Finally delete the cache files, as they are OS dependent:
```bash
rm -rf var/cache/*
```

Now you can upload the `kimai2/` directory to your hosting environment and point your domain (document root) to `kimai2/public/`.

### Use MySQL database 

You might be able to use the MySQL instance in your shared hosting, if you can reconfigure the database user to allow access from your own computer.
If that is allowed with your hoster, you can change your `.env` and point the `DATABASE_URL` to your MySQL before creating the database schema.
It is worth a try, as using SQLite, especially without SSH access might be problematic during updates.

## Development installation

Clone the repository and install all dependencies:

```bash
git clone https://github.com/kevinpapst/kimai2.git
cd kimai2/
composer install
```

The default installation uses a SQLite database, so there is no need to create a database for your first tests.
Our default settings will work out-of-the-box, but you might want to adjust the `.env` values to your needs.
You configure the database connection and environment in your `.env` file, e.g.:
```
DATABASE_URL=sqlite:///%kernel.project_dir%/var/data/kimai.sqlite
APP_ENV=dev
```

The next commands will create the database and the schema:
```bash
bin/console doctrine:database:create
bin/console doctrine:schema:create
```

Lets bootstrap your environment by executing this command (which is only available in dev environment):
```bash
bin/console kimai:reset-dev
```

You just imported demo data, to test the application in its full beauty and with several different user accounts and permission sets.

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
The `kimai:reset-dev` command can always be executed later on to reset your dev database and cache.

ATTENTION - if you don't want the test data, then erase it and create a empty schema:

```bash
bin/console doctrine:schema:drop --force
bin/console doctrine:schema:create
```

There is no need to configure a virtual host in your web server to access the application for testing.
Just use the built-in web server for your first tests:

```bash
bin/console server:run
```

This command will start a web server for Kimai. Now you can access the application in your browser at <http://127.0.0.1:8000/>.
You can stop the built-in web server by pressing `Ctrl + C` while you're in the terminal.

### Frontend assets 
 
To re-generate the frontend assets ([more information here]({% link _documentation/developers.md %})), execute:
```bash
yarn install
npm run prod
```

### Installation on MacOS

cd ~/Sites
wget XXXXXXXX/kimai-release-{{ site.kimai_v2_version }}.zip
unzip kimai-release-{{ site.kimai_v2_version }}.zip
cd kimai-release-{{ site.kimai_v2_version }}
chown -R :_www .
chmod g+x .
chmod -R g+r .
chmod -R g+rw var/

## Installation FAQ

### SQLite not recommended for production usage

SQLite is a great database engine for testing, but when it comes to production usage it is imperfect due to several reasons:

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
