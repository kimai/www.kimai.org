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

Make the header fixed at the screen top and remove that stickyness from the table headers (both are not possible right now):
```javascript
function stickyHeader() {
    [].slice.call(document.querySelectorAll('thead.sticky-top')).map((element) => {
        element.classList.toggle('sticky-top');
    });
    const header = document.querySelector('div.page header.navbar');
    if (!header.classList.contains('sticky-top')) {
        header.classList.toggle('sticky-top');
    }
}
document.addEventListener('kimai.initialized', stickyHeader);
document.addEventListener('kimai.reloadedContent', stickyHeader);
```

Hide the dashboard edit button (for all non super-admins only):
```javascript
document.addEventListener('kimai.initialized', function (event) {
    if (event.detail.kimai.getUser().isSuperAdmin() && document.querySelector('section.dashboard') !== null) {
        document.querySelector('.page-header').style.setProperty("display", "none", "important");
    }
});
```

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

Deactivate a certain field by ID in a modal if the current user is not an Admin or SuperAdmin:
```javascript
function deactivateField(source, selector) {
    const field = source.querySelector(selector);
    if (field !== null) { field.disabled = true; if (field.tomselect) { field.tomselect.disable(); } }
}

document.addEventListener('kimai.initialized', function(event) {
    const kimai = event.detail.kimai;
    if (!kimai.getUser().isAdmin() && !kimai.getUser().isSuperAdmin()) {
        document.addEventListener('show.bs.modal', (e) => { deactivateField(e.srcElement, '#expense_form_metaFields_status_value'); });
        deactivateField(document, '#expense_form_metaFields_status_value');
    }
});
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
