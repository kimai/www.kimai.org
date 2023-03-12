---
title: Translation
description: Replace translations in Kimai with your own wording
---

{% include plugins/translation.md %}  

### Screenshots

The main translation page show a listing of all translated contents, grouped by their language:

{% include docs-image.html src="/images/marketplace/translation-listing.png" title="List all adjusted translations" width="1200px" %}

The add dialog allows to find a string by typing in the `Default translation` field and then you can enter your custom translation in `New translation`:

{% include docs-image.html src="/images/marketplace/translation-add.png" title="Select the text to change and enter your custom translation" width="800px" %}

The edit dialog allows to change your custom translation:

{% include docs-image.html src="/images/marketplace/translation-edit.png" title="Change your custom translation" width="800px" %}

## Permissions

| Permission Name     | Description                                                                               |
|---------------------|-------------------------------------------------------------------------------------------|
| edit_translation    | access the translation screen and allow all actions: create, edit and delete translations |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}

