---
title: SQL Examples
description: A collection of SQL commands to quick start your statistic query 
---

This page contains collections of SQL statements, which were helpful in the past and might be of use for other people as well.

### Summary of total duration, grouped by customer and user
 
```sql
SELECT
    c.name as Customer,
    u.username as Username,
    u.alias as User,
    FORMAT(SUM(t.duration) / 3600, 0) as Duration
FROM
    kimai2_timesheet t
        LEFT JOIN kimai2_projects p on t.project_id = p.id
        LEFT JOIN kimai2_customers c on p.customer_id = c.id
        LEFT JOIN kimai2_users u on t.user = u.id
GROUP BY
    c.id, t.user, c.name, u.username, u.alias
;
```

The output looks like this:

| Customer     | Username         | User        | Duration |
|--------------|------------------|-------------|----------|
| Acme company | test@example.com | John Doe    | 1,745.4  |
| Acme company | chris_user       | Chris Maier | 45.8     |
| Foo Bar      | test@example.com | John Doe    | 345.0    |

Duration is formatted as decimal time.
So `1,745.4` is one-thousand-seven-hundred-forty-five hours and 24 minutes.

### Summary of total duration, grouped by user and customer

```sql
SELECT
    u.username as Username,
    u.alias as User,
    c.name as Customer,
    FORMAT(SUM(t.duration) / 3600, 0) as Duration
FROM
    kimai2_timesheet t
    LEFT JOIN kimai2_projects p on t.project_id = p.id
    LEFT JOIN kimai2_customers c on p.customer_id = c.id
    LEFT JOIN kimai2_users u on t.user = u.id
GROUP BY
    t.user, u.username, u.alias, c.id, c.name
;
```

| Username         | User        | Customer     | Duration |
|------------------|-------------|--------------|----------|
| test@example.com | John Doe    | Acme company | 1,745.4  |
| test@example.com | John Doe    | Foo Bar      | 345.0    |
| chris_user       | Chris Maier | Acme company | 45.8     |

Duration is formatted as decimal time.
So `1,745.4` is one-thousand-seven-hundred-forty-five hours and 24 minutes.

### Find entries where hourly rate does not match users hourly rate

Compares timesheet hourly rate and user-preference rate. 
Does not check configured customer/project/activity rates!

```sql
SELECT
    t.id, t.user as "User ID", u.username,
    t.duration as Duration,
    t.hourly_rate as "Timesheet rate",
    COALESCE(p.value, 0.00) as "Configured rate",
    t.rate as "Current rate",
    round((COALESCE(p.value, 0.00) * (t.duration / 3600)), 2) as "Possible rate"
FROM
    kimai2_timesheet t
LEFT JOIN
    kimai2_users u ON t.user = u.id
LEFT JOIN
    kimai2_user_preferences p on u.id = p.user_id
WHERE
    p.name = 'hourly_rate'
    and t.hourly_rate != COALESCE(p.value, 0.00)
order by rate DESC;
```

### Find users without explicit hourly rate

```sql
SELECT u.id, u.username, COALESCE(p.value, 0.00) as hourly_rate
FROM kimai2_users u LEFT JOIN kimai2_user_preferences p on u.id = p.user_id
WHERE p.name = 'hourly_rate'
AND COALESCE(p.value, 0.00) = 0.00;
```

### Update timesheet rates by user configuration

These statements are only meant as idea! Update timesheet rates by configured users rates.
Does not use configured customer/project/activity rates.

```sql
UPDATE kimai2_timesheet t
RIGHT JOIN kimai2_users u ON t.user = u.id
RIGHT JOIN kimai2_user_preferences p on u.id = p.user_id
SET
    t.hourly_rate = COALESCE(p.value, 0),
    t.rate = round((COALESCE(p.value, 0) * (COALESCE(t.duration,0) / 3600)), 2)
WHERE p.name = 'hourly_rate';

UPDATE kimai2_timesheet t
RIGHT JOIN kimai2_users u ON t.user = u.id
RIGHT JOIN kimai2_user_preferences p on u.id = p.user_id
SET t.internal_rate = round((COALESCE(p.value, 0) * (COALESCE(t.duration,0) / 3600)), 2)
WHERE p.name = 'internal_rate';
```
