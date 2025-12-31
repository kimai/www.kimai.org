---
title: Using the API to import CSV data with PHP
navigation: Importing a CSV file
description: Demo application that uses a CSV oparse and the Kimai API to import local data
related:
    - rest-api
    - rest-api-examples
---

This example application uses the API to import a list of customers, projects and activities from a CSV file.

First create the following `composer.json` file and run `composer install` afterward.

```json
{
    "name": "kimai/api_demo",
    "require": {
        "guzzlehttp/guzzle": "^7.3",
        "symfony/console": "^5.3",
        "league/csv": "^9.7",
        "ext-json": "*"
    }
}
```
 
Now create a file with the name `importer` and adjust the `KIMAI_API_*` constants to your installation:

```php
#!/usr/bin/env php
<?php
require __DIR__.'/vendor/autoload.php';

define('KIMAI_API_URL', 'https://demo.kimai.org/api/');
define('KIMAI_API_TOKEN', 'api_kitten_super');

use GuzzleHttp\Client;
use League\Csv\Reader;
use Symfony\Component\Console\Helper\ProgressBar;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\SingleCommandApplication;
use Symfony\Component\Console\Style\SymfonyStyle;

(new SingleCommandApplication())
    ->setName('Kimai - Simple activity importer')
    ->setVersion('0.3')
    ->addArgument('file', InputArgument::REQUIRED, 'The CSV file to import')
    ->addOption('delimiter', null, InputOption::VALUE_REQUIRED, 'The delimiter to use (by default comma ",")', ',')
    ->setCode(function (InputInterface $input, OutputInterface $output) {

        $io = new SymfonyStyle($input, $output);

        $file = $input->getArgument('file');
        if (!file_exists($file)) {
            $io->error('Cannot find file: ' . $file);
            return 1;
        }
        if (!is_readable($file)) {
            $io->error('Cannot read file: ' . $file);
            return 2;
        }

        $delimiter = $input->getOption('delimiter');
        if (empty($delimiter)) {
            $io->error('Cannot use empty delimiter');
            return 3;
        }

        $csv = Reader::createFromPath($file, 'r');
        $csv->setDelimiter($delimiter);
        $csv->setHeaderOffset(0);

        $client = new Client([
            'base_uri' => KIMAI_API_URL,
            'verify' => false,
            'headers' => ['Authorization' => 'Bearer ' . KIMAI_API_TOKEN]
        ]);

        $customers = 0;
        $projects = 0;
        $activities = 0;
        $customerIds = [];
        $projectIds = [];
        $activityIds = [];

        $doPost = function (Client $client, string $endpoint, array $data) {
            $response = $client->post($endpoint, ['json' => $data]);

            return json_decode($response->getBody(), true);
        };

        $records = iterator_to_array($csv->getRecords());

        $progressBar = new ProgressBar($output, count($records));

        foreach($records as $record) {
            if (!array_key_exists('Customer', $record)) {
                $io->error('Cannot import row, missing field "Customer" in row: ' . implode($delimiter, $record));
                return 4;
            }
            if (!array_key_exists('Project', $record)) {
                $io->error('Cannot import row, missing field "Project" in row: ' . implode($delimiter, $record));
                return 5;
            }
            if (!array_key_exists('Activity', $record)) {
                $io->error('Cannot import row, missing field "Activity" in row: ' . implode($delimiter, $record));
                return 6;
            }

            $customerName = trim($record['Customer']);
            $projectName = trim($record['Project']);
            $activityName = trim($record['Activity']);

            if (!array_key_exists($customerName, $customerIds)) {
                $customer = $doPost($client, 'customers', ['name' => mb_substr($customerName, 0, 150), 'country' => 'IT', 'currency' => 'EUR', 'timezone' => 'Europe/Rome', 'visible' => true]);
                $customerIds[$customerName] = $customer['id'];
                $customers++;
            }

            $customerId = (int) $customerIds[$customerName];

            if (!array_key_exists($customerId, $projectIds)) {
                $projectIds[$customerId] = [];
            }

            if (!array_key_exists($projectName, $projectIds[$customerId])) {
                $project = $doPost($client, 'projects', ['name' => mb_substr($projectName, 0, 150), 'customer' => $customerId, 'visible' => true]);
                $projectIds[$customerId][$projectName] = $project['id'];
                $projects++;
            }

            $projectId = (int) $projectIds[$customerId][$projectName];

            if (!array_key_exists($projectId, $activityIds)) {
                $activityIds[$projectId] = [];
            }

            if (!array_key_exists($activityName, $activityIds[$projectId])) {
                $activity = $doPost($client, 'activities', ['name' => mb_substr($activityName, 0, 150), 'project' => $projectId, 'visible' => true]);
                $activityIds[$projectId][$activityName] = $activity['id'];
                $activities++;
            }

            $progressBar->advance();
        }

        $progressBar->finish();

        $io->success('Created ' . $customers . ' customers');
        $io->success('Created ' . $projects . ' projects');
        $io->success('Created ' . $activities . ' activities');
    })
    ->run();
```

Set execute permission `chmod +x importer` and start it by passing the filename for your CSV `./importer ~/kimai-import.csv`, 
which should be formatted like this:

```
Customer,Project,Activity
DEMO,FOO,A long activity title
DEMO,FOO,Demand management
DEMO,BAR,Software as a service
DEMO,BAR,Administration
DEMO,BAR,Video conference 
DEMO,BAR,Sales talk
DEMO,Hello world,I see you
DEMO,Hello world,Testing the API
```
 
