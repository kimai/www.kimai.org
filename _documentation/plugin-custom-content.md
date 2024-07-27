---
title: Custom content
description: Add custom content to your Kimai installation
---

{% include plugins/custom-content.md %}  

## News page

You can edit two fields: 
- The news title is the name of the menu entry
- The content for the page (markdown is supported for formatting)

Deactivate the news: if the title is empty, the menu will be hidden.

## Alert

```markdown
That's how the **alert / warning message** looks like. You can even include _markdown_ and [links](/en/custom-content-news) !
```

## Javascript

{% include plugins/custom-javascript-examples.md %}

## CSS

{% include plugins/custom-css-examples.md %}

## Permissions

| Permission Name      | Description                                     |
|----------------------|-------------------------------------------------|
| edit_custom_content  | show the "custom content" administration screen |
| js_custom_content    | edit the additional javascript                  |
| css_custom_content   | edit the additional stylesheet                  |
| alert_custom_content | edit the page wide warning message              |
| news_custom_content  | edit the additional news page                   |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include snippets/store-howto-permissions.md %}
