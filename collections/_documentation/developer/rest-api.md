---
title: Start using the Kimai API
navigation: Kimai API
description: Access your time-tracking data with the Kimai JSON API
related:
    - rest-api-examples
---

- Read the API documentation in your Kimai installation at `/api/doc`.
- You can preview the API docs at the demo installation at [https://demo.kimai.org/api/doc](https://demo.kimai.org/api/doc).
- You need to be authenticated to see the API docs, credentials can be [found here]({% link _pages/{{ page.lang }}/demo.md %}).

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

A token is shown exactly once: directly after it was created. Afterwards it is no longer displayed, so it has to be 
copied before leaving the page.

### Token QR code

Right after a token was created, Kimai renders a QR code together with it. It carries the server URL and the new token, 
so an app can be configured by scanning it, instead of letting the user type a 25 character token on a phone keyboard.

{% include docs-image.html src="/images/documentation/api-token-qr-code.webp" title="Example QR code for the payload below" width="320px" %}

The QR code contains a JSON object:

```json
{
    "type": "kimai", 
    "version": 1, 
    "url": "https://127.0.0.1:8000", 
    "token": "6ccc2932be3a7e8fa1dd2c254"
}
```

| Field     | Type    | Description                                                                                           |
|-----------|---------|-------------------------------------------------------------------------------------------------------|
| `type`    | string  | Always `kimai`. Use it to detect whether a scanned QR code belongs to Kimai at all.                   |
| `version` | integer | Format version, currently `1`. See below.                                                             |
| `url`     | string  | Absolute base URL of the Kimai installation, without a trailing slash. Append `/api` for API calls.   |
| `token`   | string  | The API token, to be sent as `Authorization: Bearer <token>` header.                                  |
{: .table}

The `url` stays correct behind a reverse proxy and in subdirectory installations (e.g. `https://example.com/kimai`).

{% alert %}The payload is plain JSON and not a URL: scanning it with a generic camera app shows text and does not 
open anything. Apps have to use their own in-app scanner.{% endalert %}

#### Reading the payload

Implement it defensively, the format will grow over time:

- Reject the payload if `type` is not `kimai`.
- Reject the payload if `version` is higher than the version your app knows, and ask the user to update the app.
- **Ignore unknown fields**, do not fail on them.

#### Format stability

The payload is a public contract for apps and third-party integrations, therefor:

- Existing fields are never renamed or removed.
- New fields may be added at any time, without raising `version`.
- `version` is only raised, if the meaning of an existing field changes.

{% alert warning %}The QR code contains a valid credential. Treat a screenshot of it like the token itself and do not 
store the decoded payload in logs or a scan history.{% endalert %}

## Open API definition

The API calls can be exported in a Open API definition format, which can be imported into your tool of choice.

There is option to export the file in the API docs UI at `/api/doc`.

## Data types

### Order

The order of attributes is NOT guaranteed and therefor not stable. 
Always use the attribute name instead of querying them via index. 

### Default values

The API does not promise any BC on any default value.

When you create objects via API, make sure to set all relevant fields explicit, as we might change them at some point 
and then your integration could break. Some examples:

- visible flag
- auto generated numbers
- settings with default values (like the customer default language/country/currency)
- user preferences with default values

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
