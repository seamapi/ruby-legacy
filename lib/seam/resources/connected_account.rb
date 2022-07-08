# frozen_string_literal: true

module Seam
  class ConnectedAccount < BaseResource
    attr_accessor :connected_account_id, :user_identifier, :account_type

    date_accessor :created_at
  end
end
