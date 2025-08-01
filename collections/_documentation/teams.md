---
title: Teams
description: Configure teams to limit access to projects and customers 
---

Teams allow you to organize your users in groups and limit access to customers and projects.

A team consists of teamleads and regular team members. 
The teamleads have access to all contents and timesheets of the team. 
Every content object can be linked to an arbitrary amount of teams.

## Limit access with teams

If you want to limit the access to Kimai functionality instead of content, 
please read the [permissions documentation]({% link _documentation/permissions.md %}).

{% alert warning %} Once a team is assigned to a customer or project, access to this object and its children is limited.{% endalert %}

Some examples how team assignments work:

- A customer without a team is visible to all users
- A project without a team, whose customer has no team is visible to all users
- A project without a team, whose customer is linked to Team B is only visible to all members of Team B

Please review the permission docs for customer, project and activity.

## Permission details

First, we will have a look at the available user roles and how their permission work when using teams (this only applies when you use the default [permission configuration]({% link _documentation/permissions.md %})):

- `System-Admin` - can see and manage all content and use all administrative functions.
- `Administrator` - can see and manage all content, but access to system specific settings and contents (like users) are limited. 
- `Teamlead` - can see all un-privileged contents and all contents assigned to his teams. Team specific contents can be managed for all teams where this user is the `Teamlead`. 
- `User` - can see all un-privileged contents and all contents assigned to his teams.

Next step is to understand the difference between the user role `Teamlead` and the `teamlead` of a user team:

- The `Teamlead` role limits access to features like `edit`, `delete`, `budget`
- The leader of a team (`teamlead`) is allowed to see team related contents like `projects` and `timesheet` 

Contents:

- `Customers` - access can be limited by assigning one or more teams. Customers without any team assignment can be seen by every user. Projects for this customer will be limited as well, if a team is assigned 
- `Projects` - access can be limited by assigning at least one team. Projects without any team assignment can be seen by every user, which has access to the related customer

## Create a team

Team creation is limited to the user roles `System-Admin` and `Administrator`.

## Filter and search 

You can query for a free search term, which will be searched in the fields:
- `name`

## Permissions

{% include documentation/permissions.md id="teams" howto=true %}
