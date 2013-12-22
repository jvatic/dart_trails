$LOAD_PATH << "#{File.dirname(__FILE__)}/lib"

require 'dart_trails/version'

Gem::Specification.new do |s|

  s.name = 'dart_trails'
  s.summary = 'Dart engine for Sprockets/Tilt.'
  s.description = 'A Sprockets/Tilt engine using the dart2js compiler (slow).'
  s.license = 'MIT'

  s.version = DartTrails::VERSION

  s.author = 'Kelsey Judson'
  s.email = 'kelseyjudson@gmail.com'
  s.homepage = 'http://github.com/kelseyjudson/dart_trails'

  s.files = Dir.glob('lib/**/*') + %w{README.md LICENSE}
  
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false

  s.required_ruby_version = '>= 1.9.3'

end
