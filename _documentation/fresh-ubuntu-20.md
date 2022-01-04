---
title: "Install Kimai on Ubuntu 20.04"
description: "How to install Kimai on a brand new Ubuntu 20.04 with database, webserver and SSL certificate"
toc: true
canonical: /documentation/fresh-ubuntu-20.html
---

This is a collection of snippets to help you with setting up a fresh Ubuntu 18.04 server for using with Kimai.
It is neither a full fledged documentation, explaining each step, nor is it a bash tutorial.

Please see it as a personal snippet collection... in which I assume:
- that you are familiar with the Linux bash and have at least basic knowledge of vim
- that you use a single domain on this server, change the nginx configuration accordingly if you have multiple VirtualHosts
- that you know how to protect your server (UFW, Fail2Ban ...) and can securely run it in the "wild"

You must additionally:
- replace `IP-of-myserver` with the server IP
- replace the username `kevin` with your own
- replace the domain `www.kimai.local` with your own

## Accounts and SSH connection

We start on our local machine, connect to the server and create our real user account:
```bash
ssh root@IP-of-myserver

useradd -m -s /bin/bash kevin
passwd kevin
```

Enable sudo access for this new user:
```bash
visudo /etc/sudoers.d/kevin
```

And paste this one line:
```
kevin   ALL=(ALL:ALL) ALL
```

Back to our local machine:
```bash
exit
```

Generate your SSH key and sent it to your server:
```bash
ssh-keygen -f ~/.ssh/kevin_myserver_rsa
ssh-copy-id -i /Users/kevin/.ssh/kevin_myserver_rsa.pub kevin@IP-of-myserver
```

Then edit your local SSH config:
```bash
vim ~/.ssh/config
```

And paste this:
```
Host myserver
    HostName IP-of-myserver
    IdentityFile ~/.ssh/kevin_myserver_rsa
    User kevin
```

And finally on to the server to start the software installation:

```bash
ssh myserver
```

### Secure your SSHD configuration

Make sure your SSH server has at least some basic security settings in place:
```bash
sudo su
vim /etc/ssh/sshd_config
```

Change those:
```
PermitRootLogin no
PasswordAuthentication no
```

And restart the SSH Daemon:
```bash
/etc/init.d/ssh restart
```

## Install PHP, webserver and database

Let's start with all required software:
```bash
apt update
apt upgrade
apt install git unzip curl vim
apt install mariadb-server mariadb-client
apt install nginx
```

Now before we continue, we enable the well-known and respected Ondřej PPA by @oerdnj to use PHP 8:
```bash
apt install software-properties-common
add-apt-repository ppa:ondrej/php
```

Now install PHP 8:
```bash
apt install php8.0-fpm php8.0-cli php8.0-common php8.0-opcache php8.0-readline php8.0-xml php8.0-zip php8.0-intl php8.0-gd php8.0-mbstring php8.0-mysql php8.0-curl
```

## Install composer

Grab the latest `hash` from the [composer download page](https://getcomposer.org/download/) and then execute:
```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
```

Only proceed if you see: **Installer verified**!

```bash
php composer-setup.php
php -r "unlink('composer-setup.php');"
chmod +x composer.phar
mv composer.phar /usr/bin/composer
```

## Create database

Connect to your database as root user:

```bash
sudo su
mysql -u root
```

And execute the following statements:
```mysql
CREATE DATABASE IF NOT EXISTS `kimai2`;
CREATE USER IF NOT EXISTS `kimai2`@127.0.0.1 IDENTIFIED BY "my-super-secret-password";
GRANT select,insert,update,delete,create,alter,drop,index,references ON `kimai2`.* TO kimai2@127.0.0.1;
exit;
```
> Replace "my-super-secret-password" with a strong password and probably change the username as well.

## Install Kimai

Clone Kimai and set proper file permissions:

> Please check the lastest installation docs to check if something changed since writing these docs: <https://www.kimai.org/documentation/installation.html>

```bash
cd /var/www/
git clone -b {{ site.kimai_v2_version }} --depth 1 https://github.com/kevinpapst/kimai2.git
cd kimai2/
composer install --no-dev --optimize-autoloader -n
vim .env
```

Configure the database connection and adjust the settings to your needs (compare with the [original .env file](https://github.com/kevinpapst/kimai2/blob/1.16.8/.env.dist)):
```
DATABASE_URL=mysql://kimai2:my-super-secret-password@127.0.0.1:3306/kimai2?charset=utf8&serverVersion=5.7
```
 

Then execute the Kimai installation:
```bash
bin/console kimai:install -n
bin/console kimai:user:create admin admin@example.com ROLE_SUPER_ADMIN
```

{% include file-permissions.html %}
Use `sudo` to run the commands to change file permissions.

## Configure webserver

Good, now that we have done all these steps we only need the webserver and VirtualHost configuration:

> Check your PHP-FPM config for the fastcgi_pass (eg. version and socket)

This can be done with:
```
vim /etc/php/8.0/fpm/pool.d/www.conf
listen = /run/php/php8.0-fpm.sock
```

Edit/create the virtual host file:
```bash
vim /etc/nginx/sites-available/kimai2
```

And paste the following configuration:
```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name www.kimai.local;
    root /var/www/kimai2/public;
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
        fastcgi_pass unix:/run/php/php8.0-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi.conf;
        fastcgi_param PHP_ADMIN_VALUE "open_basedir=$document_root/..:/tmp/";
        internal;
    }

    location ~ \.php$ {
        return 404;
    }
}
```

Remove the Ubuntu default host and activate the site:
```bash
unlink /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/kimai2 /etc/nginx/sites-enabled/kimai2
nginx -t && service nginx reload
```

### Install Certbot for SSL

Almost there, only the free Lets Encrypt SSL certificate is missing:

```bash
apt-get install certbot python3-certbot-nginx
certbot --nginx
```

Follow the interactive dialogs and choose "2: Redirect - Make all requests redirect to secure HTTPS access.".
This will rewrite your nginx site configuration and should work out-of-the-box.

Kimai is now up and running at www.kimai.local - enjoy!
