# frozen_string_literal: true

module Seam
  class Device < BaseResource
    attr_accessor :device_id, :device_type, :properties, :connected_account_id, :workspace_id

    date_accessor :created_at

    include Seam::ResourceErrorsSupport
    include Seam::ResourceWarningsSupport
  end
end
