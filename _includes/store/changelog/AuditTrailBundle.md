## Version 2.7.0

Compatibility: requires minimum Kimai 2.14.0

- Changed: Track user fields (systemAccount, totpEnabled)
- Changed: Track activity field (number)
- Changed: Track project field (number)

## Version 2.6.0

Compatibility: requires minimum Kimai 2.5.0

Changed: support attribute caching in Voter

## Version 2.5.0

Compatibility: requires minimum Kimai 2.5.0

- Fixed: use correct base class for migration - removes Doctrine deprecation warning
- Fixed: import route from annotation namespace

## Version 2.4.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: moved some translations to core, allowing more languages
- Changed: replaced most Gedmo code with own implementation
- Changed: bump PHPStan from level 7 to level 9

## Version 2.3.0

Compatibility: requires minimum Kimai 2.3.0

- fixed: date formatting failed for timesheets
- fixed: accessing entries without object ids
- fixed: added missing listener calls

## Version 2.2.0

Compatibility: requires minimum Kimai 2.1.0

- use annotation type for routes (fix deprecation)
- convert to Doctrine listener (fix deprecation)

## Version 2.1.0

Compatibility: requires minimum Kimai 2.0.33

Fixed: possible pagination issue

