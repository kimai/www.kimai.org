---
title: Hosting Kimai on DigitalOcean
navigation: DigitalOcean
description: Hosting Kimai on the DigitalOcean is the simplest solution available for self-hosting Kimai 
canonical: /documentation/hosting-digital-ocean.html
---

This hosting guide shows you how to self-host Kimai on a DigitalOcean server. It uses:

* [Caddy](http://caddyserver.com){:target="_blank" .external-link} (a reverse proxy) to allow access to the Server from the internet
* [Docker Compose](https://docs.docker.com/compose/){:target="_blank" .external-link} to create and define the application components and how they work together

{% include snippets/self-hosting-warning.md %}
 
## Create a Droplet

1. [Log in](https://cloud.digitalocean.com/login){:target=_blank .external-link} to DigitalOcean. New to DigitalOcean? [Register here]({{ site.digital_ocean }}){:target="_blank" .external-link}.
2. Select the project to host the Droplet, or [create a new project](https://docs.digitalocean.com/products/projects/how-to/create/){:target=_blank .external-link}.
3. In your project, select **Droplets** from the **Manage** menu.
4. [Create a new Droplet](https://docs.digitalocean.com/products/droplets/how-to/create/){:target=_blank .external-link} using the [Docker image](https://marketplace.digitalocean.com/apps/docker){:target="_blank" .external-link} available on the **Marketplace** tab.

{% note "Droplet resources" %}When creating the Droplet, DigitalOcean asks you to choose a plan. For most usage levels, a basic shared CPU plan is enough.{% endnote %}
{% note "SSH or Password" %}DigitalOcean lets you choose between SSH and password-based authentication. SSH is more secure. The rest of this guide assumes you are using SSH.{% endnote %}

## Log in to your server

The rest of this guide requires you to log in to the Droplet using a terminal with SSH. Refer to [How to Connect to Droplets with SSH](https://docs.digitalocean.com/products/droplets/how-to/connect-with-ssh/){:target="_blank" .external-link} for more information. You can find the public IP in the listing of your droplets.

## Clone configuration repository

Docker Compose, Kimai, and Caddy require a series of folders and configuration files. 
You can clone these from [this repository](https://github.com/kimai/kimai-docker-caddy){:target="_blank" .external-link} into the root user folder of the server. 
The following steps will tell you which file to change and what changes to make.

Clone the repository with the following command:

```bash
git clone https://github.com/kimai/kimai-docker-caddy.git
```

And change directory to the root of the repository you cloned:

```bash
cd kimai-docker-caddy
```

## Default folders and files

The host operating system (the server) copies the two folders you created to Docker containers to make them available to Docker. The two folders are:

- `caddy_config`: Holds the Caddy configuration files.
- `kimai_config`: Holds the Kimai configuration file.

### Create Docker volume

To persist the Caddy cache between restarts and speed up start times, create [a Docker volume](https://docs.docker.com/storage/volumes/){:target="_blank" .external-link} that Docker reuses between restarts:

```bash
docker volume create caddy_data
```

Create a Docker volume for the Kimai data:

```bash
docker volume create kimai_data
```

Create a Docker volume for the Kimai plugins:

```bash
docker volume create kimai_plugins
```

Create a Docker volume for the database:

```bash
docker volume create mysql_data
```

## Set up DNS

Kimai typically operates on a subdomain. 
Create a DNS record with your provider for the subdomain and point it to the IP address of the server. 
The exact steps for this depend on your DNS provider, but typically you need to create a new "A" record for the Kimai subdomain.
DigitalOcean provide [An Introduction to DNS Terminology, Components, and Concepts](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts){:target="_blank" .external-link}.

## Open ports

Kimai runs as a web application, so the server needs to allow incoming access to traffic on port 80 for non-secure traffic, and port 443 for secure traffic.

Open the following ports in the server's firewall by running the following two commands:

```bash
ufw allow 80
ufw allow 443
```

## Configure Kimai

Kimai needs some environment variables set to pass to the application running in the Docker container. The example `.env` file contains placeholders you need to replace with values of your own.

Open the file with the following command:

```bash
nano .env
```

The file contains inline comments to help you know what to change.

## The Docker Compose file

The Docker Compose file (`docker-compose.yml`) defines the services the application needs, in this case Caddy and Kimai.

- The MySQL service definition defines the database that will be used by Kimai and the volume that is used for permanent storage of Kimai content.
- The Caddy service definition defines the ports it uses and the local volumes to copy to the containers.
- The Kimai service definition defines the ports it uses, the environment variables Kimai needs to run (some defined in the `.env` file), and the volumes it needs to copy to the containers.

The Docker Compose file uses the environment variables set in the `.env` file, so you shouldn't need to change it's content, but to take a look, run the following command:

```bash
nano docker-compose.yml
```

## Configure Caddy

Caddy needs to know which domains it should serve, and which port to expose to the outside world. 
Edit the `Caddyfile` file in the `caddy_config` folder.

```bash
nano caddy_config/Caddyfile
```

Change the placeholder subdomain to yours. 
If you followed the steps to name the subdomain Kimai, your full domain is similar to `kimai.example.com`. 
The `kimai` in the `reverse_proxy` setting tells Caddy to use the service definition defined in the `docker-compose.yml` file:

```text
kimai.<domain>.<suffix> {
    reverse_proxy kimai:8001 {
      flush_interval -1
    }
}
```

## Start Docker Compose

Start Kimai and Caddy with the following command:

```bash
docker compose up -d
```

This may take a few minutes.

If you see an error, wait for a few minutes and retry.
It can take a while until the DNS changes are available and the SSL certificate is generated.

## Test your setup

In your browser, open the URL formed of the subdomain and domain name defined earlier.
Enter the username and password defined earlier, and you should be able to access Kimai.

## Stop Kimai and Caddy

You can stop Kimai and Caddy with the following command:

```bash
docker compose stop
```

## Updating

```bash
# Pull latest version
docker compose pull

# Stop and remove older version
docker compose down

# Start the container
docker compose up -d
```
