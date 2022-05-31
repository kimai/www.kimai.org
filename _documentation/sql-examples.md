---
title: SQL Examples
description: A collection of SQL commands to quick start your statistic query 
toc: true
---

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
