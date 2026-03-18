---
title: "Sunsetting FPM docker images"
date: "2026-01-16 16:00:00 +0200"
image: /images/blog/sunset-fpm-images.webp
tags: [on-premise]
excerpt: "Due to continuing issues with the FPM docker images, we are deprecating their usage."
cta: cloud
---

## What is happening?

Starting with the **next release** we will no longer create version specific FPM tags:

- `kimai/kimai2:fpm-x.xx.x`

And with the next **major release** we will stop creating the following images and tags:

- `kimai/kimai2:fpm`
- `kimai/kimai2:latest`

## Who is affected?

Every installation using the Kimai Docker image with one the following tags:

- `kimai/kimai2:fpm`
- `kimai/kimai2:latest`
- `kimai/kimai2:fpm-x.xx.x`

The following images were already deprecated quite a long time ago:

- `kimai/kimai2:fpm-prod`
- `kimai/kimai2:fpm-latest`
- `kimai/kimai2:prod`
- `kimai/kimai2:fpm-x.xx.x-prod`

## Why is this happening?

There was a high amount of recurring support requests about deprecated assets after update.
Those came from the problem, that the FPM image itself cannot serve static assets and needed a mount point like `public:/opt/kimai/public`.

This mount had to be updated manually after each docker image update AKA docker compose pull, which defeats the purpose of docker.

We created that image in the past, when we didn't know enough about Docker and the usage of Kimai images. 

## Resolution

Switch to using the Apache tag `kimai/kimai2:apache`.

This might require changes in your setup, depending on your (reverse proxy) integration.

Read more in our [Docker Compose docs]({% link _documentation/docker/docker-compose.md %}). 
