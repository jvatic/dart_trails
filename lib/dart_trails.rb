# https://github.com/rtomayko/tilt/blob/master/lib/tilt/template.rb

require 'dart_trails/logging'

require 'tilt'
require 'dart_trails/tilt'
require 'dart_trails/railtie'
require 'dart_trails/version'

module DartTrails

  # Configuration Options
  # -----------------------

  class << self
    attr_accessor :cli_options
  end

end
