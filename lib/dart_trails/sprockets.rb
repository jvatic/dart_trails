if defined?(::Sprockets)
  Sprockets.register_engine('.dart', DartTrails::Tilt::Template)
end
