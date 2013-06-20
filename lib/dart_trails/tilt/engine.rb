module DartTrails
  module Tilt
    class Engine

      attr_reader :file, :options

      def initialize(file, data, options = {})
        @options = defaults.merge(options)
        @file    = fetch_file(file, data)
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

        success  ? read_and_unlink : ''
      end

      private

      def defaults
        { minify: true }
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

      # I'm a little undecided about how to handle this. How would it work
      # with Rails? Would I write to the tmp folder, read the resulting file
      # and then unlink it?
      #
      # And in all other cases (not Rails), perhaps I should just write and
      # read from a /tmp file also. So how do I separate the two cases?
      # Inheritance? A separate "Engine" for each case?
      #
      def output_file
        '/tmp/dart_tilt_test.dart' # TEMPORARY
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

      def string_to_file(s)
        f = Tempfile.new('dart_tilt')
        f.write(s)
        f.close
        f
      end

      def read_and_unlink
        files = %W{ #{output_file} #{output_file}.deps #{output_file}.map}
        s = File.read(output_file)
        File.unlink(*files)
        s
      end

    end
  end
end
