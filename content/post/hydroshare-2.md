---
title: "Hydroshare Part 2: Toolchain for a heterogenous team"
metaAlignment: center
coverMeta: out
date: 2016-11-23
draft: true
categories:
- professional
tags:
- management
---

This post is the second in a series about the last project I worked on at UNC.
Hydroshare was the most challenging exercise I ever undertook there, and I'm
proudest of it, despite the fact that I can't claim to have done everything
*right*. In fact I made some blunders, but ones I hope I've learned from. These
posts are my attempt to say what went right, what went wrong, and what can be
learned from both.

As a reminder, if you missed the first post, Hydroshare is essentially a content
management system (CMS) on a particular brand of steroids. Where most CMSes are
backed by a CDN (content distribution network) and a database and possibly a
block store such as Amazon S3, this one had to be different to accommodate
distributed computing resources and the management and curation of datasets and
real-time data streams that sometimes breach the terabyte size boundary.

## Challenge: Replacing The Prototype

When I arrived on the project, the team already had a CMS in place, a
github repository, and some test content. All of this was done in Drupal. It was
a great platform for prototyping the look and feel and capabilities of the
website, and to test ideas among the stakeholders. It was, however, not a
tenable platform for a finished product with this team.

No-one knew PHP. No-one had any motivation to use PHP. No-one does data science
in PHP, and most of the team's coding experience involved developing simulation
and modeling software for one-off hydrology projects. Some of the team had wider
experience developing software, but not enough to build what they were proposing.

Furthermore, every model and computing resource they wanted to be able to run
from the website would have to have a wrapper built around it to make it talk
to other objects in the Drupal system, and that would be invariably in a different
language than they were used to. This meant that the few seasoned coders we had
would be taxed forever copying and modifying boilerplate to incorporate one
thing or another.

### The Hydroshare Toolchain

#### Docker

Solving the challenge of portability came first. Despite the hurdles of getting
everyone up and going with [Docker](https://www.docker.com) in its early days,
it provided a way for us to ship a clean, componentized build of the software
that ran locally on everyone's computer and allowed them to test out their own
developments. We could therefore ship test and development versions of the
database, data, filesystem (Hydroshare uses a filesystem store called IRODS to
manage data and metadata), and core server separately. If anyone irreparably
broke their software stack, it was a matter of opening a terminal (or clicking
on a batch or shell script) and doing a "docker pull" to get back to a clean
build.

The other great thing about Docker was that it made for a great way to isolate
contributors' simulation and modeling code (and system dependencies) from the
core code of the Hydroshare website, and from each other. Spinning up a model to
respond to a user request on the website was a relatively simple matter of
telling one of the compute nodes to grab the latest version of a docker
container with the simulation, point it at the appropriate Hydroshare URI for
data, and run.

At the time, it was bleeding edge technology, and as such even as I advocated
its use I questioned choosing it. But I didn't see anything that would serve all
the purposes as well as Docker.  In the end, it took almost a month and a half
to get the Docker development setup right and installed perfectly on everyone's
systems. However, after it was done the team appreciated the ability to reset
environments and to be able to rest assured that code written on a person's
laptop would run the same on the production servers.

#### Python, Django, Django REST Framework, and Mezzanine.

R's stack for writing web service applications leaves a lot to be desired for
building a service like Hydroshare.  Hydroshare needed a robust REST API, a
content management interface, and the ability to rip out and replace internals
like the filesystem and query layers with custom components for handling large,
complex datasets.

#### PyCharm

Almost everyone ended up developing in [PyCharm](https://jetbrains.com). I
don't use it every day anymore, but of the IDEs out there, PyCharm is currently
my favorite. It seems to be suffering some feature bloat over time, like all
IDEs, but the core functionality is there and has not changed.
