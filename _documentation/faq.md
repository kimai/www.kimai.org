---
title: FAQ
description: Frequently asked questions for Kimai
toc: true
redirect_from:
  - /faq.html
---

## I have a problem

Please check your logfile at `var/log/prod.log`. Many problems reveal themselves after checking it.

If that doesn't help, open a new issue at [GitHub]({{ site.kimai_v2_repo }}/issues/) and we try to find a solution.
Please include the last ~ 20-50 lines of the log file, which were written around the time the error happened.  

## Recorded times are wrong

Please read the [user preferences documentation]({% link _documentation/user-preferences.md %}) especially the part 
about **timezones**.

Don't mix it up with the system specific configuration for new customers.

## Changed configs/templates do not load

Kimai is built on top of Symfony, a framework that optimizes its speed by caching most files.
Therefor, if you are running Kimai in `production`, you have to clear the cache before changes will show up:

```bash
bin/console cache:clear
``` 

See also the [configurations docs]({% link _documentation/configurations.md %}).

## I have only FTP available

So you want to install Kimai v2 but have no SSH access to your server? 
There is a workaround available, read the additional [installation instructions]({% link _documentation/installation.md %}). 

## Error on bin/console doctrine:schema:create

If you get an error during the installation of the database schema that mentions `DC2Type:json_array`, e.g. like the following: 

```
In PDOConnection.php line 109:

  SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'JSON
   NOT NULL COMMENT '(DC2Type:json_array)', UNIQUE INDEX UNIQ_B9AC5BCE5E237E06' at line 1
```

Then the most likely case is that you are using a MariaDB database which is too old. You can find out which version is 
used by executing `mysql --version` or by checking the server information e.g. with PHPMyAdmin.

There is a [discussion in the issue tracker]({{ site.kimai_v2_repo }}/issues/191) about this topic.

Further readings:

- [MariaDB - JSON support was added with 10.2.7](https://mariadb.com/kb/en/library/json-data-type/)
- [Using JSON fields with Doctrine ORM on PostgreSQL & MySQL](https://symfony.fi/entry/using-json-fields-with-doctrine-orm-on-postgresql-mysql)

## Dotenv::populate() must be an instance of Symfony\\Component\\Dotenv\\void

If you encounter an error like this:

```
PHP Fatal error:  Uncaught TypeError: Return value of Symfony\\Component\\Dotenv\\Dotenv::populate() must be an instance of Symfony\\Component\\Dotenv\\void, none returned in /var/www/kimai2/vendor/symfony/dotenv/Dotenv.php:95
Stack trace:
#0 /var/www/kimai2/vendor/symfony/dotenv/Dotenv.php(57): Symfony\\Component\\Dotenv\\Dotenv->populate(Array)
#1 /var/www//kimai2/public/index.php(15): Symfony\\Component\\Dotenv\\Dotenv->load('/var/www/html/k...')
#2 {main}\n  thrown in /var/www/kimai2/vendor/symfony/dotenv/Dotenv.php on line 95

```

you are running PHP 7.0. Probably you were able to install Kimai v2, because your PHP-CLI uses a different PHP version than your webserver.
Upgrade PHP and the error will be gone.  