---
title: Impersonate a user
description: How to impersonate a user and test permissions
---

When working on [user roles]({% link _documentation/users.md %}), [permissions]({% link _documentation/permissions.md %}) or 
[teams]({% link _documentation/teams.md %}), you might want to test the outcome without creating new users.

This can be done by `impersonating` a user, which means you switch to a real existing account.

As this feature is potentially dangerous, it is deactivated and needs configuration file changes to activate it.

## Activate 

You need to adjust the application firewall and user role settings. Open the file `config/packages/security.yaml` and 
add the following line to the `secured_area` firewall:
```
switch_user: true
``` 

It must look like this:

```yaml
security:
    # ...
    firewalls:
        dev:
            # ...
        secured_area:
            # ...
            switch_user: true
            # ...
``` 

This activates the feature. Now adjust the super admin role, so it has the special role `ROLE_ALLOWED_TO_SWITCH`:
 
```yaml
security:
    # ...
    role_hierarchy:
        ROLE_SUPER_ADMIN: [ROLE_ADMIN, ROLE_ALLOWED_TO_SWITCH]
```

Finally refresh your cache:
{% include cache-refresh.html %}

To switch to another user, add a query string with the `_switch_user` parameter and the username as the value to the current URL (you must 
be logged-in as a super admin to use this feature):

```
https://example.com/en/dashboard/?_switch_user=anna_admin
```

To switch back to the original user, use the special `_exit` username:

```
https://example.com/en/dashboard/?_switch_user=_exit
```
 
To deactivate the feature again, simply revert your config changes and refresh the application cache again:

{% include cache-refresh.html %} 

## See also

- [Symfony documentation](https://symfony.com/doc/current/security/impersonating_user.html)
