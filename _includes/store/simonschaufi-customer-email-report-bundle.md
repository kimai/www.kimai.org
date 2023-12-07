## Email report on working hours

A Kimai plugin to send an email report to a client with the previous day's working hours and descriptions.

Are you a freelancer? Use this plugin to send your clients a daily status report on the hours worked.

Surprise your client with transparency and trust instead of an unexpectedly high invoice at the end of the month.
This gives your customer a good overview of all work performed.

In the customer administration, you can set whether you want to send a status report to each customer individually.

## Daily report as a responsive e-mail

The e-mail adapts seamlessly to any end device. 
You can read the email perfectly on any device. 
Depending on the device settings, your customer can also read the email perfectly in dark mode.

## What's included?

- a new permission manage_customer_email_report
- a new command to send the email report
- a meta field for customers to activate the email report

## System Requirements

You need the ability to execute cronjobs on your server, either in your hosting administration platform or manually via `crontab -e`.
This is required for executing the command `bin/console customer-email-report:send`.

## Setup steps after Installation

If you want to send the email report in German daily at 1:00 am, you can use the following cronjob:

```
0 1 * * * /usr/bin/php8.1 /var/www/html/kimai/bin/console customer-email-report:send --locale=de >/dev/null 2>&1
```
