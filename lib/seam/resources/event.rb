# frozen_string_literal: true

module Seam
  class Event < BaseResource
    attr_accessor :event_id, :event_type, :payload, :workspace_id, :device_id

    date_accessor :created_at
  end
end
