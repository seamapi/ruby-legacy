# frozen_string_literal: true

module Seam
  class SeamError < BaseResource
    attr_accessor :error_code, :message
  end
end
