# frozen_string_literal: true

module Seam
  module ResourceErrorsSupport
    def errors
      if @errors.nil? || (!@errors.empty? && @errors[0].is_a?(Hash))
        @errors = @data["errors"].is_a?(Array) ? Seam::ResourceError.load_from_response(@data["errors"]) : []
      end

      @errors
    end
  end
end
