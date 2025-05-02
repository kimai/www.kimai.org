---
title: Troubleshooting
description: Troubleshooting your Kimai docker image
canonical: /documentation/docker-troubleshooting.html
---

## Running commands

The Kimai working directory in Docker is `/opt/kimai/` so the usual commands across the documentation need to be prefixed.

For example clearing the cache is

```bash
docker exec -ti kimai-test /opt/kimai/bin/console kimai:reload --env=prod
```

## Logging

When Kimai runs inside the docker container, logging is reconfigured to use `stderr` which can be seen within the docker container logs.
See [View container logs](https://docs.docker.com/config/containers/logging/) on how to access them.

## Docker behind a reverse proxy

While outside the direct responsibility of this project we get a lot of issues reported that relate to proxying with NGINX into the FPM container.

Note that you will need to set the name of your NGINX container to be in the list of `TRUSTED_PROXIES` when you start the Kimai container.

## Permissions

If you are mounting the code base into the container (`-v $PWD/kimai:/opt/kimai`) then you will need to fix the permissions on the var folder.

```bash
docker exec --user root CONTAINER_NAME chown -R www-data:www-data /opt/kimai/var
```

or

```bash
docker-compose --user root exec CONTAINER_NAME chown -R www-data:www-data /opt/kimai/var
```

## Older version

While we do backport bug fixes we only thoroughly test them against the latest release of Kimai.
We keep the older tags available for those who do not wish to upgrade, but if you encounter a bug then first retest after pulling the latest tag before raising an issue.

## Allowed memory size exhausted

If you encounter an error like `Allowed memory size of 134217728 bytes exhausted` during cache reload, you can instruct PHP to use more memory for that one call with passing the memory limit as runtime parameter:

```bash
php -d memory_limit=1G ../../bin/console kimai:reload --env=prod
```
