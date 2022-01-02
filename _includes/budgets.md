Budgets help you to watch your progress and to stay within contract boundaries.

If the [System > Settings]({% link _documentation/configurations.md %}) configuration `Allow overbooking of stored budgets` is not active,
Kimai will prevent that records will be created, which would go beyond your configured budgets.

Currently, the visibility of budgets cannot be limited independently. So if you want to show progress to your users, 
you cannot show only the time budget (this will be changed in the future).

The permissions `budget_team_{{include.permission}}`, `budget_teamlead_{{include.permission}}` and `budget_{{include.permission}}` are used 
to check if the logged-in user can see the budgets. 

### Budget type

Kimai knows two budget types. The default budget type is `lifetime` (which is used if the `budget type` is empty), 
the other available budget type is `monthly`.

- `Lifetime budget` - uses all records of all times to calculate progress and budget usage
- `Monthly budget` - uses all records of the selected month to calculate progress and budget usage

No matter which budget type is used, it does not influence invoice amounts. 
There is no automatism that will add a monthly budget to your invoice (you have to create [expenses]({% link _store/keleo-expenses-bundle.md %}) or time records for that).  

### Money budget

Money budgets will be used to calculate reports.

For Kimai there is no difference between money and time budgets.
If there are multiple people with a different hourly rate working on the same tasks, then money and time budget will differ in their outcome. 

Only billable records will be used to calculate the remaining budget. 

### Time budget

The time budget should be entered in the format `hh:mm` or decimal `hh.m`.

Time budgets will be used to calculate reports.

If you are using money budget and want to show progress to your users, it is a good idea to calculate the hourly rate by using `money budget / average hourly rate`. 

Only billable records will be used to calculate the remaining budget.  
