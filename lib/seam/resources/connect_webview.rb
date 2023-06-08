# frozen_string_literal: true

module Seam
  class ConnectWebview < BaseResource
    attr_accessor :connect_webview_id, :connected_account_id, :custom_redirect_url, :custom_redirect_failure_url, :url,
      :workspace_id, :device_selection_mode, :accepted_providers, :selected_provider, :accepted_devices,
      :any_provider_allowed, :any_device_allowed, :login_successful, :status

    date_accessor :created_at
  end
end
