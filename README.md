DartTrails
============

DartTrails is an engine for Rails Sprockets making use of the `dart2js`
command-line compiler which is currently very slow (so be sure to precompile
assets).

Usage
-------

Add to your `Gemfile` either ...

    group :assets do
      gem 'dart_trails'
    end

... or using a local development tree ...

    group :assets do
      gem 'dart_trails', path: '/path/to/dart_trails'
    end


Configuration
---------------

You may select the default command-line options by setting the attribute
`DartTrails.cli_options`. For example, to enable the command-line option
`--minify`, use ...

    DartTrails.cli_options = { minify: true }


Troubleshooting
-----------------

If `.dart` assets don't seem to be compiling, you may need to clear the assets
cache from `tmp/cache/assets` as you may have an (non-compiled) cached copy of
the asset if it has been served and hasn't changed before adding the
`dart_trails` gem.
