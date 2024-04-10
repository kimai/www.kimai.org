---
title: Docker Compose
description: Running Kimai with Docker compose
canonical: /documentation/docker-compose.html
---

Several docker-compose example files that use the latest Kimai version.

## Apache (prod)

```dockerfile
version: '3.5'
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
      test: mysqladmin -p$$MYSQL_ROOT_PASSWORD ping -h localhost
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:apache
    volumes:
      - data:/opt/kimai/var/data
    ports:
      - 8001:8001
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
      - TRUSTED_HOSTS=nginx,localhost,127.0.0.1
    restart: unless-stopped

volumes:
  data:
  mysql:
```

## Apache (dev)

```dockerfile
version: '3.5'
services:

  sqldb:
    image: mysql:8.3
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
    image: kimai/kimai2:apache-dev
    ports:
      - 8001:8001
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
      - TRUSTED_HOSTS=nginx,localhost,127.0.0.1
    restart: unless-stopped
```

## FPM and nginx

Listed here are example setups for running the image(s).
If you'd like to contribute a new one them please [raise a PR for this page](https://github.com/kimai/www.kimai.org/edit/main/_documentation/docker/docker-compose.md).

None of these images persist the DB between restarts, unless you add a volume to do that:
```dockerfile
    volumes:
      - mysql:/var/lib/mysql
```

{% capture proxImage %}
Be aware that the below image [tobybatch/nginx-fpm-reverse-proxy](https://github.com/tobybatch/nginx-fpm-reverse-proxy) is only meant as example.
It is not made for production usage. Use your existing reverse proxy instead! 
{% endcapture %}
{% assign proxImage = proxImage|markdownify %}
{% include alert.html icon="fas fa-exclamation" type="danger" alert=proxImage %}

### Production

```dockerfile
version: '3.5'
services:

  sqldb:
    image: mysql:8.3
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

  nginx:
    image: tobybatch/nginx-fpm-reverse-proxy
    ports:
      - 8001:80
    volumes:
      - public:/opt/kimai/public:ro
    restart: unless-stopped
    depends_on:
      - kimai
    healthcheck:
      test:  wget --spider http://nginx/health || exit 1
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:latest
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
      - TRUSTED_HOSTS=nginx,localhost,127.0.0.1
    volumes:
      - public:/opt/kimai/public
      # - data:/opt/kimai/var/data
      # - ./ldap.conf:/etc/openldap/ldap.conf:z
      # - ./ROOT-CA.pem:/etc/ssl/certs/ROOT-CA.pem:z
    restart: unless-stopped

volumes:
    data:
    public:
    mysql:
```

### With addons
 
```dockerfile
version: '3.5'
services:

  sqldb:
    image: mysql:8.3
    environment:
      - MYSQL_DATABASE=kimai
      - MYSQL_USER=kimaiuser
      - MYSQL_PASSWORD=kimaipassword
      - MYSQL_ROOT_PASSWORD=changemeplease
    volumes:
      - mysql:/var/lib/mysql
    command: --default-storage-engine innodb
    restart: unless-stopped
    healthcheck:
      test: mysqladmin -p$$MYSQL_ROOT_PASSWORD ping -h localhost
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  nginx:
    image: tobybatch/nginx-fpm-reverse-proxy
    ports:
      - 8001:80
    volumes:
      - public:/opt/kimai/public:ro
    restart: unless-stopped
    depends_on:
      - kimai
    healthcheck:
      test:  wget --spider http://nginx/health || exit 1
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:latest
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0
      - TRUSTED_HOSTS=nginx,localhost,127.0.0.1
      - MAILER_URL=smtp://mailer:1025
      - MAILER_FROM=kimai@example.com
    volumes:
      - public:/opt/kimai/public
      # - data:/opt/kimai/var/data
      # - ./ldap.conf:/etc/openldap/ldap.conf:z
      # - ./ROOT-CA.pem:/etc/ssl/certs/ROOT-CA.pem:z
    restart: unless-stopped

  phpmyadmin:
    image: phpmyadmin
    restart: always
    ports:
      - 8081:80
    environment:
      - PMA_ARBITRARY=1

  swagger:
    image: swaggerapi/swagger-ui
    ports:
      - 8080:8080
    volumes:
      - ./swagger.json:/swagger.json
    environment:
      - SWAGGER_JSON=/swagger.json

  mailer:
    image: schickling/mailcatcher
    ports:
      - "${MAILER_SMTP_PORT:-1025}:1025"
      - "${MAILER_ADMIN_PORT:-1080}:1080"

volumes:
    data:
    public:
    mysql:
```

### Development

```dockerfile
version: '3.5'
services:

  sqldb:
    image: mysql:8.3
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

  nginx:
    image: tobybatch/nginx-fpm-reverse-proxy
    ports:
      - 8001:80
    volumes:
      - public:/opt/kimai/public:ro
    restart: unless-stopped
    depends_on:
      - kimai
    healthcheck:
      test:  wget --spider http://nginx/health || exit 1
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  kimai:
    image: kimai/kimai2:fpm-dev
    environment:
      - ADMINMAIL=admin@kimai.local
      - ADMINPASS=changemeplease
      - "DATABASE_URL=mysql://kimaiuser:kimaipassword@sqldb/kimai?charset=utf8mb4&serverVersion=8.3.0"
      - TRUSTED_HOSTS=nginx,localhost,127.0.0.1
    volumes:
      - public:/opt/kimai/public
      # - data:/opt/kimai/var/data
      # - ./ldap.conf:/etc/openldap/ldap.conf:z
      # - ./ROOT-CA.pem:/etc/ssl/certs/ROOT-CA.pem:z
    restart: unless-stopped

volumes:
    data:
    public:
    mysql:
```
