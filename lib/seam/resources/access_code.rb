# frozen_string_literal: true

module Seam
  class AccessCode < BaseResource
    attr_reader :access_code_id, :name, :type, :code

    date_accessor :starts_at, :ends_at

    include Seam::ResourceErrorsSupport
    include Seam::ResourceWarningsSupport
  end
end
