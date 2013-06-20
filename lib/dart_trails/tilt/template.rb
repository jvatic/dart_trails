module DartTrails
  module Tilt
    class Template < ::Tilt::Template

      attr_reader :engine

      # Called once, the first time the class is initialized.
      # Use this to require the underlying template library and perform any
      # initial setup.
      #
      def initialize_engine
      end

      def self.default_mime_type
        'application/javascript'
      end

      # Implementation of #prepare is required by Tilt::Template and is called
      # before #evaluate.
      #
      def prepare
        @engine = Engine.new(file, data)
      end

      # Several attributes are available.
      #
      #     #file -> The name/path given for the original file.
      #              If a block passed to #new in place of a file, this will
      #              return nil.
      #     #data -> The data read from the file or passed in directly through
      #              a block.
      #     ... (see the source code) ...
      #
      def evaluate(scope, locals, &block)
        engine.compile
      end

    end
  end
end
