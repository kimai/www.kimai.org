---
title: Rounding
description: "Rounding duration and rates in Kimai: Why It Matters and How It Works"
---

Time tracking and invoicing operate on two fundamentally different mathematical bases:

- **Time** is measured in **base 60**
- **Money** is calculated in **base 100**

At first glance this does not seem important, but when a system needs to combine *measured time* with *decimal invoices*, rounding becomes unavoidable.

This page explains why rounding is necessary, why the results might sometimes look unintuitive, and why the behavior in Kimai creates **mathematically correct** invoices that comply with accounting and e-invoicing standards.

## Why does rounding happen at all?

### Time: base 60

Time entries are stored in seconds.
A minute has 60 seconds, an hour has 60 minutes. All divisions in this system produce repeating decimals when converted into decimal hours.

**Example:**

```
5 minutes = 300 seconds
300 / 3600 = 0.0833333… hours
```

### Money: base 100

Prices and invoice totals must follow decimal rules.
The smallest allowed monetary unit is:

```
0.01 (one cent)
```

### The problem

Decimal hours allow only two decimal places:

```
0.0833333… rounds to 0.08 hours
```

But if you **calculate money using the unrounded duration**, yet **display only the rounded duration**, you create an accounting mismatch.

This was the behavior in older Kimai versions and caused in certain circumstances real invoice validation issues.

## The fundamental constraint
### **0.01 hours = 36 seconds**

To stay compatible with decimal invoices, Kimai must convert time into the smallest possible unit that works for both systems:

- The smallest monetary step is **0.01**
- Therefor the smallest compatible duration step is:
  **0.01 hours × 3600 seconds = 36 seconds**

This means:

- All durations are rounded to multiples of **36 seconds**
- All hourly calculations use these **rounded durations**
- The result always matches:
  **displayed duration × hourly rate = displayed amount**

This ensures your invoice is mathematically correct and fully compatible with tax authorities and e-invoicing systems.

## Why does the rounding feel “wrong” for small durations?

A real example from a user question:

> “5 minutes used to result in 5€, now it shows 4.8€. Why?”

Let’s compare the **intuitive** calculation vs. the **decimal** calculation.

### ❌ The intuitive but incorrect expectation

Many people still think in "base 60" units:

- 1 hour = 60€
- 60 minutes / 5 minutes = 12
- 60€ / 12 = **5€**

But invoices do **not** work this way and this method ignores decimal rounding.

### ✔ The correct decimal calculation

```
5 minutes = 300 seconds
300 / 3600 = 0.083333… rounds to 0.08 hours
60€ × 0.08 = 4.8€
```

This is how proper decimal invoicing works.

### Showing `0.08h` on the invoice, but charging `5€` is **incorrect**

This inconsistency:

- violates accounting rules
- can make clients reject invoices
- leads to automatic validation errors in e-invoices

Kimai must prevent this.

## Example: 5 minutes (loss) and 10 minutes (gain)

### 5 minutes:

```
300 sec / 3600 = 0.083333… rounds to 0.08
60€ × 0.08 = 4.8€
```

### 10 minutes:

```
600 sec / 3600 = 0.166666… rounds to 0.17
60€ × 0.17 = 10.2€
```

As you see:

- Sometimes rounding means you “lose” a few cents
- Sometimes you “gain” a few cents
- Over time, these effects usually cancel out

This is normal behavior in any decimal-based billing system.

## Why the new method is better

Older versions of Kimai:

- **Displayed** rounded decimal hours
- **Calculated** with full unrounded seconds
- Produced mismatches between displayed duration and monetary total
- Caused rounding inconsistencies when many entries were merged
- Broke e-invoice validation rules

The new approach:

- Converts all durations into **decimal-compatible seconds** (multiples of 36)
- Ensures: **displayed hours × rate = displayed money**
- Completely eliminates hidden rounding differences
- Produces mathematically and legally correct invoices

This is the only approach aligned with accounting principles.

## Should I round my recorded working time?

For many businesses: **yes**.

But not in the way most people think. Humans tend to round to multiples of 5 — often 10 — because it feels natural.
However, when it comes to time-tracking and converting durations into decimal hours, rounding to 5 or 10 minutes 
**creates repeating decimals** (e.g., 10 minutes = 0.16666… hours), which can lead to unexpected results in invoices or reports.

To avoid this problem, it is recommended to round your recorded working time to a multiple of 3 minutes.

**Why 3?**

Because 3 minutes is 1/20 of an hour = exactly 0.05 hours. No repeating decimals.

Even better is rounding to 6 minutes (0.1 hours) or 15 minutes (0.25 hours), which also convert into clean decimals without fractions.

Common and reliable duration roundings are therefore:
* 3 minutes = 0.05 h
* 6 minutes = 0.1 h
* 15 minutes = 0.25 h

These values help you **avoid all decimal rounding issues** and are widely used in many industries because they simplify both time-tracking and invoicing.

Of course, Kimai supports exact second-based tracking for businesses that need precise timestamps; rounding rules simply ensure that your invoice totals always remain predictable, consistent, and compliant.

## Summary

- Time is base 60, money is base 100 which is incompatible by design
- Decimal hours have only 2 decimals with the smallest unit = **0.01h = 36 seconds**
- Kimai rounds durations to multiples of 36 seconds
- This guarantees: **displayed duration × hourly rate = displayed total**
- The new rounding is mathematically correct and required for valid invoices
- Small deviations for very short entries are expected and normal

Even if certain examples feel unintuitive at first, the new rounding system ensures that your invoices are consistent, compliant, and correct.
