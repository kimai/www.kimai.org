---
title: "BlauArt Catering GmbH"
date: "2026-09-23 12:00:00 +0200"
permalink: /en/stories/blauart-catering
layout: story
tags: [stories]
author: nikita
excerpt: "Chips instead of paper: How the Potsdam catering company BlauArt modernized time tracking at 15 school locations"
homepage: www.blauart.de
homepage_url: https://www.blauart.de
logo: /images/stories/blauart-logo.svg
image: /images/stories/blauart-image.webp
person: Derk-Janko Blauert
photo: /images/stories/blauart-photo.webp
quote: "Derk-Janko is the IT administrator at BlauArt, with a strong focus on development and process optimization. He loves tricky problems, enjoys automating recurring tasks, and relies on pragmatic, user-friendly solutions. Data sovereignty and customizability are especially important to him – which is why he prefers to host systems on-premise and likes to use open source."
quote2: "We don't want to depend on other providers for where our data is stored. We want to be able to react quickly ourselves."
position: IT Administrator
industry: Catering
size: 70+
since: 2021
location: Potsdam, Germany
version: onpremise
wins:
  - Several hours saved in the HR department thanks to automatic time recording
  - Less effort processing vacation requests thanks to the digital request feature directly in Kimai
  - Reliable chip-based time tracking at 15 locations thanks to the Kiosk feature
  - Full real-time transparency for employees over their own working hours
intro_lines:
  - title: "Founders"
    content: "Simone and Ralf Blauert"
---

**TL;DR**

A catering company from Potsdam switched its entire workforce to digital time tracking with Kimai, making it easy to clock in and out with a personal chip at kiosk screens at the school locations. Since then, the company has been saving several hours of paperwork every year.

**About the company**

BlauArt is a family-founded catering company from Potsdam that today mainly supplies schools and daycare centers with meals. With around 70 employees, the team produces about 4,000 portions per day and places great emphasis on high quality, a high share of organic ingredients, and a vegetarian option every day. Digitalization and in-house IT solutions play a central role in keeping processes lean and responding flexibly to the different requirements of each facility.

Founded in 1994 by Ralf and Simone Blauert, the Potsdam family business BlauArt started out as a conference venue and has grown over three decades into one of the best-known catering companies in the region. Today, BlauArt delivers freshly prepared meals to around 15 schools and 6 daycare centers every day – roughly 4,000 portions a day. What is unusual for a catering company: BlauArt runs its own IT department with two specialists. Derk-Janko Blauert, son of Ralf and Simone, has been one of them since 2020. His approach is clear: *“Helping people with IT problems – whether that means finding the right software or writing scripts to automate tedious tasks.”*

<!-- PARTS -->

**The challenge: time tracking for everyone – even the less tech-savvy**

The legal obligation to record working hours was the formal trigger for BlauArt, but the real driving force was something else: the HR department needed to be relieved, and working hours should no longer be pieced together for several days after the fact, but recorded daily and traceably. On top of that, the new tool had to be easy for everyone to use. *“It was important to me that it's simple,”* says Derk-Janko. *“Swipe the chip, see your hours right away – done.”* At the same time, it was clear from the start that a cloud solution was out of the question. *“We don't want to depend on other providers for where our data is stored. We want to be able to react quickly ourselves.”* So the solution had to be open source, self-hostable, and at the same time as easy to use as possible.

**Choosing Kimai time-tracking**

Derk-Janko reviewed various options and quickly decided on Kimai – not least because of the [demo]({% link _pages/{{page.lang}}/demo.md %}) on the website. *“What also convinced me was that there's a demo – you quickly get a feel for it without having to set everything up first. With other tools, you first have to install them, enter data, and so on. With Kimai, I had a good first impression right away.”* The large community, the active development, and the ability to suggest features convinced him even further. It also fit the bigger picture that BlauArt already relies on other open-source products. *“If there's no other way, you go with closed-source software. But the basic idea is always: first see what the open-source market has to offer.”*

**The implementation: Raspberry Pi, RFID chips, and kiosk displays**

The rollout happened fast. Derk-Janko himself describes it as *“pretty much done in one big push,”* but it still followed a clear plan. First, the workflows were tested internally. Then came the key realization: classic browser access or an app wasn't a practical solution for many employees. What was needed was a physical terminal for clocking in and out.

The answer was the [Kiosk plugin]({% link _store/{{page.lang}}/kiosk-barcode-bundle.md %}) for Kimai. Derk-Janko built a first prototype from a Raspberry Pi, a screen, and an RFID reader – and tested it in the office for two months. For the rollout at all locations, he switched to more professional hardware: network-enabled displays with a built-in RFID reader that can be powered and managed over the network.

The rollout itself was well prepared. Since the Kimai kiosk view is set as the start page on the devices, they could be configured in advance at the office. *“We prepared a lot in the office. Carry it into each school, open the browser, and the reader picks up the chips right away.”* Today, there is a terminal at every entrance. Employees clock in with their chip in the morning and clock out in the afternoon. Clocking out at a different location works just as well – handy for employees who don't end their shift where they started it. When they clock in, they immediately see their own hours for the current week.

**The results: less effort, more reliability**

The change with Kimai was noticeable. Where some employees used to enter their hours for several days at once, records are now created automatically when clocking in and out – reliably and without gaps. The HR department has been relieved: a significant share of vacation requests is now handled directly in Kimai, with no paper forms and no follow-up questions. *“If 50 percent request it online, that already takes a lot of pressure off.”*

Employees can view their own times, but not edit them. Derk-Janko also built his own dashboard from the [absence data]({% link _store/{{page.lang}}/controlling.md %}) in Kimai: an overview that shows at a glance who is sick, who is on vacation, and who is taking time off in lieu – broken down by team, with weekly statistics and an integrated school holiday calendar. Especially during the summer holidays, when the core business with the schools is on pause, this overview is particularly valuable: you can see immediately how vacation is distributed across the entire workforce.

<!-- PARTS -->

**Cutting costs with Kimai time-tracking: around 700 euros a year for 70 employees**

The cost balance speaks for itself. BlauArt currently pays around 700 euros a year, solely for the plugins it needs. Kimai itself is free. According to Derk-Janko, commercial providers with per-user licensing would be significantly more expensive for 70 employees. *“For many small and medium-sized businesses that don't have the resources for expensive software, open-source products are the go-to.”* There are also upfront hardware costs – but in return, that hardware brings data sovereignty and full control. *“We save a lot of money because we host it ourselves. In the end, you basically only pay for electricity – and no expensive subscriptions.”*

**The collaboration: when someone really listens**

What Derk-Janko particularly values about Kimai is working with the developer, Kevin. He has submitted several feature suggestions – some were implemented, others didn't fit the concept. Both were fine with him: *“You really get the feeling that someone is listening and taking requests seriously. And if something doesn't fit Kimai's concept, they tell you so clearly.”* The ability to build custom extensions via the API, JavaScript, or CSS makes Kimai especially valuable for BlauArt – because no two companies work the same way, and every facility comes with its own processes.

**Advice for other companies**

Self-hosting isn't right for everyone, Derk-Janko emphasizes. *“I'd only do it with either an in-house IT person or a company backing you that takes care of it.”* Those who have the resources benefit enormously from data sovereignty, flexibility, and cost savings. For smaller companies and anyone who prefers to delegate, there is a maintenance-free, GDPR-compliant option: [Kimai Cloud]({% link _pages/{{page.lang}}/pricing.md %}). *“But from 100–200 people upwards, I'd still say: it's more cost-effective to self-host.”*

For BlauArt, in any case, choosing Kimai and self-hosting was the right decision. What started with a Raspberry Pi and an RFID reader is now the backbone of time tracking for an entire company – reliable, affordable, and close to the people who use it every day.

Many thanks to Derk-Janko Blauert for his time, and all the best for the future of BlauArt!
