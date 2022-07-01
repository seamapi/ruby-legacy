# frozen_string_literal: true

module Seamapi
  class Device < BaseResource
    extend Seamapi::Operations::Find
    extend Seamapi::Operations::List

    attr_accessor :device_id

    def access_codes
      @access_codes ||= AccessCode.list(device_id: device_id)
    end
  end
end
