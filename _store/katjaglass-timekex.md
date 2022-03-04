---
title: TimeKex - Kimai meets Excel
name: TimeKex - Importing timesheet Excel files
intro: "Import your Excel maintained times into Kimai on a weekly basis. A flat customer/project/activity import from Excel is also available."
developer: katjaglass
date: "2022-03-04 12:00:00 +0100"
icon: fas fa-file-excel
price: "0"
screenshot: 
  - https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/timesheet_to_kimai_01.gif
  - https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/layout_week_display.png
  - https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/example_admin_create_02.png
  - https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/layout_week_display_issues.png
github: https://github.com/KatjaGlassConsulting/TimeKex
type: client
new: true
features:
  - excel
  - import
tags:
  - Excel
  - Import
---

This application is designed to allow importing times, tracked in Excel, into Kimai by uploading the Excel files through the web frontend.

![Screenshot of login screen](https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/timesheet_to_kimai_01.gif)

## Documentation and Demo

The documentation of TimeKex as well as a running demonstration instance is available [here](https://katjaglassconsulting.github.io/TimeKex/).

The demonstration is running on the stable Kimai demo instance. Be aware that this demo instances is regularily rebuild.

[Example excel](https://github.com/KatjaGlassConsulting/TimeKex/tree/main/exampleFiles) files are located in the GitHub repository.

## License

### Code & Scripts

This project is using the [MIT](http://www.opensource.org/licenses/MIT "The MIT License | Open Source Initiative") license (see [`LICENSE`](LICENSE)) for code and scripts.

## Local Development and Compilation

TimeKex is a ReactJS Web Application. To run a local development version, you can use NPM to install all dependencies and start or build the app. 

1. Make sure to have [NPM installed](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
2. Download/clone this repository to a folder `<folder>`
3. Open the command line, go to that folder (cd `<folder>`)
4. Install packages using `npm install`
5. Start the development server with `npm start`
6. Build the app via `npm run build`

## Deployment

The TimeKex web application is a simple static HTML fileset which can run locally or on any Webserver. When you have build the app, it can simply be started by opening "index.html".

The final build folder contains next to the config.js also additional example configurations files which you might want to try. Just copy the content as config.js to apply the corresponding configuration. The current configuration files are using the Kimai demonstration server and users.

![Folder Structure](https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/folder_structure_build.png)

## Excel Structure Timesheets

![Excel Sheet Structure](https://raw.githubusercontent.com/KatjaGlassConsulting/TimeKex/main/docs/img/layout_excel_sheet.png)

The Excel file is expected in a specific format. When the Excel file should contain a different structure, for example different column names, this can be changed by a source code updated and re-compiling the app. The file `src/features/excelImport/ExcelSchema` is responsible to read in and map the corresponding Excel file to the specific object required for the application. Feel free to update the column names from the Excel file.

The package [read-excel-file](https://gitlab.com/catamphetamine/read-excel-file) is used to read in the Excel file and use the corresponding schema for mapping. Please look into the package details to apply a different schema.

For the Excel file it is very important that the first sheet contains the time data and that the first row starts with the column names. There can be additional sheets and additional columns in the Excel file. The column order is also not relevant. Example file is available under "./exampleFiles"
