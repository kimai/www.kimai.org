---
title: Export
description: Export your timesheet data with Kimai into several different formats
---

The export module allows you to export filtered timesheet data into several formats.

## Difference between export and invoice

There are a couple of differences in these two Kimai modules, the most important ones:

- Invoices can only be created for a dedicated customer, where an export can be created without selecting a customer
- Invoices do more calculation (e.g. tax) 
- Invoices support self-created templates in more formats (e.g. XLSX, ODS, DOCX)

## Security and privacy

Giving a user the permission `create_export` to export data, allows him to see most time related data in Kimai 
(like customer, projects, activities, rates, time worked per user and more).

The "mark as export" checkbox is only available for users with the `edit_export_other_timesheet` [permission]({% link _documentation/permissions.md %}).

{% alert danger %}The export extension does not check all available permissions, as this would defeat the purpose of an export. If your users shall not see rates, do not give them the 'create_export' permission.{% endalert %}

## Export state

Invoices and exports share the export state, which is used to mark timesheet records as processed. 
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.
 
You need to activate the checkbox before creating the export, to automatically set the export state on all filtered timesheet records.

For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

## Time format

Kimai knows both the `natural` and `decimal` notation for times and both versions have their Pros and Cons:
- the `natural` format (e.g. 1:15) is usually easier to understand
- the `decimal` format (e.g. 1.25) is better for calculations

As a user, you can decide which version you want to use by going to your own [user preferences]({% link _documentation/user-preferences.md %}): in the upper right corner click your username and then `Preferences`.

There is a toggle called `Use decimal duration in export` that switches between the two versions:

{% include docs-image.html src="/images/documentation/export-time-format.webp" title="Time format toggle" width="400px" %}

## Adding export templates

Kimai supports custom PDF and HTML export templates.

Those export templates are searched in the location `var/export/`, which does not exist by default, please create it when you add your first template.

Be aware of the following rules:

- HTML templates have the file extension `.html.twig`
- PDF templates have the file extension `.pdf.twig`
- You can use every template filename only once, as they are used as reference
- The names `default.html.twig`, `default.pdf.twig`, `default-budget.pdf.twig`, `default-internal.pdf.twig`, `timesheet.pdf.twig` are reserved
- Use unique filenames and prefix them with your company name, eg `company-export.html.twig` 
 
After you created a new or updated an existing template, you have to clear the cache to see the results:
{% include snippets/cache-refresh.md %} 

### How to start

Copy & paste the [default templates]({{ site.kimai_v2_repo }}/blob/main/templates/export/pdf-layout.html.twig) to `var/export/company-template.pdf.twig` as starting point.

## PDF Templates

There is so much to say about PDF templates, that there is a dedicated page about [PDF templates]({% link _documentation/pdf-templates.md %}).
 
### Custom fields

You can access custom fields with:

```twig
{% raw %}{% set cf = entry.metaField('example') %}
{% if cf is not null and cf.value is not null %}
    {{ cf.value }}
{% endif %}{% endraw %}
```

## Permission

The export page is visible to users who own the `create_export` permission.

The export does **not** respect permissions like `view_rate_other_timesheet` and `view_rate_own_timesheet`. 
