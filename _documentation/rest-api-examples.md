---
title: API examples
navigation: Examples
description: Some examples how to access the Kimai PAI with different languages
related:
- rest-api
---

## Using the API to import CSV data with PHP

This example uses the API to import a list of customers, projects and activities from a CSV file.

First create the following `composer.json` file and run `composer install` afterwards.

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
    ->setVersion('0.2')
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

## Calling the API with Javascript

If you develop your own [plugin]({% link _documentation/plugins.md %}) and need to use the API for logged-in user, 
then you don't have to care about authentication, Kimai will handle it for you.

Copy & paste this code into a new `api.html` file and open it in your browser.
You can execute some sample requests and see the JSON result.
```html
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Kimai - API demo</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://getbootstrap.com/docs/4.3/examples/floating-labels/floating-labels.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/themes/prism.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/plugins/line-numbers/prism-line-numbers.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/prism.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/components/prism-json.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/plugins/line-numbers/prism-line-numbers.min.js"></script>
	<style>
		body { display: block; }
		.codePreview { margin-top: 30px; }
	</style>
	<script>
        function callKimaiApi(method, successHandler, errorHandler) {
            var domain = $('#inputDomain').val();
            var token = $('#inputToken').val();
            $.ajax({
                url: domain + '/api/' + method,
                type: 'GET',
                beforeSend: function (request) {
                    request.setRequestHeader('Authorization', 'Bearer ' + token);
                },
                headers: {
                    'Authorization': 'Bearer ' + token,
                },
                success: successHandler,
                error: errorHandler
            });
        }

        $(function () {
            $('#loginForm').on('submit', function (event) {
                event.preventDefault();
                event.stopPropagation();
                $('#loginButton').text('Loading...');
                callKimaiApi('version', function (result) {
                        $('#loginButton').text('Success');
                        $('.secret').attr('style', 'display:block');
                        return false;
                    }, function (xhr, err) {
                        $('#loginButton').text('Try again!');
                        $('.secret').attr('style', 'display:none');
                        console.log(xhr);
                        alert('Error occured, see console for details');
                    }
                );
                return false;
            });

            $('button[data-api]').on('click', function (event) {
                event.preventDefault();
                event.stopPropagation();

                var apiMethod = $(this).attr('data-api');
                var breakAttr = $(this).attr('data-attribute-break');
                $('#loginButton').text('Loading...');

                callKimaiApi(
                    apiMethod, 
                    function (result) {
                        $('#loginButton').text('Success!');
                        var jsonBeauty = JSON.stringify(result).trim();
                        if (breakAttr === "true") {
                            jsonBeauty = jsonBeauty.split('","').join('",' + "\n" + '"');
                        }
                        jsonBeauty = jsonBeauty.split('},{').join('},' + "\n" + '{');
                        $('#apiResult').text(jsonBeauty);
                        $('.codePreview').attr('style', 'display:block');
                        Prism.highlightElement(document.getElementById('apiResult'));
                        return false;
                    }, function (xhr, err) {
                        $('#loginButton').text('Sorry, that failed :-(');
                        console.log(xhr);
                        alert('Error occured, see console for details');
                    }
                );
                return false;
            });
        });
	</script>
</head>
<body>
<div class="container">
	<form id="loginForm" class="form-signin">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">Kimai &ndash; API Demo</h1>
			<p>Please provide your API URL and token below</p>
		</div>
		<div class="form-label-group">
			<input type="url" id="inputDomain" class="form-control" placeholder="https://www.example.com/" required
				   autofocus value="https://demo.kimai.org">
			<label for="inputDomain">Kimai base URL (domain + port)</label>
		</div>
		<div class="form-label-group">
			<input type="text" id="inputToken" class="form-control" placeholder="API Token" required value="api_kitten_super">
			<label for="inputToken">API Token</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" id="loginButton" type="submit">Sign in</button>
	</form>
	<div class="row secret" style="display:none">
		<div class="col-sm text-center">
			<button type="button" class="btn btn-primary" data-api="ping" data-attribute-break="true">Ping</button>
			<button type="button" class="btn btn-secondary" data-api="version" data-attribute-break="true">Version</button>
			<button type="button" class="btn btn-secondary" data-api="plugins" data-attribute-break="true">Plugins</button>
			<button type="button" class="btn btn-primary" data-api="timesheets" data-attribute-break="false">Timesheet</button>
			<button type="button" class="btn btn-primary" data-api="activities" data-attribute-break="false">Activities</button>
			<button type="button" class="btn btn-primary" data-api="projects" data-attribute-break="false">Projects</button>
			<button type="button" class="btn btn-primary" data-api="customers" data-attribute-break="false">Customers</button>
		</div>
	</div>
	<div class="row codePreview" style="display:none">
		<pre class="language-json line-numbers" style="white-space: pre-line">
			<code id="apiResult"></code>
		</pre>
	</div>
</div>
</body>
</html>
```
