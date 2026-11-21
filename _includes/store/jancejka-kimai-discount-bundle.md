DiscountBundle adds discounts to individual Kimai invoices. You decide the discount when you invoice: on the "Create invoice" page, after you have seen the invoice amount.

A discount belongs to one invoice, not to a customer or a template. It consists of up to 10 lines, each with its own description and either a fixed net amount or a percentage. The lines are applied one after another on the remaining net amount, and taxes are calculated afterwards. Everything is calculated in whole cents, percentages are rounded half-up, so the discount lines always add up exactly.

The discount is part of the invoice lines, subtotal, taxes and total stored in Kimai, and therefore also of the PDF, the payment QR code, the invoice history and its XLSX export. Time entries, rates and budgets stay untouched.

- Discount editor right next to the customer on the "Create invoice" page, the total price column shows the discounted amount immediately
- Preview as often as you like, saving the invoice uses the discount exactly once (also with two open tabs, a double click or a resubmitted form)
- Every saved invoice keeps an immutable snapshot of its discounts and calculation
- Works with Kimai's built-in invoice documents, custom templates get extra variables such as `invoice.discount_total`
- Report "Invoiced (with discounts)" with totals by customer and/or month, totals per currency and XLSX export
- English and Czech translations

DiscountBundle can be used **free** of charge for **3 discounts per month** per Kimai installation. A **license** (49 € / year) unlocks **unlimited discounts** and the report "Invoiced (with discounts)".

## Download

Download the free version from the public distribution:

<https://github.com/Cuchulain/kimai-discount-bundle-dist/releases/latest/download/DiscountBundle.zip>

More information is available at <https://kimai-discountbundle.jancejka.cz/>.

## Requirements

- Kimai version 2.71.0 or newer
- MySQL or MariaDB database

## Pricing

- **Free** for **3 discounts per month**, without the report
- **License** for **unlimited discounts** and the report "Invoiced (with discounts)", valid for one production and one test installation

## Buy license

Subscribe (49 € / year) at [Lemon Squeezy](https://witcher.lemonsqueezy.com/checkout/buy/a7fea23c-0c89-49e4-8d8a-71d21d94d8ed).

The license key is activated by a super admin in **System → DiscountBundle license**.
