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
    end
  end
end
