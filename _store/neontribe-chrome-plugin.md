---
name: ChromePlugin to Kimai Bridge
intro: "This plugin allows time to logged from ChromePlugin tickets into a Kimai instance."
developer: tobybatch
date: "2020-07-10 10:00:00 +0200"
icon: fab fa-chrome
price: '0'
version: 1.0.0
download: https://github.com/tobybatch/ChromeKimaiBridge/archive/v1.0.0.zip
github: https://github.com/tobybatch/ChromeKimaiBridge
features:
  - Allows a Kimai instace to be accessed from a browser pop up.
  - Log time attached to specific Trello card or Github issue.
  - View time logged against a card or issue.
type: client
tags:
  - Chrome
bundle:
    name: "ChromePluginBundle"
---

# ChromePlugin to Kimai Bridge

This plugin allows time to logged from ChromePlugin tickets into a Kimai instance.

## Installation

### The plugin

Clone the repo into your plugins folder of a Kimai installation (it must be in a folder named ```ChromePluginBundle```:

    cd /path/to/kimai
    cd var/plugins
    clone https://github.com/tobybatch/ChromeKimaiBridge.git ChromePluginBundle

Reload the plugins:

    cd /path/to/kimai
    ./bin/console kimai:reload

### The chrome extension

Right now it's not in the chrome store, it will be, but for now there is a packed crx file in the var/plugins/ChromePluginBundle/Resources/ folder.  Because the extension needs to access your Kimai instance it has to have the ```hosts: https://*/*``` permissions which google (quite correctly) finds very permissive and this holds up getting it into the store.

Get it [here](https://github.com/tobybatch/ChromeKimaiBridge/blob/master/Resources/chrome.crx).

## Set up

This will add a new icon to your chrome extensions.  The first time you click it you will launch the options page.  Here you must add a URL pointing to the web root of you Kimai server.  Save the options and then you can use the extension.

## Linking to Trello/Github

Time can be logged directly against a project from a Github issue/project or Trello board.

 1. Navigate to the Github issue/project or Trello board, and open any card.
 1. Activate the extension, the white arrow in a green circle.
 1. The pop up will say it cannot find a project associated with this board.
 1. Copy the ID, e.g. ```tobybatch_ChromeKimaiBridge```
 1. Log into Kimai as an admin and navigate to the project you want to associate with this project.
 1. Edit the project, you will find a field call **External Board ID**
 1. Enter the board id and save the project.
 1. Return to the github issue/trello card and activate the extension.
 1. Log time and view logged history.

The external board id accepts multiple board references in a comma seperated list.

