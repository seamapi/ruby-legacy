# frozen_string_literal: true

module Seam
  class AccessCode < BaseResource
    attr_reader :access_code_id, :name, :starts_at, :ends_at, :type, :created_at
  end
end
