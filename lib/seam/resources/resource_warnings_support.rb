# frozen_string_literal: true

module Seam
  module ResourceWarningsSupport
    def warnings
      if @warnings.nil? || (!@warnings.empty? && @warnings[0].is_a?(Hash))
        @warnings = @data["warnings"].is_a?(Array) ? Seam::ResourceWarning.load_from_response(@data["warnings"]) : []
      end

      @warnings
    end
  end
end
