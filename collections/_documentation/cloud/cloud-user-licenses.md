---
title: User licenses
description: How the seat-based licensing works in Kimai-Cloud
---

Kimai uses a **per-seat licensing model**, where each active user account consumes one license. 
However, the system is designed with fairness in mind, so deactivated accounts do not consume licenses. 

Here's a breakdown of how the licensing works:

## Licensing Rules

- **Active users**: Each active user consumes one license.
- **Deactivated users**: Do not consume a license. This allows the license to be reassigned to another user.

### Managing user accounts

- When a user leaves the company, you can deactivate their account, freeing up the license for another user.
- If a deactivated user is reactivated, they will once again consume a license. Reactivation is only possible if there are available licenses.
- New user accounts can only be created if there are free licenses available.

### Before starting a subscription

- When registering for a plan, the system displays the minimum number of licenses you need to purchase based on your current number of active users.
- If you see more licenses than necessary, you can deactivate any extra accounts and reload the page to adjust the displayed license count.

### Purchasing additional licenses

If your subscription does not include enough licenses, you can purchase additional ones at any time through the [My Cloud](https://www.kimai.cloud/my-cloud/) portal.

The additional licenses will be billed immediately, but only for the remaining time of your current payment period:
- New licenses are always aligned with your existing subscription period.
- For example, if you add a license to an annual subscription that is already 6 months old, you will only be charged for the remaining 6 months.

### Reducing licenses

If some of your currently licensed accounts were deactivated, you can lower the amount of licenses with the next payment period.

This is currently not possible in the self-checkout, so please [write a short email to the support](mailto:{{ site.cloud.support_email }}).
Make sure to deactivate the unused accounts before.

## Deprecated metered plans

For users still on the deprecated **metered plans** (`Plus` and `Premium`), which are no longer available to new customers, billing is based on usage:
- **Active users incur charges**.
- **Deactivated users incur charges** if they were active within the last month. This includes:
    - Users who registered within the last month.
    - Users who logged in within the last month.
    - Users who made time bookings within the last month (or later).

This system ensures flexibility in managing user accounts while maintaining fairness in licensing costs.
