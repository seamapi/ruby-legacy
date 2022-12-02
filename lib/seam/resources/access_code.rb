# frozen_string_literal: true

module Seam
  class AccessCode < BaseResource
    attr_reader :access_code_id, :name, :type, :code, :errors, :warnings

    date_accessor :starts_at, :ends_at

    def initialize(data, client = nil)
      super(data, client)

      @errors = data["errors"].is_a?(Array) ? Seam::SeamError.load_from_response(data["errors"]) : []
      @warnings = data["warnings"].is_a?(Array) ? Seam::Warning.load_from_response(data["warnings"]) : []
    end
  end
end
