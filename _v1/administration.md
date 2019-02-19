---
title: Administration
redirect_from:
  - /documentation/administration/
  - /documentation/manual/administration.html
  - /documentation/manual/projects.html
  - /documentation/manual/users.html
  - /documentation/manual/administration/users.html
  - /documentation/manual/projects.html
  - /documentation/manual/administration/projects.html
---

In the admin panel you can do every administration that is necessary for the running system.

## Customers

Here you can add, change and delete customers. If you do not set a password the customer cannot login to Kimai. By selecting a group you enable all members of that group to see that customer. All fields except the customer name are optionally.

## Projects

Here you can add, change and delete projects. Projects have to be assigned to a customer. Further you can set rates for this project if they differ from the standard rates (for details about rates see chapter [Rates](../rates/)). If there is a budget it can be set here, too.

### What is an internal project?

An internal project is (as the name describes) only meant for internal tasks and visible to user and admins but NOT to customers.

## Budget

Default rate: This rate will apply for every user and every task if no other rate overwrites it.

My rate: This rate is user specific and will only apply for the current user.

Fixed rate: No matter how much time a user works on a project, this amount of money will be payed.

Budget: The amount of money that is available for a project.

Effort: To be written...

Approved: To be written...

## Tasks

Here you can add, change and delete tasks. A task has no relation to a customer or a project, but you can select which groups can use them. Additionally you can set rates here, too (for details about rates see chapter [Rates](../rates/)).

## Users

Here you can add, change and delete users. 
Users work with the Kimai application and can add, change or delete data like their own time records. They can edit also other data like customers, projects e.g. depending on their roles and rights. The roles and rights are set using global roles, membership roles and groups.

![]({% link /images/manual/user-list.jpg %})

### Add Users

Edit user >  General 

Add a name for the new user and press 'Add user'.

To let the user reset the password, a email adresse is necessary.
The Nickname is used 

![]({% link /images/manual/user-general.jpg %})

A user can only have one global role at a time but can belong to unlimited groups. 

If the password field is empty when pressing OK, the password will not change. If a password was never set for the user, a warning is displayed in the dialog box and in the user list. 

Edit user > Groups

![]({% link /images/manual/user-groups.jpg %})

If you enter a valid email address you can send emails from your local account by clicking the mailer symbol.

By default, a user is created in the group of its creator - wich is in most of the cases a user with admin roles. Make sure that you add and remove the correct roles for the new user. In most cases you need to remove the admin group.


## Groups

Here you can add, modify and delete groups and also define their membership role. Every group can have an unlimited amount of membership roles.

## Global Roles

User get their permissions from their global roles and from their group membership 

## Membership roles

The membership role defines with role a user has inside of a group.

## Status

Use this function to define status labels.

## Advanced

Here you can define general settings like number of failed login-tries, bantime, currency, etc.

## Database

Backup the database with the maintenance function before updating Kimai. Other database functions might be implemented here in the future.
