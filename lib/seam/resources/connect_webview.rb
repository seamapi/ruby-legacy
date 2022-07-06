# frozen_string_literal: true

module Seam
  class ConnectWebview < BaseResource
    attr_accessor :connect_webview_id, :custom_redirect_url, :url, :workspace_id, :device_selection_mode,
                  :accepted_providers, :accepted_devices, :any_provider_allowed, :any_device_allowed, :created_at,
                  :login_successful, :status
  end
end
