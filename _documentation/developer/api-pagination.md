---
title: Pagination
navigation: Pagination
description: Cycle through API result data 
related:
- rest-api
---

To enhance API performance, several collection endpoints support pagination. To use this feature you have to add a `page` and a `size` parameter to the URL's query string. 

For example, the following url:
```
https://example.kimai.cloud/api/timesheets?page=2&size=10
```

This will return the second page of ten timesheets. If the `size` parameter is not provided, the API will return 50 records per page by default, unless otherwise specified.

Information on whether a given endpoint supports pagination parameters can be found in the parameter list within the swagger documentation of your API endpoints.

## Paginated responses

If the endpoint supports pagination, some metadata about the paginated collection will be returned in the response header.

```
X-Page: 3
X-Total-Count: 1142
X-Total-Pages: 23
X-Per-Page: 50
```

Here's a summary of the meaning of each of these headers:

| Header        | Description | Example |
|---------------|-------------|---------|
| X-Page        | Description | 3       |
| X-Total-Count | Description | 1142    |
| X-Total-Pages | Description | 23      |
| X-Per-Page    | Description | 50      |
{: .table }

