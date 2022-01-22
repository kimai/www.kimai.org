---
title: "About Kimai"
description: What is behind the time-tracking app Kimai? Find out about it, its history and developer.
lang: en
lang-ref: about
---

# What is Kimai?

{% include alert.html icon="far fa-thumbs-up" alert='Probably <strong>the best free and open source time-tracking app</strong> you will find ...' %}

![Kimai logo]({% link /images/kimai_logo.png %}){:class="float-right" style="margin-left: 20px" }

Kimai is a time-tracking app with a long history. Its first version was released 2006. Why do we mention that? 
Because we have seen so many services come and go in the last decade - trust us when we say: we'll stick around. 
We didn't make a living from Kimai for many years, it was the fun that kept us motivated to improve Kimai. 
We believe the fun is one of the main reasons for the success of Kimai.

We build Kimai for one purpose: tracking your working hours. Kimai supports an unlimited amount of users and timesheet entries, 
so you can handle all of your teams/departments in one easy-to-use installation. 
Kimai is web-based, so all you need is a PHP enabled webserver. 
It's built with a responsive design, so you can even track times using your mobile device while you are on the go. 
Kimai is translated into multiple languages and missing translations can be added easily, using the open translation standard Xliff.

Oh, and did we mention that you can create invoices from your timesheets within your browser? It has not only customizable 
invoice templates, Kimai can easily be extended in various ways. It's build on the most popular and modern frameworks and has an active community 
which produces a lot of plugins extending the core functionality of Kimai.
    
Now, we could write so much more about its features and the benefits it will bring to you - whether you are a freelancer, 
a small organization or a company with hundreds of employees - but we think, that giving you the option to test it directly is even better than a thousand words from us:
So be our guest and test Kimai online with our [demo installation]({% link _pages/demo.md %}). If you are a friend of hard facts, we also have a compiled [feature list]({% link _pages/index.html %}).

And last but not least - probably the most important fact: **Kimai is open-source, you can download it for free and you will never be charged a license fee for any future update**.

## Who is Kimai?

There is a great and large community around Kimai and listing everyone is impossible. You find a brief list of former developers below.
The [marketplace]({% link _pages/store.html %}) shows a list of plugins and their developers, this will give you a good idea of the developers 
supporting the project with their knowledge.

The main person behind Kimai, this website, the demo installations, the [Saas version of Kimai](https://www.kimai.cloud) and multiple plugins is:

{% include card-donate.html user="kevinpapst" %}

There are also many people who contribute their free time and provide feedback, test reports and constructive questions. 
Their names can be found regularly in the [GitHub issue tracker]({{ site.kimai_v2_repo }}/issues). 

My greatest thanks go out to you all ❤️   

## History of Kimai

Kimai has a long history and was way ahead of its time, when the team around Torsten Höltge started its development in 2006. 
It had a responsive design (thanks to a lot of javascript magic) back in the time when that word wasn't even officially invented.

He wanted to [shut it down]({% link _posts/2009-06-19-bye-bye-folks.md %}) due to personal/time limitations, when [Kevin stepped in as maintainer]({% link _posts/2009-07-20-the-condemned-live-longer.md %}).
With the help of other open source volunteers he was able to keep it alive and extend it for multiple years.

In the meantime the PHP community made great steps forward and Kimai felt back, due to its technical history - built around a lot of single PHP scripts which all had to be public accessible.
It had also some major drawbacks, like limited capabilities of extending it and a problematic database design. After many years of development, the code base became hard to maintain and the logic was wildly spread among scripts, classes and the frontend layer.
 
That's why the idea of rewriting Kimai with modern frameworks was there for a very long time, also driven by community requests, but we simply had no time to push these ideas forward.
In the end of 2017 Symfony 4.0 was released along with a neat frontend built stack.
That's when Kevin took the opportunity and started the development of the next evolutional step: Kimai 2 was born.

The original Kimai is more than 15 years old and was used by people all around the world. We are proud of that and about its great community. 
Now after 5 years most people migrated to new Kimai version and the amount of users is higher than ever. 
That's why we would like to thank each and everyone who contributed to Kimai.
There were way too many people to name them all, so this list is only a small compilation of the people who contributed huge amounts of time, code, thoughts and help to Kimai 1 and its community:

{% include pages/about_contributors.md %} 
