# frozen_string_literal: true

module Seam
  module Clients
    class ConnectWebviews < BaseClient
      def get(connect_webview_id = nil)
        request_seam_object(
          :get,
          "/connect_webviews/get",
          Seam::ConnectWebview,
          "connect_webview",
          params: {connect_webview_id: connect_webview_id}
        )
      end

      def list
        request_seam_object(
          :get,
          "/connect_webviews/list",
          Seam::ConnectWebview,
          "connect_webviews",
          params: {}
        )
      end

      def create(
        accepted_providers: nil,
        custom_redirect_url: nil,
        custom_redirect_failure_url: nil,
        custom_metadata: nil,
        automatically_manage_new_devices: nil,
        device_selection_mode: nil,
        provider_category: nil
      )
        request_seam_object(
          :post,
          "/connect_webviews/create",
          Seam::ConnectWebview,
          "connect_webview",
          body: {
            accepted_providers: accepted_providers,
            custom_redirect_url: custom_redirect_url,
            custom_redirect_failure_url: custom_redirect_failure_url,
            automatically_manage_new_devices: automatically_manage_new_devices,
            device_selection_mode: device_selection_mode,
            custom_metadata: custom_metadata,
            provider_category: provider_category
          }.compact
        )
      end
    end
  end
end
