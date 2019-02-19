---
title: Invoice templates
description: Invoice templates variables for Kimai 1
redirect_from: 
  - /documentation/developer/invoice-templates.html
  - /documentation/invoice-templates/
---

Creating templates for the invoice extension is actually pretty easy.

You can create templates Open Office documents or HTML pages.
Existing templates are stored in the directory ```extensions/ki_invoice/invoices/```.

There is a repository for sharing ready-to-use [Invoice templates](https://github.com/kimai/invoice-templates) where you
can find a Debug HTML invoice, which will help you in inspecting all possible variables while developing your own template.

## Open Office templates

When writing an ODT (Text Document) or an ODS (Spreadsheet) file you can use following variables in the form
of ```[var.variablename]``` (the brackets are required).

Variables you can use:

* ```[var.today]``` Current Date
* ```[var.ttltime]``` Total amount of hours
* ```[var.invoiceID]``` Defined as "CUSTOMER-NAME - YEAR - MONTH". See /extensions/ki_invoice/print.php. 
* ```[var.beginDate]``` Selected starting date
* ```[var.endDate]``` Selected end date
* ```[var.dueDate]``` Defined as Current Date %2B 1 Month. See /extensions/ki_invoice/print.php.
* ```[var.currencySign]``` Currency sign (e.g. €)  
* ```[var.currencyName]``` Currency name (e.g. Eur)
* ```[var.invoiceDate]``` Timestamp when this invoice was generated
* ```[var.dateFormat]``` Date format for formatting the invoiceDate (Kimai config: date_format_2)
* ```[var.vatRate]``` VAT rate
* ```[var.vat]``` Total VAT sum
* ```[var.amount]``` Total sum without VAT
* ```[var.total]``` Total sum including VAT

Customer related variables:

* ```[var.companyName]``` Company of the customer
* ```[var.customerName]``` Name of the customer
* ```[var.customerStreet]``` Street of the customer
* ```[var.customerCity]``` City of the customer
* ```[var.customerZip]``` Zip code of the customers city
* ```[var.customerComment]``` Comment, which is set for the customer
* ```[var.customerPhone]``` Phone number of the customer
* ```[var.customerFax]``` Fax number of the customer
* ```[var.customerMobile]``` Mobile number of the customer
* ```[var.customerEmail]``` Email address of the customer
* ```[var.customerContact]``` Name of the customer's contact person
* ```[var.customerVat]``` VAT of the customer

Project related variables:

An invoice can contain items for multiple projects. All projects are available from ```[var.projects]```.
Elements of the array can be accessed using a zero-based index.
For example the name of the first project is ```[var.projects.0.name]```.

*  ```[var.projects.0.name]``` Name of the project
*  ```[var.projects.0.comment]``` Comment of the project

A row has these variables:

* ```[row.desc]``` Name of the task (event)
* ```[row.hour]``` Duration of the timesheet entry in decimal hours
* ```[row.fduration]``` Duration of the timesheet entry formatted as "hours:minutes"
* ```[row.amount]``` Wage of the entry
* ```[row.date]``` Day of the entry
* ```[row.description]``` Description of the timesheet entry
* ```[row.comment]``` Comment of the timesheet entry

### Formatting variables in ODT

http://www.tinybutstrong.com/manual.php

var.today to [var.dueDate; frm='dd.mm.yyyy'] 
and added format to the row.date = [row.date; frm='dd.mm.yyyy']

### Problems with ODT documents

If you get a blank page or an error similar to the following

```bash
Fatal error: Uncaught exception 'tinyDocException'  with message 'the PHP global variable named 'c<text:span' does not  exist or is not set yet.' in  /var/www/kimai/extensions/ki_invoice/TinyButStrong/tinyDoc.class.php:997  Stack trace:
#0 extensions/ki_invoice/TinyButStrong/tinyButStrong.class.php(1870):  tinyDoc->meth_Misc_Alert(Object(clsTbsLocator), 'the PHP global  ...', true)
#1 extensions/ki_invoice/TinyButStrong/tinyButStrong.class.php(669):  clsTinyButStrong->meth_Merge_AutoVar('<?xml version="...', true)
#2 extensions/ki_invoice/TinyButStrong/tinyDoc.class.php(269):  clsTinyButStrong->Show(0)
#3 extensions/ki_invoice/print.php(204):  tinyDoc->saveXml()
#4 {main} thrown in extensions/ki_invoice/TinyButStrong/tinyDoc.class.php on  line 997
```

the variable name has a style applied. Select the (or all) variable name(s) and reset them to the default format.
Then you can format the whole variable name as you want it.

## HTML templates

Using HTML templates is possible since version 0.9.3.

If you want to create a new HTML template, you have to crete a new subdirectory in ```extensions/ki_invoice/invoices/``` with
an ```index.html``` or ```index.phtml``` file inside.

For example, creating the HTML template called "ACME" you would create: ```extensions/ki_invoice/invoices/ACME/index.html```.
The easiest way is to duplicate the directory "my_company" and rename the copy.
