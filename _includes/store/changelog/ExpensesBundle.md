**Version 2.19.0**

Compatibility: requires minimum Kimai 2.25.0

- Do never return export items, if export query included tags

**Version 2.18.0**

Compatibility: requires minimum Kimai 2.25.0

- Added empty "category" option, so the user has to choose one
- Support `Quantity` column in overview listing
- Allow to hide `Customer` column 
- Use translations from Kimai core
- PHPStan v2: Code syntax improvements (Refactoring)

**Version 2.17.1**

Compatibility: requires minimum Kimai 2.17.0

- Rename migration config for compatibility with new plugin installer
- Fix migration warning in newer Kimai versions

**Version 2.17.0**

Compatibility: requires minimum Kimai 2.17.0

- Category listing always shows fallback color in dots

**Version 2.16.0**

Compatibility: requires minimum Kimai 2.17.0

- Refactoring: new query types
- Refactoring: use attributes for export service injection

**Version 2.15.0**

Compatibility: requires minimum Kimai 2.17.0

- Inline Nelmio API Doc configuration

**Version 2.14.0**

Compatibility: requires minimum Kimai 2.17.0

- Added: new filter parameter for API collection call: users[], customers[], projects[], activities[]
- Added: unify API access permission check

**Version 2.13.0**

Compatibility: requires minimum Kimai 2.10.0

Fixed: error if category `Default` was hidden and no other category exists

**Version 2.12.0**

Compatibility: requires minimum Kimai 2.10.0

- Added: allow to filter expenses and expense categories from detail page listing
- Added: reload customer/project/activity detail page after expense was created

**Version 2.11.0**

Compatibility: requires minimum Kimai 2.10.0

- Changed: cache permissions in view
- Changed: support attribute caching in Voter

**Version 2.10.0**

Compatibility: requires minimum Kimai 2.10.0

- Fixed: use correct base class for migration - removes Doctrine deprecation warning
- Fixed: removed ApiSecurity annotation

**Version 2.9.0**

Compatibility: requires minimum Kimai 2.10.0

Added: System-Configuration to disable time field

**Version 2.8.0**

Compatibility: requires minimum Kimai 2.9.0

- Set "now" as pre-filled default value for an expense date
- Remove time field and set to 12:00:00 internally
- Fix "not null" category validator does not highlight correct field
- More DateTime to DateTimeImmutable refactorings

**Version 2.7.0**

Compatibility: requires minimum Kimai 2.9.0

- Changed: internal DateTime to DateTimeImmutable refactoring
- Changed: replace deprecated RestRoute attribute with SF native one
- Changed: replace deprecated Route vs Attribute annotations

**Version 2.6.0**

Compatibility: requires minimum Kimai 2.6.0

- Added: calculate "exported" vs. "not exported" statistics and provide for several statistics
- Added: sort invoice entries if "expense category project" grouping is activated
- Changed: re-use "Expenses" translation for configuration
- Fixed: broken "category" translation

**Version 2.5.0**

Compatibility: requires minimum Kimai 2.5.0

- Changed: create default category if none is existing yet
- Changed: moved some translations to core allowing more languages

**Version 2.4.0**

Compatibility: requires minimum Kimai 2.1.0

Use annotation type for routes

**Version 2.3.0**

Compatibility: requires minimum Kimai 2.0.33

Fixed: API pagination compatibility with Kimai 2.0.33

