DartTrails
==========

DartTrails is an engine for Rails Sprockets making use of the `dart2js`
command-line compiler. The compiler is currently very slow and on top of that,
my engine does not minify the JavaScript output. As such, I do not recommend
the use of this engine in a production Rails application.

However if you would like to play around with it, just add it to your
`Gemfile`, with either ...

    gem 'dart_trails'

... or using a local tree ...

    gem 'dart_trails', path: '/path/to/dart_trails'

Have fun, but try not to use it where it isn't appropriate :)!


Troubleshooting
---------------

If `.dart` assets don't seem to be compiling, you may need to clear the assets
cache from `tmp/cache/assets`.

Note that currently there is little debug logging and there will not be any
indication if the `dart2js` command fails. Until this has a more permanent
solution, make sure all Dart scripts successfully compile at the command
line before use in Rails.
