DartTrails
==========

Troubleshooting
---------------

If `.dart` assets don't seem to be compiling, you may need to clear the assets
cache from `tmp/cache/assets`.

Note that currently there is little debug logging and there will not be any
indication if the `dart2js` command fails. Until this has a more permanent
solution, make sure all Dart scripts successfully compile at the command
line before use in Rails.
