---
title: LDAP structure Example for Kimai and OpenLDAP
canonical: /documentation/ldap-example.html
---

This is an example LDAP data structure, which was used for testing the Kimai LDAP integration with Kimai 1.18 and 2.0.

It demonstrates a possible setup and the matching [LDAP connection configuration]({% link _documentation/ldap.md %}). 

## Creating the structure files

Create the file `ou-root.ldiff` and add this:
```
dn:dc=kimai,dc=org
objectClass:dcObject
objectClass:organizationalUnit
dc:kimai
ou:KIMAI
```

Create the file `ou-users.ldiff` and add this:
```
dn: ou=users,dc=kimai,dc=org
objectClass: organizationalUnit
ou: users
```

Create the file `ou-groups.ldiff` and add this:
```
dn: ou=groups,dc=kimai,dc=org
objectClass: organizationalUnit
ou: groups
```

The hashed password `{SSHA}+/Ir5pqpe09B07Xz8IT5AS+swJ5s29QS` from the following files are in plain text `kitten`.

Create the file `user-user.ldiff` and add this:
```
dn: uid=user-ldap,ou=users,dc=kimai,dc=org
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
uid: user-ldap
sn: LDAP-User
givenName: LDAP-User Example
cn: user-ldap
displayName: LDAP User (User)
mail: user-ldap@example.com
userPassword: {SSHA}+/Ir5pqpe09B07Xz8IT5AS+swJ5s29QS
```

Create the file `teamlead-user.ldiff` and add this:
```
dn: uid=teamlead-ldap,ou=users,dc=kimai,dc=org
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
uid: teamlead-ldap
sn: LDAP-Teamlead
givenName: LDAP-Teamlead Example
cn: teamlead-ldap
displayName: LDAP User (Teamlead)
mail: teamlead-ldap@example.com
userPassword: {SSHA}+/Ir5pqpe09B07Xz8IT5AS+swJ5s29QS
```

Create the file `teamlead-group.ldiff` and add this:
```
dn: cn=teamlead,ou=groups,dc=kimai,dc=org
objectClass: top
objectClass: groupOfNames
cn: Teamleads
member: uid=teamlead-ldap,ou=users,dc=kimai,dc=org
```

Create the file `admin-user.ldiff` and add this:
```
dn: uid=admin-ldap,ou=users,dc=kimai,dc=org
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
uid: admin-ldap
sn: LDAP-Administrator
givenName: LDAP-Admin Example
cn: admin-ldap
displayName: LDAP User (Administrator)
mail: admin-ldap@example.com
userPassword: {SSHA}+/Ir5pqpe09B07Xz8IT5AS+swJ5s29QS
```

Create the file `admin-group.ldiff` and add this:
```
dn: cn=admin,ou=groups,dc=kimai,dc=org
objectClass: top
objectClass: groupOfNames
cn: Admins
member: uid=admin-ldap,ou=users,dc=kimai,dc=org
```

Create the file `super-user.ldiff` and add this:
```
dn: uid=super-ldap,ou=users,dc=kimai,dc=org
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
uid: super-ldap
sn: LDAP-SuperAdmin
givenName: LDAP-Teamlead Example
cn: super-ldap
displayName: LDAP User (Super-Admin)
mail: super-ldap@example.com
userPassword: {SSHA}+/Ir5pqpe09B07Xz8IT5AS+swJ5s29QS
```

Create the file `super-group.ldiff` and add this:
```
dn: cn=super,ou=groups,dc=kimai,dc=org
objectClass: top
objectClass: groupOfNames
cn: Super-Admins
member: uid=super-ldap,ou=users,dc=kimai,dc=org
```

## Importing the data

```bash
ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f ou-root.ldif
ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f ou-users.ldiff
ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f ou-groups.ldiff

ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f user-user.ldiff

ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f teamlead-user.ldiff
ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f teamlead-group.ldiff

ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f admin-user.ldiff
ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f admin-group.ldiff

ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f super-user.ldiff
ldapadd -D "cn=admin,dc=kimai,dc=org" -W -x -f super-group.ldiff
```

## The local.yaml settings

```yaml
kimai:
    ldap:
        activate: true
        connection:
            host: 127.0.0.1
        user:
            baseDn: ou=users, dc=kimai, dc=org
            attributes:
                - { ldap_attr: uid, user_method: setUserIdentifier }
                - { ldap_attr: givenName, user_method: setAlias }
                - { ldap_attr: mail, user_method: setEmail }
        role:
            baseDn: ou=groups, dc=kimai, dc=org
            filter: (&(objectClass=groupOfNames)(|(cn=Admins)(cn=Super-Admins)(cn=Teamleads)))
            userDnAttribute: member
            usernameAttribute: dn
            groups:
                - { ldap_value: Teamleads, role: ROLE_TEAMLEAD }
                - { ldap_value: Admins, role: ROLE_ADMIN }
                - { ldap_value: Super-Admins, role: ROLE_SUPER_ADMIN }
```

## Tips and Tricks

Some very basic infos for novice OpenLDAP users.

**Links:**

- https://github.com/IntersectAustralia/acdata/wiki/Setting-up-OpenLDAP
- http://blog.facilelogin.com/2012/05/setting-up-openldap-under-mac-os-x.html
- https://docs.kanboard.org/en/latest/admin_guide/ldap_examples.html

**Create password:**

```bash
slappasswd
```

**Run OpenLDAP:**

```bash
/usr/libexec/slapd -d3
```

**Edit configuration:**

```bash
vim /usr/local/etc/openldap/slapd.conf
```
