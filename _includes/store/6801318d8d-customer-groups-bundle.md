CustomerGroupsBundle is for people with many customers and projects. In every project list (the "Project" field of the timesheet and timer forms, the project filters...) the customer headers become a collapsible tree:

- every customer starts closed when the list opens, showing its name, a chevron and the number of its projects
- a click on a customer opens or closes its projects
- while you type, the customers with matching projects open by themselves
- the keyboard (arrows, Enter) skips the projects of closed customers
- a list with the projects of one customer only (for example when the form already has a customer selected) shows them without the customer header

Every select list (projects, activities, customers, users, tags...) also grows down to the bottom of the window, instead of the fixed height of about six rows.

On a phone or tablet, tapping a select list opens it without the on-screen keyboard, so the list is not half covered; tap the select again while its list is open to search by typing. Mouse and pen work as before.

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/CustomerGroupsBundle/releases) into `var/plugins/CustomerGroupsBundle` and run `bin/console kimai:reload --env=prod`. Nothing to configure, nothing stored in the database. See the [README](https://github.com/6801318d8d/CustomerGroupsBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/CustomerGroupsBundle/issues).
