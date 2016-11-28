---
title: "An Intro to Sondra: Part 2"
metaAlignment: center
coverMeta: out
date: 2016-11-15
categories:
- coding
tags:
- sondra
- python
- rethinkdb
- flask
- rest
- tutorials
- open source
---

Part 2 of our tutorials on Sondra build on our sample application from part 1
and covers exposing the API on the web. Basically we will add one more module,
which creates a Flask app. The app I show below does very little more
than the basic Flask app. It adds compression, because that's pretty standard
these days and supported by almost all browsers.  It's also a good idea with
APIs where responses can get very long.


~~~python
from flask import Flask
from flask.ext.compress import Compress
from sondra.flask import api_tree, init

# Create the Flask instance and the suite.
app = Flask(__name__)
Compress(app)  # This is not necessary, but I find it generally helpful.
app.debug = True
app.suite = TodoSuite()
init(app)

# Register all the applications.
TodoApp(app.suite)

# Create all databases and tables.
app.suite.validate()  # remember this call?
app.suite.ensure_database_objects()  # and this one?

# Attach the API to the /api/ endpoint.
app.register_blueprint(api_tree, url_prefix='/api')

if __name__ == '__main__':
    app.run()

~~~

It's probably pretty obvious what's going on here.  This is the typical look of a Flask app, after
all. The additional things we have to do are, in order:

1. Attach the suite to the Flask app as `app.suite`.
2. `init` the app. This sets up CORS if it's been configured and makes sure that logging is handled correctly.
3. Ensure the application objects exist in the database.
4. Register the `api_tree` blueprint with Flask, typically at `/api`.
