# frozen_string_literal: true

module Seam
  class ResourceError < BaseResource
    attr_accessor :error_code, :message
  end
end
