---
title: Connecting via API
description: How to connect your Kimai account with applications, requesting your API token and how to use it.
---

## How to create an API token

First open your API credentials page:

{% include docs-image.html src="/images/documentation/api_access.webp" title="Open API access from your personal user menu" width="300px" %}

Then you select `Create` to create one API token:

{% include docs-image.html src="/images/documentation/api_access_detail.webp" title="Create an API token for Kimai" width="800px" %}

## Bearer token
 
When calling the API you have to submit the additional `Authorization` header with every call:

- `Authorization: Bearer xyz` - here `xyz` is the unique API token for that account

## API Base URL

All application will also ask for your Kimai base URL.

While your API is available under `/api` or as complete URL `https://demo.kimai.org/api`, 
the base URL is what you use to access Kimai in your browser: `https://demo.kimai.org`.

Do not include the trailing slash:

- Wrong: `https://demo.kimai.org/`
- Correct: `https://demo.kimai.org`

