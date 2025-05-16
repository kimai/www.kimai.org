---
title: Docker
description: Running Kimai inside docker
canonical: /documentation/docker.html
---

We offer Kimai Docker images, both for development and a docker-compose setup suitable for running in a production environment.
Any issues with the container rather than the application itself can be raised [here]({{ site.kimai_v2_docker }}/issues/new?template=docker.yml).

The **Docker Hub repo**, where you find the auto-building prod and dev containers for Kimai is: [https://hub.docker.com/r/kimai/kimai2](https://hub.docker.com/r/kimai/kimai2)

## Available tags

- `kimai/kimai2:apache`: the latest Kimai version bundled in an Apache container, needs a reverse proxy only
- `kimai/kimai2:fpm`: the latest Kimai version bundled in PHP-FPM Alpine container (smaller image, but [needs extra setup steps]({% link _documentation/docker/docker-compose.md %})) 
- `kimai/kimai2:latest`: same as `kimai/kimai2:fpm`
- `kimai/kimai2:dev`: development image based on Apache, only to be used locally with debug mode and more 

Each new release creates tag names containing the Kimai release number:

- `kimai/kimai2:apache-x.xx.x`: version specific release (Apache container)  
- `kimai/kimai2:fpm-x.xx.x`: version specific release (PHP-FPM container)

The following tags are deprecated and will not receive updates anymore, replace them:

- `kimai/kimai2:apache-prod`: replaced by `kimai/kimai2:apache` 
- `kimai/kimai2:apache-latest`: replaced by `kimai/kimai2:apache` 
- `kimai/kimai2:fpm-prod`: replaced by `kimai/kimai2:fpm`
- `kimai/kimai2:fpm-latest`: replaced by `kimai/kimai2:fpm` 
- `kimai/kimai2:prod`: replaced by `kimai/kimai2:fpm`
- `kimai/kimai2:apache-dev`: replaced by `kimai/kimai2:dev`  
- `kimai/kimai2:fpm-dev`: no replacement
- `kimai/kimai2:apache-x.xx.x-dev`: no replacement
- `kimai/kimai2:fpm-x.xx.x-dev`: no replacement 
- `kimai/kimai2:apache-x.xx.x-prod`: replaced by `kimai/kimai2:apache-x.xx.x` 
- `kimai/kimai2:fpm-x.xx.x-prod`: replaced by `kimai/kimai2:fpm-x.xx.x` 

## Environment variables

The Kimai image supports the following environment variables:

- `DATABASE_URL` - Default "mysql://kimai:kimai@127.0.0.1:3306/kimai?charset=utf8mb4&serverVersion=5.7.40"
- `APP_SECRET` - Default: "change_this_to_something_unique"
- `TRUSTED_PROXIES` - Default: "nginx,localhost,127.0.0.1" 
- `MAILER_FROM` - Default: "kimai@example.com"
- `MAILER_URL` - Default: "null://localhost"
- `ADMINMAIL` - Email for the new `admin` user (will be created if not existing)
- `ADMINPASS` - Password for the new `admin` user (will be created if not existing)
- `memory_limit` - Default: "256M", the [maximum amount of memory](https://php.net/memory-limit) a script may consume

It is possible to set the user that FPM or Apache run as. If the user does not exist a new user called www-kimai is created and the server is then run under that user. Note these must be numbers, not names.

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
        -p 3399:3306 -d mysql
    ```

2. Start Kimai

    ```bash
    docker run --rm --name kimai-test \
        -ti \
        -p 8001:8001 \
        -e DATABASE_URL=mysql://kimai:kimai@${HOSTNAME}:3399/kimai?charset=utf8mb4&serverVersion=8.3.0 \
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
