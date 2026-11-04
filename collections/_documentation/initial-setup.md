---
title: "Initial setup"
description: Things to configure before you can start time-tracking
related:
  - configurations
  - user-preferences
  - permissions
  - teams
---

Kimai tries to leave you as much freedom as possible in the way how you use it for your time-tracking.
It comes with pre-defined settings, but you have should check them, before tracking your first time record.

This guide walks you through that phase. If you follow it from top to bottom, you will end up with a system that is
ready for production use. Plan roughly 10 minutes for a single-user setup and a bit more if you want to onboard a team.

## Before you start

- **Kimai Cloud**: your instance is ready, you are logged in as `System-Admin` and can skip directly to [Step 1](#step-1-understand-the-data-structure)
- **Self-hosted**: [install Kimai]({% link _documentation/installation.md %}) first and create your first user, which
  will automatically become a `System-Admin` (`ROLE_SUPER_ADMIN`)

The steps in this guide are:

1. Understand the data structure
2. Check your own user preferences
3. Create your first customer, project and activity
4. Go through the system settings
5. Configure prices (rates)
6. Create users and configure roles
7. Configure teams (optional)
8. Prepare invoicing (optional)
9. Working times, absences and holidays (optional)
10. Test your setup and roll it out

{% alert info %}
Nothing in this guide is written in stone: almost every setting can be changed later on.
The two decisions that are expensive to change later are your **data structure** (step 1) and the **time-tracking mode** (step 4).
{% endalert %}

## Step 1: Understand the data structure

It is crucial to understand that there is a certain data structure used in Kimai, which cannot be changed:

- `Customer` → `Project` → `Activity` are mandatory fields for every timesheet
- Projects are linked to one customer, while an activity can either be project specific or global
- Each time-record is assigned to a `Project` and an `Activity` (and therefore implicitly to a customer)
- Each time-record belongs to exactly one user

This structure is used to allow all kinds of features, like customer based invoicing or project based reporting.

{% include youtube-video.html id="setup_object_structure" %}

### How to model your work

The most common setup question is "what should be a project and what should be an activity?".
A helpful rule of thumb: **you can only report and invoice on the level you record**.

| You are ...      | Customer                      | Project                                  | Activity                                     |
|------------------|-------------------------------|------------------------------------------|----------------------------------------------|
| a freelancer     | each of your clients          | the engagement, contract or retainer     | the type of work (development, support, ...) |
| an agency        | each of your clients          | the campaign or product you work on      | the type of work                             |
| an internal team | your own company / department | the internal initiative, product or team | the type of work                             |
{: .table}

A few recommendations:

- Create a customer for **your own company** as well, to track internal work like administration, meetings or vacation preparation.
  You will need it again in [step 8](#step-8-prepare-invoicing-optional) as invoice issuer.
- Use **global activities** for work that happens everywhere (e.g. `Meeting`, `Travel`, `Administration`) and
  **project specific activities** for anything that only exists in one project. See [Activities]({% link _documentation/activity.md %}).
- Do **not** create one activity per task. Activities are categories, not tasks. For task level tracking use
  [Tags]({% link _documentation/tags.md %}) or the [Task management plugin]({% link _documentation/plugin-task-management.md %}).
- Keep the amount of entries small in the beginning. It is easy to add another project later, but a wildly grown
  structure is hard to clean up.

## Step 2: Check your own user preferences

### The first-time wizard

Every user has to go through the "first-time wizard" at their first login. It asks for the four settings that
influence the entire user interface:

- `Language` - the language used for all translations of the user interface
- `Locale` - the formats used for dates, times, numbers and money (this can be a different region than the language,
  e.g. an English UI with German date formats)
- `Timezone` - the timezone in which the times of this user are recorded and displayed
- `Theme` - `dark`, `bright` or `auto` (follows the setting of the operating system)

All of them can be changed later on in the user preferences.
If you do not want your users to see the wizard, deactivate `Show setup wizard for new users` in the
`User` section at [System → Settings]({% link _documentation/configurations.md %}) - in that case make sure that the
default values for new users are correct (see [step 4](#step-4-go-through-the-system-settings)).

### The remaining preferences

Open your user preferences (from the user drop-down menu in the upper right corner) and check all settings, see
[User preferences]({% link _documentation/user-preferences.md %}).

The most important ones for a new installation:

- `First day of the week` - influences all week based views and reports
- `Hourly rate` and `Internal rate` - see [step 5](#step-5-configure-prices-rates)
- `Initial view` - the screen you see after login
- `Initial calendar view` - the calendar view that you see as the first one

## Step 3: Create your first customer, project and activity

In order to record your first timesheets, create some entries for your company:

- Create your first `Customer` named `My company`
- Create your first `Project` named `Internal` and link it to the `Customer` named `My company`
- Create your first `Activity` named `Internal` and link it to the `Project` named `Internal`

Now you can already start your first time-record and see whether the times are stored as expected.

### Things to know while creating them

- [Customer]({% link _documentation/customer.md %}): the `Timezone`, `Country` and `Currency` of a customer are pre-filled
  from the system settings. The currency is used for all rates and invoices of that customer, so make sure it is correct.
- [Project]({% link _documentation/project.md %}): `Start` and `End` dates limit the project selection in the timesheet form,
  which prevents bookings on projects that did not start yet or are already finished.
- [Activity]({% link _documentation/activity.md %}): a project specific activity can be converted to a global one, but not
  the other way around. If in doubt, start with a global activity.
- All three objects support a `Color`, a `Number`, `Budgets`, `Teams` and their own `Rates`.

{% alert warning %}
Do not delete customers, projects or activities that were already used: deleting them also deletes the linked timesheet records.
Set them to invisible instead, which removes them from all dropdowns while keeping the recorded data.
{% endalert %}

## Step 4: Go through the system settings

Change to `System` → `Settings` and walk through the sections.
Everything is documented at [Settings]({% link _documentation/configurations.md %}), these are the ones that matter
for a fresh installation:

### Timesheet

- `Time-tracking mode` - the most important decision of the whole setup. `Default` lets users edit everything,
  `Time-clock` only allows punch in/out and `Duration` only allows to enter durations.
  Read the [tracking modes]({% link _documentation/configurations.md %}) before you decide, and be aware that
  changing it later will change the forms of all your users.
- `Allow time entries in the future`, `Allow overlapping time entries`, `Allow time entries with an empty duration` -
  the stricter you configure these, the fewer wrong records you get.
- `Maximum duration of a timesheet record` - a good safety net against forgotten running records.
- `Permitted number of simultaneously running time entries` - keep it at `1` unless your users really work in parallel.

### Time rounding

Rounding rules are applied when a record is saved and directly influence the calculated price.
The default rounds begin and end to full minutes. See [Rounding]({% link _documentation/rounding.md %}).

### User - default values

`Timezone`, `Language` and `Design` apply to every newly created user. In a multi-user environment you should set
these before you create your users, otherwise everyone has to fix their timezone manually.

### My company

`Company name`, `Logo URL` and `Financial year` - the financial year is used in reports and the dashboard.

### Authentication

Decide whether the `Forgot password` function should be available. For self-hosted installations this requires a
working [email configuration]({% link _documentation/emails.md %}).

### Customer, project and activity numbers

If you need generated numbers (e.g. for your accounting), configure the number formats now, before you create your data.

### Theme and calendar

`Allowed colors`, markdown support in descriptions and all [calendar]({% link _documentation/calendar.md %}) related
settings like business hours and slot duration.

## Step 5: Configure prices (rates)

If you want to see money values in reports, exports and invoices, you have to configure prices, see [Prices]({% link _documentation/rates.md %}).

{% include youtube-video.html id="rates" %}

The recommended order:

1. Set an `Hourly rate` (and `Internal rate`) in every **user profile**. This is the last fallback Kimai uses,
   so if it is empty, records without any other rate will have a price of `0`.
2. Add rates on **customer**, **project** or **activity** level wherever you charge a different price.
   The most specific rate always wins: activity → project → customer → user.
3. Optionally define user specific rates on those objects, e.g. a different price for a senior developer.

The rate is calculated and stored when a record is saved - changing a rate later does **not** update existing records.

## Step 6: Create users and configure roles

{% include youtube-video.html id="create_users" %}

### Users

Create your users at `System` → `Users`, see [Users]({% link _documentation/users.md %}).
Recommendations for the start:

- Mark your administrative accounts as `System-Account`, so they do not show up in reports and dropdowns.
- Do not use your admin account for daily time-tracking, create a regular account for yourself.
- Set the `Hourly rate` while creating the user (see step 5).

### Roles

Kimai ships four default roles: `User`, `Teamlead`, `Administrator` and `System-Admin`.
Every permission of every role can be adjusted at `System` → `Roles`, see [Permissions]({% link _documentation/permissions.md %}).

Only change permissions if the defaults do not fit - and change them **before** your users start working,
so nobody loses access to features they already got used to.

## Step 7: Configure teams (optional)

Roles limit **which features** a user can use, teams limit **which data** a user can see.
If your departments should not see each others customers and projects, teams are the tool for that,
see [Teams]({% link _documentation/teams.md %}).

You can skip this step in a small company where everyone may see everything.

### How visibility works

The rule is simple, but it works the other way round than most people expect:

- an object **without** any team assignment is visible to **all** users
- as soon as **one** team is assigned, only the members of that team (and their teamleads) can see it
- the restriction is inherited: a customer restricted to `Team A` also restricts all of its projects and activities
- users with the `view_all_data` permission (by default `Administrator` and `System-Admin`) always see everything

{% alert warning %}
The moment you assign the first team to a customer, all users that are not in that team cannot see it any longer e.g. for new timesheets, in filter dropdowns or as option for reports.
{% endalert %}

### Teamlead vs. the Teamlead role

Those two are easy to confuse:

- the **Teamlead role** is a set of permissions: it allows features like editing projects, seeing rates or budgets
- the **leader of a team** is a member function: this person can see and manage the contents and timesheets of that team

A user can be the teamlead of a team without having the `Teamlead` role and vice versa.
But in most setups you want both for your department leads.

### Example: two departments

Your company has a `Design` and a `Development` department, both of them work for different clients,
and the management should see everything:

| Object                     | Team assignment         | Result                                                         |
|----------------------------|-------------------------|----------------------------------------------------------------|
| Customer `Acme Inc.`       | `Design`                | only the design department sees this customer and its projects |
| Customer `Globex`          | `Development`           | only the development department sees it                        |
| Customer `My company`      | no team                 | everybody can book internal times                              |
| Project `Website relaunch` | `Design`, `Development` | both departments work on this project                          |
{: .table}

The management does not need a team: their `Administrator` role includes `view_all_data`.

### How to set it up

1. Create the teams at `System` → `Teams` (allowed for the roles `Administrator` and `System-Admin`).
2. Add one or more **teamleads** and all **members** to each team.
3. Assign the teams to your data. You can do that from both directions:
   - in the team form, where you can select customers, projects and activities
   - in the customer, project or activity form, in the `Teams` tab
4. Start with the **customer** level: it is inherited by projects and activities, so you rarely need to assign
   teams further down. Only go deeper if a single project of a customer needs a different audience.
5. Log in with (or switch to) a regular user of one team and verify that they only see what they should see.

{% alert info %}
There is a setting `Take over teams from the logged-in user when creating new entries` for projects
(see [Settings]({% link _documentation/configurations.md %})). If teamleads create their own projects, activate it,
otherwise their new projects are visible to everybody.
{% endalert %}

### Teams and timesheets

Team assignments also decide whose timesheets a user can see:

- a teamlead can see the timesheets of their team members (in combination with the `view_other_timesheet` permission)
- if a user with `view_other_timesheet` sees an empty user dropdown, they are not the teamlead of any team

## Step 8: Prepare invoicing (optional)

If you want to create invoices from your recorded times, see [Invoices]({% link _documentation/invoices.md %}):

1. Create a **customer for your own company** and fill in all invoice relevant fields
   (company name, address, Vat-ID, ...). This customer is used as `Invoice issuer`.
2. Create an **invoice template** at `Invoices` → `Templates` with your tax rate, payment terms, bank account,
   invoice number format and the document you want to use.
3. Create a **test invoice** from a few records and check the result, before you send anything to a real customer.
   Delete the test invoice afterwards.

{% include youtube-video.html id="first_invoice" %}

The same preparation helps for [Exports]({% link _documentation/export.md %}), which share the `export` flag with invoices:
once a record was exported or invoiced, regular users cannot change it any longer.

## Step 9: Working times, absences and holidays (optional)

If you use Kimai to track employee working times (available in Kimai Cloud `Pro` and with the `Controlling` plugin):

1. Configure the [public holidays]({% link _documentation/public-holiday.md %}) for your locations - the bulk import
   takes care of the most common countries.
2. Configure the [working contract]({% link _documentation/contract.md %}) with the expected daily working hours
   for each employee, including the vacation entitlement.
3. Decide how [absences]({% link _documentation/absence.md %}) are requested and approved.

{% include youtube-video.html id="working_contracts_setup_and_absences" %}

## Step 10: Test your setup and roll it out

Before you invite your users, run a short test with your own account:

- record a couple of timesheets, including one running record
- check the [calendar]({% link _documentation/calendar.md %}), the [weekly view]({% link _documentation/weekly-times.md %})
  and the [reports]({% link _documentation/reporting.md %})
- create an [export]({% link _documentation/export.md %}) and (if needed) a test invoice
- verify that the rates are calculated as expected
- if you configured teams: log in as a regular user and check that they see exactly the customers and projects they should
- delete your test records afterwards

For self-hosted installations you should also:

- run `bin/console kimai:doctor` to check for common problems, see [Doctor]({% link _documentation/doctor.md %})
- set up [backups]({% link _documentation/backups.md %}) **before** you go live
- read how [updates]({% link _documentation/updates.md %}) work

### Onboarding your users

Send your users a short introduction that covers:

- the link to their Kimai and how to log in
- the hint that the first-time wizard asks for language, locale, timezone and theme - and that especially the
  timezone should be correct
- the request to check the remaining [user preferences]({% link _documentation/user-preferences.md %})
- which customer, project and activity they should use for which type of work
- how you want tags, descriptions and the billable flag to be used
