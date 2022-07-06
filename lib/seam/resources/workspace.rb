# frozen_string_literal: true

module Seam
  class Workspace < BaseResource
    attr_accessor :workspace_id, :name, :connect_partner_name, :is_sandbox
  end
end
