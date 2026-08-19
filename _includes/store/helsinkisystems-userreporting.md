
## Description

This plugin generates PDF reports from Kimai time tracking data and sends them by email to configured recipients. It supports monthly automatic report generation via cronjob, manual generation for custom date ranges, and role-based distribution to team leads, supervisors, and configured recipients. Reports are generated using Twig-based PDF templates and include a web UI under `Reporting -> Detailed User Report` with filters for date range, user, and team.

## Installation

To display the graphs, this bundle uses the `JPGraph` Package from Amenadiel. This can be installed using this command:

```bash
composer require amenadiel/jpgraph
```

After that, you can install the bundle as follows:

`php bin/console kimai:bundle:userreporting:install`


## Configuration

The command and report rendering use the following bundle config values:

- `user_reporting.config.send_to_teamlead`
- `user_reporting.config.send_to_supervisor`
- `user_reporting.config.send_company_report_teamleads`
- `user_reporting.config.send_company_report_supervisors`
- `user_reporting.config.all_reports_receiver`
- `user_reporting.config.additional_mails`
- `user_reporting.config.kimai_url`


## Support

If you need help setting this plugin up or have any feature requests our commercial support is available at [kunden@helsinki-systems.de](mailto:kunden@helsinki-systems.de)

