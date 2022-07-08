# frozen_string_literal: true

module Seam
  class Device < BaseResource
    attr_accessor :device_id, :device_type, :properties

    date_accessor :created_at
  end
end
