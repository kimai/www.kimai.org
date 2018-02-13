---
layout: kimai
title: Documentation for Kimai
description: Documentation for Kimai Time-Tracking
---
# Fees

## How are fees calculated?

Here is the order in which is checked if a rate exists. The first one found is then used:

* my rate of the activity
* my rate of the project
* my rate set via preferences
* rate of the activity
* rate set for the project


See function ```get_best_fitting_rate``` in Database class.
