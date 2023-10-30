# frozen_string_literal: true

module Seam
  module Clients
    class ConnectedAccounts < BaseClient
      def get(connected_account_id_or_body)
        body = if connected_account_id_or_body.is_a?(String)
          {connected_account_id: connected_account_id_or_body}
        else
          connected_account_id_or_body
        end

        request_seam_object(
          :post,
          "/connected_accounts/get",
          Seam::ConnectedAccount,
          "connected_account",
          body: body
        )
      end

      def list(body = {})
        request_seam_object(
          :post,
          "/connected_accounts/list",
          Seam::ConnectedAccount,
          "connected_accounts",
          body: body
        )
      end
    end
  end
end
