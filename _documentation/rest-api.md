---
title: Rest API
description: Access your time-tracking data via the REST API with Kimai
toc: true
---

Read the Swagger documentation of the Kimai 2 API in your Kimai installation at `/api/doc`.
As example you can have a look at the API docs for the demo installation at [https://demo-v2.kimai.org/api/doc]({{ site.kimai_v2_demo }}/api/doc).
You need to login to see them, credentials can be [found here]({% link _pages/demo.md %}).

Or you can export the JSON collection by visiting `/api/doc.json`. Store the result in a file, which can be imported with Postman.

## Authentication

When calling the API you have to submit two additional header with every call for authentication:

- `X-AUTH-USER` - holds the username or email
- `X-AUTH-TOKEN` - holds the users API password, which he can set in his profile

{% include alert.html type="danger" alert="Make sure to ONLY call the Kimai 2 API via `https` to protect the users data. Time-tracking data includes very private and sensitive information!" %}

## Calling the API with Javascript

If you develop your own extension and need to use the API for logged-in user, then you have to set the header `X-AUTH-SESSION` 
which will allow Kimai to use the current user session and not look for the default token based API authentication.
