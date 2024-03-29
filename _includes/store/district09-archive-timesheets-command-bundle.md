A Kimai plugin, which allows you to archive timesheets older than a specified timeframe, using a command.

Note that archiving in this case means removing them from the database
permanently. You will not be able to restore them.

## Configuration

After installing the plugin, the `kimai:archive:timesheets` command will be 
available for you to use.

```
Description:
  Archive (remove) timesheets older than the given preserve period.

Usage:
  kimai:archive:timesheets [options]

Options:
  -p, --preserve-period[=PRESERVE-PERIOD]  The period for which to preserve the timesheets, in the PHP DateInterval format 
(http://php.net/manual/en/dateinterval.construct.php#refsect1-dateinterval.construct-parameters). Defaults to 1 year. [default: "P1Y"]
  -h, --help                               Display this help message
  -q, --quiet                              Do not output any message
  -V, --version                            Display this application version
      --ansi                               Force ANSI output
      --no-ansi                            Disable ANSI output
  -n, --no-interaction                     Do not ask any interactive question
  -e, --env=ENV                            The Environment name. [default: "prod"]
      --no-debug                           Switches off debug mode.
  -v|vv|vvv, --verbose                     Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug
```
