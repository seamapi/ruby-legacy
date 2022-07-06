# frozen_string_literal: true

module Seam
  class ConnectedAccount < BaseResource
    attr_accessor :connected_account_id, :created_at, :user_identifier, :account_type
  end
end
