# frozen_literal_string: true

require "logger"

module Seamapi
  class Logger
    def self.info(message)
      logger = ::Logger.new($stdout)
      logger.info(message)
    end
  end
end
