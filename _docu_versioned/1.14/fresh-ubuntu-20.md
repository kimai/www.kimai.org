---
title: "Install Kimai on a fresh Ubuntu 20.04 LTS"
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

Lets start with all required software:
```bash
apt-get update
apt-get upgrade
apt-get install git unzip curl vim
apt-get install php-fpm php-cli php-common php-json php-opcache php-readline php-xml php-zip php-intl php-gd php-mbstring php-mysql php-curl
apt-get install mariadb-server mariadb-client
apt-get install nginx
```

## Install composer

Grab the latest `hash` from the [composer download page](https://getcomposer.org/download/) and then execute:
```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
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

> Please compare with the latest version infos at: <https://www.kimai.org/documentation/installation.html>

```bash
cd /var/www/
git clone -b {{ site.kimai_v2_version }} --depth 1 https://github.com/kevinpapst/kimai2.git
cd kimai2/
composer install --no-dev --optimize-autoloader -n
vim .env
```

Configure the above created database credentials:
```
DATABASE_URL=mysql://kimai2:my-super-secret-password@127.0.0.1:3306/kimai2
```

And execute the Kimai installation:
```bash
bin/console kimai:install -n
bin/console kimai:create-user admin admin@example.com ROLE_SUPER_ADMIN
```

{% include file-permissions.html %} 
Use `sudo` to run the commands to change file permissions.

## Configure webserver

Good, now that we have done all these steps we only need the webserver and VirtualHost configuration: 

> Check your PHP-FPM config for the fastcgi_pass (eg. version and socket)

This can be done with:
```
vim /etc/php/7.4/fpm/pool.d/www.conf
listen = /run/php/php7.4-fpm.sock
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
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
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
