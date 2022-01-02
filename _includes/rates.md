You can configure rates on different levels in Kimai. It starts from the user hourly rate and goes from [Customers]({% link _documentation/customer.md %}) to
[Projects]({% link _documentation/project.md %}) and [Activities]({% link _documentation/activity.md %}).
Please read the [rates documentation]({% link _documentation/configurations.md %}) to find out more how rates are calculated. 

On the detail page of the selected item (which you find by clicking a row in the listing table or select `Show` from the dropdown menu) 
you find the `Hourly rate` section. By default, you see the message `No hourly rates have yet been configured`.

![The rates section table](/images/documentation/rates-section.png)

You configure new rate rules by clicking the `+` button in the upper-right of the `Hourly rates` table.

A user needs the two permissions to be able to see and edit rates: 
- one of: `view_{{include.permission}}`, `view_team_{{include.permission}}`, `view_teamlead_{{include.permission}}` 
- one of: `edit_{{include.permission}}`, `edit_team_{{include.permission}}`, `edit_teamlead_{{include.permission}}`

### Edit rate screen

The `edit rate` screen has four settings:

![The edit rates screen](/images/documentation/rates-edit.png)

- `User` - the user this rate applies to - if no user is chosen it applies to everyone without explicit personal rule  
- `Rate` - the rate to be charged (per hour)
- `Internal rate` - the internal rate (or "costs" if you will) to apply (per hour); if this is not specified, the normal rate is used for calculation.
- `Fixed rate` - if this is ticked, each time record gets the configured `Rate` value applied, regardless of the record duration

**Catch-all rate**  

If no user was chosen, this rule applies to every user, except those who have a explicit `User specific rate` configured.

**User specific rate**  

Every rule the defines a user is a `user specific rate` and those always win over `Catch-all rate` configurations.

### Rates example

The following example contains two rate rules:

![A sample rates configuration](/images/documentation/rates-example.png)

The first one is a `Catch-all rate` that applies to everyone who is recording times for this {{include.permission}}. 
So every hour counts with 50 € towards the budget of this {{include.permission}} and has internal costs of 25 €.
Every recorded hour has a gross margin of 25 € / hour.

The second rule applies to the user `Susan Super` who (as only user) has a `User specific rate` for this {{include.permission}}.
Even though she has a higher internal cost of 45 € / hour, her work earns 85 € / hour, which leads to a gross margin of 40 € / hour.
