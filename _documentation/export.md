---
title: Export
description: Export your timesheet data with Kimai into several different formats
since_version: 0.8
toc: true
redirect_from:
  - /documentation/export/
---

The export module allows you to export filtered timesheet data into several formats.

## Difference between export and invoice

There are a couple of differences in these two Kimai modules, the most important ones:

- Invoices can only be created for a dedicated customer, where an export can be created without selecting a customer
- Invoices do more calculation (e.g. tax) 
- Invoices support self-created templates in more formats (e.g. XLSX, ODS, DOCX)

## Security and privacy

{% include alert.html type="danger" alert="The export extension DOES NOT check permissions, as this would defeat the purpose of an export." %}

So giving a user the permission to export data allows to see most time related data in Kimai 
(like customer, projects, activities, rates, time worked per user and more).

## Export state

Invoices and exports share the export state, which is used to mark timesheet records as processed. 
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.
 
You need to tick the checkbox before creating the export, to automatically set the export state on all filtered timesheet records.

For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

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

Please copy & paste one of [default templates](https://github.com/kevinpapst/kimai2/tree/master/templates/export/renderer) to `var/export/` 
as starting point and rename it afterwards.

You can translate the button for your template, by adding its name to the export translation file, eg. `translations/export.en.xlf`.
Internally for each template a new ExportRenderer service is registered, called `exporter_renderer.filename_EXT_twig` (see `ExportServiceCompilerPass`).   

### PDF Templates

Since 1.13 you can customize the following values from within your PDF templates:
 - many [mPDF options](https://mpdf.github.io/reference/mpdf-functions/construct.html) and [configurations](https://mpdf.github.io/reference/mpdf-variables/overview.html) like the page format
 - the generated filename by using the option named `filename`

```
{%raw%}
{{- pdfContext.setOption('format', 'A4-L') -}}
{{- pdfContext.setOption('filename', 'Timesheets_' ~ filenamePrefix|default('') ~ (query.customers|length == 1 ? query.customers.0.name|replace({' ': '-'}) ~ '_' : '') ~ query.begin|date_format('Y_m') ~ '.pdf') -}}
{%endraw%}
```

The variable name (here `format` and `filename`) must be one of the mPDF construtor options, ConfigVariables or FontVariables.
 

## Adding export renderer

An export renderer is a class implementing `App\Export\RendererInterface` and it is responsible to convert an array of 
`Timesheet` objects into a downloadable/printable document. 

Every export renderer class will be automatically available when refreshing the application cache, thanks to the  
[ExportServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/ExportServiceCompilerPass.php).

Each renderer is represented by a "button" below the datatable on the export screen.

A simple example, which only shows the IDs of the included timesheet records could look like this: 

```php
use App\Entity\Timesheet;
use App\Export\RendererInterface;
use App\Repository\Query\TimesheetQuery;
use Symfony\Component\HttpFoundation\Response;

final class TimesheetIdRenderer implements RendererInterface
{
    public function render(array $timesheets, TimesheetQuery $query): Response
    {
        $ids = array_map(function(Timesheet $timesheet) {
            return $timesheet->getId();
        }, $timesheets);

        $response = new Response();
        $response->setContent(sprintf('Included IDs: %s', implode(', ', $ids)));

        return $response;
    }

    public function getId(): string
    {
        return 'ext_array_dump';
    }

    public function getIcon(): string
    {
        return 'fas fa-file-code';
    }

    public function getTitle(): string
    {
        return 'Show IDs';
    }
}
```

All you need to do is to register it as a service in the Symfony DI container.

## Adding timesheet export renderer

**Feature available since 1.6**

Timesheet exporter (implementing the interface `App\Export\TimesheetExportInterface`) are almost the same as export renderer, 
except that they don't have the methods `getIcon()` and `getTitle()`.

If you already wrote an export renderer, all you need to add is the second interface and you can export the filtered data 
from the user and admin timesheet screen.

Be aware, that you should add more permission (eg. `view_rate_own_timesheet`) checks to these renderer, as they are available for every user!
