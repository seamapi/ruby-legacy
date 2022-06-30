# frozen_string_literal: true

require "seamapi/version"
require "seamapi/health"
require "seamapi/devices"
require "seamapi/workspaces"
require "seamapi/objects"

module Seam
  class Error < StandardError; end

  class SeamClient
    attr_accessor :http_client

    def initialize
      @http_client = HTTP
                     .headers("User-Agent" => "Ruby SDK v#{Seam::VERSION} (https://github.com/seamapi/ruby)")
                     .accept(:json)
                     .auth("Bearer seam_sandykey_0000000000000000000sand")
    end
  end
end
