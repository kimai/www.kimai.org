---
title: Docker
description: Running Kimai inside docker
canonical: /documentation/docker.html
---

We offer Kimai Docker images, both for development and a docker-compose setup suitable for running in a production environment.

Any issues with the container rather than the application itself can be raised [here]({{ site.kimai_v2_docker }}/issues).

## Docker Hub

The Docker Hub repo, where you find the auto-building prod and dev containers for Kimai is: [https://hub.docker.com/r/kimai/kimai2](https://hub.docker.com/r/kimai/kimai2) 

## Quick start

Run the latest production build:

1. Start a DB

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
            -e DATABASE_URL=mysql://kimai:kimai@${HOSTNAME}:3399/kimai?charset=utf8&serverVersion=5.7 \
            kimai/kimai2:apache
    ```

3. Add a user using the terminal

    ```bash
        docker exec -ti kimai-test \
            /opt/kimai/bin/console kimai:user:create admin admin@example.com ROLE_SUPER_ADMIN
    ```

Now, you can access the Kimai instance at <http://localhost:8001>.

__Note:__
If you're using Docker for Windows or Docker for Mac, and you're getting "Connection refused" or other errors, you might need to change `${HOSTNAME}` to `host.docker.internal`.
This is because the Kimai Docker container can only communicate within its network boundaries. Alternatively, you can start the container with the flag `--network="host"`.
See [here](https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach) for more information.

Keep in mind that this Docker setup is transient and the data will disappear when you remove the containers.

```bash
    docker stop kimai-mysql-testing kimai-test
    docker rm kimai-mysql-testing kimai-test
```

## Using docker-compose

This will run the latest prod version using FPM with an nginx reverse proxy

See the [[docker-compose.yml]({{ site.kimai_v2_docker }}/blob/main/docker-compose.yml)] in the root of this repo.

### Examples

Listed here are example setups for running the image(s). If you'd like to contribute a new one them please raise a PR for this page.

* [Apache dev]({{ site.kimai_v2_docker }}/tree/main/compose/docker-compose.apache.dev.yml)
* [Apache prod]({{ site.kimai_v2_docker }}/tree/main/compose/docker-compose.apache.prod.yml)
* [FPM dev]({{ site.kimai_v2_docker }}/tree/main/compose/docker-compose.fpm.dev.yml)
* [FPM prod]({{ site.kimai_v2_docker }}/tree/main/compose/docker-compose.fpm.prod.yml)

None of these images persist the DB between restarts, you will need to add a volume to do that:
```dockerfile
    volumes:
      - mysql:/var/lib/mysql
```
See the [docker-compose.yml](../docker-compose.yml) in the root of the repo.


## Runtime Arguments

The following settings can set at runtime:

### PHP memory limit

The maximum amount of memory a script may consume, <https://php.net/memory-limit>

```bash
memory_limit=512M
```

### Kimai core settings

See the Kimai and Symfony docs for more info on these.

```bash
DATABASE_URL=mysql://user:pass@hodt/dbname?charset=utf8&serverVersion=5.7
APP_SECRET=change_this_to_something_unique
TRUSTED_PROXIES=nginx,localhost,127.0.0.1
TRUSTED_HOSTS=nginx,localhost,127.0.0.1
MAILER_FROM=kimai@example.com
MAILER_URL=null://localhost
```

Start up values:

If set, then these values will be used to create a new admin user (if not yet existing).

```bash
ADMINPASS=
ADMINMAIL=
```

## Changing UID and GID

It is possible to set the user that FPM or Apache run as. If the user does not exist a new user called www-kimai is created and the server is then run under that user. Note these must be numbers, not names.

```bash
USER_ID=1000
GROUP_ID=1000
```

## Alternate DB config

It is possible to pass the DB config in individual values. If the ENV variable ```DB_TYPE``` is set then the following values will be expected:

The ```DB_TYPE``` must be `mysql`:

* ```DB_USER``` defaults to ```kimai```
* ```DB_PASS``` defaults to ```kimai```
* ```DB_HOST``` defaults to ```sqldb```
* ```DB_PORT``` defaults to ```3306```
* ```DB_BASE``` defaults to ```kimai```

















{% comment %} 

### Build the docker

```bash
docker build -t my-local-kimai .
```

### Run the docker

```bash
docker run -ti -p 8001:8001 --name kimai2 --rm my-local-kimai
```

You can then access the site on http://127.0.0.1:8001. If that doesn't work check the IP of your docker:

```bash
{% raw %}docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kimai2{% endraw %}
```

#### Mac using docker-machine

When using docker-machine on your Mac, you need to use the IP of your machine.
Considering you started the machine named `default`, you find the IP with:

```bash
docker-machine ip default
```

### Running commands in the docker

You can run any command in the container in this fashion once it is started.  Add `-ti` to attach a terminal.

```bash
docker exec -ti kimai2 bash
```

#### Create a user and dummy data

This creates a user admin/password with all privileges.
```bash
docker exec kimai2 /opt/kimai/bin/console kimai:user:create admin admin@example.com ROLE_SUPER_ADMIN password
```

To install the test data (fixtures):
```bash
docker exec kimai2 /opt/kimai/bin/console kimai:reset:dev
```

### Using a custom local.yaml

You can mount a [custom configuration]({% link _documentation/local-yaml.md %}) into the container while starting it:
```bash
docker run --rm -ti -p 8001:8001 --name kimai2 -v $(pwd)/config/packages/local.yaml:/opt/kimai/config/packages/local.yaml kimai/kimai2:dev
```

{% endcomment %}

The [official docker documentation](https://docs.docker.com/) has more options on running the container.
