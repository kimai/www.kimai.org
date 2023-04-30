---
title: Custom content
description: Add custom content to your Kimai installation
---

{% include plugins/custom-content.md %}  

## Custom content page

You can edit two fields: 
- The title is the name of the menu entry
- The content for the page, markdown is supported for formatting.

If the title is empty, the menu will be hidden.
 
## Examples

### Javascript

React on global events and utilize the Kimai Javascript API:
```javascript
document.addEventListener('kimai.initialized', function(event) {
    alert(event.detail.kimai.getTranslation().get('confirm'));
});
```

Select an Activity e.g. to simulate a global default activity. The ID `1234` is the Activity ID to be selected (should be global).
```javascript
$('body').on('change.select2', '#timesheet_edit_form_activity', function() { 
    setTimeout( function() { $(this).val('1234').trigger('change'); }, 200 ); 
});
```

Make sure that the "mark as exported" checkbox in the "invoice screen" is pre-selected: 
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

Always deactivate the export checkbox:
```javascript
document.addEventListener('kimai.initialized', function(event) {
    const cb = document.querySelector('#preview_export #markAsExportedCheck');
    if (cb !== null && cb.checked) { cb.checked = false; }
});
```

Automatically login with SAML (only works if normal form login is deactivated):
```javascript
document.querySelector('body.login-page #social-login-button')?.click();
```

Expand extended timesheet settings (since 2.0 beta 3):
```javascript
document.addEventListener('show.bs.modal', (e) => { 
    e.srcElement.querySelector('#timesheet_extended_settings a[data-bs-toggle]')?.click(); 
});
```

### Alert

```markdown
That's how the **alert / warning message** looks like. You can even include _markdown_ and [links](/en/custom-content-news) !
```

### CSS / Stylesheet

{% include plugins/custom-css-examples.md %}

## Permissions

| Permission Name      | Description                                     |
|----------------------|-------------------------------------------------|
| edit_custom_content  | show the "custom content" administration screen |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
