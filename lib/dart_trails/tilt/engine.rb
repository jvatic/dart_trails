module DartTrails
  module Tilt
    class Engine

      include Logging

      attr_reader :file, :options

      def initialize(file, data, options = {})
        @options = defaults.merge(options)
        @file    = fetch_file(file, data)
      end

      def config
        DartTrails
      end

      # This should return a string, the creation of a file is an unfortunate
      # side effect (the dart2js compiler does not allow you to direct the
      # compiled output to stdout). So I will need to read in the file, and
      # unlink it when I am finished with it.
      #
      # Also keep in mind that dart2js also creates .deps and .map files which
      # will need to be cleaned up.
      #
      def compile
        redirect = { [:out, :err] => '/dev/null' }
        success  = system( command, *cli_options,
                           output_file_option, input_file,
                           redirect )

        if success
          log(:info, "Successfully compiled #{file.path}.")
          read_and_unlink
        else
          log(:error, "Failed to compile #{file.path}.")
          ''
        end
      end

      private

      def defaults
        config.cli_options || { minify: true }
      end

      def command
        'dart2js'
      end

      # This isn't used with the current format of the call to Kernel#system,
      # which instead passes the options as separate arguments.
      #
      def compile_command
        "dart2js #{cli_options.join(' ')} --out=#{output_file} #{input_file}"
      end

      def enabled_options
        options.select { |k, v| v }
      end

      def cli_options
        enabled_options.keys.map do |k|
          cli_option(k)
        end
      end

      def cli_option(option)
        "--#{option}"
      end

      def output_file
        base = defined?(Rails) ? Rails.root.to_s : ''
        base + '/tmp/dart_trails.dart'
      end

      def input_file
        file.path
      end

      def output_file_option
        "--out=#{output_file}"
      end

      def fetch_file(file, data)
        file ? File.new(file) : string_to_file(data)
      end

      # The dart2js compiler does not accept input data on stdin and expects
      # an input file, so unfortunately if we receive a string, we need to
      # write it to a file first.
      #
      def string_to_file(s)
        f = Tempfile.new('dart_trails_input.dart')
        f.write(s)
        f.close
        f
      end

      def read_and_unlink
        files = %W{ #{output_file} #{output_file}.deps #{output_file}.map}
        s = File.read(output_file)
        File.unlink(*files)

        strip_source_mapping(s)
      end

      # Strip the JavaScript Source Map declaration to prevent the browser
      # making a request for it as currently it is unlinked along with the
      # other dart2js output files and I believe support for source map files
      # with Sprockets is still under development.
      #
      def strip_source_mapping(s)
        s.gsub(/\/\/[@#] sourceMappingURL=.+\.map$/, '')
      end

    end
  end
end
