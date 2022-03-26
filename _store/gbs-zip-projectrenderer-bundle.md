---
title: ZipProjectRenderer plugin for Kimai
name: ZipProjectRenderer plugin
intro: "A Kimai 2 plugin that allows to create a separate PDF file per project for several selected projects in the export. The PDF-Files which are then packed into a zip archive that is downloaded."
developer: gbs-it
date: "2012-03-24 20:00:00 +0200"
icon: fa-solid fa-file-zipper
price: "0"
download: https://github.com/jens-2305/ZipProjectRendererBundle/archive/master.zip
github: https://github.com/jens-2305/ZipProjectRendererBundle
type: plugin
tags:
  - plugin
bundle:
  name: "ZipProjectRendererBundle"
  clone: "https://github.com/jens-2305/ZipProjectRendererBundle.git" 
---


### Storage

This bundle stores the files to be created in the system temp directory. [PHP function sys_get_temp_dir()]
Make sure that this directory is writable for your web server. The files are automatically deleted after download.
