# frozen_string_literal: true

module Seam
  module Clients
    class ConnectedAccounts < BaseClient
      def get(connected_account_id = nil)
        request_seam_object(
          :get,
          "/connected_accounts/get",
          Seam::ConnectedAccount,
          "connected_account",
          params: { connected_account_id: connected_account_id }
        )
      end
    end
  end
end
