---
title: PHP console client for Kimai
name: Console client (PHAR)
intro: Cross platform console client for Kimai
slug: console-phar
developer: keleo
date: "2020-01-01 20:00:00 +0200"
icon: fas fa-terminal
price: "0"
download: https://github.com/kevinpapst/kimai2-console/releases/latest
github: https://github.com/kevinpapst/kimai2-console
type: client
tags:
  - bash
  - PHP
  - PHAR
---

PHP Command line client for Kimai.

## Features

This command line client should help work Kimai remotely via your favorite shell.

It is based on the PHAR technology, so you need PHP >= 7.3 installed on your machine to use it.

You can find the [full documentation at GitHub]({{ page.github }}).

## Download and install

I cannot help with windows installs, this is only for Linux and Mac:

```bash
curl -LO https://github.com/kevinpapst/kimai2-console/releases/latest/download/kimai.phar
curl -LO https://github.com/kevinpapst/kimai2-console/releases/latest/download/kimai.phar.sha1
sha1sum --check kimai.phar.sha1
rm kimai.phar.sha1
chmod +x kimai.phar
mv kimai.phar /usr/local/bin/kimai
``` 

Before using it the first time, you have to create a configuration file, which holds the connection infos for Kimai. 
By default this config file will be located at `~/.kimai2-console.json`:

```bash
kimai configuration:create
```
Make sure the file is only readable for your own user:

```bash
chmod 600 ~/.kimai2-console.json
```

That's it, you can use Kimai from the command line now, like so:
```bash
$ kimai
$ kimai customer:list
```

By default the configuration file holds credentials for the demo installation ... but now its time to target your own Kimai installation! 
Edit the config file and change the settings: URL, username and API token.

You can find all options in the help:

```
$ kimai

 _  _____ __  __    _    ___   ____
| |/ /_ _|  \/  |  / \  |_ _| |___ \
| ' / | || |\/| | / _ \  | |    __) |
| . \ | || |  | |/ ___ \ | |   / __/
|_|\_\___|_|  |_/_/   \_\___| |_____|

Kimai 2 - Remote Console version 0.3 2020-01-05 17:56:49 UTC (#55c3766)

Usage:
  command [options] [arguments]

Options:
  -h, --help            Display this help message
  -q, --quiet           Do not output any message
  -V, --version         Display this application version
      --ansi            Force ANSI output
      --no-ansi         Disable ANSI output
  -n, --no-interaction  Do not ask any interactive question
      --profile         Display timing and memory usage information
      --csv             Render raw data instead of styled tables
  -v|vv|vvv, --verbose  Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug

Available commands:
  active         List active timesheets
  configuration  Handle the Kimai configuration file
  help           Displays help for a command
  list           Lists commands
  start          Starts a new timesheet
  stop           Stops running timesheets
  version        Show the Kimai version
 activity
  activity:list  List available activities
 customer
  customer:list  List available customers
 project
  project:list   List available projects
 self
  self:check     Checks for available updates
  self:rollback  Rollback to the latest available version
  self:update    Update to the latest available version
```
