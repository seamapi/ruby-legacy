# frozen_string_literal: true

module Seam
  module Clients
    class ConnectedAccounts < BaseClient
      def get(connected_account_id_or_params)
        params = if connected_account_id_or_params.is_a?(String)
          {connected_account_id: connected_account_id_or_params}
        else
          connected_account_id_or_params
        end

        request_seam_object(
          :get,
          "/connected_accounts/get",
          Seam::ConnectedAccount,
          "connected_account",
          params: params
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
