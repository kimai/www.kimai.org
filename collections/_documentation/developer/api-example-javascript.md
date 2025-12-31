---
title: Calling the API with Javascript
navigation: jQuery Demo
description: A jQuery example accessing the Kimai API
related:
    - rest-api
    - rest-api-examples
---

If you develop your own [plugin]({% link _documentation/developer/plugins.md %}) and need to use the API for logged-in
user,
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
        body {
            display: block;
        }

        .codePreview {
            margin-top: 30px;
        }
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
            <input type="text" id="inputToken" class="form-control" placeholder="API Token" required
                   value="api_kitten_super">
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
 
