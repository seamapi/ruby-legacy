# frozen_string_literal: true

module Seam
  module Clients
    class ConnectedAccounts < BaseClient
      def get(connected_account_id_or_hash)
        params = if connected_account_id_or_hash.is_a?(Hash)
                   { email: connected_account_id_or_hash[:email] }
                 else
                   { connected_account_id: connected_account_id_or_hash }
                 end

        request_seam_object(
          :get,
          "/connected_accounts/get",
          Seam::ConnectedAccount,
          "connected_account",
          params: params.compact
        )
      end

      def list(params = {})
        request_seam_object(
          :get,
          "/connected_accounts/list",
          Seam::ConnectedAccount,
          "connected_accounts",
          params: params
        )
      end
    end
  end
end
