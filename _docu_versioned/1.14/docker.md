---
title: Docker
description: Running Kimai inside docker
toc: true
canonical: /documentation/docker.html
---

## Production docker

@tobybatch is managing the Kimai Docker images, both for development and a docker-compose setup suitable for running in a production environment.

- [https://github.com/tobybatch/kimai2](https://github.com/tobybatch/kimai2) - his repository with all the docker sources 
- [https://hub.docker.com/r/kimai/kimai2](https://hub.docker.com/r/kimai/kimai2) - dockerhub repo, auto-building prod and dev containers
 
Any issues with the container rather than the application itself should be raised [here](https://github.com/tobybatch/kimai2/issues).

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
docker exec kimai2 /opt/kimai/bin/console kimai:create-user admin admin@example.com ROLE_SUPER_ADMIN password
```

To install the test data (fixtures):
```bash
docker exec kimai2 /opt/kimai/bin/console kimai:reset-dev
```

### Using a custom local.yaml

You can mount a [custom configuration]({% link _documentation/local-yaml.md %}) into the container while starting it: 
```bash
docker run --rm -ti -p 8001:8001 --name kimai2 -v $(pwd)/config/packages/local.yaml:/opt/kimai/config/packages/local.yaml kimai/kimai2:dev
```

The [official docker documentation](https://docs.docker.com/) has more options on running the container.
