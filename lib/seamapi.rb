# frozen_string_literal: true

require_relative "seamapi/version"
require_relative "seamapi/config"
require_relative "seamapi/request"
require_relative "seamapi/routes"
require_relative "seamapi/logger"
require_relative "seamapi/operations/base_operation"
require_relative "seamapi/operations/create"
require_relative "seamapi/operations/find"
require_relative "seamapi/operations/list"
require_relative "seamapi/resources/base_resource"
require_relative "seamapi/resources/device"
require_relative "seamapi/resources/access_code"
require_relative "seamapi/resources/workspace"

module Seamapi
  def self.configure
    yield(config)
  end

  def self.config
    @config ||= Config.new
  end

  def self.health
    Request.get("health")
  end
end
