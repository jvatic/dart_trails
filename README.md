DartTrails
============

DartTrails is an engine for Sprockets making use of the `dart2js` command-line
compiler which is currently very slow (not an issue when assets are precompiled).

Usage
-------

Add to your `Gemfile` either ...

    gem 'dart_trails'

... or using a local development tree ...

    gem 'dart_trails', :path => '/path/to/dart_trails'

After running `bundle`, any Dart assets with the extension `.js.dart` should be compiled to JavaScript automatically.


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
