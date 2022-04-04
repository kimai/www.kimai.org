---
title: Recurring budget plugin for Kimai 
name: Recurring budget plugin
intro: "Automatically adds money or time to your project budgets on a recurring basis with a custom interval."
developer: pcsg
date: "2022-02-22 10:00:00 +0200"
icon: "fas fa-file-invoice-dollar"
price: "149€"
gumroad: apoebu
features:
  - Automatic recurring budget credits for projects
  - Custom budget interval per project
  - Detailed budget history view
  - Export budget summaries (PDF)
new: true
type: plugin
tags:
  - plugin
bundle:
  name: "RecurringBudgetBundle"
  command: "kimai:bundle:recurringbudget:install"
  purchase: true
  versions:
    - ["1.0", "1.16.9"]
screenshots:
  - 
    src: "/images/marketplace/pcsg-recurring-budget-bundle-project.png"
    title: Project settings
    description: "Project settings for recurring budget."
  - 
    src: "/images/marketplace/pcsg-recurring-budget-bundle-command.png"
    title: CLI Command
    description: "Output of the CLI command that credits budgets and calculates project statistics."
  - 
    src: "/images/marketplace/pcsg-recurring-budget-bundle-export.png"
    title: PDF Export
    description: "Example of a PDF budget summary export for one month."
  - 
    src: "/images/marketplace/pcsg-recurring-budget-bundle-budgets.png"
    title: Project budgets overview
    description: "Lists all projects with their currently available (time or money) budgets and total budgets."
  - 
    src: "/images/marketplace/pcsg-recurring-budget-bundle-history.png"
    title: Project budgets history
    description: "Lists all completed budget intervals and shows statistics for each of them."
  -
    src: "/images/marketplace/pcsg-recurring-budget-bundle-email.png"
    title: Budget statistics email
    description: "Example of a budget statistics email sent out to the project team lead after a completed budget interval."
---

Set up your projects to receive a fixed amount of budget on a regular basis (e.g. 05:00 hours every month). 
Ideal for contracts with a regular budget bonus (e.g. maintenance agreements, SLAs etc.).

## Features
* Automatic budget credits on a per-project basis (time or money)
* Custom budget interval (every month, every 90 days or whatever you desire)
* Detailed budget history view for all projects and budget intervals in the Kimai backend
* Current budget view for all projects in the Kimai backend
* Export budget summaries for specific time periods with all budget details for your documents or your customers
* Send budget summary emails to project team leads each budget interval
* Available translations: English, German

## Requirements

* Kimai v1.16 or higher
* The ability to execute cronjobs on your server; this is required for executing the command that calculates
  project budgets on a regular basis

## Usage

### Setup projects for recurring budget

This plugin works on a per-project basis. Each Kimai project has to be configured individually if you want to set it up
for recurring budgets.

To set up a project you do the following:

1. Open the project edit window of a project.
2. **Either** set a recurring **time** or **money** budget (field "Recurring time budget" / "Recurring money budget").
3. Set the interval for the recurring budget. This is set to 1 month by default.
4. Set the start date of the next budget interval. This is usually the first day of a month.
5. Save the project!

The project is now set up and is considered when the console command is executed.

### Execute command

The budget addition and calculation for all projects is done via the command:

```bash
bin/console recurring-budget:calculate
```

* Please make sure that you set up a cronjob that executes this command on a regular basis.
* The cronjob interval depends on how your projects are set up; e.g. if all your projects get a budget on a monthly
  basis, then an execution interval of once per month is sufficient.
* With default settings the command considers all project budget intervals up to the execution date.

The budget calculation works in three steps:

1. Fetch all projects that are due for a budget credit and credit the corresponding (time or money) budget
2. Determine all completed budget intervals and calculate budget statistics
3. Send out a budget overview email for every project with the current budget statistics

The command comes with a set of special parameters that let you restrict execution to a specific project or time period
or lets you recalculate previous budget intervals (e.g. after you adjusted some timesheet entries for a project).

The full parameter list can be seen with:

```bash
bin/console recurring-budget:calculate --help
```

### Budget overview

This plugin provides two new overview tables in the Kimai main menu.

**Project budgets**

Lists all projects with their **currently available (time or money) budgets and total budgets**. It also shows the budget
credited for each budget interval.

In the "responsible" column you can see the name of the user who is the team lead of the team that is assigned to the
project. Currently, it only reads the team lead of the first team in the list.

This view is ideal for companies with multiple projects and project leads. It easily shows where the budget is positive
and additional work may need to be done.

**Project budgets history**

Lists all **completed budget intervals** and shows statistics for each of them. Here you can track the history of budget
credits, how much of a project budget was used and how much was remaining for each interval.

### Export recurring budget details

This plugin extends the Kimai export functionality with two views.

In the `Export` menu you have the new "Customer budget" dropdown. Here you have two options:

1. PDF - Complete
2. PDF - Without rates

Both options create an export view with three budget summary blocks for the selected export period:

1. Budget summary - Shows all budget intervals as in the "Project budgets history" view (see above).
2. Summery per project - Lists amount of time (and rates in "Complete" view) worked per project
3. Summary per activity - Lists amount of time worked per activity

This is intended for your internal documents or as information for you customers.

## Support

If you require support for the usage or setup of this plugin or find any bugs please contact [support@pcsg.de](mailto:support@pcsg.de).
