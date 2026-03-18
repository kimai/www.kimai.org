---
title: "Cloud Updates - Week 07 - February 2021"
date: "2021-02-16 12:30:00 +0200"
---

In the 7 week of 2021, between 15. - 21. of February, all cloud instances will be updated to the latest Kimai version.

Your clouds might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

## Upcoming changes 

Below are some of the highlights of the new version:

### Timesheet tracking form

New configurations available for the "duration selector" and "start and end date minute dropdown":

![Configuration values to influence timesheet dropdowns]({% link images/documentation/timesheet/minute_configuration.png %})

Default setting is to match your rounding rules. So when you have a rounding rule, that rounds the "duration" to 15 minutes you will see the new duration dropdown:

![The new duration select dropdown]({% link images/documentation/timesheet/duration_selector.png %})

If your rounding rule keep "From" and "To" as they are, you can still configure the minute selector to show ten minute 
steps for "From" and "To" (see first screenshot) and you will get a shorter dropdown::
 
![Minute selects support steps as well]({% link images/documentation/timesheet/minute_selector.png %})

As additional improvement, the duration field now accepts more formats and can interpret decimal as well.

For entering 90 minutes you can now type `1:30`,  `01:30`,  `1,5`, `1.5`, `1h30m` or `90m` ... or you simply select it from the dropdown!

### Prevent modals from closing accidentally

Previously clicking outside a modal always closed it and you could easily loose all your changes. 
Now all forms that are changed, cause the modal to display a warning message when you clicked outside of it, and the modal can only be 
closed by using the "Save" or "Close" button.

The message appears at the top of form, below the modals title:
![Warning message prevents that changed forms will be accidentally closed]({% link images/documentation/modal_close.webp %})

### Reassign timesheets

Allows reassigning of timesheet records from "delete user" dialog, so historical data can be moved to a backup account upon user deletion:

![Reassign timesheets when deleting account]({% link images/documentation/user/delete_user_reassign.png %})

### List actions for last items

The action dropdown in long lists were partially hidden for the last items in the list, if the action menu was rather long. These menus now appear as "drop-ups" and all entries can be selected: 

![List actions appear as drop-up]({% link images/news/1-13-dropup.png %})

### Lockdown configuration

The timesheet lockdown period is somewhat complicated to configure, if you are unfamiliar with the "PHP DateTime "syntax.
To help with the configuration, the calculated results of your settings will now be shown:
    
![Rendered lockdown configuration values]({% link images/documentation/lockdown_configuration.webp %})

### Invoices

The invoice template "Single service date" (formerly called "Freelancer") was converted to produce a PDF version (was: HTML).
PDF invoices have many benefits over HTML, like proper header and footer placement, immutability for legal reasons, 
they can be shared easily with your clients and more.

### Translations

New languages "German (Austrian)" and "Portuguese" were added. 
Austrian matches german by now in most cases, but has some translations for the calendar.

Updated translations for Spanish, Polish, Hungarian, Chinese, Hebrew, French, Turkish, Slovak, Portuguese & Portuguese Brazil, Czech, Esperanto, Dutch, Romanian, Russian, Arabic, French, Polish and Korean.

## Further changes

In addition to several improvements and bug fixes, the following points have been changed:

- Expenses are now included in global export module
- Sorted teams alphabetically
- Height for dashboard widgets (teams and projects) is now limited and clicks on rows open detail pages

A complete list of all changes can be found [here]({% link _posts/en/2020-12-14-kimai-v2-release-1-12.md %}) and [here]({% link _posts/en/2021-02-06-kimai-v2-release-1-13.md %}).
