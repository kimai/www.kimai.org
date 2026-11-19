Kemai is a cross-platform desktop client for Kimai, for Windows, macOS and Linux.
You can start and stop your timer, correct your recent entries and see what's running from the system tray, without opening a browser.

Kemai is free software under the MIT license. It's developed independently of the Kimai project.

## Features

- **Timer**: start a timer on a project and activity, or restart a recent entry. Stop it from the window or from the system tray.
- **History**: see your entries of this week, this month or the last 30 days. Edit or delete any of them.
- **Quick creation**: create a customer, project or activity from the search.
- **Tasks**: start and close tasks from the [Task Management]({% link _store/{{ page.lang }}/task-management-bundle.md %}) plugin.
- **Custom fields**: fill in required [custom fields]({% link _store/{{ page.lang }}/custom-fields-bundle.md %}) for your time entries.
- **Sync**: changes stay in sync with the web interface and other clients.
- **Away detection** (optional): Kemai stops the timer when you're idle or lock your session, at the time you left.
- **Several servers**: save profiles for different Kimai servers. API tokens are stored in the system keychain. You can trust self-signed certificates per server.

## Requirements

- Kimai 2.14 or later
- An API token (in Kimai, open your profile and go to *API access*). Login with username and API password isn't supported anymore.

## Installation

Version 26.11.1 is the first stable release of the new Kemai, completely rewritten with Qt 6 and QML. It replaces version 0.11.1, which doesn't receive updates anymore.

For now, there are no prebuilt packages: build Kemai from source with the instructions in the [latest release](https://github.com/AlexandrePTJ/kemai/releases/latest). Signed Windows packages and a Flathub package are planned.

Kemai 26.11.1 runs next to Kemai 0.11 without changing its settings. At the first start, it offers to import your existing profiles.

## Privacy

Kemai connects only to your Kimai server and, for the optional update check, to the public GitHub API. There's no telemetry.
