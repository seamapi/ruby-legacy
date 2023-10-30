# frozen_string_literal: true

module Seam
  module Clients
    class ActionAttempts < BaseClient
      def get(action_attempt_id)
        request_seam_object(
          :post,
          "/action_attempts/get",
          Seam::ActionAttempt,
          "action_attempt",
          body: {action_attempt_id: action_attempt_id}
        )
      end
    end
  end
end
