---
title: Developer introduction
description: Developer docs for Kimai 1
redirect_from:
  - /documentation/developer/documentation.html
  - /documentation/developer/introduction.html
  - /documentation/developer/index.html
  - /documentation/developer/
---

This document gives an overview of how Kimai works. It is intended for developers (core and extensions).

## Glossary

First lets talk about the wording used in Kimai to describe things:

### Floater (or Dialog)

Those are the dragable “windows” which open as an overlay in the page. For example the preferences dialog or the dialog to add new timerecords.

### Sublists

The lists in the lower part which show users, customers, projects and tasks.

### Processor

PHP files which handle AJAX calls.

### Extension

Every tab you see in Kimai (like timesheet, export, admin panel) is an extension.

## Folder structure

  * **core** these are the dispatcher files for kimai (entry points for web/mobile/api/floater)
  * **extensions** every subfolders is one extension, for details see the chapter below
  * **includes** Files which are needed in almost every other file.
    * **autoconf.php** Contains the configuration given by the user during setup. (Database connection information)
    * **basics.php** Simple wrapper to include all usually necessary files like functions and database layer.
    * **func.php** Database independant functions are placed here.
    * **kspi.php** “Kimai Standard Processor Initialization” is included by every processor. Some setup is done here.
  * **installer** Installer for Kimai.
  * **js** Contains javascript files for the core.
  * **languages** Every file is shown as a possible langauge (without the .php file extension) in the preferences dialog.
  * **libraries** External libraries which are used (and possibly modified) by Kimai.
  * **skins** All folders will be shown as available skins. Only the `styles.css` is mandatory. For the sake of readability you should split your stylesheets up into several files.
  * **templates** Templates used by the core.
  * **temporary** Used for temporary file creation.

## Login Process

Login happens at the /index.php file. This is where you land when you open the kimai folder in your browser. 
Both, customers and users can login through the same login mask. 
For conflicting names (user and customer have the same name) the customer account takes precedence.

After a successfull login the user is redirected to `/core/kimai.php`. Here all extensions are loaded and the main user interface is being build.

## Extensions

When you develop an extension you have to think of a name and a so called key. 
This key should be prepended to every javascript method, class, id, … just anything that is used within your extension to prevent conflicting names.

Floaters get their seperate folder under the templates folders. The folder css is obviously for CSS files which are needed by the extension. 
The js folder usually contains two javascript files. An `_init.js` and a `_func.js` file. 
The first should contain code to setup the extension. 
The second should only contains javascript functions which are used within this extension.

Only after an extension/tab is selected its content is being loaded. 
This is handled by the init.php file in the extensions folder. 
The processor.php file handles AJAX calls and floater.php creates those dragable windows.

## Install a release

From time to time we will release ZIP archives. These are most often beta versions, to be tested by our user base for problems and bugs. 
Production ready releases will be linked specifically in the download section at our website.

You can download the current developer-version as ZIP from our [master branch at GitHub]({{ site.kimai_v1_repo }}/archive/master.zip).

## Install from the repository

To get the developer version use the repository. Please keep in mind, that this version is NOT stable! 
We like to receive bug reports to be faster with fixing them, but we can not guarantee support for these versions.

We recommend using a fork, so any changes made can be pushed back and then submitted back via pull-requests:

* Fork Kimai
* Clone it locally: `git clone https://github.com/YOUR-USERNAME/kimai.git`

Then, if you want to make changes and submit them, use a feature branch:

* `git checkout -b my-feature`
* `git commit -am "Added my feature"`
* `git push origin my_kimai`

Create a pull request from your GitHub repo page.
