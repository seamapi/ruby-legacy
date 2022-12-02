# frozen_string_literal: true

module Seam
  module ResourceWarningsSupport
    def warnings
      @warnings ||= @data["warnings"].is_a?(Array) ? Seam::ResourceWarning.load_from_response(@data["warnings"]) : []
    end
  end
end
