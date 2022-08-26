A Kimai plugin, which logs an error message for every failed login attempt to a dedicated logfile.

This logfile can be analyzed by `fail2ban` to block access and prevent authentication attacks.

## Fail2Ban configurations

You should know how to use and configure `fail2ban`, we cannot help with that part!
Having said that, here are some possible rules for your `fail2ban` configuration.

First the Kimai specific filter:
```
#/etc/fail2ban/filter.d/kimai2.conf
[Definition]
failregex = fail2ban.ERROR: <HOST> \[.*\] \[.*\]$
```

And the additional jail.local for Kimai:
```
#/etc/fail2ban/jail.local
[kimai2]
enabled   = true
filter    = kimai2
logpath   = /var/www/kimai2/var/log/fail2ban.log
port      = http,https
bantime   = 600
banaction = iptables-multiport
maxretry  = 3
```

Now touch the file to make sure it exists:
```
touch /var/www/kimai2/var/log/fail2ban.log
```

## Credits

- Bundle inspired by [this blog entry](https://www.nomisoft.co.uk/articles/symfony-fail2ban-ip-blocking) 
- Thanks also to [@BeckeBauer](https://github.com/kevinpapst/kimai2/issues/951) for the idea and the initial try
- Find config documentation in the [fail2ban wiki](http://www.fail2ban.org/wiki/index.php/Main_Page)
