---
title: Connecting via API
description: How to connect your Kimai account with applications, requesting your API token and how to use it.
toc: false
---
 
When calling the API you have to submit the additional `Authorization` header with every call:

- `Authorization: Bearer xyz` - here `xyz` is the unique API token for that account

Application will also ask for your Kimai base URL.

This is usually the URL you use to access Kimai in your browser, e.g. `https://demo.kimai.org`.

Do not include the trailing slash:

- Wrong: `https://demo.kimai.org/`
- Correct: `https://demo.kimai.org`
