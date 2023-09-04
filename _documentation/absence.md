---
title: Absence
description: Managing absences
related:
- contract
- public-holiday
---

This screen and the `Contract` menu can be seen by any user that has active contract settings.
The `Absence` screen can be seen by any user that has the `absence` permission.

## Holiday

TODO 

## Sickness

TODO 

## Time-Off

TODO

## Other absences

TODO 

## Permissions

Administrators require the `contract_other_profile` permission to see the `Contract` menu, which includes the `Absence` management view.

| Permission Name          | Description                                                                                                         |
|--------------------------|---------------------------------------------------------------------------------------------------------------------|
| absence                  | View and access the Absence screen. By default given to: `User`, `Teamlead`, `Administrator`, `Super Administrator` |
| edit_own_absence         | Edit the own absences. By default given to: `User`, `Teamlead`, `Administrator`, `Super Administrator`              | 
| edit_other_absence       | Edit other users absences. By default given to: `Teamlead`, `Administrator`, `Super Administrator`                  |
| delete_own_absence       | Delete the own absence entries. By default given to: `Teamlead`, `Administrator`, `Super Administrator`             |
| delete_other_absence     | Delete other users absence entries. By default given to: `Teamlead`, `Administrator`, `Super Administrator`         |
{: .table }

{% include store-howto-permissions.md %}
