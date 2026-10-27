Additions to Kimai's **Reporting** section and dashboard.

- **Quarterly views** for one user and for all users, in the style of Kimai's yearly views,
  with a quarter picker that steps a quarter back or forward.
- The **weekly, monthly, quarterly and yearly reports for one user** get a bar chart of the
  hours per day (or month), stacked by project, and a doughnut chart with the total time in
  its centre. In the table, projects are indented under their customer, names link to their
  detail pages, and the table sorts by customer or total. Buttons next to the period picker
  switch between the four views.
- A **Summary** report shows any period on one page: totals, a bar chart over time, a
  doughnut chart, and a breakdown per project, customer, activity or user down to each
  description.
- Two **dashboard widgets**: your working hours by project per week, and an hours overview
  that separates your own hours from everyone's.

The charts use the Chart.js build that Kimai ships.

### Permissions

The plugin adds no permissions of its own. The reports follow Kimai's: `view_reporting` for
the summary report, `report:user` and `report:other` for the views for one user and for all
users, and `view_rate_own_timesheet` and `view_rate_other_timesheet` for amounts. Team leads
only see their team members.

### Support

Report problems and ideas in the plugin's
[issues](https://github.com/FaliseDotCom/kimai-reporting-graphs-bundle/issues). The full documentation is in its [README](https://github.com/FaliseDotCom/kimai-reporting-graphs-bundle#readme).

### Works well with

This plugin is one of five made to work together; each also works on its own:

- [Quick start bar]({% link _store/{{ page.lang }}/falisedotcom-quick-timer-bar-bundle.md %}): start and stop time recording from one bar below the top bar of every page.
- [Short time entries]({% link _store/{{ page.lang }}/falisedotcom-short-time-entries-bundle.md %}): type 945 for 9:45 or 10 for ten minutes in Kimai's time and duration fields.
- [Inline timesheet editing]({% link _store/{{ page.lang }}/falisedotcom-inline-timesheet-edit-bundle.md %}): edit your own records right in the record list.
- [Timesheet extras]({% link _store/{{ page.lang }}/falisedotcom-timesheet-extras-bundle.md %}): collapsible days in the record list and closable search filters.
