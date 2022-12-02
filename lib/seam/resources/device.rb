# frozen_string_literal: true

module Seam
  class Device < BaseResource
    attr_accessor :device_id, :device_type, :properties, :errors, :warnings

    date_accessor :created_at

    def initialize(data, client = nil)
      super(data, client)

      @errors = data["errors"].is_a?(Array) ? Seam::SeamError.load_from_response(data["errors"]) : []
      @warnings = data["warnings"].is_a?(Array) ? Seam::Warning.load_from_response(data["warnings"]) : []
    end
  end
end
