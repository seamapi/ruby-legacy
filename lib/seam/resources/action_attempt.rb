# frozen_string_literal: true

module Seam
  class ActionAttempt < BaseResource
    attr_accessor :action_attempt_id, :action_type, :status, :result

    def wait_until_finished
      while @status == "pending"
        res = Seam::Request.new(@client.api_key, @client.base_uri).perform(
          :get,
          "/action_attempts/get",
          params: { action_attempt_id: @action_attempt_id }
        )
        update_from_response(res["action_attempt"])
        sleep(0.2)
      end
      self
    end
  end
end
