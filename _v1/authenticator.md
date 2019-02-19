---
title: Authenticator
description: Authenticator docs for Kimai 1
redirect_from: 
  - /documentation/administrator/authenticator.html
  - /documentation/authenticator/
---

By default kimai uses its internal user management, where users and passwords are stored in the Kimai database.
But there are more authenticators, which can be used to connect to existing user repositories.

## Configuration

The authenticator that will be used is configured in ``includes/auth.php`` within the key ``$authenticator``. 

```php
$authenticator = 'kimai';
```

*kimai* is the last part of the classname without the namespace and the first character in lowercase. 
For example "ldap" comes from Kimai\_Auth\_Ldap: remove Kimai\_Auth\_ and lowercase the first character in the word "ldap".

If the used authenticator supports configuration parameters, you can set those with the file ``includes/auth.php`` 
(supported since Kimai > 1.0.1). 

Therefor you need to create the file ``includes/auth.php`` with the content:

```php
<?php
return array(
    'key_1' => 'value',
    'key_2' => 'value',
);
```

Set the parameters according to the authenticator documentation below ('key_1' and 'key_2' can be safely 
removed, they are just examples for the structure of the file).

If you use Kimai 1.0.1 or lower, you have to set these Configuration-parameters in the PHP files directly, for 
example in the [LDAP class here]({{ site.kimai_v1_repo }}/blob/master/libraries/Kimai/Auth/Ldap.php).

## Kimai

The built-in authenticator, using the Kimai database.

* Change ``$authenticator = "kimai";`` in ``includes/autoconf.php``

It has no configuration parameters and is working out-of-the-box.

## HTTP

A Basic-Auth authenticator

* Change ``$authenticator = "http";`` in ``includes/autoconf.php``
* create .htaccess

```
AuthType Basic
AuthName "kimai"
AuthUserFile  /absolute/path/to/.htpasswd
Require valid-user
```

* Create a .htpasswd file [online generator](http://www.htaccesstools.com/htpasswd-generator/)
* Login with ``http://admin:changeme@kimai.localhost/index.php``

### Configuration-parameters

* **HTAUTH_ALLOW_AUTOLOGIN:** Set true to allow web server authorized automatic logins
* **HTAUTH_FORCE_USERNAME_LOWERCASE:** Set true to search for lower-case usernames only
* **HTAUTH_USER_AUTOCREATE:** Set true to create Kimai user for web server authorized users
* **HTAUTH_PHP_AUTH_USER:** Check for PHP_AUTH_USER server variable
* **HTAUTH_REMOTE_USER:** Check for REMOTE_USER server variable
* **HTAUTH_REDIRECT_REMOTE_USER:** Check for REDIRECT_REMOTE_USER server variable


Default settings and full example for ``includes/auth.php``:

```php
<?php
return array(
    'HTAUTH_ALLOW_AUTOLOGIN' => true,
    'HTAUTH_FORCE_USERNAME_LOWERCASE' => false,
    'HTAUTH_USER_AUTOCREATE' => false,
    'HTAUTH_PHP_AUTH_USER' => false,
    'HTAUTH_REMOTE_USER' => true,
    'HTAUTH_REDIRECT_REMOTE_USER' => false,
);
```

## LDAP

Basic LDAP authenticator.

* Change ``$authenticator = "ldap";`` in ``includes/autoconf.php``

### Configuration-parameters

* **LDAP_SERVER:** URL of your LDAP-Server
* **LDAP_FORCE_USERNAME_LOWERCASE:** Case-insensitivity of some server may confuse the case-sensitive-accounting system
* **LDAP_USERNAME_PREFIX:** Prefix for user LDAP query
* **LDAP_USERNAME_POSTFIX:** Postfix for user LDAP query
* **LDAP_LOCAL_ACCOUNTS:** Accounts that should be locally verified
* **LDAP_USER_AUTOCREATE:** Automatically create a user in Kimai after successful login 


Default settings and full example for ``includes/auth.php``:

```php
<?php
return array(
    'LDAP_SERVER' => 'ldap://localhost',
    'LDAP_FORCE_USERNAME_LOWERCASE' => true,
    'LDAP_USERNAME_PREFIX' => 'cn=',
    'LDAP_USERNAME_POSTFIX' => ',dc=example,dc=com',
    'LDAP_LOCAL_ACCOUNTS' => array('admin'),
    'LDAP_USER_AUTOCREATE' => true,
);
```

## Advanced LDAP-Authentication

An advanced LDAP authenticator, that allows further configuration options.

* Change ``$authenticator = "ldapadvanced";`` in ``includes/autoconf.php``

### Configuration-parameters

* **host:** This is the URI to connect with your LDAP-Server. This can be something like ```ldap://ldap.example.com``` or ``` ldaps://ldap.example.com:1234```
* **bindDN:** This is the DN of a user with read access to the LDAP. Leave empty when your LDAP supports anonymous bind
* **bindPW:** the password for the user with read access to the LDAP. Leave empty also for anonymous bind
* **searchBase:** Where do your searches start in the ldap. This is normaly something like ```o=example,c=org```
* **userFilter:** What filter shall be used to search for a user. The string ```%1$s``` will be replaced with what the user entered as login name. You can use that string multiple times to enable login by UID **and** email. The filter would then be ```(|(uid=%1$s)(mail=%1$s))```
* **groupFilter:** What filter shall be used to heck for group memberships. The string ```%1$s``` will be replaced by the value of the attribute defined by ```usernameAttribute``` of the user-entry. The string ```%2$s``` will be replaced by the DN of the users entry;
* **usernameAttribute:** The attribute to be sed to check for group memberships **as well as** retrieving the username to be used by kimai
* **commonNameAttribute:** This attribute defines the alias of the user in kimai
* **groupidAttribute:** This attribute contains the value that is represented in the ```allowedGroupIds```
* **mailAttribute:** This attribute holds the users email-address that will be ported to kimai
* **allowedGroupIds:** An array of values defined by ```groupidAttribute```. Members of the LDAP-groups referenced here will be allowed access to kimai!
* **forceLowercase:** Whether the username for kimai shall be lowercased or not.
* **nonLdapAcounts:** A list of kimai-usernames that shall **not** be autehnticated via LDAP but via the default kimai-authentication-adapter
* **autocreateUsers:** Shall uses authenticated via LDAP be created automatically in kimai. If set to false the users have to be added manually to kimai and only password-verification will be handled via LDAP
* **defaultGlobalRoleName:** The name of the default role newly created users will be associated with
* **defaultGroupMemberships:** An array of group=>role mappings the user shall also be associated with

Default settings and full example for ``includes/auth.php``:


```php
<?php
return array(
    'host' => 'ldap://localhost',
    'bindDN' => '',
    'bindPW' => '',
    'searchBase' => 'dc=example,c=org',
    'userFilter' => 'uid=%s',
    'groupFilter' => 'memberUid=%1$s',
    'usernameAttribute' => 'uid',
    'commonNameAttribute' => 'cn',
    'groupidAttribute' => 'cn',
    'mailAttribute' => 'mail',
    'allowedGroupIds' => array('kimai-access'),
    'forceLowercase' => true,
    'nonLdapAcounts' => array('admin'),
    'autocreateUsers' => true,
    'defaultGlobalRoleName' => 'User',
    'defaultGroupMemberships' => array('Users' => 'User'),
);
```

## Active Directory

Kimai support authentication with Microsofts Active Directory through LDAP. 

* Change ``$authenticator = "activeDirectory";`` in ``includes/autoconf.php``

### Configuration-parameters

* **enhancedIdentityPrivacy:** Supports the "Enhanced Identity Privacy" option, see [Microsoft Technet](https://technet.microsoft.com/en-us/library/f351e0e3-6c78-49dc-9b0f-2b24e1b7411c)


Default settings and full example for ``includes/auth.php``:

```php
<?php
return array(
    'enhancedIdentityPrivacy' => 'false',
);
```

As this class is a subclass of the LDAP-Advanced authenticator (see above), you can set all Configuration-parameters from there as well, for example the host:

```php
<?php
return array(
    'host' => 'ldap://localhost',
    'enhancedIdentityPrivacy' => 'false',
);
```
