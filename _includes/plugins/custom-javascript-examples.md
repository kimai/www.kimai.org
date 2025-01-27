
Make your tables horizontal scrollable if they are too wide:
```javascript
function scrollableTable() {
    [].slice.call(document.querySelectorAll('div.dataTables_wrapper')).map((element) => {
        element.style.overflowX = 'scroll';
    });
}
document.addEventListener('kimai.initialized', scrollableTable);
document.addEventListener('kimai.reloadedContent', scrollableTable);
```

Remove the activity from the timesheet form.
You have to create one global activity and grab the ID from the URL, replace `5095` in the code with your new ID:
```javascript
document.addEventListener('show.bs.modal', (e) => {
    const activity = e.srcElement.querySelector('#timesheet_edit_form_activity');
    if (activity !== null) {
        activity.value = '5095'; 
        activity.dispatchEvent(new Event('change', { bubbles: true }));
        const activityRow = e.srcElement.querySelector('.timesheet_edit_form_row_activity');
        if (activityRow !== null && !activityRow.classList.contains('d-none')) {
            activityRow.classList.add('d-none');
        }
    }
});
```

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
        activity.dispatchEvent(new Event('change', { bubbles: true }));
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

Make the timesheet description field mandatory:
```javascript
document.addEventListener('show.bs.modal', (e) => {
    const desc = e.srcElement.querySelector('#timesheet_edit_form_description');
    if (desc !== null) {
        desc.required = true;
        const label = e.srcElement.querySelector('label[for=timesheet_edit_form_description]');
        if (label !== null && !label.classList.contains('required')) { label.classList.add('required'); }
    }
});
```

Always deactivate the export checkbox:
```javascript
document.addEventListener('kimai.initialized', function(event) {
    const ec = document.getElementById('markAsExportedCheck');
    if (ec !== null && ec.checked) { ec.checked = false; document.getElementById('markAsExported').value = 0; }
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
    e.srcElement.querySelector('#timesheet_extended_settings button[data-bs-toggle]')?.click(); 
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

Add IDs to all h3 header of your custom news page (allowing to use jump anchor links):
```javascript
document.addEventListener('kimai.initialized', function (event) {
    if (document.getElementById('custom-content-news') !== null) {
        const headings = document.querySelectorAll('#custom-content-news .markdown h3');
        let counter = 0;
        for (const element of headings) {
            element.id = 'news' + (++counter);
        }
    }
});
```

Make the tags field mandatory:
```javascript
document.addEventListener('show.bs.modal', (e) => {
    const field = e.srcElement.querySelector('#timesheet_edit_form_tags');
    if (field !== null) {
        field.required = true;
        const label = e.srcElement.querySelector('label[for=timesheet_edit_form_tags-ts-control]');
        if (label !== null && !label.classList.contains('required')) { label.classList.add('required'); }
    }
});
```

Change the "create timesheet" UI, add a button, select a customer on click (note: change the `'1'` to an existing customer ID): 
```
(function() { document.addEventListener('show.bs.modal', function () {
    const customerSelection = document.getElementById('timesheet_edit_form_customer');
    if (customerSelection === null) {
        return;
    }

    const rowSelect = customerSelection.parentElement;

    const box = document.createElement('div');
    box.classList.add('mt-2');

    const hint = document.createElement('span');
    hint.textContent = 'Suggestions:';
    hint.classList.add('me-2');

    const btn = document.createElement('button');
    btn.type = 'button';
    btn.classList.add('btn', 'btn-white', 'fw-normal');
    btn.textContent = 'Customer #1';
    btn.addEventListener('click', () => {
        customerSelection.value = '1'; /* insert a valid customer ID here */
        customerSelection.dispatchEvent(new Event('change', { bubbles: true }));
    });

    box.appendChild(hint);
    box.appendChild(btn);
    rowSelect.appendChild(box);
}); })();
```
