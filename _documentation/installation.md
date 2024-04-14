---
title: Installation
description: How to install Kimai on your server with git, composer and SSH or FTP
canonical: /documentation/installation.html
related:
  - shared-hosting
  - hosting-1-click
  - fresh-ubuntu-22
  - webserver-configuration
redirect_from: 
  - /documentation/installation/
  - /documentation/ftp.html
  - /v1/installation.html 
---

## Server requirements

<ul class="list-unstyled mb-4 px-4 px-lg-0">
    <li class="d-flex align-items-center pb-1 mb-2">
        <i class="bx bxl-php fs-xl text-primary me-3"></i>
        {{ "PHP 8.1+ with the extensions: `mbstring`, `gd`, `intl`, `json`, `pdo`, `tokenizer`, `xml`, `zip`" | markdownify | replace: "<p>", "" | replace: "</p>", "" }}
    </li>
    <li class="d-flex align-items-center pb-1 mb-2">
        <i class="bx bx-data fs-xl text-primary me-3"></i>
        Database: MariaDB or MySQL
    </li>
    <li class="d-flex align-items-center pb-1 mb-2">
        <i class="bx bx-server fs-xl text-primary me-3"></i>
        Webserver (NGINX, or Apache with mod_rewrite)
    </li>
    <li class="d-flex align-items-center pb-1 mb-2">
        <i class="bx bx-window fs-xl text-primary me-3"></i>
        A modern web browser
    </li>
    <li class="d-flex align-items-center pb-1 mb-2">
        <i class="bx bx-cog fs-xl text-primary me-3"></i>
        A free subdomain (use in subdirectory is not supported)
    </li>
    <li class="d-flex align-items-center pb-1 mb-2">
        <i class="bx bx-wrench fs-xl text-primary me-3"></i>
        You need to install Git and <a class="mx-1" href="https://getcomposer.org/doc/00-intro.md" target="_blank">Composer</a> if you haven't already
    </li>
</ul>

## Install Kimai with SSH

To install Kimai in your environment, connect with SSH to your server and change to your webservers (document) root directory.

First clone this repo ({{ site.kimai_v2_version }} is the [latest stable release]({{ site.kimai_v2_repo }}/releases)):

```bash
git clone -b {{ site.kimai_v2_version }} --depth 1 {{ site.kimai_v2_repo }}.git
cd kimai/
```

Now install all dependencies:
```bash
composer install --optimize-autoloader
```

Configure the database connection and server version in the `.env` file:
```
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database?charset=utf8mb4&serverVersion=11.1.2-MariaDB
```
Fetch the exact serverVersion by running `mysql --version` and copy&paste the entire version. 

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
{% include documentation/file-permissions.html %}

### Create your first user

There are several options to create your first user:

- via command: `bin/console kimai:user:create username admin@example.com ROLE_SUPER_ADMIN`
- via login screen: you can register a user, the first one will be promoted to the role `ROLE_SUPER_ADMIN`
- you can configure [LDAP]({% link _documentation/ldap.md %}) or [SAML]({% link _documentation/saml.md %}) for authentication

If you are going to [import data from Kimai v1]({% link _documentation/migration-v1.md %}) choose a username & email that was not used in v1.

### Configure DocumentRoot

Configure your web server (like nginx or Apache) to point its DocumentRoot at the `public/` directory.
For more details, see the [Webserver How-To]({% link _documentation/webserver-configuration.md %}).

Oh ... wait! Before you leave, please read the [initial setup guide]({% link _documentation/initial-setup.md %}).

## Other installation methods

### Docker

There is a dedicated article about running [a Docker image of Kimai]({% link _documentation/docker/docker.md %}), suitable for development and production.

### Kubernetes

The rise of containerization and orchestration is not stopping, please read the [Kubernetes and Helm chart]({% link _documentation/docker/kubernetes.md %}) chapter to find out more.

### Shared hosting

Kimai is known to be compatible and can be installed on a wide range of [shared hosting environments]({% link _documentation/shared-hosting.md %}) like Uberspace, 1&1, ionos, Domainfactiry, All-Inkl, Strato and others.

### 1-click installations

Many platforms adopted Kimai to be compatible with their [1-click installation systems]({% link _documentation/hosting-1-click.md %}), like YunoHost, Softaculous, Cloudron, VestaCP, ISPConfig 3 and Cloudjiffy.

### Plesk

Hosting Kimai on Plesk is described in the [shared hosting article]({% link _documentation/shared-hosting.md %}).

### FTP installation

{% include alert.html type="warning" alert="Installation via FTP is not supported, because most of Kimai's management tasks rely on the console." %}

You have two choices:
- get a proper webhosting/virtual server with SSH support
- use a [SaaS time-tracking software]({{ site.cloud.url }})

{% capture support %}
If you don't have the technical background for managing a server yourself and need to rely on a shared hosting package,
it is better to stop hosting business critical software yourself!
If you thought about switching to a managed server before (they are affordable these days)
you can contact me, [I offer paid setup support]({% link _store/keleo-installation-support.md %}).
{% endcapture %}
{% assign support = support|markdownify %}

{% include alert.html type="info" alert=support %}

### Ansible

[Webarchitects Co-operative](https://www.webarchitects.coop/) have written a [Kimai Ansible Galaxy role](https://git.coop/webarch/kimai) for automatically installing and upgrading Kimai sites on their shared hosting servers.

## Installation FAQ

### Column 'TABLE_NAME' in where clause is ambiguous

An error like this might occur when you have a misconfigured `serverVersion` in your `DATABASE_URL`:

```
[ERROR] Failed to set migration status: An exception occurred while executing a query: SQLSTATE[23000]: Integrity
constraint violation: 1052 Column 'TABLE_NAME' in where clause is ambiguous
```

Run `mysql --version` and extract the [entire version string](https://www.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#automatic-platform-version-detection), for example for this version string: 
```
mysql from 11.1.2-MariaDB, client 15.2 for osx10.19 (arm64) using  EditLine wrapper
```

the `serverVersion` part in your `DATABASE_URL` should include the part `11.1.2-MariaDB` like this:
```
DATABASE_URL=mysql://kimai:kimai@sqldb/kimai?charset=utf8mb4&serverVersion=11.1.2-MariaDB
```

### MySQL server has gone away

The message `SQLSTATE[HY000] [2006] MySQL server has gone away` usually means that your `DATABASE_URL` is wrong. You can run a command like `bin/console doctrine:schema:validate` to check,
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
DATABASE_URL=mysql://root:mG0%2Fd1%403aT.Z%29s@127.0.0.1:3306/kimai2?charset=utf8mb4&serverVersion=8.3.0
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

### Memory limit 

Composer crashes with something like

```bash
!!    Error: Allowed memory size of 134217728 bytes exhausted (tried to allocate 20480 bytes)
```

Then please read [this chapter](https://getcomposer.org/doc/articles/troubleshooting.md#memory-limit-errors) in the official docs.
In short, try to run: 
```bash
COMPOSER_MEMORY_LIMIT=-1 php -d memory_limit=-1 /usr/bin/composer install --optimize-autoloader
```

### Internal Server Error 500

This error can have several causes. Here is a small summary what to check for if
this error occurs when trying to access the Kimai frontend:

- There could be something wrong with your file permissions. Please check the
  log `var/log/prod.log` in your installation directory.
- Make sure not to reload Kimai as `root` (e.g. via `bin/console kimai:reload
  --env=prod`). The application will create folders and files. If *root* started
  the process you most likely will have permission errors if the web-server is
  not started as `root` as well. [Fix file permissions]({% link _documentation/cache.md %})!

### Still doesn't work?

These infos were added to give you some possible guidance if you run into troubles. The Linux (and Mac) filesystem
with its permission structure, especially when using server software, can be tricky and challenging.

But this has NOTHING to do with Kimai and we might not be able to help you in such situations ... it is your system and
responsibility, be aware that wrong permissions might break Kimai and can also lead to security problems.
