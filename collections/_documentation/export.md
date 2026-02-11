---
title: Export
description: Export your timesheet data with Kimai into several different formats
---

The export module allows you to export filtered timesheet data into several formats.

{% include youtube-video.html id="quicky_export" %}

## Difference between export and invoice

There are a couple of differences in these two Kimai modules, the most important ones:

- Invoices can only be created for a dedicated customer, where an export can be created without selecting a customer
- Invoices do more calculation (e.g. tax) 
- Invoices support templates in more formats (e.g. XLSX, ODS, DOCX)

## Export state

{% include youtube-video.html id="exports_invoices" chapter="export" %}

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

## Export templates

Kimai supports customizable PDF, Excel and CSV templates.

You can create them with the UI: after filtering timesheets, you will see the list of export buttons. 
Next to them is the {% include demo-action-button.html icon="create" %} button, which will open the modal to create a new template.

{% include docs-image.html src="/images/documentation/export-add-template.webp" title="Add export template" width="400px" %}

These templates allow you to select:
- the exported file `type` (here `PDF`, `CSV` or `Excel`)
- the `language` for header translations, which uses the request language if not configured
- the `columns` that should be exported
- whether they can be used by **every logged-in user** with `Allow access for all users`

Activating the `Allow access for all users` setting means that the new template can be selected in the `My times` and `All times` views for exporting data. 
However, be careful: this does not check permissions. For example, adding a rate column will render this column visible to all users, even if they do not have permission to see rates.

Some fields are specific for the export format.

**PDF**

- Title
- Summary (export summary on the first page of the PDF)
- Font (a list of fonts)
- Page size (A4, A5, A6, Legal, Letter)
- Orientation (Portrait or Landscape)

**CSV**

- Separator (Comma or Semicolon)

{% include docs-image.html src="/images/documentation/export-create-template.webp" title="Edit export template form" %}

After creating the template, the respective buttons will become a dropdown and you can select your template for the export.

{% include docs-image.html src="/images/documentation/export-select-template.webp" title="Select template for export" width="400px" %}

When you hover such a template, you can edit and delete it from the dropdown. 

### PDF and HTML (for developer)

Kimai supports custom PDF and HTML export twig templates. This is an advance topic, only for very specific use-cases.

**How to create your first template**
- Copy & paste the [default templates]({{ site.kimai_v2_repo }}/blob/main/templates/export/pdf-layout.html.twig)
- Read the dedicated chapter about [PDF templates]({% link _documentation/pdf-templates.md %})
- Adjust the template to your needs and add it to Kimai 

{% alert info %}
- **Cloud** users have to send their template to the support via `{{ site.cloud.support_email }}`
- **OnPremise** users need to store their export templates in the directory `var/export/` (you might have to create it on first use)
{% endalert %}

Be aware of the following rules:

- HTML templates have the file extension `.html.twig`
- PDF templates have the file extension `.pdf.twig`
- Use unique filenames and prefix them with your company name, eg `company-export.html.twig` 
- The names `default.html.twig`, `default.pdf.twig`, `default-budget.pdf.twig`, `default-internal.pdf.twig`, `timesheet.pdf.twig` are reserved
- After updating an existing template, you have to [clear the cache]({% link _documentation/cache.md %}) to see the results

**How to access custom fields in PDF templates**

You can access custom fields with `entry.metaField('name')` and you should always safeguard the call in case of a missing custom-field:

```twig
{% raw %}{% set cf = entry.metaField('example') %}
{% if cf is not null and cf.value is not null %}
    {{ cf.value }}
{% endif %}{% endraw %}
```

## Permissions

{% alert danger %}The export extension does not check all available permissions, as this would defeat the purpose of an export. If your users shall not see rates, do not give them the "create_export" permission.{% endalert %}
 
- The export does **not** guarantee to respect permissions like `view_rate_other_timesheet` and `view_rate_own_timesheet`
- The "mark as export" checkbox is only available for users with the `edit_export_other_timesheet` [permission]({% link _documentation/permissions.md %})

{% include documentation/permissions.md id="export" howto=true %}
 
