# frozen_string_literal: true

module Seamapi
  class ConnectWebview < BaseResource
    extend Seamapi::Operations::Create
    extend Seamapi::Operations::Find
    extend Seamapi::Operations::List

    attr_accessor :connect_webview_id, :custom_redirect_url, :url, :workspace_id, :device_selection_mode, :accepted_providers, :accepted_devices, :any_provider_allowed, :any_device_allowed, :created_at, :login_successful, :status

    def view_url
      "#{Seamapi.config.base_uri}/connect/webview/#{connect_webview_id}"
    end
  end
end
