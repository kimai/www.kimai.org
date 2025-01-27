---
title: "Install Kimai on a Synology NAS"
navigation: Synology NAS
description: "How to install Kimai on a Synology NAS with DSM 7+"
canonical: /documentation/synology.html
---

{% include snippets/unsupported-installation-warning.md %}
{% include snippets/self-hosting-warning.md %}

Everything is handled via the `Conatiner Manager` on the Synology DSM 7+ Web UI.

This HowTo explains the installation of Kimai on a Synology NAS with **DSM 7+** - but right now there are some steps missing.
 
## Installation

- Open "Container Manager"
- Go to "Registration"
  - Select "kimai/kimai2"
  - Select "Download"
  - Select "apache" Tag and wait until download is finished
- Go to "Projects"
  - Create a new Project 
    - Next steps are not documented, if you try it, please share what you did, so we can adapt the docs!
    - Use Dockerfile from below ...

### Docker-Composer YAML

```dockerfile
version: '3.5'
services:

  sqldb:
    image: mysql:5.7
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
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=5.7.40"
    restart: unless-stopped

volumes:
  data:
  mysql:
  plugins: 
```

## Updating the image

- Open "Container Manager"
- Go to "Registration"
    - Select "kimai/kimai2"
    - Select "Download"
    - Select "apache" Tag and wait until download is finished
- Now go to "Projects"
  - Select "Kimai" and stop it
  - Select "Kimai" and the "create it"
  - Start "Kimai"

## Installing plugins

You have to create a docker volume mount for the plugins, let's call it `kimai_plugins`.

This will be stored at `/volume1/@docker/volumes/kimai_plugins/_data/`.

- Copy the ZIP files into a directory via File Station, e.g. `/volume1/home/kimai/`
- Extract the ZIP files, e.g. `/volume1/home/kimai/KioskBundle-1.12.0`
- Rename the directory, e.g. `/volume1/home/kimai/KioskBundle`
- Now SSH into the DSM 
  - ssh user@synology-ip
  - sudo su
  - cd /volume1/@docker/volumes/kimai_plugins/_data/
  - mv /volume1/home/kimai/KioskBundle .
- Now install the plugin in Kimai
  - docker exec -it kimai /bin/bash
  - cd /opt/kimai/var/cache/
  - rm -rf pro*
  - cd /opt/kimai/
  - bin/console kimai:bundle:kiosk:install
- Quit both the `Docker` and `SSH` sessions with `exit`
- Reload the Kimai website

## Backups

You can export your Kimai database with a daily cronjob:

- Create a backup directory, e.g. `/volume1/backups/`
- Start the "Task Scheduler" and configure a `Custom script`, which you run as `root`, e.g. `daily` at `01:00`.

The script looks like this:
```bash
/usr/local/bin/docker exec kimai-sqldb-1 mysqldump -uroot -pchangemeplease kimai > /volume1/backups/kimai-`date +%Y-%m-%d`.sql
```

You might habe to adjust the database container name `kimai-sqldb-1` and the  password `changemeplease` to your configured values.
