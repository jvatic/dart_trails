Gem::Specification.new do |s|

  s.name = 'dart_trails'
  s.summary = 'Dart engine for Sprockets/Tilt.'
  s.description = 'A Sprockets/Tilt engine using the dart2js compiler (slow).'
  s.license = 'MIT'

  s.version = 0.1

  s.author = 'Kelsey Judson'
  s.email = 'kelseyjudson@gmail.com'
  s.homepage = 'http://kelseyjudson.com'

  s.files = Dir.glob('lib') + %w{README.md LICENSE}
  
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false

  s.required_ruby_version = '>= 1.9.3'

end
