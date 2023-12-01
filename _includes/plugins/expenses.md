
- Record all your expenses and show them in a table view
    - The data can be searched- and filtered (see screenshots)
- All (billable) expenses will be automatically included in your invoices
    - Negative amounts allow for complex bookings, budget and invoice adjustments
- Manage expenses via API
- Export expenses in: Excel, PDF, HTML
- Support for custom-fields
- Include expenses in Kimai export module
- Import expenses from Kimai 1

Expenses will be assigned to free configurable categories and each category has:
- name
- visibility flag
- default cost
- color
- help text (will be shown when creating an expense)
- description (will be copied into the expense description upon selection)

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

If turned on, Expenses count towards budgets and revenue statistics.

Expense summaries are displayed on the detail pages for customer, project and activity.
