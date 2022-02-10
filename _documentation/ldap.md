---
title: LDAP
description: How to use an LDAP directory server with Kimai
toc: true
canonical: /documentation/ldap.html
redirect_from: 
  - /documentation/administrator/authenticator.html
  - /documentation/authenticator/
---

Kimai supports authentication against your company directory server (LDAP or AD).
LDAP users will be imported during the first login and their attributes and groups
updated on each following login.

## Installation

In order to use the LDAP authentication module of Kimai, you have to install the LDAP library:
```bash
composer require laminas/laminas-ldap --optimize-autoloader
```

If you see an error message like this:
```
laminas/laminas-ldap requires ext-ldap * -> it is missing from your system. Install or enable PHP's ldap extension.
```
you have to install the PHP LDAP extension, e.g. on Ubuntu with `apt-get install php-ldap` first.

### Activate LDAP authentication

You activate the LDAP authentication by adding the following code to the end of your
[local.yaml]({% link _documentation/local-yaml.md %}) and [reloading the cache]({% link _documentation/cache.md %}) afterwards.

```yaml
kimai:
    ldap:
        activate: true
        # more infos about the connection params can be found at:
        # https://docs.laminas.dev/laminas-ldap/api/
        connection:
            # The default hostname of the LDAP server (mandatory setting). 
            # You can connect to multiple servers by setting their URLs like this:
            # host: "ldap://ldap.example.local ldap://ldap2.example.local"
            # host: "ldaps://ldap.example.local ldaps://ldap2.example.local"
            host: 127.0.0.1
            
            # Default port for your LDAP port server
            # default: 389
            #port: 389
            
            # Whether or not the LDAP client should use SSL encrypted transport. 
            # The useSsl and useStartTls options are mutually exclusive.
            # default: false
            #useSsl: false
            
            # Enable TLS negotiation (should be favoured over useSsl).
            # The useSsl and useStartTls options are mutually exclusive.
            # default: false
            #useStartTls: false
            
            # The default credentials username (your service account). Some servers 
            # require that this is given in DN form.
            # It must be given in DN form if the LDAP server requires  
            # a DN to bind and binding should be possible with simple usernames. 
            # default: empty
            #username:
            
            # Password for the username (service-account) above
            # default: empty
            #password:
            
            # LDAP search filter to find the user (%s will be replaced by the username).
            # Should be set, to be compatible with your object structure.
            # You might not need to set this filter, unless you have a special setup 
            # or use Microsofts Active directory.
            #
            # Defaults:
            # - if bindRequiresDn is false: (&(objectClass=user)(sAMAccountName=%s))
            # - if bindRequiresDn is true: (&%filter%(uid=%s))
            #   - %filter% = empty 
            #     accountFilterFormat = (&(usernameAttribute=%s))
            #   - %filter% = (&(objectClass=posixAccount)) 
            #     accountFilterFormat = (&(objectClass=posixAccount))(&(usernameAttribute=%s))
            #
            # %filter% is the "filter" configuration defined below in the "user" section
            #accountFilterFormat: (&(objectClass=inetOrgPerson)(uid=%s))
            
            # If true, this instructs Kimai to retrieve the DN for the account, 
            # used to bind if the username is not already in DN form. 
            # default: true
            #bindRequiresDn: true
             
            # If set to true, this option indicates to the LDAP client that 
            # referrals should be followed, default: false
            #optReferrals: false
            
            # for the next options please refer to:
            # https://docs.laminas.dev/laminas-ldap/api/ 
            #allowEmptyPassword: false
            #tryUsernameSplit: 
            #networkTimeout: 
            #accountCanonicalForm: 3
            #accountDomainName: HOST
            #accountDomainNameShort: HOST

        user:
            # baseDn to query for users (mandatory setting).
            baseDn: ou=users, dc=kimai, dc=org
            
            # Field used to match the login username in your LDAP.
            # If "bindRequiresDn: false" is set, the username is used in "bind".
            # Otherwise a search is executed to find the users "dn" by finding the user
            # via this attribute with his "baseDn" and the "filter" below. 
            # default: uid 
            usernameAttribute: uid
            
            # LDAP search base filter to find the user / the users DN.
            # Do NOT include the rule (&(usernameAttribute=%s)), it will be appended
            # automatically. The result of the search filter must return 1 result only.
            # default: empty (results in (&(uid=%s)) with default usernameAttribute)
            filter: (&(objectClass=inetOrgPerson))

            # LDAP search base filter to find the user attributes.
            # This is used for a slightly different query than the one above, which is 
            # used to query the users DN only.
            # AD users might have too many results (Exchange activesync devices 
            # attributes) and therefor an incompatible result structure if not changed.
            # See {{ site.kimai_v2_repo }}/issues/875   
            # default: (objectClass=*)
            #attributesFilter: (objectClass=Person)

            # Configure the mapping between LDAP attributes and user entity
            # The ldap_attr must be given in lowercase!
            attributes:
                # The following 2 rules are automatically prepended and can be overwritten.
                # Username is set to the value of the configured "usernameAttribute" field 
                - { ldap_attr: "usernameAttribute", user_method: setUsername }
                # Only applied if you don't configure a mapping for setEmail()
                - { ldap_attr: "usernameAttribute", user_method: setEmail }
                # An example which will set the display name in Kimai from the 
                # value of the "common name" field in your LDAP
                - { ldap_attr: cn, user_method: setAlias }

        # You can comment the following section, if you don't want to manage
        # user roles in Kimai via LDAP groups. If you want to use the group
        # sync, you have to set at least the "role.baseDn" config.
        # default: deactivated as "role.baseDn" is empty by default
        role:
            # baseDn to query for groups, MUST be set to activate the "group import"
            # default: empty (deactivated)
            baseDn: ou=groups, dc=kimai, dc=org
            
            # Filter to query user groups, all results will be matched against 
            # the configured "groups" mapping below.
            # The full search filter will ALWAYS be generated like this:
            # (&%filter(userDnAttribute=valueOfUsernameAttribute)) 
            # The following example rule will be expanded to (for user "foo"):
            # (&(&(objectClass=groupOfNames))(member=foo))
            # default: empty
            filter: (&(objectClass=groupOfNames))
              
            # The following field is taken from the LDAP user entry and its 
            # value is used in the filter above as "valueOfUsernameAttribute".
            # The attribute must be given in lowercase!
            # The example below uses "posix group style memberUid". 
            # default: dn
            #usernameAttribute: uid
            
            # Field that holds the group name, which will be used to map the 
            # LDAP groups with Kimai roles (see groups mapping below).
            # default: cn
            #nameAttribute: cn
            
            # Field that holds the users dn in your LDAP group definition.
            # Value of this configuration is used in the filter (see above).
            # default: member
            #userDnAttribute: member
            
            # Convert LDAP group name (nameAttribute) to Kimai role
            # You will very likely have to define mappings, unless your groups
            # are called "teamlead", "admin" or "super_admin"
            #groups:
            #    - { ldap_value: group1, role: ROLE_TEAMLEAD }
            #    - { ldap_value: kimai_admin, role: ROLE_ADMIN }
``` 

This is the full available configuration, most of the values are optional and their default values were chosen for maximum compatibility with OpenLDAP setup.
Kimai uses the Laminas Framework LDAP module and uses the configured `connection` parameters without modification.
Find out more about the settings in the [detailed documentation](https://docs.laminas.dev/laminas-ldap/api/).

You need to [re-build the cache]({% link _documentation/cache.md %}) for changes to take effect.

## User synchronization

User data is synchronized on each login, fetching the latest data from your LDAP.

**How it works**

- if `bindRequiredDn` is active, a `search` is executed to find the users DN by the given username
- the authentication is checked with a `bind`
- if the `bind` was successful:
    - another `bind` using the service account (connection.username/connection.password) is executed and under that scope:
        - a `search` is executed to find and map LDAP attributes to the Kimai profile
        - if configured, another `search` is executed to sync and map the users LDAP groups to Kimai roles

**Password handling**

Obviously Kimai does not store the users password when logged-in via LDAP and there is
no fallback mechanism implemented, if your LDAP is not available (currently only ONE server can be configured).

{% include alert.html type="danger" alert="The default configuration allows a user to change the internal password. This manually chosen password is not overwritten by the LDAP plugin and would allow a user to login, even after you removed him from LDAP." %}

To prevent that problem:
- Disable the "[Password reset]({% link _documentation/users.md %})" function via [System > Settings]({% link _documentation/configurations.md %})
- Disable the `password_own_profile` and `password_other_profile` [permissions]({% link _documentation/permissions.md %}) for each role

If you don't adjust your configuration, you have to:
- either deactivate users manually in Kimai after deleting their LDAP account
- or use an attribute mapping to set the user deactivated flag via `setEnabled()`

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

In this example we tell Kimai to sync the following fields:
- `uid` will be the username in Kimai (will fail with a 500 if not unique)
- `mail` will be the account email address (read "known limitations" below)
- `cn` will be used for the display name in Kimai

Available methods on the User entity are: `setUsername(string)`, `setEmail(string)`, `setAlias(string)`, `setAvatar(url)`, `setTitle(string)`.
Its unlikely that you will need those, but they also exist: `setEnabled(bool)`, `setSuperAdmin(bool)`, `addRole(string)`.

### Groups / Roles import

Kimai can use your LDAP groups and map them to [user roles]({% link _documentation/users.md %}).
If configured, it will execute another `search` against your LDAP after authentication and importing the user attributes.

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

These converted names will be validated and [only existing roles]({% link _documentation/users.md %}) will pass to the user profile.

{% include alert.html type="info" alert="Remove the entire 'role' configuration block to deactivate role sync!" %}

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

Roles are not merged, but replaced during authentication, so you cannot  
demote or promote a User permanently to another role in Kimai.

The rule is: either manage all roles in Kimai or in LDAP, mixing is not possible.

## Examples

{% include alert.html type="info" alert="Before you start to configure your LDAP, switch to 'dev' environment and tail 'var/log/dev.log'." %}

Another simple solution to debug the generated queries is to start your OpenLDAP with `sudo /usr/libexec/slapd -d256`.

### Minimal OpenLDAP

A minimal setup with a local OpenLDAP with roles sync.
This will only work for very basic LDAP setups, but it demonstrates the power of default values.

```yaml
kimai:
    ldap:
        activate: true
        connection:
            host: 127.0.0.1
        user:
            baseDn: ou=users, dc=kimai, dc=org
        role:
            baseDn: ou=groups, dc=kimai, dc=org
```

The generated query to find the users DN looks like this (for the username "foo"):
```
SRCH base="ou=users,dc=kimai,dc=org" scope=2 deref=0 filter="(&(uid=foo))"
SRCH attr=dn
```
The query to find all user attributes looks like this:
```
SRCH base="uid=foo,ou=users,dc=kimai,dc=org" scope=2 deref=0 filter="(objectClass=*)"
SRCH attr=+ *
```
The generated query for the group-to-role mapping:
```
SRCH base="ou=groups,dc=kimai,dc=org" scope=2 deref=0 filter="(&(member=uid=foo,ou=users,dc=kimai,dc=org))"
SRCH attr=cn + *
```

The Kimai account will have the username and email set to the `uid`, because we did not configure
another usernameAttribute (like `cn`) or a mapping for the email.

If the role search would have returned groups with the `cn` value `admin`, `super_admin` or `teamlead`,
the new account would have been promoted into these roles.

### OpenLDAP with group sync

A secured local OpenLDAP on port 543 with roles sync for the objectClass `posixAccount` users:

```yaml
kimai:
    ldap:
        activate: true
        connection:
            host: 127.0.0.1
            useSsl: true
            port: 543
            user: kimai
            password: serverToken
            # auto generated fallback is the same, no need to set it explicit:
            #accountFilterFormat: (&(objectClass=posixAccount)(uid=%s))
        user:
            baseDn: ou=users, dc=kimai, dc=org
            filter: (&(objectClass=posixAccount))
            usernameAttribute: uid
            attributes:
                - { ldap_attr: uid, user_method: setUsername }
                - { ldap_attr: cn, user_method: setAlias }
                - { ldap_attr: mail, user_method: setEmail }
        role:
            baseDn: ou=groups, dc=kimai, dc=org
            filter: (&(objectClass=groupOfNames)(|(cn=teamlead)(cn=manager)(cn=devops)))
            userDnAttribute: member
            usernameAttribute: uid
            groups:
                - { ldap_value: teamlead, role: ROLE_TEAMLEAD }
                - { ldap_value: manager, role: ROLE_ADMIN }
                - { ldap_value: devops, role: ROLE_SUPER_ADMIN }
```

### Connect to Active Directory

This is an [example](https://gist.github.com/firegore/b12d43ef679bd8020a7b5ffa4a556083) how you can connect your AD with Kimai.

```yaml
kimai:
    ldap:
        activate: true
        connection:
            host: ad.example.com
            username: user@ad.example.com
            password: secret
            accountDomainName: ad.example.com
            accountDomainNameShort: AD
            accountFilterFormat: (&(objectClass=Person)(sAMAccountName=%s))
        user:
            baseDn: dc=ad,dc=example,dc=com
            filter: (&(objectClass=Person))
            usernameAttribute: samaccountname
            attributesFilter: (objectClass=Person)
            attributes:
                - { ldap_attr: mail, user_method: setEmail }
                - { ldap_attr: displayname, user_method: setAlias }
                - { ldap_attr: samaccountname,  user_method: setUsername }
        role:
            baseDn: dc=ad,dc=example,dc=com
            filter: (&(objectClass=group))
            groups:
                - { ldap_value: Leads, role: ROLE_TEAMLEAD }
                - { ldap_value: Sysadmins, role: ROLE_SUPER_ADMIN }
                - { ldap_value: Users, role: ROLE_USER }
```
{% include alert.html type="warning" alert="You need to configure the attributes in lower-case, otherwise they won't be processed." %}

The LDAP code is based on [the work](https://github.com/Maks3w/FR3DLdapBundle) by @Maks3w , thanks for sharing!
