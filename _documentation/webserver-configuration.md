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

    DocumentRoot /var/www/kimai2/public
    <Directory /var/www/kimai2/public>
        AllowOverride All

        # If you see an error like the following in your logs:
        # AH01630: client denied by server configuration: /var/www/kimai2/public/
        # then you might have to exchange the "Order/Allow" rules with "Require" (see below)
        # More infos at https://httpd.apache.org/docs/2.4/de/upgrading.html

        # Apache 2.2
        Order Allow,Deny
        Allow from All
        
        # Apache 2.4
        # Require all granted

        FallbackResource /index.php
    </Directory>

    <Directory /var/www/kimai2>
        Options FollowSymlinks
    </Directory>

    # optionally disable the fallback resource for the asset directories
    # which will allow Apache to return a 404 error when files are
    # not found instead of passing the request to Symfony
    <Directory /var/www/kimai2/public/bundles>
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

## IIS on Windows or Azure

This is not officially supported, basically because I have no way to test it...

But there is a [discussion in the issue tracker](https://github.com/kevinpapst/kimai2/issues/979#issuecomment-514895906) and a 
[Symfony documentation page](https://symfony.com/doc/3.4/deployment/azure-website.html#configure-the-web-server) which could help.

## Reverse proxy

When you want to run Kimai behind a proxy, you have to provide all necessary `X-Forwarded-*` headers.
Here is an example of a nginx proxy configuration, which terminates SSL on `kimai2.local` and forwards the request to Kimai running at `http://127.0.0.1:8010/`:  

```
server {
    listen 443 ssl;
    server_name                 kimai2.local;
    ssl_certificate             /Users/kevin/Sites/_certs/kimai2.local.crt;
    ssl_certificate_key         /Users/kevin/Sites/_certs/kimai2.local.key;
    ssl_session_timeout         5m;
    ssl_protocols               SSLv2 SSLv3 TLSv1;
    ssl_ciphers                 HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    location / {
          proxy_pass http://127.0.0.1:8010/;

          proxy_set_header  Host $http_host;
          proxy_set_header  X-Real-IP $remote_addr;
          proxy_set_header  X-Forwarded-Host $host:$server_port;
          proxy_set_header  X-Forwarded-Server $host;
          proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header  X-Forwarded-Proto $scheme;
          proxy_set_header  X-Forwarded-Port $server_port;
      }
}
```

Now, when you open `https://kimai2.local/` you wil be redirected to the login URL without `http`, here: `http://kimai2.local/en/login/`.
Why is that? Well, because you have to tell Kimai (or the Symfony framework) that it should trust your proxy and take the headers into account 
when generating URLs for links and redirects.

To achieve that, set the environment variable `TRUSTED_PROXIES` to the name of your proxy, either via `.env` file:

```
TRUSTED_PROXIES=127.0.0.1,kimai2.local,localhost
```

or set it in your Kimai server definition (here nginx syntax):
```
fastcgi_param TRUSTED_PROXIES "127.0.0.1,kimai2.local,localhost";
```


### With subdirectory usage

Kimai was made to be hosted on the domain level, so running it inside a subdirectory is not perfectly supported.
Nevertheless, there are some workarounds that enable the usage behind a Reverse Proxy and inside a subdirectory.

The easy part is fixing asset URLs. Edit your local.yaml and paste this code inside:
```yaml
framework:
    assets:
        base_path: "/kimai2"
```
This will prepend `/kimai` to all assets URLs (CSS, Javascript, Images).

Now, lets move on to configure the the webserver (here nginx is used as reverse proxy).
 
Lets assume Kimai is running on `192.168.0.100` on port `8080`, your host is `example.com` and it 
should run in the subdirectory directory `kimai2/`:

```
server {
    listen       80;
    server_name  example.com;

    location /kimai2 {
        proxy_pass http://192.168.0.100:8080;
    }
}
```

The important part here is the "missing" trailing slash!

You are almost there, the only real "workaround" you have to apply is that you have to create a symlink within the `public/`
directory of kimai, pointing to itself with the name being the same as the above `location` (here: kimai2):

```bash
cd /var/www/kimai2/public/
ln -s . kimai2
``` 

In a docker context it could look like this:
```
docker exec -it kimai2 bash ln -s /opt/kimai/public /opt/kimai/public/kimai2 
``` 

And you are good to go: Kimai is now running behind a Reverse Proxy.

Read [this GitHub issue](https://github.com/kevinpapst/kimai2/issues/1006) for more information (start at the bottom).
