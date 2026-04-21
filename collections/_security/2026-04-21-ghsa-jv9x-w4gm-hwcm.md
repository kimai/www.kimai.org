---
title: "Team API Missing Object-Level Authorization"
date: "2026-04-21 16:10:14 +0000"
ghsa_id: "GHSA-jv9x-w4gm-hwcm"
cve_id: "CVE-2026-41498"
severity: "low"
affected_version: "< 2.54.0"
patched_version: "2.54.0"
author: "AzureADTrent"
published: "kevinpapst"
state: "published"
---

The Team API endpoints use `#[IsGranted('edit_team')]` instead of `#[IsGranted('edit', 'team')]`, causing Symfony TeamVoter to abstain from voting. 
This removes entity-level ownership checks on team operations, allowing any user with the edit_team permission to modify any team, not just teams they are authorized to manage.

## Info

The team association endpoints in `src/API/TeamController.php` use `#[IsGranted('edit_team')]` with a single argument. 
The controller at `src/Controller/TeamController.php` correctly uses `#[IsGranted('edit', 'team')]` with two arguments, passing the $team parameter as the subject.
When `edit_team` is passed as the attribute, `TeamVoter::supportsAttribute()` returns false because it only recognizes `view`, `edit`, and `delete`. 
The voter abstains entirely. Only `RolePermissionVoter` fires, which checks the role-level permission without any entity-level ownership validation.

In default configuration, only `ROLE_ADMIN` and `ROLE_SUPER_ADMIN` have `edit_team`, making the missing check less critical. 
The vulnerability becomes exploitable if an administrator grants `edit_team` to a lower-privilege role (such as `ROLE_TEAMLEAD`) through the permissions UI. 
In that scenario, the lower-privilege user could modify any team's membership, customer assignments, project assignments, and activity assignments without being a member or teamlead of that team.

## Solution

Users should update to `2.54.0` or newer.
