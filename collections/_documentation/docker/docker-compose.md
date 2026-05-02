---
title: Docker Compose
description: Running Kimai with Docker compose
canonical: /documentation/docker-compose.html
---

Several docker-compose example files that use the latest Kimai version.

## Installation

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
      test: mysqladmin -uroot -p$$MYSQL_ROOT_PASSWORD ping -h 127.0.0.1 --silent
      interval: 10s
      timeout: 5s
      retries: 12
      start_period: 30s

  kimai:
    image: kimai/kimai2:stable
    depends_on:
      sqldb:
        condition: service_healthy
        restart: true
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

## Updating Kimai

The usual update step is simple: stop, pull latest version, restart.

This example is based on the `Apache` image, using the `apache` plugin:

```bash
# Pull latest version
docker compose pull
# Stop and remove older version
docker compose down
# Start the container
docker compose up -d
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
    depends_on:
      sqldb:
        condition: service_healthy
        restart: true
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

This requires a new mount, e.g. mounting the local file `/home/kimai/local.yaml` into the correct location inside the container.  

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

## FPM (deprecated)

{% alert danger %}
Be aware: the FPM image with a reverse proxy for serving the `public` assets is [not supported any longer]({% link _posts/en/2026-01-16-sunset-fpm-docker-images.md %}).  
{% endalert %}

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

## Development

If you want to start a development image, please switch to the [developer docs]({% link _documentation/developer/developers.md %})
