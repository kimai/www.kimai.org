---
title: Translation
description: Replace translations in Kimai with your own wording
---

{% include plugins/translation.md %}  

### How to use it

When clicking the create button, you see a form that contains the fields:

- Language
- Default translation
- New translation

With `Language` you choose the target language, which is usually the current active one.

The `default translation` allows you to search for a given phrase, which you then translate in the field `New translation`.

** ATTENTION** 
The default translation is shown in the current user locale (see the URL of the page). 
If there is no translation for the exact locale (e.g. `de_AT`) the english translation is used instead.
You might want to switch your language via the URL to the base language with region code (so `de` instead of `de_AT`). 

The `new translation` contains the translation that you want to display in the future.
The same locale logic applies as written above. If you create a translation in `de_AT` it will not be displayed in `de`.
But if you create a translation in `de`, your new translation will also be visible in `de_AT`.

### Screenshots

The main translation page shows a listing of all translated contents, grouped by their language:

{% include docs-image.html src="/images/marketplace/translation-listing.webp" title="List all adjusted translations" width="1200px" %}

The add dialog allows to find a string by typing in the `Default translation` field and then you can enter your custom translation in `New translation`:

{% include docs-image.html src="/images/marketplace/translation-add.webp" title="Select the text to change and enter your custom translation" width="800px" %}

The edit dialog allows to change your custom translation:

{% include docs-image.html src="/images/marketplace/translation-edit.webp" title="Change your custom translation" width="800px" %}

## Permissions

| Permission Name     | Description                                                                               |
|---------------------|-------------------------------------------------------------------------------------------|
| edit_translation    | access the translation screen and allow all actions: create, edit and delete translations |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
