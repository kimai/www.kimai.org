---
title: "About Kimai"
description: What is behind the time-tracking app Kimai? Find out about it, its history and developer.
sitemap:
    priority: 0.7
    lastmod: 2018-03-03
    changefreq: weekly
---

# What is Kimai?

{% include alert.html icon="far fa-thumbs-up" alert='Probably <strong>the best free and open source time-tracking app</strong> you will find ...' %}

![Kimai logo]({% link /images/kimai_logo.png %}){:class="float-right" style="margin-left: 20px" }

Kimai is a time-tracking app with a long history. Its first version was released more than 10 years ago. Why do we mention that? 
Because we have seen so many services come and go in the last decade - trust us when we say: we'll stick around. 
We never made a living from Kimai, it's the fun that keeps us motivated to improve Kimai. We believe that's one of the main reasons for Kimai's success.

We build Kimai for one purpose: tracking your working hours. Kimai supports an unlimited amount of users and timesheet entries, 
so you can handle all of your teams/departments in one easy-to-use installation. 
Kimai is web-based, so all you need is a PHP enabled webserver. It's built with a responsive design, so you can even track times using your mobile device while you are on the go. 
Kimai is translated into multiple languages and missing translations can be added easily, using the open translation standard Xliff.

Oh, and did we mention that you can create invoices from your timesheets within your browser? It has not only customizable 
invoice templates, Kimai can easily be extended in various ways. It's build on the most popular and modern frameworks and has several
extension points for your developers.
    
Now, we could write so much more about its features and the benefits it will bring to you - whether you are a freelancer, 
a small organization or a company with hundreds of employees - but we think, that giving you the option to test it directly is even better than a thousand words from us:
So be our guest and test Kimai online with our [demo installation]({% link _pages/demo.md %}). If you are a friend of hard facts, we also have a compiled [feature list]({% link _pages/index.html %}).

And last but not least - probably the most important fact: Kimai is open-source, you can download it for free and you will never be charged a license fee for any future update.

<a href="{% link _pages/testimonials.md %}" class="btn btn-primary"><i class="far fa-comments"></i> Testimonials</a>

## History of Kimai

Kimai has a long history and was way ahead of its time, when the team around Torsten Höltge started its development in 2006. 
It had a responsive design (thanks to a lot of javascript magic) back in the time when that word wasn't even officially invented.

He wanted to [shut it down]({% link _posts/2009-06-19-bye-bye-folks.md %}) due to personal/time limitations, when it was [taken over by Kevin]({% link _posts/2009-07-20-the-condemned-live-longer.md %}).
With the help of other open source volunteers he was able to keep it alive and extend it for multiple years.

In the meantime the PHP community made great steps forward and Kimai felt back, due to its technical history - built around a lot of single PHP scripts which all had to be public accessible.
It had also some major drawbacks, like limited capabilities of extending it and a problematic database design. After many years of development, the code base became hard to maintain and the logic was wildly spread among scripts, classes and the frontend layer.
 
That's why the idea of rewriting Kimai with modern frameworks was there for a very long time, also driven by community requests, but we simply had no time to push these ideas forward.
In the end of 2017 Symfony 4.0 was released along with a neat frontend built stack called _Webpack-Encore_.
That's when Kevin took the opportunity and started the development of the next evolutional step: Kimai v2 reloaded was born.

The original Kimai is more than 10 years old and is used by people all around the world. We are proud of that and about its great community. 
That's why we would like to thank each and everyone who contributed to Kimai.
There were way too many people to name them all, so this list is only a small compilation of the people who contributed huge amounts of time, code, thoughts and help to Kimai and its community:
 
- Torsten Höltge - the inventor of Kimai 1
- [Severin Leonhardt](https://github.com/ServiusHack) - a core maintainer of Kimai for a long time
- [Simon Schaufelberger](https://github.com/simonschaufi) - core developer for a very long time ... and on-going!
- You can find a list of all [contributors]({{ site.kimai_v1_repo }}/graphs/contributors) at GitHub
- Kimai v1 was also highly influenced by Oleg Britvin, Martin Klemkow, Vasilis van Gemert, Maximilian Kern, Enrico Ties, Thomas Wensing, Kelvin Luck, Urs Gerig, Willem van Gemert, Torben Boe and HamBug Studios, Klaus Franken, Chris (Urban Willi), Andreas Berndt, Niels Hoffmann, Günter Hengsbach, Paul Brand, Joaquín G. de la Zerda, Allesandro Bertoldo, José Ricardo Cardoso, RRZE 
