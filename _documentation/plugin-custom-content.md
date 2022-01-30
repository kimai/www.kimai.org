---
title: Custom content
description: Add custom content to your Kimai installation
toc: true
---

{% include plugins/custom-content.md %}  

## Custom content page

You can edit two fields: 
- The title is the name of the menu entry
- The content for the page, markdown is supported for formatting.

If the title is empty, the menu will be hidden.
 
## Examples

### Javascript

```javascript
document.addEventListener('kimai.initialized', function(event) {
    alert(event.detail.kimai.getTranslation().get('confirm'));
});
```

### Alert

```markdown
That's how the **alert / warning message** looks like. You can even include _markdown_ and [links](/en/custom-content-news) !
```

### CSS / Stylesheet

{% include plugins/custom-css-examples.md %}
