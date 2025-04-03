**Version 4.4.0**

Compatibility: requires minimum Kimai 2.25.0

- Fix design for empty project list
- Fix too many timesheets shown for customer portals with empty project list

**Version 4.3.0**

Compatibility: requires minimum Kimai 2.25.0

- Added rate limiter to password protection form (10 failures within 1-hour will block access)
- Remove form target (password protection) to prevent proxy issues with http vs https
- Use non-deprecated API to fetch timesheets

**Version 4.2.0**

Compatibility: requires minimum Kimai 2.25.0

- Use translations from Kimai core
- Rename migration config for compatibility with new plugin installer
- Internal: PHPStan 2 with strict and deprecation rules

**Version 4.1.1**

Compatibility: requires minimum Kimai 2.21.0

- Added missing "Documentation" link 
- Create with invalid type caused 500: redirect to manage view instead

**Version 4.1.0**

Compatibility: requires minimum Kimai 2.21.0

- Move "Customer Portal" to "Administration" menu
- Use new database table `kimai2_customer_portals`
- Automatic migration of existing URL shares and database cleanup
- Move statistics card above timesheets
- Fix: broken customer statistics (customer portals with budget display for customer without budget)

**Version 4.0.0**

Compatibility: requires minimum Kimai 2.21.0

- Rename to "Customer portal"
- Allow to switch month and year via dropdowns
- Simplify URLs by using 20-char share-key only (old URLS still working)
- Toggle financial- and time budget statistics for shared URLs
- Allow to share an entire customer
- Add details button and stats in project listing on shared customer page
- Use translations from core, use latest repository features
- Use password field for login
- Fixes missing timesheet if user and start time is the same

