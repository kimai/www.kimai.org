---
title: Docker
description: Running Kimai inside docker
toc: true
---

## Production docker

@tobybatch is managing the Kimai 2 Docker images, both for development and a docker-compose setup suitable for running in a production environment.

- [https://github.com/tobybatch/kimai2](https://github.com/tobybatch/kimai2) - his repository with all the docker sources 
- [https://hub.docker.com/r/kimai/kimai2](https://hub.docker.com/r/kimai/kimai2) - dockerhub repo, auto-building prod and dev containers
 
Any issues with the container rather than the application itself should be raised [here](https://github.com/tobybatch/kimai2/issues).

## Development docker

The [Dockerfile]({{ site.kimai_v2_file}}/Dockerfile) that comes with Kimai 2 is suitable mainly for development. 
It runs a self contained version of Kimai 2 using a SQLite database in the docker container. 
Be careful, the recorded data can easily be lost when running docker updates or other tasks.

### Build the docker

```bash
docker build -t kimai/kimai2:dev .
```

### Run the docker

```bash
docker run -ti -p 8001:8001 --name kimai2 --rm kimai/kimai2:dev
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

This creates a user admin/admin with all privileges. 
```bash
docker exec kimai2 /opt/kimai/bin/console kimai:create-user admin admin@example.com ROLE_SUPER_ADMIN admin
```

To install the test data (fixtures):
```bash
docker exec kimai2 /opt/kimai/bin/console kimai:reset-dev
```

### Using a custom local.yaml

You can mount a [custom configuration]({% link _documentation/configurations.md %}) into the container while starting it: 
```bash
docker run --rm -ti -p 8001:8001 --name kimai2 -v $(pwd)/config/packages/local.yaml:/opt/kimai/config/packages/local.yaml kimai/kimai2:dev
```

### Developing against the docker

It is possible to mount your source tree and sqlite DB into the container at run time.  
**N.B. The sqlite database needs to writable by the www-data user.** 
Use ```chown 33:33 kimai.sqlite``` on the host machine.

```bash
docker run --rm -d -p 8001:8001 \
    -v $(pwd)/src:/opt/kimai/src \
    -v $(pwd)/var/data/kimai.sqlite:/opt/kimai/var/data/kimai.sqlite \
    --name kimai2 kimai/kimai2:dev
```

Now edits in your local files will be served by the container and all database changes will persist.

The [official docker documentation](https://docs.docker.com/) has more options on running the container.

## Further docker solutions

As there are several approaches to docker images, you have multiple docker images to choose from. 
They were built by the community, we do not support them - for question please ask in their repositories:

- [dysonspherelab](https://hub.docker.com/r/dysonsphere/kimai2/) (for more infos [read this issue]({{ site.kimai_v2_repo }}/issues/284))
- [felixhummel](https://github.com/felixhummel/kimai-in-docker/tree/kimai2)
- [Haidy777](https://github.com/Haidy777/kimai2/blob/docker/Dockerfile) (for more infos [read this issue]({{ site.kimai_v2_repo }}/pull/311))
