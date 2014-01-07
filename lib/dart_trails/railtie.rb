if defined?(::Rails)
  module DartTrails
    class Railtie < ::Rails::Railtie

      # Register the engine with Sprockets.
      #
      initializer :register_dart_engine do |app|
        app.assets.register_engine('.dart', DartTrails::Tilt::Template)
      end

    end
  end
end
