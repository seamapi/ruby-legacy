# frozen_string_literal: true

module Seam
  module ResourceErrorsSupport
    def errors
      @errors ||= @data["errors"].is_a?(Array) ? Seam::ResourceError.load_from_response(@data["errors"]) : []
    end
  end
end
