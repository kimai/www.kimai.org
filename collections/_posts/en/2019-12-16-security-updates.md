---
title: "Security updates"
date: "2019-12-16 19:08:00 +0200"
image: /images/blog/cover-cloud.webp
author: kevinpapst
tags: [cloud]
---

Some recent improvements were introduced to further strengthen the security of the Kimai cloud. This blog post is short and includes only technical information, we wanted to share it nevertheless, as we feel that our users should be informed which steps we take to protect your data.

## Supported TLS versions

Support for the [deprecated TLS version 1.0 and 1.1](https://blog.qualys.com/ssllabs/2018/11/19/grade-change-for-tls-1-0-and-tls-1-1-protocols) were removed in our webserver setup.
From now on only TLS 1.2 and TLS 1.3 connections are allowed.

During that change we cleaned up the allowed cipher suites to match the new standards.

## DNSSEC

DNSSEC was activated in our name servers, which are used for the Kimai cloud. 

_The Domain Name System Security Extensions (DNSSEC) is a suite of Internet Engineering Task Force (IETF) specifications for securing certain kinds of information provided by the Domain Name System (DNS) as used on Internet Protocol (IP) networks. It is a set of extensions to DNS which provide to DNS clients (resolvers) cryptographic authentication of DNS data, authenticated denial of existence, and data integrity._ (via [Wikipedia](https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions))

## Strict-Transport-Security

While this was already active for all cloud sites, we further hardened it by utilizing the most strict version 
`Strict-Transport-Security' 'max-age=31536000; includeSubDomains; preload` on the base domain. We also requested to be added to the official browser [HSTS preload list](https://hstspreload.org).

This HSTS header tells your browser to use HTTPS only when connecting to the Kimai cloud (no cloud is and never was available via http).

## CAA DNS record

We are using Letsencrypt certificates to secure the SSL connection between your browser and our servers. 

To make sure that no other certificate authority will issue a certificate for the Kimai cloud, we added a DNS record to announce that we are exclusively using Letsencrypt. This record is accepted by all legit certificate authorities and should prevent that anyone else will issue a certificate for our domains.

_DNS Certification Authority Authorization (CAA) is an Internet security policy mechanism which allows domain name holders to indicate to certificate authorities whether they are authorized to issue digital certificates for a particular domain name. It does this by means of a new "CAA" Domain Name System (DNS) resource record._ (via [Wikipedia](https://en.wikipedia.org/wiki/DNS_Certification_Authority_Authorization))
