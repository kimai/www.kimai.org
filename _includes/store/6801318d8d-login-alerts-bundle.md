LoginAlertsBundle sends a push notification through [ntfy](https://ntfy.sh) when someone fails to log in to Kimai:

- every failed login (wrong password, unknown user, locked account...), with the login name that was tried, the address it came from (local network or internet), the reason and the browser
- every wrong two-factor code, i.e. somebody who knows the password

To avoid a flood during a brute-force attempt, for each kind, login name and address only the 1st, 5th, 20th and 100th failure within 10 minutes is sent, with the number of attempts. A notification that cannot be sent is only logged: the login itself never breaks.

## Configuration

Environment variables of the Kimai process (for Docker, the `environment` of the Kimai service):

- `LOGIN_ALERTS_NTFY_URL` - base URL of the ntfy server, e.g. `https://ntfy.sh` (required)
- `LOGIN_ALERTS_NTFY_TOPIC` - topic to publish to, default `kimai-alerts`
- `LOGIN_ALERTS_NTFY_TOKEN` - access token of an ntfy user that may write to the topic, if your server requires one

The ntfy server must support message templates (`tpl=1`, ntfy 2.x; tested with 2.30).

## Installation

Clone or unzip the [latest release](https://github.com/6801318d8d/LoginAlertsBundle/releases) into `var/plugins/LoginAlertsBundle`, set the variables above and run `bin/console kimai:reload --env=prod`. Nothing is stored in the database. See the [README](https://github.com/6801318d8d/LoginAlertsBundle#readme) for the Docker image.

## Support

Questions, bugs and ideas: [GitHub issues](https://github.com/6801318d8d/LoginAlertsBundle/issues).
