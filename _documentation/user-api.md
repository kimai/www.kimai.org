---
title: Connecting via API
description: How to connect your Kimai account with applications, requesting your API token and how to use it.
toc: false
---
 
When calling the API you have to submit two additional header with every call for authentication:

- `X-AUTH-USER` - holds the username, which you use for the normal web-login (email address works as well)
- `X-AUTH-TOKEN` - the API password, which has to be set in your user profile (this is NOT your normal password)

Application will also ask for your Base URL (or your Kimai URL).

This is usually the URL you use to access Kimai in your browser, e.g. `https://example.kimai.cloud`.

Do not include the trailing slash:

- Wrong: `https://example.kimai.cloud/`
- Correct: `https://example.kimai.cloud`
