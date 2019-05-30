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
        
        connection:
            # more infos about the connection params can be found at:
            # https://docs.zendframework.com/zend-ldap/api/
            host: 127.0.0.1
            #port: 389
            #useSsl: false                      # Enable SSL negotiation
            #useStartTls: false                 # Enable TLS negotiation
            #username: foo
            #password: bar
            #bindRequiresDn: false
            #baseDn: ou=users, dc=kimai, dc=org # will use "user.baseDn" if not given
            #accountFilterFormat: (&(uid=%s))   # sprintf format where %s will be the username
            #allowEmptyPassword: false
            #optReferrals: false
            #tryUsernameSplit: 
            #networkTimeout: 
            #accountCanonicalForm: 3
            #accountDomainName: HOST
            #accountDomainNameShort: HOST

        user:
            baseDn: ou=users, dc=kimai, dc=org      # baseDn to query for users
            #filter: (&(ObjectClass=Person))        # extended filter for the search for user attributes
            #usernameAttribute: uid                 # field used in the LDAP bind for the given "login username" 

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

But: with the default configuration users can change the internal password either via the user profile or via [forgot password]({% link _documentation/users.md %}).
This manually chosen password would not be overwritten by the LDAP plugin. This would allow a user to login, 
if if you removed him from LDAP. To prevent such mis-use:
- disable the [password reset]({% link _documentation/users.md %}) function
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

{% include alert.html type="danger" alert="Deactivate the user if you want to safely prevent further access. Disabling access via LDAP might not be enough, depending on your configuration." %}

**DN caching**

On the first successful bind, Kimai stores the users DN. On subsequent logins, Kimai will first 
lookup the username in its database and use the cached DN for the `bind`.

If the users `dn` changed for some reason, the user will not be able to login and you have to delete the cached `dn`:
```sql
SELECT pref.* FROM kimai2_user_preferences pref 
JOIN kimai2_users user ON pref.user_id = user.id 
WHERE user.username = 'foo' AND pref.name = 'ldap.dn'
```

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

{% include alert.html type="warning" alert="Every user automatically owns the ROLE_USER role, you don't need to map that." %}

Assuming this `role` configuration:
```yaml
kimai:
    ldap:
        role:
            baseDn: ou=groups, dc=kimai, dc=org
            #filter: (&(objectClass=groupOfNames))
            #userDnAttribute: member
            #nameAttribute: cn
            groups:
                - { ldap_value: group1, role: ROLE_TEAMLEAD }
                - { ldap_value: kimai_admin, role: ROLE_ADMIN }
                - { ldap_value: administrator, role: ROLE_SUPER_ADMIN }
```

Kimai will search the `baseDn` with the additional `filter` querying for `userDnAttribute=user['dn']` and extract the 
group names from the result-sets attribute `nameAttribute`. 

After finding a list of group names, they will be converted to Kimai roles:
- first step is to lookup in `groups`, if there is a configured mapping that matches the `ldap_value` and if so, use the `role` without further processing 
- if no mapping was found, the group name will be UPPERCASED and prefixed with `ROLE_`, so `admin` will become `ROLE_ADMIN`

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

### Local OpenLDAP

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

{% include alert.html type="warning" alert="Disclosure: I have never worked with AD, please contact me at GitHub if you want or already use Kimai - I'd like to add more examples here." %}

Internally Kimai uses the [FR3DLdapBundle](https://github.com/Maks3w/FR3DLdapBundle) - Kudos to @Maks3w!
