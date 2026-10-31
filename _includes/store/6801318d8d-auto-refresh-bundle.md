AutoRefreshBundle keeps open Kimai pages up to date with changes made elsewhere: start a timer in the mobile app, and the page open on your computer shows it within a second; stop it on the computer, and the phone shows it too. Without the plugin, a Kimai page only refreshes after actions taken on that same page.

What refreshes is what Kimai itself refreshes after a change made on the page: the running timer in the toolbar, the timesheet lists (*My times*...) and the calendar. Nothing is reloaded while nothing changes.

## How it works

Kimai pushes the news to the open pages itself, with no other service in between, through Server-Sent Events:

- whenever a timesheet is created, changed, stopped or deleted (web pages, API, mobile app, console), the plugin marks its user as changed
- every visible Kimai page keeps a connection open to Kimai, behind the login, and hears about the change within about a second
- the page then checks the user's most recent timesheets and, if they differ, triggers Kimai's own refresh; a change made on the page itself causes no second refresh

A hidden page (another tab, the app in the background) closes its connection and checks once when it is shown again. Connections renew themselves every five minutes, and a 60-second safety check covers a dropped connection. Each visible page holds one web server process while it is open: fine for a personal or small-team Kimai.

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/AutoRefreshBundle/releases) into `var/plugins/AutoRefreshBundle` and run `bin/console kimai:reload --env=prod`. Nothing to configure, nothing stored in the database. A reverse proxy must pass the stream through unbuffered (Caddy and Apache do; nginx is told by a header). See the [README](https://github.com/6801318d8d/AutoRefreshBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/AutoRefreshBundle/issues).
