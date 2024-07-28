---
title: Development environment 
description: How to setup your local developer environment, tools and best practices 
canonical: /documentation/developers.html
---

This page is for all developers who want to contribute to Kimai. You rock!

# Setting up your environment

All you need is:

- a recent PHP version, best is 8.3+
- some standard PHP extensions, see composer file for more infos
- a MariaDB 11.1+ or MySQL 8.3+ instance
- [Composer](https://getcomposer.org/download/) and `git`

## Development installation

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

You can now log in with these accounts:

| Username       | Password |  API Key   | Role                |
|----------------|:--------:|:----------:|---------------------|
| clara_customer |  kitten  | api_kitten | Customer            |
| john_user      |  kitten  | api_kitten | User                |
| chris_user     |  kitten  | api_kitten | User (deactivated)  |
| tony_teamlead  |  kitten  | api_kitten | Teamlead            |
| anna_admin     |  kitten  | api_kitten | Administrator       |
| susan_super    |  kitten  | api_kitten | Super-Administrator |
{: .table }

Demo data can always be deleted by dropping the schema and re-creating it.
The `kimai:reset:dev` command will do that automatically and can always be executed later on to reset your dev database and cache.

If you want to test with an empty installation, erase the database and re-create an empty schema:

```bash
bin/console doctrine:schema:drop --force
bin/console doctrine:schema:create
```

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
