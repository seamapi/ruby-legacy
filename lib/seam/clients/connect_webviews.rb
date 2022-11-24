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
          params: { connect_webview_id: connect_webview_id }
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

      def create(accepted_providers: nil)
        request_seam_object(
          :post,
          "/connect_webviews/create",
          Seam::ConnectWebview,
          "connect_webview",
          body: { accepted_providers: accepted_providers }
        )
      end
    end
  end
end
