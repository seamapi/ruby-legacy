# frozen_string_literal: true

module Seam
  class BaseResource
    attr_accessor :data

    def initialize(data, client = nil)
      @data = data
      @client = client

      @data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def update_from_response(data)
      @data = data
      @data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.load_from_response(data, client = nil)
      if data.is_a?(Array)
        data.map { |d| new(d, client) }
      else
        new(data, client)
      end
    end
  end
end
