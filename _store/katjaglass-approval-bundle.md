---
title: Weekly timesheets Approval
name: Weekly timesheets Approval
intro: "This bundle is available to perform a weekly approval for timesheets."
developer: katjaglass
date: "2022-08-24 12:00:00 +0100"
icon: fa-solid fa-person-circle-check
price: "0"
github: https://github.com/KatjaGlassConsulting/ApprovalBundle
download: https://github.com/KatjaGlassConsulting/ApprovalBundle/archive/master.zip
type: client
new: true
screenshots:
  - 
    src: "https://raw.githubusercontent.com/KatjaGlassConsulting/ApprovalBundle/0.9.1/_documentation/Screenshot_UserApprovalForWeek.png"
    title: "User Screen for week approval"
    description: "Displays week details like working time, expected time and actions like submit for approval"
  - 
    src: "https://raw.githubusercontent.com/KatjaGlassConsulting/ApprovalBundle/0.9.1/_documentation/Screenshot_TeamleadOverviewOfTeam.png"
    title: "Screen for teamleads - show overview"
    description: "Overview Screen of open past approvals of the corresponding team members and itself and status of current finished week"
  - 
    src: "https://raw.githubusercontent.com/KatjaGlassConsulting/ApprovalBundle/0.9.1/_documentation/Screenshot_TeamleadSeeHistory.png"
    title: "History of Approval for that week"
    description: "The approval history including all comments can be viewed by the teamlead or users"
    description: "Overview Screen of open past approvals of the corresponding team members and itself and status of current finished week"
  - 
    src: "https://raw.githubusercontent.com/KatjaGlassConsulting/ApprovalBundle/0.9.1/_documentation/Screenshot_TeamleadApproveDeny.png"
    title: "Approve or deny a week"
    description: "Teamleads can approve or deny a weeks approval"
  - 
    src: "https://raw.githubusercontent.com/KatjaGlassConsulting/ApprovalBundle/0.9.1/_documentation/Screenshot_AdminRollbackOption.png"
    title: "Admins View"
    description: "Admins can do anything like teamleads, see additionally all colleagues in the overview and have the option to undo an approval"
tags:
  - plugin
bundle:
    name: "ApprovalBundle"
    clone: "https://github.com/KatjaGlassConsulting/ApprovalBundle"
    command: "kimai:bundle:approval:install"
    versions:
      - ["0.9.1", "1.16.10"]
---

A plugin for Kimai to approve timesheets of users on a weekly basis including APIs.

## Features

- Users can send a week for approval (in sequential order)
- User lockdown -> a submitted/approved week can no longer be edited (apart from admins) - there is one lockdown date per user (LockdownPerUserBundle)
- Teamlead/Admin can approve or deny the week
- Overview of approvals, missing approvals and the status
- Mailing options to recall approval tasks if outstanding

## Requirement

- Requires Kamai 2, V1.16.10 or higher
- MetaFields plugin
- LockdownPerUser plugin ([GitHub](https://github.com/kevinpapst/LockdownPerUserBundle))

