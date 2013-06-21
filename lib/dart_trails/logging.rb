module DartTrails
  module Logging

    def logger
      @logger ||= Logger.new(STDOUT) if defined?(Logger)
    end

    def log(level, s)
      message = format_message(level, s)

      if defined?(Logger)
        logger.send(level, message)
      else
        puts message
      end
    end

    private

    def format_message(level, s)
      "[DartTrails] #{level.upcase} ... #{s}"
    end

  end
end
