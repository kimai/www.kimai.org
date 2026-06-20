---
title: "Initial setup"
description: Things to configure before you can start time-tracking
---

Kimai tries to be as simple as possible, while leaving you as much freedom as possible in the way how you use it for your time-tracking.
But this freedom comes with a price: the initial setup phase ... you have to configure several settings, before you can track your first time record.

After you [installed Kimai]({% link _documentation/installation.md %}) according to the documentation, created your first user and logged in, you should follow these steps:

## Kimai data-structure

It is crucial to understand that there is a certain data structure used in Kimai, which cannot be changed:

- `Customer` -> `Project` -> `Activity` are mandatory fields for every timesheet
- Projects are linked to one customer, while an activity can either be project specific or global
- Each time-record is assigned to a `Project` and `Activity`

This structure is used to allow all kinds of features, like customer based invoicing or project based reporting.

## First data and configuration

Before you are going to use Kimai in production, please create an initial data set and then check the configuration.

{% include youtube-video.html id="setup_object_structure" %}

### Track times for your company

In order to record your first timesheets, you will create some entries for your company: 

- Create your first `Customer` named `My company`
- Create your first `Project` named `Internal` and link it to the `Customer` named `My Company`
- Create your first `Activity` named `Internal`  and link it to the `Project` named `Internal`

### Your preferences

Open your user preferences (from the upper-left user drop-down menu) and check all settings.

Read more about them [here]({% link _documentation/user-preferences.md %}).

### System configuration

Now change to `System` -> `Settings`  and configure the following settings:

- `Timesheet / Timetracking mode` - read more about the [available "Tracking modes"]({% link _documentation/timesheet.md %})
- `User - default values` - if you are using Kimai in a multi-user environment, make sure these preferences are correct, as they apply to every user that did not yet update his preferences. 

Please read the documentation for the [other configurations]({% link _documentation/configurations.md %}) as well. 
