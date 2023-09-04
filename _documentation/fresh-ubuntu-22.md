---
title: "Install Kimai on Ubuntu 22.04"
navigation: Ubuntu 22.04
description: "How to install Kimai on a brand new Ubuntu 22.04 with database, webserver and SSL certificate"
toc: true
canonical: /documentation/fresh-ubuntu-22.html
---

{% include alert.html type="success" alert="This documentation was tested with Kimai 2.0." %}

This is a collection of snippets to help you with setting up a fresh Ubuntu 22.04 server for using with Kimai.
It is neither a fully fledged documentation, explaining each step, nor is it a bash tutorial.

Please see it as a personal snippet collection... in which I assume:
- that you are familiar with the Linux bash and have at least basic knowledge of vim
- that you use a single domain on this server, change the nginx configuration accordingly if you have multiple VirtualHosts
- that you know how to protect your server (UFW, Fail2Ban ...) and can securely run it in the public internet

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
ssh-keygen -f ~/.ssh/myserver_rsa
ssh-copy-id -i ~/.ssh/myserver_rsa.pub kevin@IP-of-myserver
```

Then edit your local SSH config:
```bash
vim ~/.ssh/config
```

And paste this:
```
Host myserver
    HostName IP-of-myserver
    IdentityFile ~/.ssh/myserver_rsa
    User kevin
```

And finally on to the server to start the software installation:

```bash
ssh myserver
```

### Secure your SSH daemon

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
service sshd restart
```

## Install PHP, webserver and database

Let's start with all required software:
```bash
apt-get update
apt-get upgrade
apt-get install git unzip curl vim mariadb-server mariadb-client nginx
```

Now before we continue, we enable the well-known and respected Ondřej PPA by @oerdnj to use PHP 8.1:
```bash
apt-get install software-properties-common
add-apt-repository ppa:ondrej/php
```

Now install PHP 8.1:
```bash
apt-get install php8.1-cli php8.1-common php8.1-curl php8.1-fpm php8.1-gd php8.1-intl php8.1-mbstring php8.1-mysql php8.1-opcache php8.1-readline php8.1-xml php8.1-zip
```

Note: the required packages `php8.1-ctype`, `php8.1-iconv`, `php8.1-json`, `php8.1-pdo` are usually part of other packages like `php8.1-common`, `php8.1-cli` and `php8.1-fpm`

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
```sql
CREATE DATABASE IF NOT EXISTS `kimai`;
CREATE USER IF NOT EXISTS `kimai`@127.0.0.1 IDENTIFIED BY "my-super-secret-password";
GRANT select,insert,update,delete,create,alter,drop,index,references ON `kimai`.* TO kimai@127.0.0.1;
```
> Replace "my-super-secret-password" with a strong password and probably change the username as well.

## Install Kimai

Clone Kimai and set proper file permissions:

> Please check the latest installation docs to check if something changed since writing these docs: <https://www.kimai.org/documentation/installation.html>

```bash
cd /var/www/
git clone -b {{ site.kimai_v2_version }} --depth 1 {{ site.kimai_v2_repo }}.git
cd kimai/
composer install --optimize-autoloader -n
vim .env
```

Configure the database connection and adjust the settings to your needs (compare with the [original .env file]({{ site.kimai_v2_repo }}/blob/main/.env.dist)):
```
DATABASE_URL=mysql://kimai:my-super-secret-password@127.0.0.1:3306/kimai?charset=utf8mb4&serverVersion=5.7
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
vim /etc/php/8.1/fpm/pool.d/www.conf
listen = /run/php/php8.1-fpm.sock
```

Edit/create the virtual host file:
```bash
vim /etc/nginx/sites-available/kimai
```

And paste the following configuration:
```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name www.kimai.local;
    root /var/www/kimai/public;
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
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
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
ln -s /etc/nginx/sites-available/kimai /etc/nginx/sites-enabled/kimai
nginx -t && service nginx reload
```

### Install Certbot for SSL

Almost there, only the free Lets Encrypt SSL certificate is missing:

```bash
apt-get install certbot python3-certbot-nginx
certbot --nginx
```

Follow the interactive dialogs and choose your new domain.
The `certbot` will rewrite your nginx site configuration and the https site should now work out-of-the-box.

Kimai is now up and running at www.kimai.local - enjoy!

## Bonus points

The following points are hints for advanced use-cases. No support given! 

### Change SSH Port

By changing the default SSH port to a higher number, you can work around script-kiddies which use default "hacking tools" with default settings for their port-scans:

```
sed -i -e 's/#Port 22/Port 54321/g' /etc/ssh/sshd_config
service sshd restart
```

### UFW

Enable the universal firewall and allow the new SSH port:

```bash
ufw allow from any to any port 22 proto tcp
ufw allow from any to any port 54321 proto tcp
ufw allow http
ufw allow https
ufw default allow outgoing
ufw default deny incoming
ufw enable
```

### Fail2Ban

Install the `fail2ban` service and clone the Kimai plugin.

```bash
apt-get install fail2ban
cd /var/www/kimai/var/plugins/
git clone https://github.com/Keleo/Fail2BanBundle.git
```

Now reload the Kimai cache and follow the instructions at [https://github.com/Keleo/Fail2BanBundle](https://github.com/Keleo/Fail2BanBundle).

Finally, enable `fail2ban` with:

```bash
service fail2ban start
systemctl enable fail2ban
```
