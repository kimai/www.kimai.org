---
title: Rounding
description: "Rounding duration and rates in Kimai: Why It Matters and How It Works"
---

## Why do we round at all?

Time tracking and invoicing operate on two fundamentally different mathematical bases:

- **Time** is measured in **base 60**
- **Money** is calculated in **base 100**

At first glance this does not seem important, but when a system needs to combine *measured time* with *decimal invoices*, rounding becomes unavoidable.

This page explains why rounding is necessary, why there are different ways with different results and why you should configure the correct behavior for you, 
so Kimai can create (mathematically) **correct** invoices that comply with accounting and e-invoicing standards.

### Time: base 60

Time entries are stored in seconds.
A minute has 60 seconds, an hour has 60 minutes. Divisions in this system often produce repeating decimals when converted into decimal hours.

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

## Should I round my times?

The general answer is: for most businesses **yes**.

But not in the way most people think. Humans tend to round to multiples of 5 — often 10 — because it feels natural.
However, when it comes to time-tracking and converting durations into decimal hours, rounding to 5 or 10 minutes
**creates repeating decimals** (e.g., 10 minutes = 0.16666… hours), which can lead to unexpected results in invoices or reports.

To avoid this problem, it is recommended to round your recorded working time to a multiple of 3 minutes.

**Why 3?**

Because 3 minutes is 1/20 of an hour = exactly 0.05 hours. No repeating decimals. Common and reliable duration roundings are therefore:

* 3 minutes = 0.05 h
* 6 minutes = 0.1 h
* 15 minutes = 0.25 h

These values help you **avoid all decimal rounding issues** and are widely used in many industries because they simplify both time-tracking and invoicing.

Of course, Kimai supports exact second-based tracking for businesses that need precise timestamps; rounding rules simply ensure that your invoice totals always remain predictable, consistent, and compliant.

## Selecting the rounding mode

- Go to [System → Settings]({% link _documentation/configurations.md %})
- Go to `Invoice`
- Select the `Rate rounding` mode
    - The `classic` mode, feels most natural but can lead to small rounding issues
    - The `decimal` mode rounds duration to a multiple of 36 second, safe but can be unintuitive

There are other rules to define how the timesheet start and end times and the duration should be rounded. 
The rounding issues discussed in this article always originate from the **duration of a timesheet**.

The relevant configuration to check and adjust is `Time rounding → Rounding of the duration` at [System → Settings]({% link _documentation/configurations.md %}).

## Rounding: CLASSIC 

This mode is available, as it is the most intuitive one. 
Due to potential rounding issues, it is recommended to round the `duration` with a multiple of `3` minutes.

- **Calculate** with unrounded seconds
- Uses **4 decimals** to calculate rates
- **Displays** rounded decimal hours with **2 decimals**
- Can produce mismatch between displayed duration and monetary total

Use this, if you never experienced rounding issues. It is the `default` rounding mode.

## Rounding: DECIMAL 

Decimal hours are displayed with two decimal places on invoices:

```
0.0833333… rounds to 0.08 hours
```

But if you **calculate money using the unrounded duration**, yet **display only the rounded duration**, you create a mismatch.
This can cause (in certain circumstances) invoice validation issues.

### **0.01 hours = 36 seconds**

To stay compatible with decimal invoices, Kimai can convert time into the smallest possible unit that works for both systems:

- The smallest monetary step is **0.01**
- Therefor the smallest compatible duration step is:
  **0.01 hours × 3600 seconds = 36 seconds**

This means:

- All durations are rounded to multiples of **36 seconds**
- All hourly calculations use these **rounded durations**
- The result always matches:
  **displayed duration × hourly rate = displayed amount**

This ensures your invoice is mathematically correct and fully compatible with tax authorities and e-invoicing systems.

### Expectation vs Reality

Let’s compare the **intuitive** calculation vs. the **decimal** calculation.

The intuitive expectation stems from thinking in "base 60" units:

- 1 hour = 60€
- 60 minutes / 5 minutes = 12
- 60€ / 12 = **5€**

But this method ignores decimal rounding, which looks like this:

```
5 minutes = 300 seconds
300 / 3600 = 0.083333… rounds to 0.08 hours
60€ × 0.08 = 4.8€
```

This is how **decimal rounding** works.

Showing `0.08h` on the invoice, but charging `5€` is **incorrect**.

This inconsistency can:

- violate accounting rules
- make clients reject invoices
- lead to automatic validation errors in e-invoices

Decimal rounding prevent this.

### Examples

**5 minutes (loss)**

```
300 sec / 3600 = 0.083333… rounds to 0.08
60€ × 0.08 = 4.8€
```

**10 minutes (gain)**

```
600 sec / 3600 = 0.166666… rounds to 0.17
60€ × 0.17 = 10.2€
```

As you see:

- Sometimes this rounding means you “lose” a few cents
- Sometimes you “gain” a few cents
- Over time, these effects should cancel out

### Summary

- Time is base 60, money is base 100 - conversion can lead to rounding issues
- Decimal hours have only 2 decimals with the smallest unit = **0.01h = 36 seconds**
- Rounding durations to multiples of 36 seconds guarantees: **displayed duration × hourly rate = total rate**
- Completely eliminates hidden rounding differences

Even if certain examples feel unintuitive at first, this rounding system ensures that your invoices are consistent and always compliant.

