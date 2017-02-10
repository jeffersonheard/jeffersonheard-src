---
title: "Being a Data Scientist: My Experience and Toolset"
metaAlignment: center
coverMeta: out
date: 2017-01-14
draft: false
categories:
- coding
tags:
- data science
---

If I had to use a few words to give myself a title for my position at UNC, I might not have said I was a data scientist. When I was starting my career there was no such thing, but looking at my CV / Resume, I have:

* Worked at a billion dollar company, writing the integration process that pushed 40+ large datasets through complex models and analytics to produce one large modeled data product.
* Done graduate work in text mining and data mining.
* Wrote a innovative search engine from scratch and worked to commercialize it with two professors (it was their patent, but I was the programmer in the end).
* Worked at UNC, Duke, and NC State University through [Renci](http://www.renci.org) doing data mining, cartography, and interactive and static information visualization for various domain scientists.

I have done dozens of projects, and apparently I've amassed a fair bit of knowledge along the way that in some ways I have totally missed. Sometimes I answer a question and I think, "How did I know that, anyway?" 

Well, yesterday I started mentoring at [Thinkful](https://thinkful.com) in their [Flexible Data Science Bootcamp](https://www.thinkful.com/bootcamp/data-science/flexible/), and I have to say that I love it already.  I like their approach, because it blends 1-on-1 time with remote learning and goes out of its way to support its mentors in being good educators and not just experts. 

But as I dig through my data science know-how I want to share it with more than just one student at a time, so this is the first in a series of posts about what it's like to be a data scientist, or more accurately perhaps what *I* did as a data scientist and how that might relate to a new person doing data science in the field.

Some of it will include direct examples of doing data science projects in Python, and some of it will be more about the tools of the trade and how to work with open source tools to do data science. And some posts, like this one, will be more about "life as a data scientist,"

## What I did as a Data Scientist at Renci

I would say that most of what I did at Renci fell into two camps. 

1. Take a set of requirements from a domain scientist and work, typically from an experimental methods section (published or in progress) and translate that into code.
2. Develop systems for collaboration, dataset sharing, and access to HPC resources for research groups of **domain scientists**.

### What's a Domain Scientist?

When I think of a domain scientist, or a domain *expert* I typically think of someone outside general computer science, who may know something about programming, but need not, but has a question they're trying to answer, a requirement they need to fulfill, or a body of work that they add to over time. They typically require scientific methods or knowledge of the science of information classification, accessibility, and archiving (think librarians). These include:

* Academic scientists at research institutions doing basic or applied research in any of the sciences: biology, medicine, public health, psychology, chemistry, physics, and so on.
* Journalists who deal with polls, data, infographics, or who are science journalists who have to read, understand, and *fact-check* the articles they published.
* Corporate or independent consulting scientists of all flavors from geologists working in minerals to pharmacologists to compliance organizations like UL and Rand Corporation.
* Nonprofit and NGOs like the World Bank employ scientists to rigorously analyze the effectiveness of their programs.
* Scientists working at government labs or consortiums (like NIST or the FDA) on standards, testing, and auditing procedures.
* Historians, librarians, and archivists concerned with preserving aging documents, bodies of records, and providing sound systems for accessing, referencing, and searching these records.

Any of these domain scientists can also be *data scientists*, but they are different hats to wear and data science distinctly requires a focus on computation and algorithms. 

## When does a Domain Scientist need a Data Scientist?

### Outgrowing Excel.

After you reach 100,000 rows, or when you have sheets with "lookup keys", pivot tables, and formulae that rely on hidden sheets, you have likely outgrown Excel.  It's not that Excel can't handle it (although there *is* a practical row limit). It's that Excel sheets have a tendency to turn into *spaghetti code* for a variety of reasons: 

* Visual presentation trumps "source" and it's often hard to find formulae and harder even to see what cells are being referenced by a formula.
* Adding a variable or sometimes a column or a row can cause you to need to update multiple cells on multiple sheets to make all the calculations come out right, which is error prone.
* You get in the situation where "it works, but I no longer know *why* it works"
* Plugging in different data is not simple.

### Performance on Large or Unusual Datasets.

"Big Data" means something different to everyone, but generally it is unmanageable or hard to run your models on because running the model takes too long. When this happens, someone with an expertise in coding and data science can rewrite a scientist's model so that they can manage data separately from managing the model, and so that they can run their model efficiently on appropriate hardware. 

### Cleaning and Data Preparation.

There is a heirarchy we often talked about in information and knowledge management. Information < Data < Knowledge. Within that hierarchy are levels. Scanned paper documents. OCR-ed documents. Spreadsheets with commentary littered all over them and inconsistent representations of what's "missing." 

### Creating Algorithms from Methods.

Most often domain scientists simply aren't computer people. In this case, a data scientist works directly with the domain scientist, walking through their research methods with them and gathering the specifics that can turn their ideas into code.

### Visualization, especially Geographic and Interactive. 

Visualization requires a specialized skillset that most scientists, even the coders, don't have. Visualization tools available to the domain scientist often produce "rough drafts" of graphics, and are limited to "canned" representations that require customization to represent data effectively. Visualization is - to some extent - an art, but there are scientific principles as well that the data scientist will learn that help them:

* Produce fair, unbiased visual representations of data.
* Show the most relevant correlations for the problem at hand.
* Produce visual representations that reproduce in different media effectively.

Spatial (geographic) representations are even more specialized, as map projections, layering, and reproduction issues make producing effective maps its own subfield of visualization. 

### Machine Learning & Data Mining

Machine learning, text mining, and data mining are their own separate fields of study. They are part of "data science," but require a significant amount of specialization. Machine learning refers to different methods of having a machine develop its own algorithm for categorizing or classifying elements of a dataset. Machine learning and data mining are not well distinguished, but machine learning techniques increasingly favor "unsupervised" learning algorithms. 


### Sharing, Collaboration, and Information and Knowledge Management

Like machine learning and data mining, I mentally separate this task because it requires a different skillset, and typically you're working with a team or a professional organization.  Skills the data scientist uses here tend to fall into the "library sciences." Building or setting up an effective system for sharing and knowledge management means:

* Building an online, generally web-based system. Often the backbone of this is a CMS, but it will be heavily customized. 
* Making common domain-dependent data transforms available online. 
* Enabling indexing, search, and selection (and not naïve implementations - most sciences have their own cataloging systems you need to respect). 
* [Keeping track of provenançe information](http://ebiquity.umbc.edu/blogger/2008/05/28/provenance-tracking-in-science-data-processing-systems/).
* Version management.
* Authentication and authorization.
* Distinguishing content types.
* Integration with existing sharing systems, including legacy systems, Dropbox, and Google Drive.
* Effective presentation of data.
* Data storage at scale.
* API Access

## Data Science Tools

This is not meant to be exhaustive *at all*. It is just a sampling of the tools that are out there, and to some extent a list of tools I have used in the past to get things done. It is in the same general order as the section above. Where possible I have listed Python libraries and standalone tools, but some of the libraries here are in other languages, but they are widely used. I do not cover R at all, because it is its own ecosystem, and there are tens of thousands of packages for R that do everything you want.

##### Tools for working with larger and more complex excel-like data

* [Pandas](http://pandas.pydata.org/) - General purpose toolkit for dealing with tabular (Excel like) data for data science tasks.
* [SQLite](https://sqlite.org/) - Tabular database format that handles large datasets, but still works on your desktop.
* [PostgreSQL](https://www.postgresql.org/about/) - Enterprise-grade database system.

##### Tools for working with spatial (geographic) data:

* [PostGIS](http://www.postgis.net/) - Geospatial extensions for Postgres
* [Carto](https://carto.com/) - Commercial tool for geospatial data mining.
* [Mapbox](https://mapbox.com/) - Commercial cartography and tile-based web map system.
* [Leaflet](http://leafletjs.com/) - Library for composing interactive web maps from online sources and your own data.
* [qGIS](http://www.qgis.org/en/site/forusers/download.html) - Graphical GIS tool for all things geospatial and mapping.

##### Tools for working with unusual datasets

* [RethinkDB](https://rethinkdb.com/) - Database that deals well with realtime streams. In transition from commercial to open source. Take care when using.
* [MongoDB](https://www.mongodb.com/) - Database that handles large amounts of unstructured and semi-structured data. Some caveats when using in production.
* [CouchDB](http://couchdb.apache.org/) - Similar to, but different than MongoDB.
* [Cassandra](http://cassandra.apache.org/) - Graph and relationship database. 

##### Tools for creating performant code with large datasets

* [Pandas](http://pandas.pydata.org/) - A note that Pandas is largely backed by performant C code. Translating your algorithm to C for performance reasons when it uses Pandas well is usually not needed.
* [Apache Spark](http://spark.apache.org/) - A general high-performance data processing system
* [SciPy and Numpy](https://www.scipy.org/) - Scriptable, C-based numerical algorithms that operate on compact, machine-level data structures.
* [Cython](http://cython.org/) - Take parts of your Python program and compile them with C for performance.
* [PyOpenCL](https://mathema.tician.de/software/pyopencl/) - Numerical and statistical processing on your graphics card.

Note that any of the database systems from above also fall into this category. 

##### Tools for cleaning data

* [ODO](http://odo.pydata.org/en/latest/) - Python library to transform data between different formats.
* [OpenRefine](http://openrefine.org/) - Explore and clean data in a graphic user interface
* [Pandas](http://pandas.pydata.org/) - General purpose Python-based toolkit for dealing with tabular (Excel like) data for data science tasks.
* [Scrapy](https://scrapy.org/) - Python library to scrape the web and extract items from web pages
* [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/) - Same as scrapy, but different.
* [Scrubadub](http://scrubadub.readthedocs.io/en/stable/index.html) - Remove personally identifiable information
* [Arrow](http://crsmithdev.com/arrow/) - Make sense of and manipulate times and dates
* [DataCleaner](https://github.com/rhiever/datacleaner) - Python library to impute, drop, and general cleaning of missing and ugly data
* [Dora](https://github.com/NathanEpstein/Dora) - Python library similar to DataCleaner. 

##### Tools for Visualization

* [Processing](https://processing.org/) - Build interactive visualizations interactively. [Great O'Reilly book, Visualizing Data](https://www.amazon.com/gp/product/0596514557?ie=UTF8&tag=processing09-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0596514557)
* [D3](https://d3js.org/) - Build interactive visualizations on the web
* [C3](http://c3js.org/) - Charts from D3.
* [Bokeh](http://bokeh.pydata.org/en/latest/) - Similar to D3, but in Python.
* [matplotlib](http://matplotlib.org/) - The original Python data visualization toolkit
* [Leaflet](http://leafletjs.com/) - Work with web-based maps.
* [MapBox](https://www.mapbox.com/) - See the section on cartographic tools.
* [qGIS](http://www.qgis.org/en/site/forusers/download.html) - See the section on cartographic tools.
* [VTK](http://www.vtk.org/) - Heavy-duty visualization toolkit often used in the medical, chemical, and physical research spaces.

##### Some data mining and ML tools

* [Weka](http://www.cs.waikato.ac.nz/ml/weka/) - There's also an [excellent, accessible book](http://www.cs.waikato.ac.nz/ml/weka/book.html) on the Weka ML and Data mining toolkit
* [SciKitLearn](http://scikit-learn.org/) - A Python-based suite of ML and data mining tools.
* [Orange](http://orange.biolab.si/) - Another Python-based suite of data mining tools, also with a GUI.
* [TensorFlow](https://www.tensorflow.org/) - Multidimensional mathematical modeling with graphs.

##### Tools for Sharing, Collaboration, and Information and Knowledge Management

* [Django](https://www.djangoproject.com/) - The ultimate batteries-included Python-based web framework.
* [Django REST Framework](http://www.django-rest-framework.org/) - Create REST APIs with Django-based websites.
* [IRODS](https://irods.org/) - Enterprise-grade data storage and management, including metadata management and rule-based data processing.
* [Cassandra (useful for metadata and relationship storage)](http://cassandra.apache.org/) - Again, I often store and query metadata in Cassandra
* [GitLab](https://about.gitlab.com/downloads/) - An open-source alternative to GitHub that you can set up on your own servers.
* [ReciPy](https://github.com/recipy/recipy) - Provenance tracking for Python. 
* [Prov](http://prov.readthedocs.io/en/latest/) - Python implementation of the W3C provenance model
* [Kanren (useful for implementing business logic on metadata and provenance info)](https://github.com/logpy/logpy) - Logic programming for Python, often useful for rule-based actions and queries on scientific metadata.

