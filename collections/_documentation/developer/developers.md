---
title: Development environment 
description: How to setup your local developer environment, tools and best practices 
canonical: /documentation/developers.html
---

This page is for all developers who want to contribute to Kimai. You rock!

## Development installation

### Docker Compose

```dockerfile
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
    restart: unless-stopped
```

### Docker

1. Start a database

    ```bash
    docker run --rm --name kimai-mysql-dev \
        -e MYSQL_DATABASE=kimai \
        -e MYSQL_USER=kimai \
        -e MYSQL_PASSWORD=kimai \
        -e MYSQL_ROOT_PASSWORD=kimai \
        -p 3457:3306 -d mysql
    ```
2. Start Kimai

    ```bash
    docker run --rm --name kimai-dev \
        -d \
        -ti \
        -p 8001:8001 \
        -e APP_ENV="dev" \
        -e DATABASE_URL="mysql://kimai:kimai@host.docker.internal:3457/kimai?charset=utf8mb4&serverVersion=9.5.0" \
        kimai/kimai2:dev
    ```
3. Import development fixtures and users

    ```bash
    docker exec -ti kimai-dev /opt/kimai/bin/console kimai:reset:dev
    ```

For more docker commands, read the [Docker chapter]({% link _documentation/docker/docker.md %})

### Native

You need:

- a recent PHP version, best is 8.3+
- some standard PHP extensions, see composer file for more infos
- a MariaDB 11.1+ or MySQL 8.3+ instance
- [Composer](https://getcomposer.org/download/) and `git`

Clone the repository and install all dependencies:

```bash
git clone {{ site.kimai_v2_repo }}.git
cd kimai/
composer install
```

You need to change your environment to `dev` and configure your database connection in your `.env` file:

```
APP_ENV=dev
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database?charset=utf8mb4&serverVersion=8.3.0
```

The next command will import demo data, to test the application in its full beauty - with different user accounts,
customers, projects, activities and several thousand timesheet records. Let's bootstrap your database
(command only available in `dev` environment):

```bash
bin/console kimai:reset:dev
```

Almost there!

Now you need to start a web server and can access Kimai in your browser.
Its totally up to you how to achieve that, I can recommend the [Symfony local webserver](https://symfony.com/doc/current/setup/symfony_server.html)
(it is fast and supports local https setup):

```bash
symfony serve --port=8010
```

If you want to test with an empty installation, erase the database and re-create an empty schema:

```bash
bin/console doctrine:schema:drop --force
bin/console doctrine:schema:create
```

## Development data

You can now log in with these accounts:

| Username       | Password | API Key | Role                |
|----------------|:--------:|:-------:|---------------------|
| clara_customer | password |  token  | Customer            |
| john_user      | password |  token  | User                |
| chris_user     | password |  token  | User (deactivated)  |
| tony_teamlead  | password |  token  | Teamlead            |
| anna_admin     | password |  token  | Administrator       |
| susan_super    | password |  token  | Super-Administrator |
{: .table }

Demo data can always be deleted by dropping the schema and re-creating it.
The `kimai:reset:dev` command will do that automatically and can always be executed later on to reset your database and cache.

## Frontend dependencies

If you want to make changes to CSS / Javascript, you need:

- [NodeJS](https://www.npmjs.com/)
- [Yarn Package Manager](https://yarnpkg.com/en/)
- [Webpack](https://webpack.js.org/)
- [Webpack Encore](https://github.com/symfony/webpack-encore)

Please [install Yarn for your OS](https://yarnpkg.com/lang/en/docs/install/) and then:

```bash
yarn install
```

To rebuild all assets you have to execute:

```bash
yarn run prod
```

You can find more information [here](https://symfony.com/doc/current/frontend/encore/installation.html) and [here](https://symfony.com/doc/current/frontend.html).

## local.yaml

Beware: if you use the [local.yaml]({% link _documentation/local-yaml.md %}) then don't put it
in `config/packages/` as all configs in there are used when running the PHPUnit testsuite.

The (integration) tests are written to work with the default configuration of Kimai and locally changed configs might unexpectedly break the tests.

Therefor put your `local.yaml` into the `dev/` folder: `config/packages/dev/local.yaml`.

## Tests suites with PHPUnit

Kimai tries to adopt a high test and code coverage. Whenever changing code, you have to make sure
that the tests are still running. New code needs additional tests, otherwise your pull request might be declined.

You can run the unit and integration tests with built-in commands:

```bash
composer kimai:tests-unit
composer kimai:tests-integration
```

Or you simply run all tests with one of:

- `composer kimai:tests`
- `vendor/bin/phpunit`

## Static code analysis via PHPStan

Besides automated tests Kimai relies on PHPStan to detect code problems.

```bash
composer kimai:phpstan
```

## Coding styles

You can run the code sniffer with the built-in command like that:

```bash
composer kimai:codestyle
```

And you can also automatically fix the violations by running:

```bash
composer kimai:codestyle-fix
```

Be aware that this command will modify all files with violations in the directories `src/` and `tests/`, so its a good idea to commit first.

Kimai code-styles are configured in [.php_cs.dist]({{ site.kimai_v2_file }}/.php_cs.dist).
