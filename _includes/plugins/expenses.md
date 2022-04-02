
- Record all your expenses and show them in a table view
    - The data can be searched- and filtered (see screenshots)
- All (billable) expenses will be automatically included in your invoices
    - Negative amounts allow for complex bookings, budget and invoice adjustments
- Manage expenses via API
- Export expenses in: Excel, PDF, HTML
- Support for custom-fields (see [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %}))
- Include expenses in Kimai export module
- Import expenses from Kimai 1

Expenses will be assigned to free configurable categories and each category has:
- name
- visibility flag
- default cost

Each expense has the following fields:
- a date-time
- category (see above)
- user
- project (and customer)
- activity (optional)
- description (free text field)
- the cost (can be hidden for default user, if you use default cost via category)
- an amount (see it as multiplier, use 1 if you want to charge the cost only)
- a billable flag (non-billable expenses will not be added to your invoices)
- an export flag (to make sure, that each expense will be invoiced only once)

## Permissions

| Permission Name            | Description                                                                                                |
|----------------------------|------------------------------------------------------------------------------------------------------------|
| `view_expense`             | allows access to the expenses screen                                                                       |
| `edit_expense`             | edit existing expenses                                                                                     |
| `edit_expense_cost`        | edit the cost of a single expense (deactivate this, if you want to provide default costs via the category) |
| `export_expense`           | export expenses                                                                                            |
| `create_expense`           | create new expenses                                                                                        |
| `delete_expense`           | delete existing expenses                                                                                   |
| `manage_expense_category`  | manage expense types                                                                                       | 
| `edit_exported_expense`    | allow to edit and delete exported expenses                                                                 | 
{: .table }

Pre-defined permissions are assigned to all default user roles.

The following restrictions are in place for accessing other user's data:
- can only be seen by users who own the `view_other_timesheet`
- users that own the `view_expense` permission but NOT `view_other_timesheet` will only see own expenses
- the visible data for non-admin users (permission `view_all_data`) is limited by team assignments

{% include store-howto-permissions.md %}
