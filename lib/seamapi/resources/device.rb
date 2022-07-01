# frozen_string_literal: true

module Seamapi
  class Device < BaseResource
    extend Seamapi::Operations::Find
    extend Seamapi::Operations::List

    attr_accessor :device_id

    def access_codes
      @access_codes ||= AccessCode.list(device_id: device_id)
    end

    def lock
      self.class.lock(device_id)
    end

    def unlock
      self.class.unlock(device_id)
    end

    def self.lock(device_id)
      Request.post("/locks/lock_door", device_id: device_id)
    end

    def self.unlock(device_id)
      Request.post("/locks/unlock_door", device_id: device_id)
    end
  end
end
