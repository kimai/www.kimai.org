---
title: ZipProjectRenderer plugin for Kimai
name: ZipProjectRenderer plugin
intro: "A plugin to export one PDF files per project for multiple selected projects."
developer: gbs-it
date: "2022-03-24 20:00:00 +0200"
icon: fas fa-file-archive
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

The export PDFs are packed into a zip archive that will be sent as download.

### Storage

This bundle stores the files to be created in the system temp directory. See PHP function `sys_get_temp_dir()`.

Make sure that this directory is writable for your web server. The files are automatically deleted after download.
