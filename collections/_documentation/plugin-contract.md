---
title: Working contract
description: Logging entity changes in Kimai
toc: false
---

The "Working hours, vacation, sickness (controlling)" plugin bundles the following features:

- [Working times]({% link _documentation/contract.md %})
- [Absence management]({% link _documentation/absence.md %})
- [Public holidays]({% link _documentation/public-holiday.md %})

## Video introduction

See these videos:

- {% include youtube-video-link.md id="workcontract" %}
- {% include youtube-video-link.md id="public_holiday" %}
- {% include youtube-video-link.md id="absence_approval_workflow" %}

## Import from MR Plugins

The importer supports the following plugins:

- Controlling
- Sickday
- Vacation

It will skip most of the data, do NOT expect the same settings or results as previously in MR reported.
This plugin has no feature parity with the MR plugins, it was never meant to replace it but to provide a new solution.
There are some major differences in the way the both plugins work and calculate working-time.

That being said, what is imported?

- Public-holiday groups
- Public-holidays
- User settings for working-times Monday to Sunday
- User settings for vacation days per year
- User settings for public holiday group
- Timesheets for vacations will be converted to approved vacations
- Timesheets for sickness will be converted to approved sickness

And what is not imported?

- Timesheets for public-holidays (the new system does not need them)
- All vacations which were not approved (rejected, canceled or only planned)
- All sickness day which were not approved (canceled or only planned)
- Controlling data (PDFs, monthly summaries, holiday settings of previous years)

Now how do you import the data?

- Run `bin/console kimai:bundle:workcontract:import-mr` from the bash after installing this plugin
- Follow the questions, you can skip cancel the process with `c` in the beginning, afterward each step can be skipped with `s`
    - YOU NEED TO CREATE A BACKUP FIRST
    - Recommended approach is to step through the entire process with `Enter` several times and let the importer migrate what is possible and let it delete the rest
    - You have your original data still in your backup!
