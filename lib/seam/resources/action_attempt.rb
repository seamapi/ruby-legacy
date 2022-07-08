# frozen_string_literal: true

module Seam
  class ActionAttempt < BaseResource
    attr_accessor :action_attempt_id, :action_type, :status, :result

    SLEEP_TIME = 0.2

    def wait_until_finished
      while @status == "pending"
        update!

        sleep(SLEEP_TIME)
      end

      self
    end

    def update!
      response = @client.request_seam(
        :get,
        "/action_attempts/get",
        params: {
          action_attempt_id: action_attempt_id
        }
      )

      update_from_response(response["action_attempt"])
    end
  end
end
