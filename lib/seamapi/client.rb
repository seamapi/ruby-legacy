# frozen_string_literal: true

module Seamapi
  class Client
    attr_accessor :api_key, :base_uri

    def initialize(api_key, base_uri)
      @api_key = api_key
      @base_uri = base_uri
    end

    def locks
      @locks ||= Seamapi::Clients::Locks.new(self)
    end

    def devices
      @devices ||= Seamapi::Clients::Devices.new(self)
    end
  end
end
