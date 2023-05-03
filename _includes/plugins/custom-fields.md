
You can create as many fields as you want for each data type, where each field:

- is either optional or mandatory
- can be restricted to users with certain permissions or roles
- can be described with a name and help text
- has a maximum length of 65535 character

The custom-field data is then available in:

- Data-tables will display all visible fields
- Exports (HTML and Spreadsheets include all visible fields)
- Timesheet exports (include visible timesheet fields)
- API (collections and entities)
- Invoice templates (custom templates have access to all fields)

You can change the "weight" of custom-fields, so they show up in the order you define.

Be aware:

- Sensitive data can be configured as "invisible", so it will not show up in the previously mentioned places
- Weekly-hours does NOT support custom fields
- User preferences (custom fields for users) are not exported by the API (this is a limitation in the core application)
- User preferences have a maximum length of 250 character
