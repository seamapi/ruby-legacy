# frozen_string_literal: true

module Seamapi
  class ActionAttempt < BaseResource
    extend Seamapi::Operations::Find

    attr_accessor :action_attempt_id, :action_type, :status, :result
  end
end
