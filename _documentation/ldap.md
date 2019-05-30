---
title: LDAP
description: How to use an LDAP directory server with Kimai 2
toc: true
since_version: 1.0
---

Kimai supports connecting with your companies directory server (LDAP or AD).

## Configuration

If you want to activate LDAP sync, you have to activate it by adjusting your [local.yaml]({% link _documentation/configurations.md %}).

This is the full available configuration, with some examples and all optional settings commented:

```yaml
kimai:
    ldap:
        active: true  # default: false
        
        connection:
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
            baseDn: ou=users, dc=kimai, dc=org
            #filter: (&(ObjectClass=Person))
            #usernameAttribute: uid

            # Mapping LDAP attributes to user entity
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                #- { ldap_attr: mail, user_method: setEmail }
                #- { ldap_attr: cn, user_method: setAlias }
                #- { ldap_attr: gidnumber, user_method: addLdapGroup }
                #- { ldap_attr: memberof, user_method: addLdapGroup }

            # Mapping LDAP groups to Kimai roles
            #groups:
            #    - { ldap_value: 'cn=group1,ou=groups,dc=kimai,dc=org', role: ROLE_TEAMLEAD }
            #    - { ldap_value: 'cn=group2,ou=groups,dc=kimai,dc=org', role: ROLE_SUPER_ADMIN }
            #    - { ldap_value: 501, role: ROLE_ADMIN }
``` 

Kimai uses the Zend Framework LDAP module and passes the `connection` without modification to its options. 
Find out more about the settings in the [detailed documentation](https://docs.zendframework.com/zend-ldap/api/). 

Internally Kimai uses the [FR3DLdapBundle](https://github.com/Maks3w/FR3DLdapBundle) - Kudos to @Maks3w!

## User synchronization

User data is synchronized on each login, fetching the latest data from your LDAP.

**How it works**

There are two steps involved:
- the login is performed by a `bind`
- if the `bind` was successful a search is executed and the attributes are synced from the LDAP resultset to the Kimai profile

If a configured attribute does not exist in the LDAP result, it will be ignored.

**Passwords are not stored**

Obviously Kimai does not store the users password when logged-in via LDAP.
There is no fallback mechanism, if your LDAP is not available, the user will not be able to login.

But: the user can change the internal password either via the user profile or via [forgot password]({% link _documentation/users.md %}).
This manually chosen password will not be overwritten.  

**DN caching**

On the first successful bind, Kimai stores the users DN. On subsequent logins, Kimai will first 
lookup the username in its database and use the cached DN for the `bind`.

If the users `dn` changed for some reason, the user will not be able to login and you have to delete the cached `dn`.

Find it with:
```sql
SELECT pref.* FROM kimai2_user_preferences pref 
JOIN kimai2_users user ON pref.user_id = user.id 
WHERE user.username = 'foo' AND pref.name = 'ldap.dn'
```

### User attributes

Kimai does not rely on an `objectClass`, but maps single LDAP attributes to the User entity by configuration.

{% include alert.html type="warning" alert="You need to configure the attributes in lower-case, otherwise they won't be processed." %}

An example could look like this:

```yaml
kimai:
    ldap:
        user:
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                - { ldap_attr: mail, user_method: setEmail }
                - { ldap_attr: cn, user_method: setAlias }
                - { ldap_attr: memberof, user_method: addLdapGroup }
```

This will tell Kimai to sync the following fields:
- `uid` will be the username in Kimai (will fail with a 500 if not unique)
- `mail` will be the account email address (read "known limitations" below)
- `cn` will be used for the display name in Kimai
- `memberof` all results will be converted to Kimai roles (`addLdapGroup` accepts scalar and array results) 

#### Known limitation: email address

Kimai requires that every user account has an email address.
If you do not configure an attribute for email, the username will be used as fallback for the email during the initial import of the user account.

This will lead to problems, when you try to update a user profile in Kimai - you will see an error stating 
that the email is not valid, even if you only tried to change the user roles.

- Bad solution: change the users email address manually, it will not be overwritten
- Good solution: sync the users email address to Kimai

#### Known limitation: manual profile changes will be overwritten

As all configured user attributes will be synchronized on every login, manual profile changes 
in the internal user database won't be permanent. 

But: fields which are not synced, won't be changed during the user login.

### Groups / Roles import

Kimai supports two ways to map LDAP groups to [user roles]({% link _documentation/users.md %}).

- You can either link a single attribute like the `gidNumber` to a Kimai role
- Or you can use the `memberof` (Reverse Group Membership) overlay in the operational attributes of OpenLDAP

It works like this: 
- you configure attributes which will be used to identify the LDAP groups
- these results will be converted to Kimai roles

{% include alert.html type="warning" alert="Every user automatically owns the ROLE_USER role." %}

An example config could look like this:
```yaml
kimai:
    ldap:
        user:
            attributes:
                - { ldap_attr: gidnumber, user_method: addLdapGroup }
                - { ldap_attr: memberof, user_method: addLdapGroup }
            groups:
                - { ldap_value: 'cn=group1,ou=groups,dc=kimai,dc=org', role: ROLE_TEAMLEAD }
                - { ldap_value: 'cn=group2,ou=groups,dc=kimai,dc=org', role: ROLE_SUPER_ADMIN }
                - { ldap_value: 501, role: ROLE_ADMIN }
```

Now we assume the following (stripped) LDIF:

```
dn: uid=foo,ou=users,dc=kimai,dc=org
objectClass: inetOrgPerson
cn: Foo
sn: Foo Bar
memberOf: cn=group10,ou=groups,dc=kimai,dc=org
memberOf: cn=group2,ou=groups,dc=kimai,dc=org
structuralObjectClass: inetOrgPerson
uid: foo
gidNumber: 503
```

Kimai looks at the attributes `gidnumber` and `memberof` and finds the following values:
- `cn=group10,ou=groups,dc=kimai,dc=org`
- `cn=group2,ou=groups,dc=kimai,dc=org`
- `503`

Then it looks up the `groups` configuration and tries to match each of the found values against 
the configured value-role mapping.

Only the value `cn=group2,ou=groups,dc=kimai,dc=org` results in a match, the other values will be ignored.
The user will have the Kimai role `ROLE_SUPER_ADMIN`.

#### Known limitation: manual role changes will be overwritten 

If you configured the group sync, all Kimai roles will be overwritten on login.

As the roles are resetted and replaced with the LDAP groups during authentication, 
you cannot demote or promote a User permanently to another role in Kimai.

The rule is: either manage all roles in Kimai or in LDAP, mixing is not possible.

## Examples

### Local OpenLDAP

A local OpenLDAP with roles sync via `memberof` overlay and additional `gidNumber` support for the objectClass `inetOrgPerson`:

```yaml
kimai:
    ldap:
        active: true
        connection:
            bindRequiresDn: true
        user:
            baseDn: ou=users, dc=kimai, dc=org
            usernameAttribute: uid
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                - { ldap_attr: cn, user_method: setAlias }
                - { ldap_attr: mail, user_method: setEmail }
                - { ldap_attr: gidnumber, user_method: addLdapGroup }
                - { ldap_attr: memberof, user_method: addLdapGroup }
            groups:
                - { ldap_value: 'cn=group1,ou=groups,dc=kimai,dc=org', role: ROLE_TEAMLEAD }
                - { ldap_value: 'cn=group2,ou=groups,dc=kimai,dc=org', role: ROLE_SUPER_ADMIN }
                - { ldap_value: 501, role: ROLE_ADMIN }
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

{% include alert.html type="warning" alert="I have never worked with AD and don't know anything about it. Please contact me at GitHub if you want or already use Kimai, I'd like to add more examples here." %}
