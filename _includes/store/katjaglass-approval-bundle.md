A plugin for Kimai to approve timesheets of users on a weekly basis.

## Features

- Users can send a week for approval (in sequential order)
- User lockdown -> a submitted/approved week can no longer be edited (apart from admins) - there is one lockdown date per user (LockdownPerUserBundle)
- Teamlead/Admin can approve or deny the week
- Overview of approvals, missing approvals and the status
- Mailing options to recall approval tasks if outstanding
- Various options to track overtime
- Option to check for breaks according German Law

## Requirements

- Requires Kimai version: 1.16.10+ or 2.5.0+
- [Lockdown per user settings]({% link _store/keleo-lockdown-per-user-bundle.md %}) (recommended)
- [Custom-fields plugin]({% link _store/keleo-custom-fields-bundle.md %}) (only required when using Kimai 1.x)
