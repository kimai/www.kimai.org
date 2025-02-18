## Description

This plugin integrates a Kimai installation into [Personio](https://worksimple.personio.de/) a SaaS HR/HCM and process automation solution. Personio offers the ability to account employee working hours. This functionality is partly overlaping with Kimai functionality. Use of this plugin avoids the neccassity that users have to enter data twice (Kimai and Personio) to account for working hours.

Timesheets are consolidated against overlappings and then transferred to Personio. Information about the linked Personio time accounting is stored. This way a differential sync is possible after the initial sync to speedup the sync process. Each time a timesheet within Kimai is changed the according Personio time accounting entries are updated during the sync job run.

The project entity within Personio is not used, synced or linked to the transferred entries.

## Installation

After installation (see Installation), open 'PersonioSyncBundle\Resources\config\services.yaml' and enter your personio client id and client secret.

To communicate with Lexoffice however, you need to install GuzzleHttp:
(run this command on /var/www/kimai, NOT /var/www/kimai/var/plugins)
```bash
composer require guzzlehttp/guzzle
```

We are currently working on removing GuzzleHttp as a dependency.

Keep in mindo to rebuild the cache:
```bash
bin/console kimai:reload -n
```

{% include snippets/composer-update-warning.md %}

## Usage

Navigate to kimai:
```bash
cd /var/www/kimai
```

Execute the plugin command to execute the sync or plan it as a cronjob:
```bash
bin/console kimai:bundle:personio-sync:sync-attendances
```

To remove all links to Personio in Kimai, the following command can be used:
```bash
bin/console kimai:bundle:personio-sync:reset-sync-state
```
  
## Support

If you need help setting this plugin up or have any feature requests our commercial support is available at [hello@unicorn-development.de](mailto:hello@unicorn-development.de)

## Legal notice

All product names, trademarks and registered trademarks (e.g. Personio) are property of their respective owners. All company, product and service names used in this website are for identification purposes only. Use of these names,trademarks and brands does not imply endorsement.