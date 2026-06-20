---
title: "Cloud Updates - November 2021"
date: "2021-11-29 12:00:00 +0200"
---

Between end of November and start of December 2021 all clouds will be updated to the latest Kimai version.

Your clouds might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

## Upcoming changes 

This update focused on many small detail improvements to make your daily workflow smoother.

One big new feature stands out in this update: the form for recording weekly working hours.

### Recording weekly hours

All users will see the new menu item "Weekly hours". With the help of this form, you will be able to record the working hours of an entire week within a very short time. It should be noted here that the start time of each entry will be the same and the form is primarily intended to make recording easier for certain user groups and/or to make life easier for companies that already record only the duration of work (but not the time). 

If you do not want to use this form, please revoke the permission `weekly_own_timesheet` for the corresponding user roles (at least "User"). If you have question about this, [please contact the support](https://www.kimai.cloud/support-center/request).

You can find the full documentation of this function [here]({% link _documentation/weekly-times.md %}).

## Further changes 

In addition to several improvements and bug fixes, the following points have been changed:

- User-dependent configuration for switching between 12 and 24 hours format
- Customized form for new user creation (new: team and role selection)
- Improved workflow for invoice creation and template selection
- Invoices can now have the status "Canceled"
- Improved file name for exports (search parameters: Customer / Project / User are supported if max. 1 is selected in each case)
- PDF documents (exports & invoices) can now be over 50 pages long
- Update of all translations
- Paying customers can now [use custom invoice templates]({% link _documentation/invoice-templates.md %}). The upload is possible in the formats Word (DOCX), OpenOffice (ODS) and Excel (XLSX). Twig and PDF templates must still be imported via support for security reasons.
- Paying customers can define their own [custom CSS rules]({% link _posts/en/2021-11-29-custom-css-rules.md %})

A complete list of all changes can be found [here]({% link _posts/en/2021-11-16-kimai-release-1-16.md %}).
