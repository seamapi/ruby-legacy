# frozen_string_literal: true

module Seamapi
  class ConnectedAccount < BaseResource
    extend Seamapi::Operations::Find
    extend Seamapi::Operations::List

    attr_accessor :connected_account_id, :created_at, :user_identifier, :account_type
  end
end
