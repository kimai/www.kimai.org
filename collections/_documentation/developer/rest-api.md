---
title: Start using the Kimai API
navigation: Kimai API
description: Access your time-tracking data with the Kimai JSON API
related:
    - rest-api-examples
---

- Read the API documentation in your Kimai installation at `/api/doc`.
- You can preview the API docs at the demo installation at [https://demo.kimai.org/api/doc](https://demo.kimai.org/api/doc).
- You need to be authenticated to see the API docs, credentials can be [found here]({% link _pages/demo.md %}).

## Authentication

When calling the API you have to submit an additional `Authorization` header with every call:

- `Authorization: Bearer xyz` - here `xyz` is the unique API token for that account

{% alert %}The API token is NOT the normal user password. API tokens can be generated in the user profile.{% endalert %}

{% alert warning %}You MUST use secure HTTPS calls to protect both credentials and data.{% endalert %}

### API tokens

Each user can generate multiple API tokens.

Each token has the following fields: 

- **name**, which is only for yourself for simpler identification.
- **expiration date** which is optional - if set, this token won't work from the configured date on
- **last usage** will be updated once a minute, when used - helps to identify obsolete tokens

## Open API definition

The API calls can be exported in a Open API definition format, which can be imported into your tool of choice.

There is option to export the file in the API docs UI at `/api/doc`.

## Data types

### Order

The order of attributes is NOT guaranteed and therefor not stable. 
Always use the attribute name instead of querying them via index. 

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
