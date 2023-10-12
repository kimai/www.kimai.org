---
title: Export
description: Export your timesheet data with Kimai into several different formats
redirect_from: 
- /documentation/export/
- /v1/export.html
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

{% include alert.html type="warning" alert="The export extension might not check all available permissions, as this would defeat the purpose of an export." %}

## Export state

Invoices and exports share the export state, which is used to mark timesheet records as processed. 
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.
 
You need to activate the checkbox before creating the export, to automatically set the export state on all filtered timesheet records.

For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

***

## Adding export templates

Since Kimai 1.9 you can add templates for PDF and HTML exports.

Export documents are searched in two locations:

- `var/export/` - does not exist by default, please create it when you add a new template
- `templates/export/renderer/` - don't change files in here, will be overwritten with te next update

Be aware of the following rules:

- HTML templates have the file extension `.html.twig`
- PDF templates have the file extension `.pdf.twig`
- Templates are addressed by their filename 
- You can use every document name only once.
  - Having `var/export/default.html.twig` and `templates/export/renderer/default.html.twig` will lead to unpredictable results 
  - Use unique filenames and prefix them with your company name, eg `acme-export.html.twig` 
- You should store your templates in `var/export/`, as this directory is not shipped with Kimai and not touched during updates
- You can configure different search directories through the config key `kimai.export.documents` if you want to add additional template source directories 
- You can hide the default templates by setting the key `kimai.export.defaults` to an empty array / null
 
After you created a new or updated an existing template, you have to clear the cache to see the results:
{% include cache-refresh.html %} 

Please copy & paste one of [default templates]({{ site.kimai_v2_repo }}/tree/main/templates/export/renderer) to `var/export/` 
as starting point and rename it afterwards.

You can translate the button for your template, by adding its name to the export translation file, eg. `translations/export.en.xlf`.
Internally for each template a new ExportRenderer service is registered, called `exporter_renderer.filename_EXT_twig` (see `ExportServiceCompilerPass`).   

### PDF Templates

{% include documentation/pdf-templates.md %}
 
#### Custom fields

You can access custom fields with:

```twig
{% raw %}{% set cf = entry.metaField('example') %}
{% if cf is not null and cf.value is not null %}
    {{ cf.value }}
{% endif %}{% endraw %}
```

