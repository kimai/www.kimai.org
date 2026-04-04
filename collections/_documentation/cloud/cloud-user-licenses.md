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

If your subscription does not include enough licenses, you can purchase additional ones at any time through the [My Cloud]({{ site.cloud.my_cloud }}) portal.

Additional licenses are billed immediately, but only for the remaining time in your current billing period:
- New licenses are always aligned with your existing subscription period.
- For example, if you add a license to an annual subscription that is already 6 months old, you will only be charged for the remaining 6 months.

### Reducing licenses

If you need fewer licenses, you must first deactivate the corresponding user accounts in your cloud.
After that, you can reduce the number of licenses through the [My Cloud]({{ site.cloud.my_cloud }}) portal.

The reduced license count will take effect at the beginning of the next billing period.

## Deprecated metered plans

For users still on the deprecated **metered plans** (`Plus` and `Premium`), which are no longer available to new customers, billing is based on usage:
- **Active users incur charges**.
- **Deactivated users incur charges** if they were active within the last month. This includes:
    - Users who registered within the last month.
    - Users who logged in within the last month.
    - Users who made time bookings within the last month (or later).

This system ensures flexibility in managing user accounts while maintaining fairness in licensing costs.
