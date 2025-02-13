---
title: "Upgrading your plugins for 2.0"
date: "2023-05-19 13:00:00 +0200"
image: /images/blog/cover-kimai2-plugins.webp
author: kevinpapst
tags: [On-Premise]
---

The plugin structure for Kimai 2.0 is not compatible with the existing plugins for Kimai 1.

The main reasons are technical, mainly caused by:

- the changed frontend, which does not allow to use the old HTML and JS code
- the upgraded backend framework  
- API changes, which require the plugin to upgrade their integration part

The following sections only cover paid plugins created by Kevin Papst, the maintainer of Kimai. Plugins from other developers might handle that differently.

## New merchant: Lemon Squeezy

Kimai 1 Plugins were sold exclusively through the Gumroad store. 
Gumroad made some decisions, that I disliked and therefor I looked ourtfor a potential replacement.
I found Lemon Squeezy, who is now my primary merchant, but I still offer my Plugins at Gumroad as well, because they support PayPal.

Some customers reported problems with Visa CC payments at Lemon Squeezy. If you are one of them: please retry the purchase at Gumroad.  

## Discounts for existing customer

Existing customers will receive a discount code for buying the upgraded plugin version, compatible with 2.0.
Depending on the time of your purchase you will receive either a 50% or 75% discount code.

You will receive an email with your personal code, which is specific to the product you have purchased.
This discount code will expire in a few months (the date is also included in the email).
If you haven't received an email by the end of May 2023, please [contact me](mailto:support@kimai.cloud).

## Subscription model

Most of the plugins will be moved to a subscription model.
Several months ago I [wrote]({% link _posts/2022-12-31-next-major-release-preview.md %}): 

> While some of you might not like that announcement, I hope that most will understand it: plugin distribution will switch (at least partially) to a subscription model.
> This is not about maximising profit, I would not share so much of my code and time for free otherwise.
> It's about being able to run a sustainable business, being able to concentrate 100% on Kimai and
> being able to get an employee ...

In the following sentences I will tell you a bit more about the "why", so that you can understand my reasons behind this decision.
To understand it, we need to take a step back and look at the last few years, my personal story of creating Kimai:

In 2018, I started working on Kimai and quit my freelance business to work on Kimai full-time.
In the course of the next three years, I not only had to give up the potential income of some big projects that were offered to me,
I still had to support my family and myself while building Kimai to the point where it was possible to generate income.
Although I had already sold some plugins since the mid of 2019, I was still making losses until the end of the third year.

People often think that open source software is for free, but forget how much money was spent to create it:
Kimai was worth between €300-500k at the time. My money, not some investor's.
All of this was only possible, because I had enough savings and because my wife supported my dream of being an independent open-source developer.

Although I am still a long way from the money I made as a freelancer, I enjoy working with Kimai so much that I am not looking back!
But the amount of time I have to spend on Kimai is getting more and more, time I want to share with my family again - so I need help in the form of an employee.
An employee who also wants to be paid.

And that is, after working for almost five years on Kimai, why I have changed most plugins to a subscription model. For a sustainable business model that allows me to continuously work on Kimai and improve it for everyone.
The subscription model is simple and fair: you pay for the plugin on an annual basis and get access to every new version.
If you cancel your subscription, you will lose access to future updates, but you can still use the latest version you own.

## Want to switch to the cloud instead?

Most plugins are available in the cloud, access depends on the paid plan you choose. 
The cloud is cheaper if you only have a few users.

If you want to switch, I am offering the "Summer of Free Migration":
If you switch to [a paid plan]({{ site.cloud.url }}/pricing), I will **import your existing Kimai data for free**.
All I need is the registered cloud and a database dump of your current Kimai installation.
Please [contact me](mailto:support@kimai.cloud) to discuss the details.
