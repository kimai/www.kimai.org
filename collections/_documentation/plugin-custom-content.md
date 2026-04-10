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
That's how the **alert / warning message** looks like. You can even include _markdown_ and [links](https://www.example.com) !
```

## Javascript

{% include plugins/custom-javascript-examples.md %}

## CSS

{% include plugins/custom-css-examples.md %}

## Permissions

{% include documentation/permissions.md id="custom_content" howto=true super_admin=true %}
