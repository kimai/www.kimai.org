
# FAQ - Frequently asked questions

## I have a problem

Please check your logfile at `var/log/prod.log`. Many problems reveal themselves after checking it.

If that doesn't help, open a new discussion at [GitHub]({{ site.kimai_v2_repo }}/discussions/) and we try to find a solution.
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

## Changed configs/templates do not load

Kimai is built on top of Symfony, a framework that optimizes its speed by caching most files.
Therefor, if you are running Kimai in `production`, you have to [clear the cache]({% link _documentation/cache.md %}) before changes will show up.

## I have only FTP available

[Sorry, no chance.]({% link _documentation/ftp.md %}) 
You either have to find a hoster that offers SSH access, or you use the [SaaS version of Kimai](https://www.kimai.cloud). 

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
Upgrade PHP or change the used PHP version in your webserver, and the error will be gone.  
