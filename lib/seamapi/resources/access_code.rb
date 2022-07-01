# frozen_string_literal: true

module Seamapi
  class AccessCode < BaseResource
    extend Seamapi::Operations::Create
    extend Seamapi::Operations::Find
    extend Seamapi::Operations::List

    attr_reader :access_code_id, :name, :starts_at, :ends_at, :type, :created_at
  end
end
