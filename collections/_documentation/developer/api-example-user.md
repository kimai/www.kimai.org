---
title: Setting user preferences for automated onboarding
navigation: Onboarding users
description: Creating user and configuring their preferences with the API allows for automated onboarding workflows  
related:
    - rest-api
    - rest-api-examples
---

For larger companies, it is often easier to pre-sync user accounts to Kimai, instead of creating them with the UI.

The API has the following endpoints:

- `GET /api/users/{id}` - for reading one user
- `POST /api/users` - for creating users
- `PATCH /api/users/{id}/preferences` - for updating settings

Please read the API docs to understand the exact requests.


## Configure contracts with user-preferences

You can configure working contracts [using the API]({% link _documentation/developer/rest-api.md %}).
All settings are kept in user-preferences, so you can set them with the `PATCH /api/users/{id}/preferences` endpoint.

**Contract Types**

Please note that some contract types are only available with the [Working contract plugin]({% link _store/keleo-controlling.md %}) or the `Pro` cloud plan. 

**Type "month" - Total monthly hours**

```json
[
  {"name": "work_contract_type", "value": "month"},
  {"name": "hours_per_month", "value": "432000"},
  {"name": "work_days_month", "value": "1,2,3,4,5"}
]
```

**Type "week" - Total weekly hours**

```json
[
  {"name": "work_contract_type", "value": "week"},
  {"name": "hours_per_week", "value": "144000"},
  {"name": "work_days_week", "value": "1,2,3,4,5"}
]
```

**Type `day` - Individual daily hours**

```json
[
  {"name": "work_contract_type", "value": "day"},
  {"name": "work_monday", "value": "28800"},
  {"name": "work_tuesday", "value": "28800"},
  {"name": "work_wednesday", "value": "28800"},
  {"name": "work_thursday", "value": "28800"},
  {"name": "work_friday", "value": "14400"}
]
```

**Available Preferences**

| Preference                     | Example                   | Description                                                        |
|--------------------------------|---------------------------|--------------------------------------------------------------------|
| `work_contract_type`           | `week` or `day`or `month` | Contract type                                                      |
| `hours_per_week`               | `144000`                  | Weekly hours in seconds (144000 = 40h)                             |
| `hours_per_month`              | `144000`                  | Monthly hours in seconds (432000 = 120h)                           |
| `work_monday` .. `work_sunday` | `28800`                   | Daily hours in seconds (28800 = 8h)                                |
| `work_days_month`              | `1,2,3,4,5`               | Work days for contract type `month` (1=Monday, 5=Friday, 7=Sunday) |
| `work_days_week`               | `1,2,3,4,5`               | Work days for contract type `week`  (1=Monday, 5=Friday, 7=Sunday) |
| `holidays`                     | `30`                      | Vacation days per year                                             |
| `public_holiday_group`         | `1`                       | Holiday group ID                                                   |
| `work_start_day`               | `2025-01-01`              | Contract start                                                     |
| `work_last_day`                | `2027-12-31`              | Contract end (optional)                                            |
{: .table }
