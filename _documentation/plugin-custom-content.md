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

Select an Activity e.g. to simulate a global default activity. The ID `6451` is the Activity ID to be selected (should be global).
```javascript
document.addEventListener('show.bs.modal', (e) => {
    const activity = e.srcElement.querySelector('#timesheet_edit_form_activity');
    if (activity !== null) {
        activity.value = '6451'; 
        activity.dispatchEvent(new Event('change'));
    }
});
```

Set the "activity description" upon selection as "timesheet description":
```javascript
document.addEventListener('show.bs.modal', (e) => {
    const desc = e.srcElement.querySelector('#timesheet_edit_form_description');
    if (desc !== null) {
        e.srcElement.querySelector('#timesheet_edit_form_activity').addEventListener('change', (e) => {
            kimai.getPlugin('api').get('/api/activities/' + e.target.value, {}, function(data) {
                desc.value = data.comment;
            });
        });
    }
});
```

Always deactivate the export checkbox:
```javascript
document.addEventListener('kimai.initialized', function(event) {
    const cb = document.querySelector('#preview_export #markAsExportedCheck');
    if (cb !== null && cb.checked) { cb.checked = false; }
});
```

Deactivate a certain field by ID in a modal:
```javascript
function deactivateField(source) {
    const field = source.querySelector('#expense_form_metaFields_status_value');
    if (field !== null) { field.disabled = true; if (field.tomselect) { field.tomselect.disable(); } }
}
document.addEventListener('show.bs.modal', (e) => { deactivateField(e.srcElement); });
deactivateField(document);
```

Automatically login with SAML:
```javascript
document.querySelector('body.login-page #social-login-button')?.click();
```

Always expand extended timesheet settings:
```javascript
document.addEventListener('show.bs.modal', (e) => { 
    e.srcElement.querySelector('#timesheet_extended_settings a[data-bs-toggle]')?.click(); 
});
```

Always set a static time in the timesheet screen:
```javascript
document.addEventListener('show.bs.modal', (e) => {
    const time = e.srcElement.querySelector('#timesheet_edit_form_begin_time');
    if (time !== null) { time.value = '01:00'; }
});
```

Set a custom browser title: 
```javascript
document.title = 'My fancy company';
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
