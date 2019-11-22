---
title: Rest API
description: Access your time-tracking data via the REST API with Kimai
toc: true
---

Read the Swagger documentation of the Kimai 2 API in your Kimai installation at `/api/doc`.
As example you can have a look at the API docs for the demo installation at [{{ site.kimai_v2_demo }}/api/doc]({{ site.kimai_v2_demo }}/api/doc).
You need to login to see them, credentials can be [found here]({% link _pages/demo.md %}).

Or you can export the JSON collection by visiting `/api/doc.json`. Save the result in a file, which can be imported with Postman.

## Authentication

When calling the API you have to submit two additional header with every call for authentication:

- `X-AUTH-USER` - holds the username or email
- `X-AUTH-TOKEN` - holds the users API password, which he can set in his profile

{% include alert.html type="danger" alert="Make sure to ONLY call the Kimai 2 API via `https` to protect the users credentials and data. Time-tracking data includes private / sensitive information!" %}

## Swagger file and Postman

The API calls can be exported in a Swagger file format, which can be imported into Postman.
You find the link in the API docs (the URL is `api/doc.json`).

The imported collection is pointing to your current installation (e.g. localhost).
If you want to point it to another location (e.g. the Kimai demo), edit the file `config/packages/nelmio_api_doc.yaml` 
and replace the following lines:

```yaml
nelmio_api_doc:
    documentation:
        host: 'demo.kimai.org'
        schemes: ['https']
```
Then export the swagger file again and import into Postman. 

You could even use this method to generate a collection utilizing Postman variables:
```yaml
nelmio_api_doc:
    documentation:
        host: '{{hostname}}'
        schemes: ['https']
```
The variable `hostname` can then be changed for the complete collection in Postman.
Using Postman environments, you can even switch the API location via a simple change of the environments drop-down.

### Authentication in Postman

After importing the collection into Postman, edit the collection and switch to the `Pre-request Scripts` tab.
You can add the following script to have a global authentication in-place, which you can still overwrite per call. 

```javascript
pm.request.headers.add({key: 'X-AUTH-USER', value: 'susan_super' });
pm.request.headers.add({key: 'X-AUTH-TOKEN', value: 'api_kitten' });
```

## DateTime formats (ISO 8601 and HTML5)

TL;DR
- the API returns ISO 8601
- the API expects HTML5 "local date and time" format

The API returns ISO 8601 formatted datetime strings in the users local time, including the timezone offset. 

When `POST`ing or `PATCH`ing timesheet records, you MUST use the HTML5 format (see [RFC 3336](https://tools.ietf.org/html/rfc3339) as well).
Even if the API might allow different formats, only this one is guaranteed to work in the future.
It is also the only format that works correct, adding a timezone might and will result in unexpected and wrong records. 

Please read [this article](http://w3c.github.io/html-reference/datatypes.html#form.data.datetime-local) to find out more 
about the "local date and time" pattern.

- PHP pattern: `yyyy-MM-dd'T'HH:mm:ss` or `Y-m-d\TH:i:s` (for example `2019-04-20T14:00:00`).
- moment.js pattern: `YYYY-MM-DDTHH:mm:ss` or `moment.HTML5_FMT.DATETIME_LOCAL_SECONDS`.

Be aware: Kimai treats the given datetime as local time and adds the configured users timezone without changing the given time.

Read [this comment](https://github.com/kevinpapst/kimai2/issues/701#issuecomment-485564359) to understand the backgrounds about that decision.

## Calling the API with Javascript

If you develop your own [plugin]({% link _documentation/plugins.md %}) and need to use the API for logged-in user, then you have to 
set the header `X-AUTH-SESSION` which will allow Kimai to use the current user session and not look for the default token based API authentication.

### Demo

Copy & paste this code into a new `api.html` file and open it in your browser.
You can execute some sample requests and see the JSON result.
```html
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Kimai 2 - API demo</title>
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
            var username = $('#inputEmail').val();
            var password = $('#inputPassword').val();
            $.ajax({
                url: domain + '/api/' + method,
                type: 'GET',
                beforeSend: function (request) {
                    request.setRequestHeader("X-AUTH-USER", username);
                    request.setRequestHeader("X-AUTH-TOKEN", password);
                },
                headers: {
                    'X-AUTH-USER': username,
                    'X-AUTH-TOKEN': password,
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
			<h1 class="h3 mb-3 font-weight-normal">API Demo</h1>
			<p>Provide your API credentials in the form below</p>
		</div>
		<div class="form-label-group">
			<input type="url" id="inputDomain" class="form-control" placeholder="https://www.example.com/" required
				   autofocus value="http://127.0.0.1:8000">
			<label for="inputDomain">Kimai base URL (domain + port)</label>
		</div>
		<div class="form-label-group">
			<input type="text" id="inputEmail" class="form-control" placeholder="Username" required value="susan_super">
			<label for="inputEmail">Email address</label>
		</div>
		<div class="form-label-group">
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" required
				   value="api_kitten">
			<label for="inputPassword">Password</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" id="loginButton" type="submit">Sign in</button>
	</form>
	<div class="row secret" style="display:none">
		<div class="col-sm text-center">
			<button type="button" class="btn btn-primary" data-api="ping" data-attribute-break="true">Ping</button>
			<button type="button" class="btn btn-secondary" data-api="version" data-attribute-break="true">Version</button>
			<button type="button" class="btn btn-primary" data-api="timesheets" data-attribute-break="false">Timesheet</button>
			<button type="button" class="btn btn-primary" data-api="activities" data-attribute-break="false">Activities</button>
			<button type="button" class="btn btn-primary" data-api="projects" data-attribute-break="false">Projects</button>
			<button type="button" class="btn btn-primary" data-api="customers" data-attribute-break="false">Customers</button>
			<button type="button" class="btn btn-secondary" data-api="config/i18n" data-attribute-break="true">i18n</button>
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

## Adding API methods

There is no example existing right now, but you can have a look at this (german) blog post:
[https://www.kevinpapst.de/blog/fosrestbundle-via-bundle.html](https://www.kevinpapst.de/blog/fosrestbundle-via-bundle.html)
