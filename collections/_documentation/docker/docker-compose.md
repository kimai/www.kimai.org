---
title: Docker Compose
description: Running Kimai with Docker compose
canonical: /documentation/docker-compose.html
---

Several docker-compose example files that use the latest Kimai version.

## Apache (prod)

```dockerfile
services:

  sqldb:
    image: mysql:8.3
    volumes:
      - mysql:/var/lib/mysql
    environment:
      - MYSQL_DATABASE=kimai
      - MYSQL_USER=kimaiuser
      - MYSQL_PASSWORD=kimaipassword
      - MYSQL_ROOT_PASSWORD=changemeplease
    command: --default-storage-engine innodb
    restart: unless-stopped
    healthcheck:
      test: mysqladmin -p$$MYSQL_ROOT_PASSWORD ping -h localhost
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:apache
    volumes:
      - data:/opt/kimai/var/data
      - plugins:/opt/kimai/var/plugins
    ports:
      - 8001:8001
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
    restart: unless-stopped

volumes:
  data:
  mysql:
  plugins:
```

## Environment variables

Instead of hardcoding your credentials and/or duplicating them in several places, you can also use a `.env` file like that:

```
DATABASE_NAME=kimai
DATABASE_USER=kimaiuser
DATABASE_PASSWORD=kimaipassword
DATABASE_ROOT_PASSWORD=changemeplease
ADMIN_EMAIL=admin@kimai.local
ADMIN_PASSWORD=changemeplease
```

And then reference those from your `docker-compose.yaml`:

```dockerfile
services:

  sqldb:
    image: mysql:8.3
    volumes:
      - mysql:/var/lib/mysql
    environment:
      - MYSQL_DATABASE=${DATABASE_NAME}
      - MYSQL_USER=${DATABASE_USER}
      - MYSQL_PASSWORD=${DATABASE_PASSWORD}
      - MYSQL_ROOT_PASSWORD=${DATABASE_ROOT_PASSWORD}
    command: --default-storage-engine innodb
    restart: unless-stopped
    healthcheck:
      test: mysqladmin -p$$MYSQL_ROOT_PASSWORD ping -h localhost
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:apache
    volumes:
      - data:/opt/kimai/var/data
      - plugins:/opt/kimai/var/plugins
    ports:
      - 8001:8001
    environment:
      - ADMINMAIL=${ADMIN_EMAIL}
      - ADMINPASS=${ADMIN_PASSWORD}
      - "DATABASE_URL=mysql://${DATABASE_USER}:${DATABASE_PASSWORD}@sqldb/${DATABASE_NAME}?charset=utf8mb4&serverVersion=8.3.0"
    restart: unless-stopped

volumes:
  data:
  mysql:
  plugins:
```

## Caddy Reverse Proxy

Kimai has extensive examples of using Caddy as reverse proxy in frontend of Kimai.

See [Hetzner Cloud]({% link _documentation/hosting-hetzner-cloud.md %}) and [Digital Ocean]({% link _documentation/hosting-digital-ocean.md %}) docs.

## Installing plugins

When using plugins, you can either use a [volume](https://docs.docker.com/engine/storage/volumes/) or a [bind mount](https://docs.docker.com/engine/storage/bind-mounts/).
As plugin are accessed read-only by Kimai, you can use both methods.

Using a volume:

```dockerfile
services:
    [...]

  kimai:
    image: kimai/kimai2:apache
    volumes:
      - data:/opt/kimai/var/data
      - plugins:/opt/kimai/var/plugins
    [...]

volumes:
  data:
  plugins:
```

Or using a bind mount, pointing to the local filesystem at `/home/kimai/plugins`:

```dockerfile
services:

  sqldb:
    [...]

  kimai:
    image: kimai/kimai2:apache
    volumes:
      - data:/opt/kimai/var/data
      - /home/kimai/plugins:/opt/kimai/var/plugins
    [...]

volumes:
  data:
```

Once the Docker container is running up, you need to step into the container and install the plugin:

```bash
docker exec -ti kimai /opt/kimai/bin/console cache:clear --env=prod
docker exec -ti kimai /opt/kimai/bin/console kimai:bundle:workcontract:install
```

## Using a local.yaml

This requires a new mount, e.g. mounting the local file `/home/kimai/local.yaml` into the correct location inside the image.  

```dockerfile
services:
    [...]

  kimai:
    image: kimai/kimai2:apache
    volumes:
      - data:/opt/kimai/var/data
      - plugins:/opt/kimai/var/plugins
      - /home/kimai/local.yaml:/opt/kimai/config/packages/local.yaml
      
    [...]

volumes:
  data:
  plugins:
```

## FPM and nginx

Listed here are example setups for running the image(s).
If you'd like to contribute a new one them please [raise a PR for this page](https://github.com/kimai/www.kimai.org/edit/main/_documentation/docker/docker-compose.md).

{% alert danger %}
Be aware that the below image [tobybatch/nginx-fpm-reverse-proxy](https://github.com/tobybatch/nginx-fpm-reverse-proxy) is only meant as example.
It is not made for production usage. Use your existing reverse proxy instead! 
{% endalert %}

```dockerfile
services:

  sqldb:
    image: mysql:8.3
    volumes:
      - mysql:/var/lib/mysql
    environment:
      - MYSQL_DATABASE=kimai
      - MYSQL_USER=kimaiuser
      - MYSQL_PASSWORD=kimaipassword
      - MYSQL_ROOT_PASSWORD=changemeplease
    command: --default-storage-engine innodb
    restart: unless-stopped
    healthcheck:
      test: mysqladmin -p$$MYSQL_ROOT_PASSWORD ping -h localhost
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  nginx:
    image: tobybatch/nginx-fpm-reverse-proxy
    ports:
      - 8001:80
    volumes:
      - public:/opt/kimai/public:ro
    restart: unless-stopped
    depends_on:
      - kimai
    healthcheck:
      test:  wget --spider http://nginx/health || exit 1
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:latest
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
    volumes:
      - public:/opt/kimai/public
      - plugins:/opt/kimai/var/plugins
      # - data:/opt/kimai/var/data
      # - ./ldap.conf:/etc/openldap/ldap.conf:z
      # - ./ROOT-CA.pem:/etc/ssl/certs/ROOT-CA.pem:z
    restart: unless-stopped

volumes:
    data:
    public:
    mysql:
    plugins:
```

## Updating Kimai

The usual update step is simple: stop, pull latest version, restart.

This example is based on the `Apache` image used with the `Docker compose` plugin:

```bash
# Pull latest version
docker compose pull
# Stop and remove older version
docker compose down
# Start the container
docker compose up -d
```

### FPM image

The FPM image will need to be upgraded with a manual step.
Because the FPM image will have a HTTP proxy (e.g. caddy or nginx) serving the static assets the `public` directory is mounted into that container. This is done via volumes:

```yaml
services:
    kimai:
        image: kimai/kimai2:latest
        ...
        volumes:
            - public:/opt/kimai/public
        ...
    nginx:
        ...
        volumes:
            - public:/opt/kimai/public:ro
    ...
```

When the Kimai image is updated, and the container is restarted any new assets in the public directory are never included.
These will be things like CSS files, images and especially version specific javascript code!
To fix this you need to copy the newer files from a fresh image over the top.

```bash
# You might need to use `docker volume ls | grep kimai` to find the name of your Kimai "public" volume
docker run --rm -ti -v kimai_public:/public --entrypoint /bin/bash kimai/kimai2
#                      ^^^^^^^^^^^^ -> Kimai public volume
cp -r /opt/kimai/public /
exit
```

Now you'll need to tell the running kimai to update its assets:

```bash
docker-compose exec kimai /opt/kimai/bin/console assets:install
```

## Apache (dev)

```dockerfile
services:

  sqldb:
    image: mysql:8.3
    environment:
      - MYSQL_DATABASE=kimai
      - MYSQL_USER=kimaiuser
      - MYSQL_PASSWORD=kimaipassword
      - MYSQL_ROOT_PASSWORD=changemeplease
    command: --default-storage-engine innodb
    restart: unless-stopped
    healthcheck:
      test: mysqladmin -p$$MYSQL_ROOT_PASSWORD ping -h localhost
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:apache-dev
    ports:
      - 8001:8001
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
    restart: unless-stopped
```
