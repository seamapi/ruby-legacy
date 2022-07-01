# frozen_string_literal: true

module Seamapi
  class Workspace < BaseResource
    extend Seamapi::Operations::Find
    extend Seamapi::Operations::List

    attr_accessor :workspace_id

    def devices
      @devices ||= Device.list(workspace_id: workspace_id)
    end
  end
end
