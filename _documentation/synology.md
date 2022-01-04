---
title: "Install Kimai on a Synology NAS"
description: "How to install Kimai on a Synology NAS"
toc: true
---

This HowTo does not explain every step for the installation of Kimai on a Synology NAS, 
but rather concentrates on the differences from the [default installation]({% link _documentation/installation.md %}).

## Important to know

You need to prefix all PHP related commands with `php73`, for example:
```bash
php73 composer.phar install --no-dev --optimize-autoloader
```

Or run a console command:
```bash
php73 bin/console kimai:version
```

The webserver user is called `http` and not `www-data`.

The database connection uses a socket instead of a port.

After creating the VirtualHost the DSM changes file ownership, so you might be forced to use `sudo` or switch to the root account for multiple commands.  

## Installation process

Clone Kimai as described in the main [installation]({% link _documentation/installation.md %}) docs. 
If no git is installed, you can use the method described under the "updates" section. 

This example uses the path `/volume1/web/kimai2`

Then [download and install composer](https://getcomposer.org/download/). Now install all dependencies:
```bash
php73 composer.phar install --no-dev --optimize-autoloader
```

### Create a database

Use phpMyAdmin or the console (if you are familiar with it)  to create a new database and database user.

Do not add special characters to the password that needs to be url encoded, rather use a longer password.
Synology seems to have strict password rules, use the minus `-` if you are forced to use a special character, 
otherwise stick with lower and uppercase character and numbers.

### .env file and database connection

Synology ships a MariaDB which is configured to use a socket connection and runs on a different port, 
therefore the connection string in your `.env` file could look different from the one used in the 
default [installation]({% link _documentation/installation.md %}) docs:

```
DATABASE_URL="mysql://kimai2:password@localhost:3307/kimai2?unix_socket=/run/mysqld/mysqld10.sock"
```

BTW: You find the MariaDB executable at `/volume1/@appstore/MariaDB10/usr/local/mariadb10/bin`.

After editing the `.env` file, install Kimai:

```bash
php73 bin/console kimai:install -n
```

### Webserver (nginx) configuration

Start by opening the `Web Station`:

![main menu](/images/documentation/synology-1.png "Main Menu > Web Station")

Check that you have a PHP 7.3 profile:

![php settings](/images/documentation/synology-2.png "Main Menu > Web Station > PHP Settings")

And then creating a VirtualHost (we use a port based in this example): 

![php settings](/images/documentation/synology-3.png "Main Menu > Web Station > PHP Settings")

Settings choosen in the example:

- Port: `7777` with `HTTPS`
- Document root: `/volume1/web/kimai2/public`
- HTTP backend server: `nginx`
- PHP backend: `PHP 7.3`

Now switch to the console and find the directory where the config needs to be stored.

Either use `ls -la /etc/nginx/conf.d/` and check which subdirectories exist or better:
have a look at the file `/etc/nginx/app.d/server.webstation-vhost.conf` where all virtual hosts are listed.

Watch out for the line that starts with `include`:

```
server {

    listen      7777 ssl default_server;
    listen      [::]:7777 ssl default_server;

    server_name _;

    ...

    root    "/volume1/web/kimai2/public";

    ...

    include /usr/local/etc/nginx/conf.d/1d16b269-904e-41c9-bd23-cbdf761e305e/user.conf*;

}
```

Ok, we found the directory `/usr/local/etc/nginx/conf.d/1d16b269-904e-41c9-bd23-cbdf761e305e/`, go ahead and edit a 
new config file to store the webserver configuration for Kimai: 
```
vim /usr/local/etc/nginx/conf.d/1d16b269-904e-41c9-bd23-cbdf761e305e/user.conf-kimai2
```

Add the following lines to it:
```
    index index.php;

    access_log off;
    log_not_found off;

    location ~ /\.ht {
        deny all;
    }

    location / {
        try_files $uri /index.php$is_args$args;
    }

    location ~ ^/index\.php(/|$) {
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi.conf;
        fastcgi_param PHP_ADMIN_VALUE "open_basedir=$document_root/..:/tmp/";
        internal;
    }

    location ~ \.php$ {
        return 404;
    }
```

Check the nginx config with:
```bash
sudo nginx -t
```

If you see the following lines:
```bash
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```
you can tell nginx to reload the configuration with:
```bash
sudo nginx -s reload
```

That's it, Kimai should now run.

## Fixing file permissions

The following commands must be run in the Kimai directory, here in `/volume1/web/kimai2/`.

They must be run as `root` user (e.g. by prefixing each line with `sudo`). 
Be extremely careful, a wrong command can destroy your Synology ... you know: with great power comes great responsibility!

```bash
cd /volume1/web/kimai2/

sudo chown -R :http .
sudo chmod -R g+r .
sudo chmod -R g+rw var/
sudo chmod -R g+rw public/avatars/
```

## Updating Kimai

Please cross-check the normal [upgrade guide]({% link _documentation/updates.md %}) for more steps:

```bash
cd /volume1/web/kimai2/
git fetch --tags
git checkout {{ site.kimai_v2_version }}
php73 composer install --no-dev --optimize-autoloader -n
php73 bin/console kimai:update
chown -R :http .
```

{% include upgrading-note.html %} 

### Update without git

```bash
cd /volume1/web/
wget https://github.com/kevinpapst/kimai2/archive/refs/tags/{{ site.kimai_v2_version }}.zip
7z x 
cp kimai2/.env kimai2-{{ site.kimai_v2_version }}/
cp -R kimai2/var/invoices kimai2-{{ site.kimai_v2_version }}/var/
cd kimai2-{{ site.kimai_v2_version }}/
```

Then [download and install composer](https://getcomposer.org/download/), followed by the installation:

```bash
php74 composer.phar install --no-dev --optimize-autoloader
php74 bin/console kimai:update
```

Now a) switch your virtual host to the new directory or b) change the directory names:

```bash
cd /volume1/web/
mv kimai2 kimai2-backup
mv kimai2-{{ site.kimai_v2_version }} kimai2
```
{% include upgrading-note.html %}

## Troubleshooting

### White page after changes to .env

If you are using a network share (or any Synology app) for downloading/editing/uploading the `.env` file, 
make sure that `group` permissions for the `http` group are preserved.

![file permissions](/images/documentation/synology-4.png "File station > Select file > Right clink > Properties")

You can change them using:

`File station > change to kimai2 directory > Right click on .env > Properties`.
