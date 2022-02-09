---
title: "Initial setup"
description: Things to configure before you can start time-tracking
toc: true
---

Kimai tries to be as simple as possible, while leaving you as much freedom as possible in the way how you use it for your time-tracking.
But this freedom comes with a price: the initial setup phase ... you have to configure several settings, before you can track your first time record.

Let's get started, so you can go back and concentrate on your real work, instead of configuring a software ;-)

## Installation

- Install Kimai [according to the documentation]({% link _documentation/installation.md %}).
- Create your first user, either via command-line with `bin/console` or in the login / registration form.
- Login into Kimai
- Then come back here and follow the next steps ...   

## Kimai data-structure

Two points are important to understand before your start:

- the structure of `Customer` -> `Project` -> `Activity` which Kimai uses
- each time-record is assigned to a `Project` and `Activity`, those fields are mandatory

This structure is used to allow all kinds of features, like customer based invoicing or project based reporting.

## Your initial setup

This leads us directly to the point of your initial content creation and configuration. 

### Track times for your company

In order to record your first timesheets, you will create some entries for your company: 

- Create your first `Customer` named `My company`
- Create your first `Project` named `Internal` and link it to the `Customer` named `My Company`
- Create your first `Activity` named `Internal`  and link it to the `Project` named `Internal`

### Your preferences

Open your user preferences (from the upper-left user drop-down menu) and configure the following settings:

- `Timezone` - set the timezone in which you are living, otherwise your records might show the wrong times  
- `Language` - use Kimai in your language (if it doesn't exist, consider to help [translating it]({% link _documentation/translations.md %}))

The other options can be left as is for now, you can read more about them later [here]({% link _documentation/user-preferences.md %}).

### System configuration

Now change to `System` -> `Settings`  and configure the following settings:

- `Timesheet / Timetracking mode` - read more about the [available "Tracking modes"]({% link _documentation/timesheet.md %})
- `User - default values` - if you are using Kimai in a multi-user environment, make sure these preferences are correct, as they apply to every user that did not yet update his preferences! 

All the other settings can be skipped for now and changed at a later point. 

### Self-registration and password reset

There are two functions, which should be checked right at the beginning for security reasons:
  
- User registration and activation
- Password reset

By default, user registration is enabled with auto activation, so everyone knowing the URL can register at your Kimai installation. 
If you use Kimai on a public server, you should change these settings!

Please read more in the `User registration` chapter [here]({% link _documentation/users.md %}) and then adapt your 
[local.yaml]({% link _documentation/local-yaml.md %}) if necessary.

{% include alert.html icon="far fa-smile-beam" type="success" alert="Setup complete: you can start time-tracking!" %}

## Troubleshooting

Something is not working as expected? 

- Check your logfile at `var/log/prod.log`, as many problems reveal themselves after reading it
- Still not working? Open a new discussion at [GitHub]({{ site.kimai_v2_repo }}/discussions/)

