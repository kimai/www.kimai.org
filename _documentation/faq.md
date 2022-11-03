---
title: FAQ - Frequently asked questions
navigation: FAQ
description: Frequently asked questions for Kimai admins and users
---

## Recorded times are wrong

Please read the [user preferences documentation]({% link _documentation/user-preferences.md %}) especially the part
about **timezones**.

Don't mix it up with the system specific configuration for new customers.

## Cannot create user (already existing)

If you try to create a user and see an error message like `The email is already used` or `The username is already used` 
it is very likely, that this account was deactivated in the past. Deactivation does not remove a user from Kimai, 
it just hides it from all views and listing.

You can reactivate the account by going to the [User administration]({% link _documentation/users.md %}), open the 
search and choose the value `Both` or `No` for the search option `Active`. The resulting list will include all 
deactivated users which can be reactivated by editing them and checking the `Active` checkbox.
 
