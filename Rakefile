$LOAD_PATH << "#{File.dirname(__FILE__)}/lib"

require 'dart_trails/version'

task :build do
  `gem build dart_trails.gemspec`
end

task :release => :build do
  `gem push dart_trails-#{DartTrails::VERSION}.gem`
end

task :install => :build do
  `gem install dart_trails-#{DartTrails::VERSION}.gem`
end

task :clean do
  `rm dart_trails-*.gem`
end
