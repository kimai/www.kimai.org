---
title: LDAP
description: How to use an LDAP directory server with Kimai 2
toc: true
since_version: 1.0
---

Kimai supports connecting with your companies directory server (LDAP or AD).

## Configuration

If you want to activate LDAP authentication, you have to adjust your [local.yaml]({% link _documentation/configurations.md %}).

This is the full available configuration, with some examples and all optional settings commented:

```yaml
kimai:
    ldap:
        active: true  # default: false
        
        # more infos about the connection params can be found at:
        # https://docs.zendframework.com/zend-ldap/api/
        connection:
            host: 127.0.0.1
            #port: 389
            #useSsl: false                      # Enable SSL negotiation
            #useStartTls: false                 # Enable TLS negotiation
            #username: foo
            #password: bar
            #bindRequiresDn: false
            #baseDn: ou=users, dc=kimai, dc=org # will use "user.baseDn" if not given
            #accountFilterFormat: (&(uid=%s))   # %s will be replaced with the username
            #allowEmptyPassword: false
            #optReferrals: false
            #tryUsernameSplit: 
            #networkTimeout: 
            #accountCanonicalForm: 3
            #accountDomainName: HOST
            #accountDomainNameShort: HOST

        user:
            baseDn: ou=users, dc=kimai, dc=org    # baseDn to query for users
            #filter: (&(ObjectClass=Person))      # extended search filter for users
            #usernameAttribute: uid               # field used in the LDAP bind for the given "login username" 

            # Mapping LDAP attributes to user entity
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
            #    - { ldap_attr: mail, user_method: setEmail }
            #    - { ldap_attr: cn, user_method: setAlias }

        #role:
            #baseDn: ou=groups, dc=kimai, dc=org    # baseDn to query for groups - MUST be set, if "role" is uncommented
            #filter: (&(objectClass=groupOfNames))  # additional filter to query the groups
            #nameAttribute: cn                      # the group name
            #userDnAttribute: member                # field to look in for the users dn 
            
            # Convert LDAP group name (nameAttribute) to Kimai role
            #groups:
            #    - { ldap_value: group1, role: ROLE_TEAMLEAD }
            #    - { ldap_value: kimai_admin, role: ROLE_ADMIN }
``` 

Kimai uses the Zend Framework LDAP module and uses the configured `connection` parameters without modification. 
Find out more about the settings in the [detailed documentation](https://docs.zendframework.com/zend-ldap/api/). 

## User synchronization

User data is synchronized on each login, fetching the latest data from your LDAP.

**How it works**

There are 2-3 steps involved:
- the login is performed by a `bind`
- if the `bind` was successful:
  - a `search` is executed to find and map LDAP attributes to the Kimai profile
  - if configured, another `search` is executed to sync the user groups

**Password handling**

Obviously Kimai does not store the users password when logged-in via LDAP.
There is no fallback mechanism, if your LDAP is not available, the user will not be able to login.

{% include alert.html type="danger" alert="The default configuration allows a user to change the internal password. This manually chosen password is not overwritten by the LDAP plugin and would allow a user to login, if if you removed him from LDAP." %} 

To prevent that problem:
- disable the "[Password reset]({% link _documentation/users.md %})" function
- disable the "change my own password" permission for each role:

```yaml
kimai:
    permissions:
        roles:
            ROLE_USER: ['!password_own_profile']
            ROLE_TEAMLEAD: ['!password_own_profile']
            ROLE_ADMIN: ['!password_own_profile']
```
Read more about `password_own_profile` and `password_other_profile` [permissions]({% link _documentation/permissions.md %}).

If you don't adjust your configuration, you have to deactivate users manually in Kimai.

### User attributes

Kimai does not rely on an `objectClass`, but maps single LDAP attributes to the User entity by configuration.

An example could look like this:

```yaml
kimai:
    ldap:
        user:
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                - { ldap_attr: mail, user_method: setEmail }
                - { ldap_attr: cn, user_method: setAlias }
```
{% include alert.html type="warning" alert="You need to configure the attributes in lower-case, otherwise they won't be processed." %}

This will tell Kimai to sync the following fields:
- `uid` will be the username in Kimai (will fail with a 500 if not unique)
- `mail` will be the account email address (read "known limitations" below)
- `cn` will be used for the display name in Kimai

Available methods on the User entity are: `setUsername(string)`, `setEmail(string)`, `setAlias(string)`, `setAvatar(url)`, `setTitle(string)`, `setEnabled(bool)`, `setSuperAdmin(bool)`, `addRole(string)` 

### Groups / Roles import

Kimai can use your LDAP groups and map them to [user roles]({% link _documentation/users.md %}).
If configured, it will execute another `search` against your LDAP after authentication and importing user attributes.

{% include alert.html type="warning" alert="Every user automatically owns the ROLE_USER role, you don't have to create a mapping for it." %}

Assuming this `role` configuration:
```yaml
kimai:
    ldap:
        role:
            baseDn: ou=groups, dc=kimai, dc=org
            #filter: (&(objectClass=groupOfNames))  # additional group filter
            #userDnAttribute: member                # field to lookup the users
            #nameAttribute: cn                      # group name to match
            groups:
                - { ldap_value: group1, role: ROLE_TEAMLEAD }
                - { ldap_value: kimai_admin, role: ROLE_ADMIN }
                - { ldap_value: administrator, role: ROLE_SUPER_ADMIN }
```

Kimai will search the `baseDn` with `userDnAttribute=user['dn']` (e.g. `member=uid=user1,ou=users,dc=kimai,dc=org`) and extract the 
group names from the result-sets attribute `nameAttribute`. 

After finding a list of group names, they will be converted to Kimai roles:
- first step is to lookup in `groups` mapping, if there is a match in `ldap_value` and uses the `role` value without further processing 
- if no mapping was found, the group name will be UPPERCASED and prefixed with `ROLE_` => e.g. `admin` will become `ROLE_ADMIN`

These converted names will validated and [only existing roles]({% link _documentation/users.md %}) will pass to the user profile.  

## Known limitations

There are a couple of caveats that should be taken into account.

### Missing email address

Kimai requires that every user account has an email address. If you do not configure an attribute for email, 
the username will be used as fallback for the email during the initial import of the user account.

This will lead to problems, when you try to update a user profile in Kimai - you will see an error saying
that the email is not valid, even if you only tried to change the user roles.

- Bad solution: change the users email address manually, it will not be overwritten by the sync
- Good solution: sync the users email address to Kimai

### Profile changes will be overwritten

As all configured user attributes will be synchronized on every login, manual profile changes 
in the internal user database won't be permanent. 

But: fields which are not synced, won't be changed during the user login.

### Role changes will be overwritten 

If you configured the group sync, the assigned user roles in Kimai will be overwritten on login.

As the roles are resetted and replaced with the LDAP groups during authentication, 
you cannot demote or promote a User permanently to another role in Kimai.

The rule is: either manage all roles in Kimai or in LDAP, mixing is not possible.

## Examples

{% include alert.html type="info" alert="Before you start to configure your LDAP, switch to 'dev' environment and tail 'var/log/dev.log'." %}

### Minimal OpenLDAP

A minimal setup with a local OpenLDAP without roles sync:

```yaml
    ldap:
        active: true
        connection:
            host: 127.0.0.1
            bindRequiresDn: true
        user:
            baseDn: ou=users, dc=kimai, dc=org
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                - { ldap_attr: mail, user_method: setEmail }
```

Please start with a minimal setup. Only if that works: start extending your config.

### OpenLDAP with group sync

A secured local OpenLDAP on port 543 with roles sync for the objectClass `inetOrgPerson` users:

```yaml
    ldap:
        active: true
        connection:
            host: 127.0.0.1
            port: 543
            user: kimai
            password: serverToken
            bindRequiresDn: true
            baseDn: dc=kimai, dc=org
        user:
            baseDn: ou=users, dc=kimai, dc=org
            filter: (&(objectClass=inetOrgPerson))
            usernameAttribute: uid
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                - { ldap_attr: cn, user_method: setAlias }
                - { ldap_attr: mail, user_method: setEmail }
        role:
            baseDn: ou=groups, dc=kimai, dc=org
            filter: (&(objectClass=groupOfNames)(|(cn=teamlead)(cn=manager)(cn=devops)))
            userDnAttribute: member
            groups:
                - { ldap_value: teamlead, role: ROLE_TEAMLEAD }
                - { ldap_value: manager, role: ROLE_ADMIN }
                - { ldap_value: devops, role: ROLE_SUPER_ADMIN }
```

### Connect to Active Directory

Just an example how you might be able to connect to your AD.
 
```yaml
kimai:
    ldap:
        active: true
        connection:
            host: ad.example.com
            username: user@ad.example.com
            password: secret
            accountDomainName: ad.example.com
            accountDomainNameShort: AD
        user:
            baseDn: dc=ad,dc=example,dc=com
            filter: (&(ObjectClass=Person))
            attributes:
                - { ldap_attr: samaccountname,  user_method: setUsername }
```

{% include alert.html type="warning" alert="I have never worked with AD, please contact me at GitHub if you can provide further examples." %}

The LDAP connection is based on [FR3DLdapBundle](https://github.com/Maks3w/FR3DLdapBundle), thanks to @Maks3w for sharing!
