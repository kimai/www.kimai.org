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

React on global events:

```javascript
document.addEventListener('kimai.initialized', function(event) {
    alert(event.detail.kimai.getTranslation().get('confirm'));
});
```

Select an Activity e.g. to simulate a global default activity. The ID `1234` is the Activity ID to be selected (should be global).
```javascript
$('body').on('change.select2', '#timesheet_edit_form_activity', function() { setTimeout( function() { $('#timesheet_edit_form_activity').val('1234').trigger('change'); }, 200 ); });
```

Make sure that the "mark as exported" checkbox is pre-selected: 
```javascript
$('#invoice-print-form input[name=markAsExported]').prop('checked', true);
```

Set the activity description upon selection as description for the timesheet record:
```javascript
$('body').on('change.select2', '#timesheet_edit_form_activity', function() {
    const descriptionField = $('#' + $(this.form).prop('name') + '_description');
    kimai.getPlugin('api').get('/api/activities/' + $(this).val(), {}, function(data) {
        descriptionField.val(data.comment);
    });
});
```

### Alert

```markdown
That's how the **alert / warning message** looks like. You can even include _markdown_ and [links](/en/custom-content-news) !
```

### CSS / Stylesheet

{% include plugins/custom-css-examples.md %}
