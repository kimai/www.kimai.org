## Installation and demo video

{% include youtube-video.html id="HjJClWQKzWY" title="Kimai 2 Vacation + Sick Day + Controlling Plugin Installation + Setup" %}

## Features

- See if your users have overtimes or undertimes (since first day in company, per month, per day)
- Check if they violate the German break time law "Arbeitszeitgesetz (ArbZG) § 4 Ruhepausen"
- Users see how much overtimes or undertimes they have + how much they've worked already in the current month and how much they still have to work in the current month
- Overview for Administrators to see all calculated times in one view
- See if one of your user's birthday is coming soon
- Handout for employees as PDF to see the worked hours of the month
- Handout downloadable as a single PDF file for all employees or easy sendable via email to each employee (even to his private email account!)
- Detect overlapping times with one click
- See if your users have missing days (no times entered on days where they had to work)
- Users can tag their time spent in home office. At the end of the year this plugin provides every user a comprehensive overview as PDF of the time spent in home office. This is
  important for tax reasons.

## FAQ

#### Reset the plugin

Usually there's no need to do this, but if you encounter any configuration problems you can reset the plugin configuration by executing a single SQL command. Make sure that you know what are you're doing and before executing the command create a backup of your data.

Show current configuration: `SELECT * FROM kimai2_configuration WHERE name LIKE 'controlling.%';`

Reset configuration: `DELETE FROM kimai2_configuration WHERE name LIKE 'controlling.%';`

## Requires

For a list of all requirements to make this software functional, please e-mail us to info (at) mrsoft (dot) gmbh
