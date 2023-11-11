## Description

Lexoffice plugin for Kimai is a plugin that allows you to automatically create invocies in Lexoffice, whenver an invoice in Kimai is created. By using the Lexoffice API (API key is needed) this plugin can create invoice drafts and finalized invoices in Lexoffice, based on your settings. Furthermore, this plugin allows you to customize the title and description of the items in the Lexoffice-invoice. The plugin therefore offers a few replacers you can choose from and that are replaced dynamically when creating the invoice for Lexoffice.

## Installation

This plugin does not need a database table, so there is no installation of the plugin necessary.
To communicate with Lexoffice however, you need to install the Lexoffice-php-sdk composer package:
``` composer require helsinki-systems/lexoffice-php-sdk:dev-master ```

UPDATE WARNING: As this plugin uses composer it breaks on Kimai Updates.
You will have to rerun the composer installation step after each update. 
See https://www.kimai.org/documentation/updates.html#changed-files for more information

## Support

If you need help setting this plugin up or have any feature requests our commercial support is available at [kunden@helsinki-systems.de](mailto:kunden@helsinki-systems.de)

