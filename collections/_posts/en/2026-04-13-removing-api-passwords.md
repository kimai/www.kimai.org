---
title: "API passwords will be removed - switch to API tokens now"
date: "2026-04-13 12:00:00 +0200"
image: /images/blog/sunset-api-passwords.webp
author: kevinpapst
tags: [general]
excerpt: "Kimai integrations must switch from custom 'X-AUTH-*' headers to the industry standard 'Authorization: Bearer' header before July 2026."
---

On 07 April 2024, we [introduced API tokens]({% link _changelogs/2024-04-07-cloud-update-104.md %}) in Kimai and deprecated API passwords.

Since then, both authentication methods have remained available to give administrators, users, and integration maintainers enough time to migrate.
That transition period is now coming to an end.

## API passwords will be removed after Q2 2026

Support for API passwords will be removed after **Q2 2026**, which means **no later than July 2026**.

If you are still using API passwords in scripts, tools, plugins, or custom integrations, you should update them now.

After the removal, API requests using the old authentication method will no longer work.

## Who is affected?

This change affects everyone who still connects to the Kimai API with the old `X-AUTH-*` headers, for example in:

- custom scripts
- internal tools
- desktop or mobile apps
- automation platforms
- external services
- customer-specific integrations

It is especially relevant for administrators of self-hosted Kimai instances and technical contacts managing integrations for larger teams.

## What changed?

Previously, Kimai API requests were authenticated with **two custom headers**:

```text
X-AUTH-USER: your-username-or-email
X-AUTH-TOKEN: your-api-password
```

The API password had to be configured in the user profile.

You can still find that authentication method in the [older documentation]({% link _docu_versioned/2.13.0/rest-api.md %}).

Today, Kimai uses the standard **Bearer token** authentication with a single header:

```text
Authorization: Bearer xyz
```

Here, `xyz` is the API token generated for the account.

See the [current documentation]({% link _documentation/developer/rest-api.md %}).

## What will stop working?

Once support for API passwords is removed, integrations using this old format will no longer authenticate:

```text
X-AUTH-USER: your-username-or-email
X-AUTH-TOKEN: your-api-password
```

To continue working, they must be changed to:

```text
Authorization: Bearer your-api-token
```

## Why you should migrate now

Migrating now helps you avoid broken integrations once support for API passwords is removed.

API tokens are the modern authentication method in Kimai and offer a cleaner setup:

- one standard header instead of two custom headers
- multiple tokens per user
- optional expiration dates
- better control and visibility

## What administrators and support teams should do now

Please review all places where your Kimai API is used and identify integrations that still rely on API passwords.

Then:

1. update centrally managed integrations to use `Authorization: Bearer`
2. inform affected users and teams about the upcoming removal
3. ask users to create API tokens in their profile where required
4. test all critical integrations before the deadline

## What your users need to do

Each user can generate API tokens in their Kimai user profile.

After creating a token, the integration they use must be updated and the new token must be added there instead of the old API password.

Many apps should already support API tokens, while older scripts and custom integrations may need to be adapted.

## What to communicate to your users

If you support Kimai users in your organization, the message is simple:

- API passwords are deprecated and will be removed after Q2 2026
- old integrations using `X-AUTH-USER` and `X-AUTH-TOKEN` must be updated
- users should create API tokens in their profile
- integrations should use `Authorization: Bearer`

## Need help?

Please check the [current API documentation]({% link _documentation/developer/rest-api.md %}) first.

If you maintain an integration for Kimai and are unsure how to migrate, feel free to get in touch.

Thanks for updating your integrations in time.
