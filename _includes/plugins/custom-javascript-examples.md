
**Make your tables horizontal scrollable if they are too wide**

```javascript
function scrollableTable() {
    [].slice.call(document.querySelectorAll('div.dataTables_wrapper')).map((element) => {
        element.style.overflowX = 'scroll';
    });
}
document.addEventListener('kimai.initialized', scrollableTable);
document.addEventListener('kimai.reloadedContent', scrollableTable);
```

**Remove activity from the timesheet form**

You have to create one global activity and grab the ID from the URL, replace `1` in the code with your new ID:

```javascript
document.addEventListener('show.bs.modal', (e) => {
    const activity = e.srcElement.querySelector('#timesheet_edit_form_activity');
    if (activity !== null) {
        activity.value = '1'; /* insert you ID here */
        activity.dispatchEvent(new Event('change', { bubbles: true }));
        const activityRow = e.srcElement.querySelector('.timesheet_edit_form_row_activity');
        if (activityRow !== null && !activityRow.classList.contains('d-none')) {
            activityRow.classList.add('d-none');
        }
    }
});
```

**Make the header fixed at the screen top** 

And remove that stickyness from the table headers, both at the same time are currently not possible.

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

**Show the dashboard edit button only for super-admins**

```javascript
document.addEventListener('kimai.initialized', function (event) {
    if (event.detail.kimai.getUser().isSuperAdmin() && document.querySelector('section.dashboard') !== null) {
        document.querySelector('.page-header').style.setProperty("display", "none", "important");
    }
});
```

**React on global events and utilize the Kimai Javascript API**

```javascript
document.addEventListener('kimai.initialized', function(event) {
    alert(event.detail.kimai.getTranslation().get('confirm'));
});
```

**Select an Activity e.g. to simulate a global default activity**

The ID `1` is the Activity ID to be selected (should be global).

```javascript
document.addEventListener('show.bs.modal', (e) => {
    const activity = e.srcElement.querySelector('#timesheet_edit_form_activity');
    if (activity !== null) {
        activity.value = '1'; /* Insert your ID here */ 
        activity.dispatchEvent(new Event('change', { bubbles: true }));
    }
});
```

**Set "activity description" upon selection as "timesheet description"**

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

**Make the timesheet description field mandatory**

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

**Always deactivate the export checkbox**

```javascript
document.addEventListener('kimai.initialized', function(event) {
    const ec = document.getElementById('markAsExportedCheck');
    if (ec !== null && ec.checked) { ec.checked = false; document.getElementById('markAsExported').value = 0; }
});
```

**Deactivate a certain field by ID in a modal if the current user is not an Admin or SuperAdmin**

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

**Automatically login with SAML**

```javascript
document.querySelector('body.login-page #social-login-button')?.click();
```

**Always expand extended timesheet settings**

```javascript
document.addEventListener('show.bs.modal', (e) => { 
    e.srcElement.querySelector('#timesheet_extended_settings button[data-bs-toggle]')?.click(); 
});
```

**Always set a static time in the timesheet screen**

```javascript
document.addEventListener('show.bs.modal', (e) => {
    const time = e.srcElement.querySelector('#timesheet_edit_form_begin_time');
    if (time !== null) { time.value = '01:00'; }
});
```
 
**Set a custom browser title**

```javascript
document.title = document.body.attributes['data-title'].value = 'My fancy company';

```

**Add IDs to all H3 header of your custom news page**

Allowing to use jump anchor links.

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

**Mandatory tags field**

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

**Add a button to the "create timesheet" UI to select a customer on click** 

Note: change the `'1'` to an existing customer ID

```javascript
document.addEventListener('show.bs.modal', function () {
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
}); 
```

**Show activity custom-field beneath field upon selection**

```javascript
document.addEventListener('show.bs.modal', (e) => {
    const customFieldName = 'foo';
    const activitySelect = e.srcElement.querySelector('#timesheet_edit_form_activity');
    if (activitySelect === null) {
        return;
    }

    activitySelect.addEventListener('change', (e) => {
        kimai.getPlugin('api').get('/api/activities/' + e.target.value, {}, function(data) {
            let newContent = null;
            for (const f of data.metaFields) {
                if (f.name === customFieldName && f.value !== '') {
                    newContent = f.value;
                }
            }

            const activityTextId = 'timesheet_edit_form_activity_' + customFieldName;
            let activityText = document.getElementById(activityTextId);

            if (newContent === null) {
                if (activityText !== null) {
                    activityText.parentElement.remove();
                }
                return;
            }
            
            if (activityText === null) {
                const rowSelect = activitySelect.parentElement;

                const box = document.createElement('div');
                box.classList.add('mt-2');

                const hint = document.createElement('span');
                hint.textContent = 'Foo:';
                hint.classList.add('me-2');

                activityText = document.createElement('span');
                activityText.id = activityTextId;

                box.appendChild(hint);
                box.appendChild(activityText);
                rowSelect.appendChild(box);
            }
            
            activityText.textContent = newContent; 
        });
    });
});
```

**Timesheet custom-field list depends on customer selection**

This advanced example uses two custom field, one on customer level and one on timesheet level.
Upon customer selection, the custom-field in the timesheet changes and show the list of entries from the customer as selection.

1. Create a custom field for customer with the internal name `foo` and the type being "Text (multi row)"
2. Edit a customer and add at least two rows to the new custom field "foo" with some string in each row, e.g. "hello" and "world"
3. Now add a custom field for timesheet with the internal name `foo_data` with type "Text (single row)"

```javascript
document.addEventListener('show.bs.modal', (e) => {
    const fooInput = e.target.querySelector('#timesheet_edit_form_metaFields_foo_data_value');
    if (fooInput !== null) {
        e.target.querySelector('#timesheet_edit_form_customer').addEventListener('change', (e) => {
            const customerId = e.target.value;
            kimai.getPlugin('api').get('/api/customers/' + customerId, {}, function(data) {
                let value = null;
                for (const entry of data.metaFields) {
                    if (entry.name === "foo") {
                        value = entry.value;
                        break;
                    }
                }

                // make sure that we remove the currently attached list from the input
                fooInput.removeAttribute('list');

                if (value === null || value === '') {
                    return;
                }

                // prepare the datalist element
                const listId = 'list_foo_' + customerId;
                const dataList = document.createElement('datalist');
                dataList.id = listId;

                const lines = value.split(/\r?\n/);
                lines.forEach(line => {
                    const option = document.createElement("option");
                    option.value = line.trim();
                    if (option.value) {
                        dataList.appendChild(option);
                    }
                    // in case a users switches the customer back and forth, the element might already exist in DOM
                    if (document.getElementById(listId) !== null) {
                        document.getElementById(listId).replaceWith(dataList)
                    } else {
                        fooInput.parentElement.appendChild(dataList)
                    }
                });

                // switch the list attribute to use the list of the last selected customer
                fooInput.setAttribute('list', listId);
            });
        });
    }
});
```
