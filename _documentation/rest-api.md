---
title: Quickstart for Kimai API (JSON / REST)
navigation: Kimai API
description: Access your time-tracking data via the JSON API with Kimai
redirect_from: 
- /documentation/api/
- /v1/api.html
related:
- rest-api-examples
---

Read the Swagger documentation of the Kimai API in your Kimai installation at `/api/doc`.
For example, you can have a look at the API docs for the demo installation at [https://demo.kimai.org/api/doc](https://demo.kimai.org/api/doc).
You need to authenticate to see them, credentials can be [found here]({% link _pages/demo.md %}).

Or you can export the JSON collection by visiting `/api/doc.json`. Save the result in a file, which can be imported with Postman.

## Authentication

When calling the API you have to submit two additional header with every call for authentication:

- `X-AUTH-USER` - holds the username (or email address)
- `X-AUTH-TOKEN` - the API password, which has to be set in the user profile

{% include alert.html type="primary" alert="The API password is different from the normal user password and can be set in the user profile." %}

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You should only use secure https calls to protect both credentials and data." %}

## Swagger file and Postman

The API calls can be exported in a Swagger file format, which can be imported into Postman.
You find the link in the API docs (the URL is `api/doc.json`).

To use the API with Postman, the simplest approach is to export the swagger file and import it with Postman. 

### Authentication in Postman

After importing the collection into Postman, edit the collection and switch to the `Pre-request Scripts` tab.
You can add the following script to have a global authentication in-place, which you can still overwrite per call. 

```javascript
pm.request.headers.add({key: 'X-AUTH-USER', value: 'susan_super'});
pm.request.headers.add({key: 'X-AUTH-TOKEN', value: 'api_kitten'});
```

## Data types

### Default values

The API does not promise any BC on any default value. This is especially true for optional booleans (see below). 

### DateTime formats (ISO 8601 and HTML5)

TL;DR
- the API returns ISO 8601
- the API expects HTML5 "local date and time" format

The API returns ISO 8601 formatted datetime strings in the users local time, including the timezone offset. 

When `POST`ing or `PATCH`ing timesheet records, you MUST use the HTML5 format (see [RFC 3339](https://tools.ietf.org/html/rfc3339) as well).
Even if the API might allow different formats, only this one is guaranteed to work in the future.
It is also the only format that works correct, adding a timezone might and will result in unexpected and wrong records. 

Please read [this article](http://w3c.github.io/html-reference/datatypes.html#form.data.datetime-local) to find out more 
about the "local date and time" pattern.

- PHP pattern: `yyyy-MM-dd'T'HH:mm:ss` or `Y-m-d\TH:i:s` (for example `2019-04-20T14:00:00`).
- moment.js pattern: `YYYY-MM-DDTHH:mm:ss` or `moment.HTML5_FMT.DATETIME_LOCAL_SECONDS`.

Be aware: Kimai treats the given datetime as local time and adds the configured users timezone without changing the given time.

Read [this comment]({{ site.kimai_v2_repo }}/issues/701#issuecomment-485564359) to understand the backgrounds about that decision.

### Boolean

All boolean fields in `POST` and `PATCH` requests are optional, defaulting to `false` if unset.

Therefor you should declare all booleans, no matter if you want them to be `true` or `false`.

The field will be mapped to `false` if it is either `not provided` or `false`.
Providing any other value, including `null`, will turn the value to `true`. 
