---
title: Rates & Fees
redirect_from:
  - /manual/rates.html
  - /manual/manual/rates.html
  - /documentation/manual/rates.html
  - /documentation/fees/
  - /documentation/rates/
---

Here is the order in which is checked if a rate exists. The first one found is then used:

* my rate of the activity
* my rate of the project
* my rate set via preferences
* rate of the activity
* rate set for the project

## Database 

See function ```get_best_fitting_rate``` in Database class.

If you have a look into the table kimai_rates you may see something like this:

| User | Project | Event | Rate |
| -- | -- | -- | -- |
| 1 | 2 | 5 | 10.00 |
| 2 | NULL | 5 | 20.00 |
| 2 | 2 | NULL | 30.00 |
| 2 | NULL | NULL | 40.00 |
| NULL | 2 | 5 | 50.00 |
| NULL | NULL | 5 | 60.00 |
| NULL | 2 | NULL | 70.00 |

The entries are already sorted. Kimai takes the first row that exists (maybe the one with the most hits).

Explanation of the table:

- user 1 on project 2 and task 5 has a rate of 10.00 € per hour
- user 2 on task 5 has a rate of 20.00 € per hour
- user 2 on project has a rate of 30.00 € per hour
- user 2 has a rate of 40.00 € per hour
- project 2 and task 5 have a rate of 50.00 € per hour
- task 5 has a rate of 60.00 € per hour
- project 2 has a rate of 70.00 € per hour

Some examples:
- User 3 is working on project 2: his rate is 70.00 €
- User 2 is working on project 1 and task 5: his rate is 20.00 €
- User 2 is working on any project except the defined ones for him: his rate is 40.00 €

This table can only be edited with SQL statements or a database-tool (05/03/2010).
