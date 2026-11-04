---
title: "Introducing Kimai Roadmap: a place for your ideas and our plans"
date: "2026-10-22 12:00:00 +0200"
image: /images/blog/roadmap-blog-teaser.webp
author: nikita
tags: [general]
excerpt: "We have a new home for feature requests, plus a public roadmap! Browse, vote, comment and share ideas."
---

*We have a new home for feature requests, plus a public roadmap (which is coming to life in the next weeks)! Browse every idea the community has shared, vote and comment on the ones you care about, or suggest your own. And when an idea moves from "Planned" to "Started" to "Completed," you'll hear about it.*

At Kimai, we're lucky to have a community that doesn't just use the software, but helps shape it. Over the years, you've sent us over 1,000 feature requests. Each one took time and care to write, and many of them are now part of the Kimai you use every day.

Collecting all those ideas, keeping track of them and telling you what happened to each one hasn't always been easy, though. We've wanted to do better at that for a long time.

Today we're opening **[Kimai Roadmap](https://roadmap.kimai.org/)**, the next step in building Kimai together with you. It's a dedicated place to suggest features, vote on them and follow what we're working on.

Read on for the story of how we got here, what changes for you, and what happens to the feature requests you've already shared on GitHub.

### Eight years of ideas on GitHub

When we started collecting feature requests on GitHub more than eight years ago, it was the natural choice. Our code lived there, our contributors had their accounts there, and anyone could see what was being discussed. Opening an issue was easy, and a 👍 reaction worked as a simple vote.

And it worked! Since then, you've opened over 1,000 feature requests:

- **Hundreds are now part of Kimai.** Features like calendar, sorting, budgets, expenses, dark theme, saml and ldap login all started as one of your requests.
- **750+ have been closed:** completed, merged with similar requests or decided against.
- **250+ are still open today,** waiting for an answer.

{% include image.html src="/images/blog/roadmap_kimai_github_feature_request.webp" %}

That's an incredible amount of shared work, and we're grateful for every single idea, vote and comment.

### Where GitHub started to hold us back

GitHub is a fantastic home for code, and it will stay ours. But as Kimai grew, using it for feature requests started to show some cracks.

**Built for code, not for everyone.**

GitHub's interface is made for developers. Many people who use Kimai every day aren't developers, and for them it's hard to browse ideas or see where things stand.

**Hard to see the big picture.**

Feature requests sit right next to bug reports, and everything is called an "issue." With 250 open requests in that list, it's difficult for anyone (including us!) to see which ideas have the most support.

**Votes were a workaround.**

A thumbs up reaction is the closest thing GitHub has to a vote. Many people write "+1" comments instead, which notify everyone following the issue but aren't counted anywhere.

**Duplicates split the support.**

When the same idea was requested several times, its votes were spread across separate issues. A popular idea could look much less wanted than it really was.

**No clear status to follow.**

After posting a request, you were left wondering. Did we see it? Is it planned? Is someone working on it? Following an issue meant getting every single comment, not just the updates you cared about.

**Data sovereignty.**

On GitHub, your posts, comments and upvotes live on someone else’s platform, under someone else’s rules. Kimai Roadmap runs on our own infrastructure, which we control and take responsibility for, and follows Kimai’s strict privacy policy.

**Ideas arrived in many places.**

Feature requests also reach us by support email and other channels. Very often they lived separately from GitHub, so not every voice was counted the same way.

{% include image.html src="/images/blog/roadmap_github_votes.webp" %}

Many requests from all the years were lost in one big list.

### Why this matters for Kimai

Kimai is open source, and it has always been shaped by the people who use it. Your ideas, bug reports and feedback are what keep it moving forward.

That only works if you can see what happens to your input. When you take the time to share an idea, you deserve to know whether it's planned, being worked on, shipped or not a fit, and why. Getting this right helps us build a better Kimai. It's also simply the right way to treat a community that has given us so much.

### Meet Kimai Roadmap

The best part of Kimai Roadmap is that it's open to everyone. You don't need an account to look around: every request and the full roadmap are public.

#### Sharing your ideas

Head over to <https://roadmap.kimai.org/> to see every request. The hottest ideas are at the top (Trending), but you can also sort by the Most wanted, Most discussed and Recent, and you can filter posts by Activity, Status and Tags.

{% include image.html src="/images/blog/roadmap_all_feedback_board.webp" %}

Have an idea of your own? Click the `+`, describe what you'd like to see, and post it. New requests start as "Open", which gives others a chance to vote and gives us time to take a look.

{% include image.html src="/images/blog/roadmap_suggestion_form.webp" %}

#### Voting and commenting

Found an idea you like? Give it your vote, and leave a comment about how you'd use it. Knowing the real situation behind a request helps us understand what you actually need.

{% include image.html src="/images/blog/roadmap_open_post.webp" %}

#### Following the roadmap

Switch to the roadmap view to see what's coming. Ideas move from Open to Planned, Started and finally, Completed.

{% include image.html src="/images/blog/roadmap_view.webp" %}

#### Getting notified

Follow any request, and you'll get an update when its status changes.

{% include image.html src="/images/blog/roadmap_notification.webp" %}

#### Why Kimai Roadmap is invite-only (for now)

Browsing Kimai Roadmap is open to everyone, no account needed. To post, vote, comment or follow requests, you'll need an invitation: just email [{{ site.support_email }}](mailto:{{ site.support_email }}) and we'll send you a sign-up link. We chose this on purpose. It keeps spam and bots off the board, so every vote comes from a real person who uses Kimai. It doesn't depend on any other service, so you don't need another account to take part, which was one of the very things holding us back before. And it gives us a quick, personal hello with everyone who joins, so we get to know the people behind the ideas.

This is going to be changed in the near future, but we need to learn more about the platform as we go and see how things work. 

### What happens to your GitHub feature requests

This is the part we thought about most. Eight years of ideas deserve more than a quick copy and paste, so here's exactly how we're handling them.

#### The rule: requests with support move over

- **Every request opened in the last 12 months moves over,** no matter how many votes it has.
- **Older requests move if they have more votes than the number of full years they've been open.**

| Open for        | Votes needed to move |
|-----------------|----------------------|
| Under 1 year    | Always moves         |
| 1–2 years       | 2 or more            |
| 2–3 years       | 3 or more            |
| 3–4 years       | 4 or more            |
| 4–5 years       | 5 or more            |
| 5 years or more | 6 or more            |
{: .table}



A vote is a 👍 reaction on the issue. Before applying the rule, we merge duplicate requests and combine their votes, so a popular idea split across several issues isn't left behind.

#### Meet the GitHub Importer

Moving hundreds of requests by hand wasn't realistic, so we're using a little helper: the **GitHub Importer** bot. It reads each original issue and all of its comments, then combines them into a single post on Kimai Roadmap. Each imported post includes:

- The original request and a summary of the discussion
- The vote count at the time of migration
- A link back to the original GitHub issue, where the full discussion stays readable

{% include image.html src="/images/blog/roadmap_imported_post.webp" %}

**About the votes.** Votes can't be transferred from GitHub accounts to accounts on another platform, so imported votes appear as votes from "Importer." This is a technical necessity: every vote still counts, it just isn't tied to a name. You can keep voting on every imported post. To get status updates on a request you supported on GitHub, follow it on Kimai Roadmap.

#### Requests we're archiving

Some older requests haven't gathered support over the years. Instead of carrying them over, we're archiving them: they stay on GitHub, closed but readable. Anyone can bring an archived idea back by posting it on Kimai Roadmap with a link to the original.

#### Requests we can't implement

A small number of requests conflict with Kimai's design or technical limits. Rather than closing them in a batch, we'll close each one individually with a short explanation. A clear answer beats an open question.

#### What stays on GitHub

**Bug reports**, pull requests and code discussions stay on GitHub, exactly as today. Only feature requests move. Migrated and archived issues remain readable there, so every existing link keeps working.

#### What happens when

1. **23. Oct:** Kimai Roadmap opens at [roadmap.kimai.org](https://roadmap.kimai.org/). Take a look around!
2. **26. Oct:** Over the next days we go through all GitHub feature requests, import and close them, linking to the roadmap if applicable. If you're subscribed to an issue, you'll get a notification.
3. **02. Nov:** We start organizing the feature requests and update the roadmap to reflect our plans for the next months. Follow the news!

### How we'll decide what to build

We'd love to build every idea, but we can't, so it's only fair to explain how we choose.

Votes matter a lot, but they're one signal among several. We also weigh how many users a change helps, how much work it takes, how it fits Kimai's direction and what our team can realistically take on.

We'll review requests every week and move them through five statuses:

- **Open:** new, waiting for votes and our first look
- **Planned:** we intend to build it
- **Started:** we're working on it
- **Completed:** it's in Kimai!
- **Declined:** we've decided not to build it, a clear "no" is more useful than a request left open for years
- **Duplicate:** we have merged it with an existing request

### We know change takes effort

If you've been part of our GitHub community for years, this is a real change, and we don't take it lightly. Your contributions there are a big part of why Kimai is what it is today, and we've worked hard to carry them over intact.

If an imported post misses something or misrepresents the original discussion, tell us at [{{ site.support_email }}](mailto:{{ site.support_email }}) and we'll fix it. 

### Over to you!

What should Kimai do next? Head over to Kimai Roadmap at [roadmap.kimai.org](https://roadmap.kimai.org/), look around, vote for the ideas you love and share your own. We can't wait to see what you come up with.

Thank you for helping build Kimai.
