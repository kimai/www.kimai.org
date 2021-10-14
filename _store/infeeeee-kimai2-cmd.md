---
title: Command line client for Kimai
name: Terminal client (kimai-cmd)
intro: "Cross platform command line client for Kimai, written with Node.js"
developer: infeeeee
date: "2019-11-11 10:00:00 +0200"
icon: fas fa-terminal
price: "0"
screenshot: 
  - https://raw.githubusercontent.com/infeeeee/kimai2-cmd/master/assets/interactive-restart.gif
download: https://github.com/infeeeee/kimai2-cmd/releases/latest
github: https://github.com/infeeeee/kimai2-cmd
type: client
tags:
  - bash
  - Node.js
  - kimai-cmd
---

Command line client for Kimai

![interactive start gif](https://raw.githubusercontent.com/infeeeee/kimai2-cmd/master/assets/interactive-start.gif)

## Features

This client is not intended to replace the Kimai webUI, so only basic functions

Commands: 
- Start, restart and stop measurements
- List active and recent measurements
- List projects and activities

UI:
- Interactive terminal UI with autocomplete
- Classic terminal UI for integration 

Integration:
- Portable executable for all three platforms
- Installer forWwindows
- Generate output for [Rainmeter (Windows)]({% link _store/infeeeee-kimai2-cmd-rainmeter.md %})
- Generate output for [Argos/Kargos/Bitbar (Gnome, Kde, Mac)]({% link _store/infeeeee-kimai2-cmd-argos.md %})

Requests for integrations with other softwares are welcomed! Just open an issue and show an example output, what you need.

## Download and install

Download from [Github releases](https://github.com/infeeeee/kimai2-cmd/releases/latest)

Available platforms:

- Linux
- Mac
- Windows portable
- Windows installer

More info on [project readme](https://github.com/infeeeee/kimai2-cmd)

## Usage

### Interactive UI

![interactive restart gif](https://raw.githubusercontent.com/infeeeee/kimai2-cmd/master/assets/interactive-restart.gif)

If you start without any commands, you will get to the interactive UI. Use your keyboard's arrow keys for navigation. On the `Start new measurement` menu item you can search for project and activity names.

You can exit with ctrl+c any time.

### Classic UI

You can find all the options in the help:

```
$ kimai2-cmd --help

Usage: kimai2-cmd [options] [command]

Command line client for Kimai2. For interactive mode start without any commands. To generate settings file start in interactive mode!

Options:
  -V, --version               output the version number
  -v, --verbose               verbose, longer logging
  -i, --id                    show id of elements when listing
  -b, --argosbutton           argos/bitbar button output
  -a, --argos                 argos/bitbar output
  -h, --help                  output usage information

Commands:
  start [project] [activity]  start selected project and activity
  restart [id]                restart selected measurement
  stop [id]                   stop all or selected measurement measurements, [id] is optional
  rainmeter                   update rainmeter skin
  list-active                 list active measurements
  list-recent                 list recent measurements
  list-projects               list all projects
  list-activities             list all activities
  url                         prints the url of the server
```
