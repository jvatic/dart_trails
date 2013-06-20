module DartTrails
  class Engine < ::Rails::Engine

    # I don't believe I need this as I am not working with models,
    # controllers, routes etc.
    #
    # isolate_namespace(DartTrails)
    
    # Register the engine with Sprockets.
    #
    initializer :register_dart_engine do |app|
      app.assets.register_engine('.dart', DartTrails::Tilt::Template)
    end

  end
end
