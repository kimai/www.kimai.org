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

## Kimai is slow

There are many factors that influence the performance of Kimai, the most important one is the server Kimai runs on.
Shared hosts aren't known for their good performance, especially running modern PHP projects like Kimai that load a large amount of files per request.

The second factor is your PHP configuration, which can lead to massively decreased performance when not tuned for production usage. 

Please [read this issue](https://github.com/kevinpapst/kimai2/issues/1584#issuecomment-604048869).

## Recorded times are wrong

Please read the [user preferences documentation]({% link _documentation/user-preferences.md %}) especially the part 
about **timezones**.

Don't mix it up with the system specific configuration for new customers.

## Share an anonymized database dump

1. Create a database dump (eg. with `mysqldump kimai2 > kimai.sql`)
2. Import that dump into a new database (`CREATE DATABASE kimai2_anonymous;`, `mysql kimai2_anonymous < kimai.sql`)
3. Run the following SQL: 
```sql
UPDATE kimai2_users SET username=concat('user', id), email=concat('email', id, '@example.com'), alias=concat('User ', id), title=null, avatar=null, password='$argon2id$v=19$m=65536,t=4,p=1$SgXu9HaM4kuQriSrWFyWmA$SouREL0yyxTyV/+YSTHWVc0UPwh5rROwOXgf96K94uM'; 
UPDATE kimai2_users SET username_canonical=username, email_canonical=email,api_token=password; 
UPDATE kimai2_customers SET name=concat('Customer ', id), comment=null, vat_id=null, company=null, address=null, email=null, contact=null, phone=null, fax=null, mobile=null, homepage=null; 
UPDATE kimai2_projects SET name=concat('Project ', id), comment=null; 
UPDATE kimai2_activities SET name=concat('Activity ', id), comment=null; 
UPDATE kimai2_invoices SET invoice_filename=concat('invoice', id);
UPDATE kimai2_invoice_templates SET address=concat('address', id), company=concat('company', id), vat_id=null, contact=null, payment_details=null, payment_terms=null;
TRUNCATE kimai2_sessions;
```
The new user password is `kitten`.

If you use plugins, you can `DROP` or `TRUNCATE` their tables.

The table  `kimai2_user_preferences` needs to be checked manually.

You can remove all data from the following tables if there is sensitive data:
```sql
TRUNCATE kimai2_timesheet_meta;
TRUNCATE kimai2_activities_meta;
TRUNCATE kimai2_customers_comments;
TRUNCATE kimai2_customers_meta;
TRUNCATE kimai2_projects_comments;
TRUNCATE kimai2_projects_meta;
```
Please check first if there is nothing sensitive inside or delete the rows by using a `where` filter.
The more data will be kept, the better it will be for testing. 

This anonymized database can now be dumped again, then create a password-protected ZIP from it and upload it to 
a cloud account (like Owncloud, Dropbox, Google Drive...) and share the URL via email/private chat.

## Changed configs/templates do not load

Kimai is built on top of Symfony, a framework that optimizes its speed by caching most files.
Therefor, if you are running Kimai in `production`, you have to clear the cache before changes will show up:

```bash
bin/console cache:clear
``` 

See also the [configurations docs]({% link _documentation/configurations.md %}).

## I have only FTP available

So you want to install Kimai but have no SSH access to your server? 
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

you are running PHP 7.0. Probably you were able to install Kimai, because your PHP-CLI uses a different PHP version than your webserver.
Upgrade PHP and the error will be gone.  
