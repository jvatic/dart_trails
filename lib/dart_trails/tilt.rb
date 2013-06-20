require 'dart_trails/tilt/engine'
require 'dart_trails/tilt/template'

module DartTrails
  module Tilt

    # The allows Tilt.new to create a new instance of DartTilt::Template when
    # it is passed a file with the extension ".dart".
    #
    ::Tilt.register( DartTrails::Tilt::Template, 'dart' )

  end
end
