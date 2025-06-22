---
title: Customer
description: Customers in Kimai
---

Customers in Kimai are used to manage project and activities, which are then used for time-records.

The customer administration can be found at `Administration > Customers`.

{% alert info %}It is best-practice to have a customer for your own company, to track times for administrative and other internal work.{% endalert %}
 
## Create a customer

Default values for new customers can be configured at [System > Settings]({% link _documentation/configurations.md %}). 

## Manage customers

### Colors

Each customer can be assigned its own color, for easier identification in timesheet listing.

If a project or an activity linked to the customer does not have its own color, the customers color will be used.
The default color code is `#d2d6de`.

### Currency

The customer currency is used when displaying the recorded entries in the timesheet.

It is also used for printing invoices, which is the reason while the invoice screen needs one applied customer filter 
before any data will be shown. 

### Billable

{% include snippets/billable.md entity="Customer" %}

### Budgets

{% include snippets/budgets.md permission="customer" %} 

### Prices

{% include snippets/rates.md permission="customer" %} 

### Visibility

By toggling the visibility on a customer, you:
- hide the customer from all drop-downs
- hide the customer from the default list in the customer administration
- hide all projects for this customer from all drop-downs, regardless of their visibility state
- hide all projects for this customer from the default list in the projects administration
- hide the activities for all customer projects from all drop-downs, regardless of their visibility state
- hide the activities for all customer projects from the default list in the activities administration

Please note:
- all currently linked objects will still show the customer in the dropdown as pre-selected option
  - you can still change the customer on timesheet records and projects, which used it before
  - you cannot create new projects for this customer
  - you cannot create new timesheet records for this customer 
- you can still access the hidden entries by changing the visibility filter on the toolbars

The visibility filter in the toolbar has three state: 
- Visible: Yes (all customers that are visible)
- Visible: No (all customers that are invisible)
- Visible "empty" (all customers, not filtering on their visibility)

### Access permissions

- Accessible to all users if no teams are assigned
- If one or more teams are assigned to the customer, only member of these teams can use it

## Customer listing

{% include docs-image.html src="/images/documentation/customer-filter.webp" title="Customer toolbar filter" width="700px" %}

The **Visible** filter in the toolbar has three states:
- `Yes` - all visible customer
- `No` - all invisible customer
- `Both` - all customer

### Invisible customers

Customers can be invisible. By default, only visible customers will be shown.
But you can use the customer filter to show all or only invisible customers.

Invisible customers will be highlighted in the listing table:

{% include docs-image.html src="/images/documentation/listing-invisible-entry.webp" title="Visible and invisible customers in the customer listing" width="700px" %}

### Filter and search 

The search supports filtering by the fields:
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name` 
- `comment`
- `number`
- `contact`
- `email`
- `phone`
- `address`

{% include snippets/search-custom-field.md %}

### Delete a customer

Customers can be deleted from the `Customer listing` view.

{% alert danger %}Usually it is not a good idea to delete a customer that was used before, as all linked projects, activities and timesheets will be deleted as well. Consider to switch the visibility instead to hide it.{% endalert %}

Right-click on a row (or open the action dropdown at the end of it) to see all available actions for the selected customer.
The last action in the list is `Delete` - once you click it you wil get a feedback screen which either tells you that the
customer is unused and can be safely deleted, or it will show you quick stats of the customer and then ask you to re-assign
the attached timesheets to another customer.

## Permissions

{% include documentation/permissions.md id="customer_admin" title=true %}
{% include documentation/permissions.md id="customer_team_leader" title=true %}
{% include documentation/permissions.md id="customer_team_member" title=true howto=true %}
