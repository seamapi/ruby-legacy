# frozen_string_literal: true

module Seamapi
  class ActionAttempt < BaseResource
    attr_accessor :action_attempt_id, :action_type, :status, :result
  end
end
