---
title: Webserver configuration
description: How to install Kimai 2 on your server with git, composer and SSH or FTP
toc: true
---

There is an excellent documentation at the Symfony site, covering multiple webserver and environments setups, 
[which you should definitely read](https://symfony.com/doc/current/setup/web_server_configuration.html).

If you can't manage to get Kimai up and running, it is very likely not an issue with Kimai.
- Check your server logs first and the the Kimai logs (at `var/logs/` inside the Kimai directory).
- Try to find an answer at Stackoverflow, ServerFault or other online communities

The following configurations are meant to give you a first idea how your config could look like, 
they either might be incompatible with your exact setup or might need further tweaking to work.

I don't offer free support for such situations, but you can contact me about [paid installation support]({% link _store/keleo-installation-support.md %}). 

## Apache

How you have to setup Apache is different across different server distributions, make sure to adapt 
the techniques, paths and commands according to your OS.

### Kimai .htaccess

Kimai ships a default [.htaccess](https://github.com/kevinpapst/kimai2/blob/master/public/.htaccess), 
which needs to be allowed by Apache via `AllowOverride All`.

### Create VirtualHost

```
<VirtualHost *:80>
    ServerName kimai.local
    ServerAlias www.kimai.local

    DocumentRoot /var/www/kimai/public
    <Directory /var/www/kimai/public>
        AllowOverride All

        # If you see an error like the following in your logs:
        # AH01630: client denied by server configuration: /var/www/kimai/public/
        # then you might have to exchange the "Order/Allow" rules with "Require" (see below)
        # More infos at https://httpd.apache.org/docs/2.4/de/upgrading.html

        # Apache 2.2
        Order Allow,Deny
        Allow from All
        
        # Apache 2.4
        # Require all granted

        FallbackResource /index.php
    </Directory>

    <Directory /var/www/kimai>
        Options FollowSymlinks
    </Directory>

    # optionally disable the fallback resource for the asset directories
    # which will allow Apache to return a 404 error when files are
    # not found instead of passing the request to Symfony
    <Directory /var/www/kimai/public/bundles>
        FallbackResource disabled
    </Directory>
    
    ErrorLog /var/log/kimai_error.log
    CustomLog /var/log/kimai_access.log combined

    # optionally set the value of the environment variables used in the application
    #SetEnv APP_ENV prod
    #SetEnv APP_SECRET <app-secret-id>
    #SetEnv DATABASE_URL "mysql://db_user:db_pass@host:3306/db_name"
</VirtualHost>
```

### Activate required modules PHP & Rewrite

This step should not be necessary. If you don't have a running PHP module yet, find out how to install and activate it 
for your server distribution. If you have the module installed but its not yet working, it might be necessary to 
activate it first in Apache.
 
This is often done with either linking a config using a tool like `a2enmod` or by manually linking the 
`php7.conf` to the proper directory. If that doesn't help, you can try it with something like this:
```
LoadModule php7_module libexec/apache2/libphp7.so

<IfModule php7_module>
    AddType application/x-httpd-php .php
    AddType application/x-httpd-php-source .phps
    <IfModule dir_module>
        DirectoryIndex index.php
    </IfModule>
</IfModule>
```
Change the `.so` module directory to environment.

The same goes for the `mod_rewrite` module, which is required for Kimai to work: 

```
LoadModule rewrite_module libexec/apache2/mod_rewrite.so
```
