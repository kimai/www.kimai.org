
You can create as many fields as you want for each data type, where each field:

- is either optional or mandatory
- has its own visibility, so the access can be restricted:
    - to certain customer/project/activity combinations (eg. a "location" field will only be shown for customer X and project Y)
    - to users with certain permissions or roles
- can be described with a name and help text
- has a maximum length of 255 character

The custom-field data is then available in:

- Data-tables will display all visible fields
- Exports (HTML and Spreadsheets include all visible fields)
- Timesheet exports (include visible timesheet fields)
- API (collections and entities)
- Invoice templates (custom templates have access to all fields)

You can change the "weight" of custom-fields, so they show up in the order you define.

Be aware:

- Restricted fields won't be visible on the create forms, as Kimai initially can't know if the rule will apply: in these cases the fields will only be shown in the edit forms
- Sensitive data can be configured as "invisible", so it will not show up in the above mentioned places
- Custom fields for users are not exported via the API (this is a limitation in the core application)
