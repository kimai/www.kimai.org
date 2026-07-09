---
title: Docker
description: Running Kimai inside docker
canonical: /documentation/docker.html
---

We offer Kimai Docker images for both development and production use, including a ready-to-use docker-compose setup.

For issues with the container itself (rather than the application), please [open a ticket here]({{ site.kimai_v2_docker }}/issues/new?template=docker.yml).

The official **Docker Hub repository** with auto-built production and development images is available at:
[https://hub.docker.com/r/kimai/kimai2](https://hub.docker.com/r/kimai/kimai2)

## Available images

- `kimai/kimai2:<major>` – recommended: pin a specific major release, e.g `kimai/kimai2:2` (will upgrade between `2.0.0` up to `2.99.99`) 
- `kimai/kimai2:stable` – always the latest stable Kimai release (might bump to a new major release, so be careful)
- `kimai/kimai2:<version>` – one specific release of Kimai, e.g `kimai/kimai2:2.58.0` (not recommended, as you will not receive updates)
- `kimai/kimai2:dev` – development image intended for local use only, with debug mode enabled
 
## Environment variables

The Kimai image supports the following environment variables:

- `DATABASE_URL` - Default "mysql://kimai:kimai@127.0.0.1:3306/kimai?charset=utf8mb4&serverVersion=5.7.40"
- `APP_SECRET` - You **MUST** set this to a long and unique string
- `TRUSTED_HOSTS` - You **MUST** set this to the domain name that is used to access Kimai (can be a regexp like `localhost|127.0.0.1|kimai.example.com`)
- `TRUSTED_PROXIES` - Default: "nginx,localhost,127.0.0.1" 
- `MAILER_FROM` - Default: "kimai@example.com"
- `MAILER_URL` - Default: "null://localhost"
- `ADMINMAIL` - Email for the new `admin` user (will be created if not existing)
- `ADMINPASS` - Password for the new `admin` user (will be created if not existing)
- `memory_limit` - Default: "256M", the [maximum amount of memory](https://php.net/memory-limit) a script may consume

It is possible to set the user that Apache run as. If the user does not exist a new user called `www-kimai` is created and the server is then run under that user. Note these must be numbers, not names.

- `USER_ID=1000`
- `GROUP_ID=1000`

## Quick test setup

This will run the latest production build and make it accessible at <http://localhost:8001>.

{% alert danger %}This setup is NOT intended for production use. It's temporary and entered data will disappear when the containers are removed (see last point).{% endalert %}

1. Start a database

    ```bash
    docker run --rm --name kimai-mysql-testing \
        -e MYSQL_DATABASE=kimai \
        -e MYSQL_USER=kimai \
        -e MYSQL_PASSWORD=kimai \
        -e MYSQL_ROOT_PASSWORD=kimai \
        -p 3456:3306 -d mysql
    ```

2. Start Kimai

    ```bash
    docker run --rm --name kimai-test \
        -d \
        -ti \
        -p 8001:8001 \
        -e APP_ENV="prod" \
        -e DATABASE_URL="mysql://kimai:kimai@host.docker.internal:3456/kimai?charset=utf8mb4&serverVersion=9.5.0" \
        kimai/kimai2:apache
    ```

    If you're getting a "Connection refused" or similar errors, try changing `${HOSTNAME}` to `host.docker.internal`. 
    Alternatively, you can start the container with the flag `--network="host"` (more infos [here](https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach)).

3. Add a user using the terminal

    ```bash
    docker exec -ti kimai-test \
        /opt/kimai/bin/console kimai:user:create admin admin@example.com ROLE_SUPER_ADMIN
    ```

4. Stop the containers

    ```bash
    docker stop kimai-mysql-testing kimai-test
    ```
 
5. When you are finished testing Kimai, you can remove the test containers

    ```bash
    docker rm kimai-mysql-testing kimai-test
    ```

If you are happy with Kimai, you can now set up your Docker installation using [Docker Compose]({% link _documentation/docker/docker-compose.md %}).

## Running commands

The Kimai working directory in Docker is `/opt/kimai/` so the usual commands across the documentation need to be prefixed.

For example clearing the cache is 

```bash
docker exec -ti kimai-test /opt/kimai/bin/console kimai:reload --env=prod
```

## Docker background worker

The Docker image runs a Symfony Messenger worker alongside Apache to process asynchronous messages such as emails.

The Docker healthcheck still verifies Apache only, so use `supervisorctl` to inspect worker state.

For `docker-compose`, configure a grace period that is longer than the worker shutdown timeout:

```yaml
stop_grace_period: 35s
```

Useful diagnostics inside the container:

```bash
docker exec <container> supervisorctl status
docker exec <container> php /opt/kimai/bin/console messenger:failed:list
docker exec <container> php /opt/kimai/bin/console messenger:failed:retry --transport=failed_async
docker exec <container> php /opt/kimai/bin/console messenger:failed:retry --transport=failed_emails
```

## Deprecated images 

Since the internal technical stack is an implementation detail irrelevant to end users, the following image name has been deprecated.
It will remain available for backwards compatibility until further notice:

- `kimai/kimai2:apache` – replaced by `kimai/kimai2:stable`

The following tags are still available, but will stop receiving updates after the next major release, replace them ASAP:

- `kimai/kimai2:fpm`: the latest Kimai version bundled in PHP-FPM Alpine container (smaller image, but [needs extra setup steps]({% link _documentation/docker/docker-compose.md %}))
- `kimai/kimai2:latest`: same as `kimai/kimai2:fpm`

The following tags are deprecated and will not receive updates anymore, replace them:

- `kimai/kimai2:apache-prod`: replaced by `kimai/kimai2:stable`
- `kimai/kimai2:apache-latest`: replaced by `kimai/kimai2:stable`
- `kimai/kimai2:apache-dev`: replaced by `kimai/kimai2:dev`
- `kimai/kimai2:apache-<version>` – replaced by `kimai/kimai2:<version>`
- `kimai/kimai2:apache-<version>-prod`: replaced by `kimai/kimai2:apache-<version>`
- `kimai/kimai2:apache-<version>-dev`: no replacement
- `kimai/kimai2:prod`: replaced by `kimai/kimai2:fpm`
- `kimai/kimai2:fpm-prod`: replaced by `kimai/kimai2:fpm`
- `kimai/kimai2:fpm-latest`: replaced by `kimai/kimai2:fpm`
- `kimai/kimai2:fpm-dev`: no replacement
- `kimai/kimai2:fpm-<version>`: no replacement
- `kimai/kimai2:fpm-<version>-prod`: replaced by `kimai/kimai2:fpm-<version>` 
- `kimai/kimai2:fpm-<version>-dev`: no replacement
