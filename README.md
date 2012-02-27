Oseh Occasions (working title, we welcome suggestions)
===============================

[![Continuous Integration status](https://secure.travis-ci.org/mattscilipoti/oseh-occasions.png)](http://travis-ci.org/mattscilipoti/oseh-occasions)
[![Dependency Status](https://gemnasium.com/mattscilipoti/oseh-occasions.png)](https://gemnasium.com/mattscilipoti/oseh-occasions)


* Rails 3
* Ruby 1.9

We manage dependencies with Bundler (http://gembundler.com/)


Initial Setup
==============

Prerequisites
-------------
* ruby 1.9
* sqlite3
* bundler (gem)


Setup
-----
  It is best if you have a fast internet connection for this:
    $ git clone git@github.com:mattscilipoti/oseh-occasions.git
    $ cd oseh-occasions
    $ bundle install
    $ rake  #runs all tests

All tests should pass.



Deloyment
==========

Our testing site is on heroku (http://hollow-dusk-9175.herokuapp.com/).
    $ git push heroku master

Open in browser with:
    $ heroku open

See: 
* http://devcenter.heroku.com/articles/rails3


Dev Notes
===========

Autotest & Faster test startup w/ spin
---------------------------
Start `guard` to start spin. test will automagically run when you change files:
  $ guard

To run manually:

    $ spin push spec
    $ spin push spec/model/person_spec.rb:43

----
This readme is in [Markup format](http://daringfireball.net/projects/markdown/syntax).
