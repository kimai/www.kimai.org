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

