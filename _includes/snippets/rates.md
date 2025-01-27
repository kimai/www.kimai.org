You can configure prices on different levels in Kimai. It starts from the user hourly prices and goes from [Customers]({% link _documentation/customer.md %}) to
[Projects]({% link _documentation/project.md %}) and [Activities]({% link _documentation/activity.md %}).
Please read the [price documentation]({% link _documentation/configurations.md %}) to find out more how rates are calculated. 

On the detail page of the selected item (which you find by clicking a row in the listing table or select `Show` from the dropdown menu) 
you find the `Hourly price` section. By default, you see the message `No prices have been configured`.

{% include docs-image.html src="/images/documentation/rates-section.webp" title="Price section table" width="700px" %}

You configure new price rules by clicking the `+` button in the upper-right of the `Prices` table.

A user needs the two permissions to be able to see and edit prices: 
- one of: `view_{{include.permission}}`, `view_team_{{include.permission}}`, `view_teamlead_{{include.permission}}` 
- one of: `edit_{{include.permission}}`, `edit_team_{{include.permission}}`, `edit_teamlead_{{include.permission}}`

### Edit price screen

The `edit price` screen has four settings:

{% include docs-image.html src="/images/documentation/rates-edit.webp" title="Edit price screen" width="700px" %}

- `User` - the user this price applies to - if no user is chosen it applies to everyone without explicit personal rule  
- `Price` - the price to be charged (per hour)
- `Internal price` - the internal price (or "costs" if you will) to apply (per hour); if this is not specified, the normal price is used for calculation.
- `Fixed price` - if this is ticked, each time record gets the configured `Price` value applied, regardless of the record duration

**Catch-all price**  

If no user was chosen, this rule applies to every user, except those who have a explicit `User specific price` configured.

**User specific price**  

Every rule the defines a user is a `user specific price` and those always win over `Catch-all price` configurations.

### Pricing example

The following example contains two price rules:

{% include docs-image.html src="/images/documentation/rates-example.webp" title="A sample rates configuration" width="900px" %}

The first one is a `Catch-all price` that applies to everyone who is recording times for this {{include.permission}}. 
So every hour counts with 50 € towards the budget of this {{include.permission}} and has internal costs of 25 €.
Every recorded hour has a gross margin of 25 € / hour.

The second rule applies to the user `DY` who (as only user) has a `User specific price` for this {{include.permission}}.
Even though she has a higher internal cost of 45 € / hour, her work earns 85 € / hour, which leads to a gross margin of 40 € / hour.
