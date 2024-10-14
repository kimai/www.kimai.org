---
title: Payments
description: How to pay your Kimai Cloud subscription - payment methods, billing period, trial period and more
---

You can use the test phase and the free plan without adding any payment method.
However, you must do so before applying for a paid plan.

### SEPA Direct Debit

Customers with a European bank account can issue a SEPA direct debit mandate.

### Credit cards

Supported card providers include **Visa, Mastercard, American Express, Discover, Diners** and more.

### Payment

#### Starter and Professional

Those are pre-paid plans. You decide on the amount of licenses and purchase them in advance.

If you need further licenses, you can purchase them at any time. The price is pro-rated, so you pay for the remaining time of the current subscription period. 

You can cancel your contract until the last day before the end of the subscription period. When your subscription expired, you will not receive another invoice.

#### Plus and Premium (deprecated)

These plans were in deprecated January 2024 and cannot be booked anymore. 
Price depends on the plan and the number of registered users. 
You can always change the amount of users and the Kimai-Cloud is billed **in hindsight**: invoices are issued at the end of each billing period.

See below ar "User based billing" for details.

If you cancel your contract, you will receive a final invoice after your subscription expired.

### Billing period

Billing takes place on a monthly or annual basis, **the billing day corresponds to the day the plan is booked**.
As an example: booking the premium plan on 26.12. results in subsequent invoices being issued on the 26th of each month.

If you need to be billed on certain dates (e.g. first of the month), please subscribe either on the next first of the month or contact support.

### Trial period

If you need an extended trial period and/or additional trial users, please contact support.

### EU Reverse-Charge and taxes
 
Kimai Cloud, as a SaaS operation, falls under "Electronically Provided Services / Data Processing" whereby the **Receiver location Principle** applies.
 
- The tax rules of {{ site.cloud.country }} apply.
- A valid VAT ID is required to issue an EU reverse-charge invoice.
- The tax-number you enter will appear on your invoice in any case.

**The Kimai Cloud is explicitly aimed at B2B customers.**

- Business customers from the EU with Vat ID will receive reverse-charge invoices.
- Our business location is Austria, so customers from Austria aways receive an invoice including tax. 
- Customers from all other EU countries without Vat ID will receive invoices with VAT of their home country (under the OSS / One-Stop Shop program).

### How payment data is stored

I work with the payment service provider "Stripe", which manages your payment data securely.
Your payment details (credit card number and CVC/check digits, or IBAN for SEPA) are **never** sent to the Kimai server.

There is anonymous access from "Stripe" to the following data for informational and fraud prevention purposes:
- the card issuer (CC) or bank details (SEPA) including the country
- the expiration date (CC)
- the last 4 digits of the card (CC) or the IBAN (SEPA)

### User licenses

Usually each registered user of a Kimai Cloud is charged, but I believe in fairness:

- **Active users** use one license
- **Deactivated users** do not use a license. Once you deactivate a user, the license is free again to be re-used by another account. If you reactivate a previously deactivated user, a license is used again. 

If you do not have sufficient licenses for creating a new account or for activating an existing account, then you can purchase more licenses at [My Cloud](https://www.kimai.cloud/my-cloud/).

### User based billing

Accounts still on the deprecated **metered plans** `Plus` and `Premium` use a different calculation model (these plans are not available for new customers).

- **Active users will be charged**
- Deactivated users will be charged **if they have any activity less than one month ago**, e.g.:
  - the user was registered within the last month
  - the user has logged in within the last month
  - the user has a time booking within the last month (or later)
