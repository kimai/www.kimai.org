---
title: Export
description: Export your timesheet data with Kimai into several different formats
since_version: 0.8
toc: true
---

The export module allows you to export filtered timesheet data into several formats.

## Difference between export and invoice

There are a couple of differences in these two Kimai modules, the most important ones:

- Invoices can only be created for a dedicated customer, where export can be done without selecting a customer
- Export state is saved with each timesheet record, so you can filter whether already exported items should be included or not
- Invoices do more calculation (e.g. tax) 
- Invoices support self-created templates (e.g. XLSX, ODS, DOCX)

## Security and privacy

{% include alert.html type="danger" alert="The export extension DOES NOT check permissions, as this would defeat the purpose of an export." %}

So giving a user the permission to export data allows to basically see everything inside Kimai.
So all customer, projects, activities, all hourly rates, the personal time worked and the money earned becomes visible!

## Export state

Invoices and exports share the export state, which is used to mark timesheet records a processed. 
These records cannot be edited any longer by regular users and are excluded by default from further invoices and exports.
 
For further information read the [timesheet documentation]({% link _documentation/timesheet.md %}).

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
 
