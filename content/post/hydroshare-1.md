---
title: "Hydroshare, Part 1: Overview of a long project"
metaAlignment: center
coverMeta: out
date: 2016-11-21
categories:
- professional
tags:
- management
---

The last project I worked on at UNC was as Chief Software Architect of the
[Hydroshare](https://www.hydroshare.org) project. It was the most challenging
exercise I ever undertook at UNC, and I'm proudest of it, despite the fact that
I can't claim to have done everything *right*. In fact I made some blunders,
but ones I hope I've learned from.

I left the Hydroshare project after I believed that it was on the right path,
and handed my role off to two of the brightest people I know in software
management and development at [Renci](http://www.renci.org).

This will be the first post in a series of posts about the unique experiences of
Hydroshare, and what I think it can teach us about building and organizing
better teams.

## The Hydroshare System

Hydroshare is essentially a content management system (CMS), like WordPress or
Drupal, but on a particular brand of steroids. Where most CMSes are backed by a
CDN (content distribution network) and a database and possibly a block store
such as Amazon S3, this one had to be different to accommodate distributed
computing resources and the management and curation of datasets and real-time
data streams that sometimes breach the terabyte size boundary.

Because of these and their consequent hosting requirements, nearness to compute
resources, and rules about data provenance, developing a truly custom solution
was essential.

## Challenge: A distributed, fluid, heterogenous team

I would say my greatest challenge professionally is learning how to train
people. No project before or since Hydroshare has ever given me as much
experience training people to work together on a software project.

Let me start off by saying that the Hydroshare team was in most ways
exceptional. The team and the experience with Hydroshare taught me the value of
building teams that include non-software people in development roles, just as
they are often included in "high-level" roles. My experience with including
"gifted amateurs" on the Hydroshare team was that they often thought and thus
wrote code in fundamentally different ways from the seasoned developers did, and
that even on those occasions (not as often as you might think) that we rewrote
their code to fit into the overall vision, we learned what assumptions we were
making and built more usable, well-thought out software.

The Hydroshare team was scattered across universities in every timezone in the
US. San Diego, two Utah locations, Indiana, North Carolina, and Virginia (and
I might be missing one!). Software development was mostly by graduate students
and postdocs in hydrology, not computer science.

The team, therefore, consisted largely of people doing their own research and
devoting only a small part of their time to Hydroshare. Most team members
initially wanted to contribute their hydrology research to the project and avoid
core software development. To be clear, advanced software development *was* a
distraction from their work. Why would a hydrologist need to know anything about
building web-services or integrating with a content management system?

Every person on our team who was not a software person was an eventual end-user
of the application. I think that, if nothing else, gave people the motivation to
learn more about writing code than they normally would. Our team consisted
largely of data scientists. All of them had some rudimentary or even intermediate
knowledge of R or Python and understood the purpose of self-contained scripts.

In addition, most everyone had a development environment of *some* sort set up
on their laptops by the time that we got going. This proved both a help and a
hindrance, as the team knew enough to code their way, and in their own
environment, which saved time explaining basics.  But the major challenge it
left was the complete lack of portability of one person's development
environment to the next.

### Running while we learned to walk

One of the key points I will stress is that there **is** an effective way to
manage a team like this, and that including non-software people does not equate
to a slower development process.

Hydroshare, when I came to it, was 18 months along. Another way to put this was
that it was 18 months behind, but that isn't entirely accurate. The team had
assembled a prototype from Drupal, but had gone as far as they could with it.
It would be necessary for the success of Hydroshare to scrap the prototype and
take things in a different direction, now that everyone knew what it was they
wanted, at a basic level.

Initially, the leaders were loathe to "throw so much away," but in the end the
enthusiasm of the core team for the new direction convinced everyone that we
were doing the right thing. This meant "starting from scratch" 18 months into a
five year project, but the team caught up and delivered on its milestones after
the retooling.

The keys to this success were:

* **Use distributed project management tools __effectively__**. (I stress the
  word "effectively" because for a time we over-used these tools and leaned on
  them too heavily, exaggerating their weaknesses as well as their strengths.  

* **Use the overlap** between the knowledge our developers already had through
  their domain work, and the needs of full-stack software development.**  

* **Spend in-person time wisely**, on training and "code crunches" based around
  features or details that require lots of coordination.

Not that we got all of that right. In particular, the last part was hard to get
to. The project's overall leadership was terrified of being 18 months behind,
and I spent a lot of time in "weekly agile standup postmortems" I don't even
know what that means, still, but they were generally two to three hour meetings
where the leadership went painstakingly over every item in the project
management system (something some consultant put us onto whose name I don't
recall, but was well loved by Agile consultants at the time) whether or not
anything changed or even if it wasn't supposed to.

### Managing distributed development

We used a number of project management tools meant for Agile development. I have
to say I was not that fond of any of them. In the end, I think our best toolset
was a combination of:

* List building on [Trello](https://www.trello.com)

* A shared document and discussion space. We used Drive and Google Docs, but now
  that Slack is around I'd probably choose that.

* A weekly developer meeting separate from the management meeting, where all
  questions were fair game, and managers didn't have to feel anxious about the
  "sausage making"

Trello is sophisticated enough for most isolated projects. Actually, it's hard
to imagine a project where Trello can't be made to work, but I think Hydroshare
and projects like it is its sweet spot.  We could assign tasks, create due dates,
use the API to generate reports and even integrate Trello and GitHub a bit. It
worked.

Despite the fact that I couldn't get the management meeting pared down below two
hours, we did manage to come to the consensus that taking up valuable developer
time in managerial sausage-making was unproductive. The developers got split out
from the project leaders, and were spared from having to listen to planning that
was irrelevant to the thing they were working on.

### Finding and Using the Overlap

I'll go over this in more detail on a later post, but I want to highlight that
everyone on our team had some, even if only minimal, software development
experience or interest. Some people were comfortable with R. Others wrote
extensive models using Excel. Still others wrote high performance code in C
surrounding simulation and environmental process modeling. But all of these
people shared the ability to look at a problem methodically and break it down
into tasks and sequence those tasks into steps.

This common ground proved the essential thing that made us work together as
developer and scientist alike. In the end, it was a matter of polling the group
for the technologies the most felt most comfortable with, and making sure that
everyone knew that programming knowledge and insights were for sharing. The
scientists were encouraged to learn from each other and not treat the coders as
"special" or "keepers of the keys." I think this encouraged a more collegial
atmosphere, and prevented two-thirds of our team from being "requirements-
generators" instead of "contributors"

This way, the team was often self-training. There were concepts that the
software engineers had to introduce, and had to direct development on a broad
level, but for day to day work, it was of little importance that an individual
scientist was unaware of certain algorithms, scalability issues, or other
fundamentals. We were able to architect the software at a high level to be
forgiving of ongoing contributions.

The training we did do brought everyone together and focused on specific
technologies that were needed to do the job, and stressed their importance as
part of the whole. Because of the way it was contexualized, it was more of a
training of "how to develop Hydroshare" than "full stack development 101," or
"Javascript basics," or "A complete beginner's guide to Django."

### Spending In-Person Time Wisely.

We had a few "code crunches" or "hackathons" as part of the Hydroshare project.
These varied in their effectiveness, but I want to talk the effective ones
from a software development point of view.

Where we were most effective, we broke into small teams centered around a
feature, including at least one "software person" with each team of scientists.
The features and functionalities that lent themselves most to code crunches were
things that were not yet fleshed out, and that required detail and in-person
conversation to understand. Often these were things that the scientists
understood in terms of their methods, but had never thought of procedurally or
functionally.

Then the conversation became both "speccing" and a certain amount of training
(two ways) as the scientist-developers engaged with the software  developers.
For the software developers, understanding from a deeper level about the users
and the processes we were modeling was helpful in deciding metaphors for
usability and for deciding whether the overall architecture would accommodate
the cases they brought up. For the domain professionals, the scientists,
learning more about coding both helped their ability to express features and
requirements in a software-friendly way, and of course it improved their ability
to contribute directly.

## Next

To make an effective software team, we needed an effective toolchain. The next
post will cover the toolchain, my reasons for selecting and promoting the
technologies I did, and what went well and what was challenging about the stack.
